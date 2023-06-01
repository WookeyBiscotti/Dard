module dard.systems.asset.shader;

import std.stdio;
import std.typecons;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.logger;
import dard.base.context;
import dard.types.string;
import dard.types.ref_count;

struct ShaderAsset {
    this(Context context, File file, in String name) {
        auto data = BinaryData(file);

        auto m = bgfx_make_ref(data.data.ptr, cast(uint) data.data.length);
        _sh = bgfx_create_shader(m);
    }

    auto bgfx() {
        return _sh;
    }

    ~this() {
        if (_sh.idx) {
            bgfx_destroy_shader(_sh);
        }
    }

private:
    bgfx_shader_handle_t _sh;
}

auto makeDefaultVsShader() {
    const(ubyte)[] data;
    switch (getCurrentRender()) {
    case RenderType.BGFX_RENDERER_TYPE_VULKAN:
        import dard.systems.asset.builtin_shaders.spirv_vs;

        data = spirv_vs;
        break;
    case RenderType.BGFX_RENDERER_TYPE_OPENGL:
        import dard.systems.asset.builtin_shaders.glsl_vs;

        data = glsl_vs;
        break;
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D9:
        //     subPath = "dx9";
        //     break;
    case RenderType.BGFX_RENDERER_TYPE_METAL:
        import dard.systems.asset.builtin_shaders.metal_vs;

        data = metal_vs;
        break;
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D11:
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D12:
        //     subPath = "dx11";
        //     break;
    default:
        fatal("No such shaders");
    }

    auto m = bgfx_make_ref(data.ptr, cast(uint) data.length);

    auto s = RC!ShaderAsset();
    s._sh = bgfx_create_shader(m);

    return s;
}

auto makeDefaultFsShader() {
    const(ubyte)[] data;
    switch (getCurrentRender()) {
    case RenderType.BGFX_RENDERER_TYPE_VULKAN:
        import dard.systems.asset.builtin_shaders.spirv_fs;

        data = spirv_fs;
        break;
    case RenderType.BGFX_RENDERER_TYPE_OPENGL:
        import dard.systems.asset.builtin_shaders.glsl_fs;

        data = glsl_fs;
        break;
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D9:
        //     subPath = "dx9";
        //     break;
    case RenderType.BGFX_RENDERER_TYPE_METAL:
        import dard.systems.asset.builtin_shaders.metal_fs;

        data = metal_fs;
        break;
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D11:
        // case RenderType.BGFX_RENDERER_TYPE_DIRECT3D12:
        //     subPath = "dx11";
        //     break;
    default:
        fatal("No such shaders");
    }

    auto m = bgfx_make_ref(data.ptr, cast(uint) data.length);

    auto s = RC!ShaderAsset();
    s._sh = bgfx_create_shader(m);

    return s;
}
