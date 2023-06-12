module dard.base.component;

public import dard.base.entity;
import dard.systems.broker;

class Component : Transceiver {
public:
    mixin ImplTransceiver;

    this(Entity e) {
        _entity = e;
    }

    ~this() {
    }

    Entity entity() {
        return _entity;
    }

private:
    Entity _entity;
}
