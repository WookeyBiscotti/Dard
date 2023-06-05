module dard.systems.asset.object3d;

import std.stdio;
import std.typecons;
import std.json;

import dard.systems.asset;
import dard.base.context;
import dard.types.string;
import dard.types.memory;
import dard.types.ref_count;

struct Object3DAsset {
    this(Context context, File file, in String name) {
        auto data = NewArray!char(file.size());
        scope (exit)
            Delete(data);
        auto js = parseJSON(data);

        _mesh = context.system!AssetSystem.mesh(String(js["mesh"].str()));
        _material = context.system!AssetSystem.material(String(js["material"].str()));
    }

    ref auto mesh() {
        return _mesh;
    }

    ref auto material() {
        return _material;
    }

private:
    RC!MeshAsset _mesh;
    RC!MaterialAsset _material;
}

auto makeDefaultObject3D(AssetSystem sys) {
    auto p = RC!Object3DAsset();
    p._mesh = sys.mesh(S!"__default__");
    p._material = sys.material(S!"__default__");

    return p;
}