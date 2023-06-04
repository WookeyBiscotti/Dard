module dard.systems.asset.asset;

import dard.base.system;
import dard.base.context;
import dard.systems.logger;
import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.systems.asset;
import dard.types.string;
import dard.types.path;
import dard.types.hash_map;
import dard.types.ref_count;

import std.container.util;
import std.typecons;
import std.stdio;
import std.format;
import std.string;
import std.file;
import std.path;

class AssetSystem : System {
public:
    this(Context context) {
        super(context);

        _fonts[S!"__default__"] = RC!FontAsset(context,
                BinaryData(builtin_default_font), Str!"__default__");
        _meshs[S!"__default__"] = makeDefaultCudeMesh();
        _shaders[S!"__default.fs__"] = makeDefaultFsShader();
        _shaders[S!"__default.vs__"] = makeDefaultVsShader();
        _programs[S!"__default__"] = makeDefaultProgram(this);
        _materials[S!"__default__"] = makeDefaultMaterial(this);
        _object3ds[S!"__default__"] = makeDefaultObject3D(this);
    }

    ~this(){
    }

    Path meshPath() {
        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"meshes");
    }

    Path fontPath() {
        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"fonts");
    }

    Path programPath() {
        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"programs");
    }

    Path materialPath() {
        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"materials");
    }

    Path object3dPath() {
        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"object3d");
    }

    Path shaderPath() {
        Path subPath;
        switch (getCurrentRender()) {
        case RenderType.BGFX_RENDERER_TYPE_VULKAN:
            subPath = "spirv";
            break;
        case RenderType.BGFX_RENDERER_TYPE_OPENGL:
            subPath = "glsl";
            break;
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D9:
            subPath = "dx9";
            break;
        case RenderType.BGFX_RENDERER_TYPE_METAL:
            subPath = "metal";
            break;
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D11:
        case RenderType.BGFX_RENDERER_TYPE_DIRECT3D12:
            subPath = "dx11";
            break;
        default:
            fatal("No such shaders");
        }

        return buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, P!"shaders", subPath);
    }

private:
    mixin assetImpl!(FontAsset, "font");
    mixin assetImpl!(MeshAsset, "mesh");
    mixin assetImpl!(ShaderAsset, "shader");
    mixin assetImpl!(ProgramAsset, "program");
    mixin assetImpl!(MaterialAsset, "material");
    mixin assetImpl!(Object3DAsset, "object3d");

    mixin template assetImpl(T, string Name) {
        mixin(format(q{
            private HashMap!(const String, RC!T) _%ss;

            public RC!T %s(in String name) {
                if (auto a = name in _%ss) {
                    return *a;
                }
                warning("Can't find "~typeid(T).name()~" `" ~ name ~ "`, use default");

                return _%ss[Str!"__default__"];
            }

            public void load%s(in String filepath, in String name) {
                if (auto f = name in _%ss) {
                    warning("This asset alias already in use: " ~ name);

                    return;
                }

                auto file = File(buildPath(%sPath(),  buildNormalizedPath(filepath.toString)));
                // TODO: Проверить плохой вариант
                _%ss[name] = RC!T(context(), file, name);
            }
        }, Name, Name, Name, Name, capitalize(Name), Name, Name, Name));
    }
}
