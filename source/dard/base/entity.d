module dard.base.entity;

import dard.base.context;
import dard.base.component;
import dard.types.memory;
import dard.systems.broker;
import dard.components.transform;
import dard.components.childs;
import dard.types.vector;
import dard.types.memory;

import std.typecons;
import std.traits;
import std.format;

class Entity : Transceiver {
    private mixin template BuiltIn(string Name, C) {
        mixin(format(`@("buildin") typeof(scoped!C(Parameters!(C.__ctor).init)) %s;`, Name));

        public T get(T)() if (is(T == C)) {
            mixin(format(`return %s;`, Name));
        }
    }

public:
    mixin ImplTransceiver;

    this(Context c, Entity parent) {
        _context = c;
        _parent = parent;

        _transform = scoped!Transform(this);
        make!Childs(this);
    }

    void make(T, Args...)(Args args) if (is(T : Component)) {
        _components[typeid(T)] = makeUnique!T(args);
    }

    T get(T)() {
        if (auto c = typeid(T) in _components) {
            return cast(T) c;
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

    mixin BuiltIn!("_transform", Transform);
    // mixin BuiltIn!("_childs", Childs);

    UniquePtr!Component[TypeInfo] _components;
}
