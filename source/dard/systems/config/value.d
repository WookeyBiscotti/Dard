module dard.systems.config.value;

import std.variant;
import std.json;

import dard.types.math.vector;
import dard.types.string;

alias Value = Algebraic!(bool, long, String, Vector2f, Vector2u);

struct EngineValue {
    enum Access {
        STATIC,
        DYNAMIC,
    }

    Access access = Access.STATIC;
    Value value;

    JSONValue toJson() const {
        JSONValue v;
        // dfmt off
        return value.visit!(
            (bool v) { return JSONValue(v); }, 
            (long v) { return JSONValue(v); },
            (in String v) { return JSONValue(v.toString); },
            (in Vector2f v) { return JSONValue([v.x,v.y]); },
            (in Vector2u v) { return JSONValue([v.x,v.y]); });
        // dfmt on
    }

    void fromJson(in JSONValue v) {
        access = Access.DYNAMIC;

        if (v.type == JSONType.ARRAY) {
            if (v.array.length != 2) {
                return;
            }
            if (v[0].type == JSONType.FLOAT && v[1].type == JSONType.FLOAT) {
                value = Vector2f(v[0].floating, v[1].floating);
            } else if (v[0].type == JSONType.INTEGER && v[1].type == JSONType.INTEGER) {
                value = Vector2u(cast(uint) v[0].integer, cast(uint) v[1].integer);
            } else {
                return;
            }
        } else if (v.type == JSONType.STRING) {
            value = String(v.str);
        } else if (v.type == JSONType.FALSE ||v.type == JSONType.TRUE) {
            value = v.boolean;
        } else if (v.type == JSONType.INTEGER) {
            value = v.integer;
        }
    }
}

alias ValueTree = EngineValue[const String];
