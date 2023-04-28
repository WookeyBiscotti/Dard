module dard.base.entity;

import dard.base.context;
import dard.base.component;

class Entity {
public:
    this(Context c) {
        _context = c;
    }

    void addComponenet(T)() if (is(T : Component)) {
        _components[typeid(T)] = Component(this);
    }

private:
    Context _context;

    Component[TypeInfo] _components;
}
