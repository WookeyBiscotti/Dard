module dard.systems.render.graphic_object;

import dard.base.component;
import dard.systems.render;
import dard.systems.asset;

class GraphicObject : Component {
    this(Entity e) {
        super(e);
    }

private:
    MeshAsset _mesh;
    Material _material;
}
