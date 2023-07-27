module dard.systems.asset.texture;

public import dard.systems.asset.binary_data;

import std.stdio;
import std.string;
import std.path;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.base.context;
import dard.types.string;
import dard.types.ref_count;
import dard.types.json;
import dard.types.path;

struct TextureAsset {
    this(this) @disable;

    this(Context) {
    }

    void deserialize(Context context, in BinaryData data) {
        auto m = bgfx_copy(data.data.ptr, cast(uint) data.data.length);
        _hdl = bgfx_create_texture(m, BGFX_TEXTURE_SRGB | BGFX_SAMPLER_U_MIRROR, false, null);
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", "textures"));
    }

    static String autoPaths(This)(Context context, in String name) {
        return String(buildPath(This.assetsPath(context), name.toString ~ ".dds"));
    }

    static auto makeDefaultRC(Context context) {
        auto p = makeShared!TextureAsset(context);

        return p;
    }

    auto bgfx() const {
        return _hdl;
    }

private:
    bgfx_texture_handle_t _hdl;
}
