module dard.systems.config;

import std.typecons;
import std.algorithm.mutation;
import std.conv;
import std.stdio;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

import dard.systems.config_dir.value;

class Config : System {
public:
    this() @disable;

    this(Context context, ref ValueTree values) {
        _values = values;
        super(context);
    }

    ref const(T) value(T)(in string name) const {
        auto found = name in _values;

        assert(found);

        auto p = found.value.peek!(T);
        assert(p);

        return *p;
    }

    const(Value)* findValue(in string name) const {
        auto found = name in _values;
        if (!found) {
            return null;
        }

        return &found.value;
    }

    static ValueTree predefinedValues() {
        ValueTree values;
        foreach (t; PREDEFINED_VALUES) {
            values[t[0]] = t[1];
        }

        return values;
    }

private:
    ValueTree _values;
}

enum {
    APPLICATION_NAME = "application_name",
    WINDOW_RESULUTION = "window_resulution"
}

Tuple!(string, EngineValue)[] PREDEFINED_VALUES() {
    return [
        tuple(APPLICATION_NAME, EngineValue(EngineValue.Access.DYNAMIC, Value(
                "Dard game engine"))),
        tuple(WINDOW_RESULUTION, EngineValue(EngineValue.Access.DYNAMIC, Value(Vector2u(800, 600))))
    ];
}
