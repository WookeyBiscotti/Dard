module dard.systems.asset.shader;

import std.stdio;

import bindbc.bgfx;

import dard.systems.asset;
import dard.base.context;
import dard.types.string;

struct ShaderAsset {
    this(Context context, File file, in String name) {
        auto data = BinaryData(file);

        auto m = bgfx_make_ref(data.data.ptr, data.data.sizeof);
        _sh = bgfx_create_shader(m);
    }

private:
    bgfx_shader_handle_t _sh;
}
