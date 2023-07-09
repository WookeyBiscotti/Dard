module dard.systems.serialization.serialize;

import std.json;
import std.traits;

import dard.systems.serialization;
import dard.types.string;

JSONValue serializeToJson(T)(in T obj) {
    JSONValue js;
    static if (isScalarType!T) {
        js = obj;
    } else {
        alias membs = FieldNameTuple!T;
        static foreach (key; membs) {
            static if (!hasUDA!(T, S7eSome) || hasUDA!(mixin("T." ~ key), S7e)) {
                writeln("T.stringof ", T.stringof, " key: ", key, " hasUDA!(S7eSome, T):", hasUDA!(S7eSome,
                        T), " hasUDA!(mixin(' T.' ~ key): ", hasUDA!(mixin("T." ~ key), S7e));
                js[key] = serializeToJson(mixin("obj." ~ key));
            }
        }
    }

    return js;
}

void deserializeFromJson(T)(in JSONValue js, ref T obj) {
    static if (isScalarType!T) {
        obj = js.get!T;
    } else {
        alias membs = FieldNameTuple!T;
        static foreach (key; membs) {
            static if (!hasUDA!(T, S7eSome) || hasUDA!(mixin("T." ~ key), S7e)) {
                deserializeFromJson(js[key], mixin("obj." ~ key));
            }
        }
    }

    return js;
}

void deserializeFromJson(T : String)(in JSONValue js, ref T obj) {
    obj = js.str;
}

void deserializeFromJson(T : string)(in JSONValue js, ref T obj) {
    obj = js.str;
}

JSONValue serializeToJson(T : String)(in T obj) {
    JSONValue js = obj.toString.dup;

    return js;
}

JSONValue serializeToJson(T : string)(in T obj) {
    JSONValue js = obj;

    return js;
}

unittest {
    import std.stdio;

    {
        bool t = false;
        writeln(serializeToJson(t).toPrettyString());
    }

    @S7eSome struct S7eMe {
        @S7e bool b = true;
        int i = 123;
        @S7e float f = 2.2f;
        @S7e double d = 1.1;
        @S7e string s = "qweqwe";
        @S7e String str = "123123";
    }

    {
        S7eMe t;
        writeln(serializeToJson(t).toPrettyString());
    }
}
