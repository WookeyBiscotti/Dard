module dard.base.component;

import dard.base.entity;

class Component {
public:
    this(Entity e) {
        _entity = e;
    }

private:
    Entity _entity;
}
