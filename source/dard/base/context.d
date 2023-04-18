module dard.base.context;

import dard.base.entity;
import dard.base.system;
import dard.base.component;
import dard.types.hash_map;
import dard.types.smart_ptr;
import dard.types.vector;
import std.algorithm : reverse;
import std.stdio;
import std.exception;

class Context {
public:
    void registerComponent(T)() {
        _componentFabric[typeid(T)] = (Entity e) { return SharedPtr!T(e); };
    }

    T createSystem(T, Args...)(Args args) {
        auto p = SharedPtr!T(this, args);

        _systems[typeid(T)] = cast(SharedPtr!System) p;

        return p;
    }

    S system(S)() {
        assert(_systems.contains(typeid(S)), "Cant find system: " ~ S.stringof);

        return cast(SharedPtr!S) _systems[typeid(S)];
    }

    S findSystem(S)() {
        return static_cast!S(_systems.get(typeid(T), null));
    }

private:
    HashMap!(TypeInfo, SharedPtr!Component function(Entity e)) _componentFabric;
    HashMap!(TypeInfo, SharedPtr!System) _systems;
}

unittest {
    class System1 : System {
        this(Context context) {
            super(context);
        }

        int a = 0;
    }

    class System2 : System {
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
