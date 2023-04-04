module dard.types.nogc_delegate;

import std.stdio;
import std.array;
import std.algorithm;
import std.traits;
import std.typecons;
import dard.types.smart_ptr;

private struct Ref(T) {
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

private CaptureVariable[] parseCaptureArgs(string capture) {
    auto vars = capture.split(",");
    CaptureVariable[] cas;
    while (vars.length != 0) {
        auto v = vars[0];
        cas ~= CaptureVariable(v);
        vars = vars[1 .. $];
    }

    return cas;
}

private string generateExtCaptureTupleString(string name, CaptureVariable[] cas)() {
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

struct NoGcDelegate(RetType, Args...) {
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
    return NoGcDelegate!(ReturnType!f, Parameters!f)(c, f);
}

class FunctionBase(RetType, Args...) {
public:
    abstract RetType call(Args args);
}

class FunctionImpl(Callable, RetType, Args...) : FunctionBase!(RetType, Args) {
public:
    this(Callable fn) {
        _fn = fn;
    }

    override RetType call(Args args) {
        return _fn(args);
    }

private:
    Callable _fn;
}

struct Function(RetType, Args...) {
    this(SharedPtr!(FunctionBase!(RetType, Args)) fn) {
        _fn = fn;
    }

    RetType opCall(Args args) {
        return _fn.call(args);
    }

private:
    SharedPtr!(FunctionBase!(RetType, Args)) _fn;
}

auto makeFunction(Callable)(Callable f) {
    auto p = SharedPtr!(FunctionImpl!(Callable, ReturnType!Callable, Parameters!Callable))(f);

    return Function!(ReturnType!Callable, Parameters!Callable)(cast(
            SharedPtr!(FunctionBase!(ReturnType!Callable, Parameters!Callable))) p);
}

unittest {
    int a = 1;
    string b = "12s";
    class C {
        int v = 66;
    }
    auto c = new C;

    mixin Capture!("capture", "ref a, ptr b, c");
    auto ff = makeFunction(noGcDelegate(move(capture), (ref typeof(capture) capture, int) {
            with (capture) {
                writeln(a);
                writeln(b);
                writeln(c.v);
            }
            return 1;
        }));

    ff(1);
    a = 12;
    b = "qwe";
    c.v = 6;
    ff(1);
}
