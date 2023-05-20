module dard.systems.config.config;

import std.typecons;
import std.algorithm.mutation;
import std.conv;
import std.stdio;

import dard.systems.config;
import dard.systems.filesystem;
import dard.systems.logger;
import dard.base.system;
import dard.base.context;
import dard.types.math.vector;
import dard.types.string;

class ConfigSystem : System {
public:
    this() @disable;

    this(Context context, in ValueTree values) {
        super(context);
        _values = cast(ValueTree) values.dup;
    }

    ref const(T) value(T)(in String name) const {
        auto found = name in _values;

        assert(found);

        auto p = found.value.peek!(T);
        assert(p);

        return *p;
    }

    bool setValue(in String name, EngineValue newValue) {
        auto found = name in _values;
        if (found) {
            if (found.value.type() != newValue.value.type()) {
                return false;
            }
            if (found.value == newValue.value) {
                return false;
            }
            if (found.access != newValue.access) {
                return false;
            }
        }

        *found = newValue;
        if (auto dgs = name in _observers) {
            foreach (ref d; dgs.byValue) {
                d(name, newValue);
            }
        }

        if (newValue.access == EngineValue.Access.DYNAMIC) {
            save();
        }

        return true;
    }

    const(Value)* findValue(in String name) const {
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

    void save() {
        import std.json;

        JSONValue r;
        foreach (ref n, ref v; _values) {
            if (v.access == EngineValue.Access.DYNAMIC) {
                r[n] = v.toJson();
            }
        }

        import std.file;

        mkdirRecurse(context().system!FileSystem.dynamicConfigPath());

        auto outFile = File(context().system!FileSystem.dynamicConfigPath() ~ "config.json", "w");
        outFile.write(r.toString());
    }

    void load() {
        import std.json;
        import std.file;

        try {
            auto j = parseJSON(readText(context()
                    .system!FileSystem.dynamicConfigPath() ~ "config.json"));

            foreach (string name, ref JSONValue jv; j) {
                EngineValue v;
                v.access = EngineValue.Access.DYNAMIC;
                v.fromJson(jv);
                setValue(String(name), v);
            }

        } catch (Exception e) {
            log(e.to!string);
        }
    }

private:
    void delegate(in String n, in EngineValue v)[uint][const String] _observers;

    ValueTree _values;
}

struct ConfigObserver {
    this(ConfigSystem config) {
        _config = config;
        _id = ++_nextId;
    }

    ~this() {
        foreach (ref v; _config._observers.byValue) {
            v.remove(id());
        }
    }

    void subscribe(in String name, void delegate(in String name, in EngineValue) dg) {
        _config._observers.require(name).require(id()) = dg;
    }

    auto id() const {
        return _id;
    }

private:
    __gshared uint _nextId = 0;
    uint _id;
    ConfigSystem _config;
}

enum {
    // dfmt off
    APPLICATION_NAME = String("application_name"),
    WINDOW_RESULUTION = String("window_resolution"),
    WINDOW_FULLSCREEN = String("window_fullscreen"),
   // dfmt on
}

Tuple!(String, EngineValue)[] PREDEFINED_VALUES() {
    return [
        tuple(APPLICATION_NAME, EngineValue(EngineValue.Access.STATIC,
                Value(String("Dard game engine")))),
        tuple(WINDOW_RESULUTION, EngineValue(EngineValue.Access.DYNAMIC,
                Value(Vector2u(800, 600)))),
        tuple(WINDOW_FULLSCREEN, EngineValue(EngineValue.Access.DYNAMIC, Value(false)))
    ];
}
