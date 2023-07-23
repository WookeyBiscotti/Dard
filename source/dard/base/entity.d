module dard.base.entity;

public import dard.base.context;
import dard.base.component;
import dard.base.scene;
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

    this(Context c, Scene scene, Entity parent) {
        _context = c;
        _scene = scene;
        _parent = parent;

        _transform = scoped!Transform(this);
    }
    
    ~this() {   
    }

    ref auto make(T, Args...)(Args args) if (is(T : Component)) {
        _components.require(typeid(T)).moveFrom(makeUnique!T(this, args));

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

    Scene scene() {
        return _scene;
    }

private:
    Context _context;

    Entity _parent;

    Scene _scene;

    mixin BuiltIn!("transform", Transform);

    HashMap!(TypeInfo, UniquePtr!Component) _components;
}
