module dard.base.context;

import dard.base.entity;
import dard.base.system;
import dard.base.component;
import dard.types.hash_map;
import dard.types.smart_ptr;
import dard.types.vector;
import std.algorithm : reverse;

class Context {
public:
     ~this() {
        while (_systemsOrder.length) {
            _systemsOrder.removeBack();
        }
    }

    void registerComponent(T)() {
        _componentFabric[typeid(T)] = (Entity e) { return SharedPtr!T(e); };
    }

    T createSystem(T, Args...)(auto ref Args args) {
        auto p = Unique!T(args);

        _systems[typeid(T)] = *p;
        _systemsOrder ~= p;
    }

    S system(S)() {
        assert(_systems.containsKey(typeid(T)));

        return cast(S)(_systems[typeid(T)]);
    }

    S findSystem(S)() {
        return cast(S)(_systems.get(typeid(T), null));
    }

private:
    HashMap!(TypeInfo, SharedPtr!Component function(Entity e)) _componentFabric;
    HashMap!(TypeInfo, System) _systems;
    Vector!(SharedPtr!System) _systemsOrder;
}
