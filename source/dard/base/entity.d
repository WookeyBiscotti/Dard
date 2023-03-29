module dard.base.entity;

import dard.base.context;
import dard.base.component;
import dard.types.hash_map;
import dard.types.smart_ptr;

class Entity {
public:
    this(Context c) {
        _context = c;
    }

    void addComponenet(T)() if (is(T : Component)) {
        _components[typeid(T)] = SharedPtr!Component(this);
    }

private:
    Context _context;

    HashMap!(TypeInfo, SharedPtr!Component) _components;
}
