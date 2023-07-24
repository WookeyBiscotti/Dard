module dard.systems.render.material;

import dard.types.json;
import dard.types.string;
import dard.systems.asset;
import dard.base.context;
import dard.types.memory;
import dard.components.graphic_object;

abstract class Material {
    // Call before object submited
    void submit(GraphicObject obj) {
    }

    ref ProgramAsset program();

    void deserialize(in ref JSONValue js) {
    }
}

class DefaultMaterial : Material {
    this(Context ctx) {
        _program = ctx.system!AssetSystem
            .get!ProgramAsset(S!"__default__");
    }

    override void submit(GraphicObject obj) {
    }

    override ref ProgramAsset program() {
        return *_program.get();
    }

    override void deserialize(in ref JSONValue js) {
    }

private:
    SP!ProgramAsset _program;
}
