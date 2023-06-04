module dard.components.graphic_object;

import dard.base.component;
import dard.systems.render;
import dard.systems.asset;
import dard.types.ref_count;

import bindbc.bgfx;

class GraphicObject : Component {
    this(Entity e) {
        super(e);

        e.context.system!Render.addObject(this);
    }

    ~this() {
        entity.context.system!Render.removeObject(this);
    }

    void submit() {
        // bgfx_set_vertex_buffer(0, _object.mesh.bgfxVbh(), 0, uint.max);
        // bgfx_set_index_buffer(_object.mesh.bgfxIbh(), 0, uint.max);

        // ulong state = 0 | BGFX_STATE_WRITE_R | BGFX_STATE_WRITE_G | BGFX_STATE_WRITE_B | BGFX_STATE_WRITE_A
        //     | BGFX_STATE_WRITE_Z | BGFX_STATE_DEPTH_TEST_LESS | BGFX_STATE_CULL_CCW
        //     | BGFX_STATE_MSAA;

        // bgfx_set_transform(cast(void*) entity.transform.transformation().arrayof, 1);

        // bgfx_set_state(state, 0);

        // bgfx_submit(0, _object.material.program().bgfx(), 0, BGFX_DISCARD_ALL);
    }

    void setObject3d(RC!Object3DAsset o) {
        _object = o;
    }

private:
    RC!Object3DAsset _object;
}
