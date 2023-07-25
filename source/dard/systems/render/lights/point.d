module dard.systems.render.lights.point;

import dard.base.component;
import dard.systems.render;
import dard.types.color;

class PointLight : Component {
    this(Entity e) {
        super(e);

        e.context.system!Render.addLight(this);
    }

    ~this() {
        entity.context.system!Render.removeLight(this);
    }

// private:
    float power;
    float r;
    Color color;
}
