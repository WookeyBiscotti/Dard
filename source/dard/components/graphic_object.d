module dard.components.graphic_object;

import dard.base.component;
import dard.systems.render;
import dard.systems.asset;
import dard.types.ref_count;
import dard.systems.asset.material;

import bindbc.bgfx;

class GraphicObject : Component {
    this(Entity e) {
        super(e);

        e.context.system!Render.addObject(this);
    }

    ~this() {
        entity.context.system!Render.removeObject(this);
    }

    void submit(bgfx_view_id_t id, ulong state = BGFX_STATE_MASK) {
        _object.mesh.submit(id, _object.material.program.bgfx(), entity()
                .transform.transformation.arrayof.ptr, state);
    }

    void setObject3d(RC!Object3DAsset o) {
        _object = o;
    }

    auto material() const {
        return _object.material;
    }

private:
    RC!Object3DAsset _object;
}
