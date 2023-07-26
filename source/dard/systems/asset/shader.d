module dard.systems.asset.shader;

import std.stdio;
import std.typecons;
import std.file;
import std.exception;
import std.path;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.systems.logger;
import dard.base.context;
import dard.types.string;
import dard.types.path;
import dard.types.ref_count;

enum {
    ShaderTypeFS = 0,
    ShaderTypeVS = 1
}
alias ShaderAssetFS = ShaderAsset!ShaderTypeFS;
alias ShaderAssetVS = ShaderAsset!ShaderTypeVS;

struct ShaderAsset(int ShaderType) {
    this(this) @disable;

    this(Context) {
    }

    void deserialize(Context, in ref BinaryData data) {
        auto m = bgfx_copy(data.data.ptr, cast(uint) data.data.length);
        _sh = bgfx_create_shader(m);
    }

    static String getSubPath() {
        switch (getCurrentRender()) {
        case RenderType.BGFX_RENDERER_TYPE_VULKAN:
            return S!"spirv";
        case RenderType.BGFX_RENDERER_TYPE_OPENGL:
            return S!"glsl";
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D9:
            return S!"dx9";
        case RenderType.BGFX_RENDERER_TYPE_METAL:
            return S!"metal";
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D11:
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D12:
            return S!"dx11";
        default:
            fatal("No such shaders");
        }
        assert(0);
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", P!"shaders"));
    }

    static String autoPaths(Context context, in String name) {
        static if (ShaderType == ShaderTypeFS) {
            return String(buildPath(assetsPath(context), name.toString, getSubPath, "main.fs.bin"));
        } else {
            return String(buildPath(assetsPath(context), name.toString, getSubPath, "main.vs.bin"));
        }
    }

    static auto makeDefaultRC(Context context) {
        const(ubyte)[] data;
        static if (ShaderType == ShaderTypeVS) {
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
        } else {
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
        }

        auto m = bgfx_make_ref(data.ptr, cast(uint) data.length);

        auto s = makeShared!ShaderAsset();
        s._sh = bgfx_create_shader(m);

        return s;
    }

    auto bgfx() {
        return _sh;
    }

    ~this() nothrow {
        if (_sh.idx) {
            bgfx_destroy_shader(_sh);
        }
    }

private:
    bgfx_shader_handle_t _sh;
}
