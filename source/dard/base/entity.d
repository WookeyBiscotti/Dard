module dard.base.entity;

public import dard.base.context;
import dard.base.component;
import dard.types.memory;
import dard.systems.broker;
import dard.components.transform;
import dard.components.childs;
import dard.types.vector;
import dard.types.memory;
import dard.types.hash_map;

import std.typecons;
import std.traits;
import std.format;
import core.lifetime;

class Entity : Transceiver {
    private mixin template BuiltIn(string Name, C) {
        mixin(format(`@("buildin") typeof(scoped!C(Parameters!(C.__ctor).init)) _%s;`, Name));

        mixin(format(`public ref auto %s() {return _%s;}`, Name, Name));
    }

public:
    mixin ImplTransceiver;

    this(Context c, Entity parent) {
        _context = c;
        _parent = parent;

        _transform = scoped!Transform(this);
    }

    ref auto make(T, Args...)(Args args) if (is(T : Component)) {
        _components[typeid(T)] = UniquePtr!Component(makeUnique!T(this, args));

        return get!T();
    }

    T get(T)() {
        if (auto c = typeid(T) in _components) {
            return cast(T) c.get();
        }

        assert(false, "No such component");
    }

    Entity parent() {
        return _parent;
    }

    Context context() {
        return _context;
    }

private:
    Context _context;

    Entity _parent;

    mixin BuiltIn!("transform", Transform);

    HashMap!(TypeInfo, UniquePtr!Component) _components;
}
