module dard.systems.render.components.light;

import dard.base.component;
import dard.systems.render;
import dard.types.color;

class Light : Component {
    this(Entity e) {
        super(e);

        e.context.system!Render.addLight(this);
    }

    ~this() {
        entity.context.system!Render.removeLight(this);
    }

private:
    // Type _type;
    Color _color;
    float _power;
}
