module dard.base.context;

import dard.base.entity;
import dard.base.system;
import dard.base.component;
import dard.utils.static_cast;
import std.algorithm : reverse;
import std.stdio;
import std.exception;

final class Context {
public:
    T createSystem(T, Args...)(Args args) {
        auto p = new T(this, args);

        _systems[typeid(T)] = p;
        _systemsList ~= p;

        return p;
    }

    S system(S)() {
        assert(typeid(S) in _systems, "Cant find system: " ~ S.stringof);

        return static_cast!S(_systems[typeid(S)]);
    }

    S findSystem(S)() {
        return static_cast!S(_systems.get(typeid(T), null));
    }

    ~this() {
        foreach_reverse (s; _systemsList) {
            destroy(s);
        }
    }

private:
    System[TypeInfo] _systems;
    System[] _systemsList;
}

unittest {
    static class System1 : System {
        this(Context context) {
            super(context);
        }

        int a = 0;
    }

    static class System2 : System {
        this(Context context) {
            super(context);
        }

        float b = 0;
    }

    auto c = new Context;

    c.createSystem!System1().a = 10;
    c.createSystem!System2().b = 17;

    assert(c.system!System1().a == 10);
    assert(c.system!System2().b == 17);
}
