module dard.base.context;

import dard.base.entity;
import dard.base.system;
import dard.base.component;
import dard.utils.static_cast;
import dard.systems.logger;
import dard.types.small_vector;
import dard.types.memory;

import std.algorithm : reverse;
import std.stdio;
import std.exception;
import std.typecons;

// import std.container;

final class Context {
public:
     ~this() {
        foreach_reverse (s; _systemsList) {
            Delete(s);
        }
    }

    T createSystem(T, Args...)(Args args) {
        auto p = New!T(this, args);

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

    void registerDestructor(T)() {
        if (typeof(T) in _dtors) {
            return;
        } else {
            _dtors[typeof(T)] = function void(void* p) {
                destroy!false(*cast(T*) p);
            };
        }
    }

    void destruct(TypeInfo t, void* p) {
        if (auto d = t in _dtors) {
            (*d)(p);
        } else {
            warning("Cant find destructor");
        }
    }

private:
    System[TypeInfo] _systems;
    SmallVector!(System, 16) _systemsList;
    void function(void*)[TypeInfo] _dtors;
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
