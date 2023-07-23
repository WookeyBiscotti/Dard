module dard.systems.asset.asset;

import dard.base.system;
import dard.base.context;
import dard.systems.logger;
import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.systems.asset;
import dard.systems.render.material;
import dard.types.string;
import dard.types.path;
import dard.types.json;
import dard.types.hash_map;
import dard.types.ref_count;

import std.container.util;
import std.typecons;
import std.stdio;
import std.format;
import std.string;
import std.file;
import std.path;
import std.traits;

class AssetSystem : System {
public:
    this(Context context) {
        super(context);
    }

    override void initialize() {
        _fonts[S!"__default__"] = FontAsset.makeDefaultRC(context);
        _meshes[S!"__default__"] = MeshAsset.makeDefaultRC(context);
        _shadersFS[S!"__default__"] = ShaderAssetFS.makeDefaultRC(context);
        _shadersVS[S!"__default__"] = ShaderAssetVS.makeDefaultRC(context);
        _programs[S!"__default__"] = ProgramAsset.makeDefaultRC(context);
        load!MaterialAsset(S!"__default__",
                makeShared!MaterialAsset(makeUnique!DefaultMaterial(context).moveTo!Material()));
        _object3ds[S!"__default__"] = Object3DAsset.makeDefaultRC(context);
    }

    ~this() {
    }

    mixin assetImpl!(FontAsset, "fonts");
    mixin assetImpl!(MeshAsset, "meshes");
    mixin assetImpl!(ShaderAssetFS, "shadersFS");
    mixin assetImpl!(ShaderAssetVS, "shadersVS");
    mixin assetImpl!(ProgramAsset, "programs");
    mixin assetImpl!(MaterialAsset, "materials");
    mixin assetImpl!(Object3DAsset, "object3ds");

private:
    mixin template assetImpl(T, string Name) {
        mixin("private HashMap!(String, RC!T, true) _" ~ Name ~ ";");

        static if (!is(T == MaterialAsset)) {
            public RC!T get(TT : T)(in String name) {
                alias mapT = mixin("_" ~ Name);
                if (auto a = name in mapT) {
                    return *a;
                }

                auto autoPath = T.autoPaths(context, name);
                warning("Can't find " ~ typeid(T)
                        .name() ~ " `" ~ name ~ "` in cache with name: `"
                        ~ autoPath ~ "`, try to load");

                load!T(autoPath, name);
                if (auto a = name in mapT) {
                    return *a;
                }

                warning("Can't find " ~ typeid(T).name() ~ " `" ~ name ~ "` load default");

                return mapT[Str!"__default__"];
            }

            public void load(TT : T)(in String filepath, in String name) {
                alias mapT = mixin("_" ~ Name);

                if (auto f = name in mapT) {
                    warning("This asset alias already in use: " ~ name);

                    return;
                }

                auto file = File(buildNormalizedPath(filepath.toString));
                auto bd = BinaryData(file);
                mapT[name] = makeShared!T(context);
                static if (is(Parameters!(T.deserialize)[1] == const(BinaryData))) {
                    bd.meta[S!"name"] = name;
                    mapT[name].deserialize(context, bd);
                } else {
                    auto js = parseJSON(cast(char[]) bd.data);
                    mapT[name].deserialize(context, js);
                }
            }
        }

        static if (is(T == MaterialAsset)) {
            public void load(TT : T)(in String name, SP!MaterialAsset m) {
                alias mapT = mixin("_" ~ Name);

                mapT[name] = m;
            }

            public RC!T get(TT : T)(in String name) {
                alias mapT = mixin("_" ~ Name);
                if (auto a = name in mapT) {
                    return *a;
                }

                warning("Can't find " ~ typeid(T).name() ~ " `" ~ name ~ "` load default");

                return mapT[Str!"__default__"];
            }
        }
    }
}
