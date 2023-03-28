module dard.base.context;

import dard.base.entity;
import dard.base.component;
import dard.types.dict;
import dard.types.smart_ptr;

class Context {
public:
    void registerComponent(T)() {
        _componentFabric[typeid(T)] = (Entity e) { return SharedPtr!T(e); };
    }

private:
    Dict!(TypeInfo, SharedPtr!Component function(Entity e)) _componentFabric;
}
