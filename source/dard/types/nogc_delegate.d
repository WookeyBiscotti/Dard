module dard.types.nogc_delegate;

import std.stdio;
import std.array;
import std.algorithm;
import std.traits;
import std.typecons;
import std.string;
import dard.types.smart_ptr;
import std.conv;

struct Ref(T) {
    ref get() inout @property {
        return *ptr;
    }

    T* ptr;

    alias get this;
}

private struct CaptureVariable {
    enum MemoryClass {
        VAL,
        REF,
        PTR,
    }

    MemoryClass mc;
    string name;

    this(string s) {
        enum ptrStr = "ptr ";
        enum refStr = "ref ";
        s = s.strip(' ');
        if (s.startsWith(ptrStr)) {
            s = s[ptrStr.length .. $].strip(' ');
            mc = MemoryClass.PTR;
        } else if (s.startsWith(refStr)) {
            s = s[ptrStr.length .. $].strip(' ');
            mc = MemoryClass.REF;
        } else {
            mc = MemoryClass.VAL;
        }
        name = s;
    }

    string generateParameter() const {
        string str;
        if (mc == MemoryClass.REF) {
            str ~= "Ref!(typeof(" ~ name ~ "))";
        } else if (mc == MemoryClass.PTR) {
            str ~= "typeof(" ~ name ~ ")*";
        } else {
            str ~= "typeof(" ~ name ~ ")";
        }
        str ~= `, "` ~ name ~ `", `;

        return str;
    }

    string generateArgument() const {
        string str;
        if (mc == MemoryClass.REF) {
            str ~= "Ref!(typeof(" ~ name ~ "))(&" ~ name ~ "), ";
        } else if (mc == MemoryClass.PTR) {
            str ~= "&" ~ name ~ ", ";
        } else {
            str ~= name ~ ", ";
        }

        return str;
    }
}

CaptureVariable[] parseCaptureArgs(string capture) {
    auto vars = capture.split(",");
    CaptureVariable[] cas;
    while (vars.length != 0) {
        auto v = vars[0];
        cas ~= CaptureVariable(v);
        vars = vars[1 .. $];
    }

    return cas;
}

string generateExtCaptureTupleString(string name, CaptureVariable[] cas)() {
    auto str = "auto " ~ name ~ " = Tuple!(";
    static foreach (c; cas) {
        str ~= c.generateParameter();
    }
    str ~= ")(";
    static foreach (c; cas) {
        str ~= c.generateArgument();
    }
    str ~= ");\n";

    return str;
}

mixin template Capture(string name, string capture) {
    mixin(generateExtCaptureTupleString!(name, parseCaptureArgs(capture)));
}

struct NoGcDelegate(Callable) {
    alias RetType = ReturnType!Callable;
    alias Args = Parameters!Callable;
    alias CaptureType = Args[0];
    alias FnArgs = Args[1 .. $];
    this(CaptureType c, RetType function(ref CaptureType, FnArgs) f) {
        fn = f;
        capture = c;
    }

    RetType opCall(FnArgs args) {
        return fn(capture, args);
    }

    CaptureType capture;
    RetType function(ref CaptureType, FnArgs) fn;
}

auto noGcDelegate(CaptureStruct, Callable)(CaptureStruct c, Callable f) {
    return NoGcDelegate!Callable(c, f);
}

class FunctionBase(RawFunctionType) {
public:
    abstract ReturnType!RawFunctionType call(Parameters!RawFunctionType args);
}

class FunctionImpl(Callable) : FunctionBase!(RawFunction!Callable) {
    alias RawFunctionType = RawFunction!Callable;
public:
    this(Callable fn) {
        _fn = fn;
    }

    override ReturnType!RawFunctionType call(Parameters!RawFunctionType args) {
        return _fn(args);
    }

private:
    Callable _fn;
}

struct Function(RawFunctionType) {
    this(SharedPtr!(FunctionBase!(RawFunctionType)) fn) {
        _fn = fn;
    }

    ReturnType!RawFunctionType opCall(Parameters!RawFunctionType args) {
        return _fn.call(args);
    }

    bool opEquals(ref const Function rhs) const {
        return &*_fn == &*rhs._fn;
    }

private:
    SharedPtr!(FunctionBase!(RawFunctionType)) _fn;
}

alias RawFunction(Callable) = ReturnType!Callable function(Parameters!Callable);

auto makeFunction(Callable)(Callable f) {
    alias RawFunctionType = RawFunction!Callable;
    auto p = SharedPtr!(FunctionImpl!Callable)(f);

    return Function!RawFunctionType(cast(
            SharedPtr!(FunctionBase!RawFunctionType)) p);
}

struct ParsedFunction {
    long line;
    string origin;
    string name;
    string capture;
    string params;
    string body;

    this(long line, string str) {
        line = line;
        origin = str;
        auto fqb = str.indexOf("[");
        assert(fqb != -1);
        auto sqb = str.indexOf("]");
        assert(sqb != -1);
        name = str[0 .. fqb].strip(" ");
        capture = str[fqb + 1 .. sqb];

        auto frb = str.indexOf("(");
        assert(frb != -1);
        long srb;
        int fbc = 1;
        for (auto i = frb + 1; i < str.length; ++i) {
            if (str[i] == '(') {
                fbc++;
            } else if (str[i] == ')') {
                fbc--;
            }
            if (fbc == 0) {
                srb = i;
                break;
            }
        }
        assert(srb);
        params = str[frb + 1 .. srb];

        auto fcb = str.indexOf("{");
        assert(fcb != -1);
        body = str[fcb .. $];
    }

    string generateFunctionString() {
        import std.conv;

        string captureName = "_capture_line_" ~ line.to!string;
        string delegateName = captureName ~ "_delegate";
        string res = "mixin Capture!(\"" ~ captureName ~ "\", \"" ~ capture ~ "\");\n";
        string dlg = "noGcDelegate(" ~ captureName ~ ", (ref typeof(" ~ captureName ~ ") " ~ captureName ~ ", " ~ params ~ "){\n" ~
            "with (" ~ captureName ~ ")" ~ body ~ "})\n";
        res ~= "auto " ~ name ~ " = makeFunction(" ~ dlg ~ ");";

        return res;
    }
}

mixin template genFunction(string _string_function_for_generation_) {
    mixin(ParsedFunction(__LINE__, _string_function_for_generation_).generateFunctionString());
}

unittest {
    int a = 14;
    int b = 11;
    mixin genFunction!("qwe [a, ref b](int p){
        // writeln(b + p + a);
        b = 666;
    }");

    qwe(11);
    // writeln(b);

    // writeln(p.generateFunctionString());

    // int a = 11;
    // string b = "12s";
    // class C {
    //     int v = 66;
    // }

    // auto c = new C;
    // mixin Capture!("capture", "ref a, ptr b, c");
    // auto d = noGcDelegate(capture, function float(ref typeof(capture) capture, int p) {
    //     with (capture) {
    //         *b = "123";
    //         return p + a + c.v;
    //     }
    // });

    // auto ff = makeFunction(d);

    // assert(b == "12s");
    // writeln(ff(1));
    // assert(b == "123");

    // assert(ff(1) == 11 + 66 + 1);
    // assert(b == "123");
    // a = 12;
    // c.v = 6;

    // assert(ff(2) == 12 + 6 + 2);
}
