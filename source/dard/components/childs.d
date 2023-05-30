module dard.components.childs;

import std.math.constants;

import dard.base.component;
import dard.types.vector;
import dard.types.memory;

class Childs : Component {
public:
    this(Entity e) {
        super(e);
    }

    ref auto childs() {
        return _childs;
    }

private:
    Array!(SharedPtr!Entity) _childs;
}
