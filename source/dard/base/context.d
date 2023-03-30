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
     ~this() {
    }

    void registerComponent(T)() {
        _componentFabric[typeid(T)] = (Entity e) { return SharedPtr!T(e); };
    }

    T createSystem(T, Args...)(Args args) {
        auto p = SharedPtr!T(this, args);

        _systems[typeid(T)] = cast(SharedPtr!System) p;

        writeln("WTF5 ", typeid(T), cast(void*)(*p));

        return p;
    }

    S system(S)() {
        auto p = cast(SharedPtr!S) _systems[typeid(S)];

        // writeln("WTF2", cast(void*)(*p));

        return p;
    }

    S findSystem(S)() {
        return cast(S)(_systems.get(typeid(T), null));
    }

private:
    HashMap!(TypeInfo, SharedPtr!Component function(Entity e)) _componentFabric;
    HashMap!(TypeInfo, SharedPtr!System) _systems;
}

T create(T)(Context ct, ref HashMap!(TypeInfo, SharedPtr!System) h) {
    auto p = SharedPtr!T(ct);
    writeln("WTF1 ", typeid(T), cast(void*)(*p));
    h[typeid(T)] = cast(SharedPtr!System) p;

    return p;
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

    // auto s1 = SharedPtr!System1(c);
    // auto s2 = SharedPtr!System2(c);

    // writeln("WTF1 ", typeid(System1), cast(void*)(*s1));
    // writeln("WTF1 ", typeid(System2), cast(void*)(*s2));

    // s1.a = 11;

    // auto p1 = cast(SharedPtr!System) s1;
    // auto p1s = cast(SharedPtr!System1) p1;

    // assert(s1.a == p1s.a);

    HashMap!(TypeInfo, SharedPtr!System) h;
    create!System1(c, h);
    create!System2(c, h);
    {

        // auto s1 = SharedPtr!System1(c);
        // auto s2 = SharedPtr!System2(c);

        // writeln("WTF1 ", typeid(System1), cast(void*)(*s1));
        // writeln("WTF1 ", typeid(System2), cast(void*)(*s2));

        // systems[typeid(System1)] = cast(SharedPtr!System) s1;
        // systems[typeid(System2)] = cast(SharedPtr!System) s2;

        // writeln("WTF2 ", typeid(System1), cast(void*)(
        //         *(cast(SharedPtr!System1) systems[typeid(System1)])));
        // writeln("WTF2 ", typeid(System2), cast(void*)(
        //         *(cast(SharedPtr!System2) systems[typeid(System2)])));
    }

    c.createSystem!System1();

    c.createSystem!System2();

    // assert(11 == (cast(SharedPtr!System1) systems[typeid(System1)]).a);

    // c.createSystem!System1().a = 10;

    // c.createSystem!System2().b = 17;

    // writeln("WTF3", cast(void*)(c.system!System1()));

    // assert(c.system!System1().a == 10);
    // assert(c.system!System2().b == 17);
}
