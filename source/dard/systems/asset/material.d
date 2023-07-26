module dard.systems.asset.material;

import std.stdio;
import std.typecons;
import std.json;
import std.path;
import core.lifetime;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.render;
import dard.systems.config;
import dard.base.context;
import dard.types.string;
import dard.types.memory;
import dard.types.vector;
import dard.systems.render.uniform;
import dard.types.ref_count;
import dard.types.path;

struct MaterialAsset {
    this(this) @disable;

    this(scope UniquePtr!Material mat) {
        _mat.moveFrom(mat);
    }

    ~this() nothrow {
    }

    auto material() {
        return _mat.get();
    }

private:
    UP!Material _mat;
}

class MaterialFactory {
    abstract UP!Material make(Context ctx, in String name);
}
