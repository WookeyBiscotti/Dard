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

    auto make() {
        auto e = makeShared!Entity(entity.context, entity.scene, entity);
        _childs ~= e;

        return e;
    }

private:
    Vector!(SharedPtr!Entity) _childs;
}
