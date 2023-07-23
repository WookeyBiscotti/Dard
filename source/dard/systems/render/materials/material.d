module dard.systems.render.materials.material;

import dard.types.json;
import dard.components.graphic_object;

class Material {
    // Call before object submited
    void submit(const ref GraphicObject obj);

    void deserialize(in ref JSONValue js);
}
