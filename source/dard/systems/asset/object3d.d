module dard.systems.asset.object3d;

import std.stdio;
import std.typecons;
import std.json;
import std.path;

import dard.systems.asset;
import dard.systems.config;
import dard.base.context;
import dard.types.string;
import dard.types.memory;
import dard.types.ref_count;
import dard.types.path;

struct Object3DAsset {
    this(this) @disable;

    this(Context) {
    }

    void deserialize(Context context, in JSONValue js) {
        _mesh = context.system!AssetSystem
            .get!MeshAsset(String(js["mesh"].str()));
        _material = context.system!AssetSystem
            .get!MaterialAsset(String(js["material"].str()));
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", P!"objects3d"));
    }

    static String autoPaths(Context context, in String name) {
        return String(buildPath(assetsPath(context), name.toString));
    }

    static auto makeDefaultRC(Context context) {
        auto p = makeShared!Object3DAsset();
        p._mesh = context.system!AssetSystem
            .get!MeshAsset(S!"__default__");
        p._material = context.system!AssetSystem
            .get!MaterialAsset(S!"__default__");

        return p;
    }

    ref mesh() {
        return _mesh;
    }

    // ref material() {
    //     return _material;
    // }

    auto material() {
        return _material.get();
    }

private:
    RC!MeshAsset _mesh;
    RC!MaterialAsset _material;
}
