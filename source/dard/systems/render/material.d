// module dard.systems.render.material;

// import std.sumtype;
// import std.meta;
// import std.traits;
// import dard.types.color;
// import dard.types.string;
// import dard.types.memory;
// import dard.types.math.vector;
// import dard.systems.render.uniform;
// import dard.systems.asset.texture;

// struct TextureTag {
//     String v;
// }

// struct MaterialEntryDeclImpl(string Name, Args...) {
// }

// mixin template MaterialDeclImpl(Args...) {
//     string structStr = "struct MaterialDeclImpl {\n";

// }

// struct MaterialDecl {
//     SumType!(Color, String) baseColor;
//     SumType!(float, String) metallic;
//     SumType!(float, String) roughness;
//     SumType!(Color, String) emissiveColor;
//     SumType!(Vector3f, String) normal;
//     SumType!(Vector3f, String) depth;
// }

// struct MaterialRT {
//     SharedPtr!Uniform baseColor;
//     SharedPtr!Uniform metallic;
//     SharedPtr!Uniform roughness;
//     SharedPtr!Uniform emissiveColor;
//     SharedPtr!Uniform normal;
//     SharedPtr!Uniform depth;

//     SharedPtr!MaterialDecl decl;
// }

// struct MaterialData {
// private:
//     bool _dirty;

//     mixin template PropertyImpl(string Name, Args...) {
//         mixin("private SumType!(Args) _" ~ Name ~ ";");
//         mixin("private bool _" ~ Name ~ "Dirty;");
//         mixin("
//         public @property ref auto " ~ Name ~ "() {
//             return _" ~ Name ~ ";
//         }");
//         static foreach (T; Args) {
//             mixin("
//             public @property ref void " ~ Name ~ "(T v) {
//                 _" ~ Name ~ " = v;
//                 _" ~ Name ~ "Dirty = true;
//             }");
//         }
//     }

// public:
//     mixin PropertyImpl!("baseColor", Color, SharedPtr!TextureAsset);
//     mixin PropertyImpl!("metallic", float, SharedPtr!TextureAsset);
//     mixin PropertyImpl!("roughness", float, SharedPtr!TextureAsset);
//     mixin PropertyImpl!("emissiveColor", Color, SharedPtr!TextureAsset);
//     mixin PropertyImpl!("normal", Vector3f, SharedPtr!TextureAsset);
//     mixin PropertyImpl!("depth", Vector3f, SharedPtr!TextureAsset);

//     SharedPtr!MaterialRT rt;

//     void update() {
//         if (_baseColorDirty) {
//             _baseColor.match!((Color v) => rt.baseColor.set(v),
//                     (SharedPtr!TextureAsset v) => rt.baseColor.set(v),);
//             _baseColorDirty = false;
//         }
//         if (_metallicDirty) {
//             _metallic.match!((float v) => rt.metallic.set(v),
//                     (SharedPtr!TextureAsset v) => rt.metallic.set(v),);
//             _metallicDirty = false;
//         }
//         if (_roughnessDirty) {
//             _roughness.match!((float v) => rt.roughness.set(v),
//                     (SharedPtr!TextureAsset v) => rt.roughness.set(v),);
//             _roughnessDirty = false;
//         }
//         if (_emissiveColorDirty) {
//             _emissiveColor.match!((Color v) => rt.emissiveColor.set(v),
//                     (SharedPtr!TextureAsset v) => rt.emissiveColor.set(v),);
//             _emissiveColorDirty = false;
//         }
//         if (_normalDirty) {
//             _normal.match!((Vector3f v) => rt.normal.set(v),
//                     (SharedPtr!TextureAsset v) => rt.normal.set(v),);
//             _normalDirty = false;
//         }
//         if (_depthDirty) {
//             _depth.match!((Vector3f v) => rt.depth.set(v),
//                     (SharedPtr!TextureAsset v) => rt.depth.set(v),);
//             _depthDirty = false;
//         }
//     }
// }

module dard.systems.render.material;

import dard.types.json;
import dard.types.string;
import dard.systems.asset;
import dard.base.context;
import dard.types.memory;
import dard.components.graphic_object;

abstract class Material {
    // Call before object submited
    void submit(const ref GraphicObject obj);

    ref ProgramAsset program();

    void deserialize(in ref JSONValue js);
}

class DefaultMaterial : Material {
    this(Context ctx) {
        _program = ctx.system!AssetSystem
            .get!ProgramAsset(S!"__default__");
    }

    override void submit(const ref GraphicObject obj) {
    }

    override ref ProgramAsset program() {
        return *_program.get();
    }

    override void deserialize(in ref JSONValue js) {
    }

private:
    SP!ProgramAsset _program;
}
