module dard.systems.asset.material;

import std.stdio;
import std.typecons;
import std.json;

import dard.systems.asset;
import dard.systems.render;
import dard.base.context;
import dard.types.string;
import dard.types.memory;
import dard.types.vector;
import dard.types.ref_count;

struct MaterialAsset {
    this(Context context, File file, in String name) {
        auto data = NewArray!char(file.size());
        file.rawRead(data);
        scope (exit)
            Delete(data);
        auto js = parseJSON(data);

        _prog = context.system!AssetSystem.program(String(js["program"].str()));
    }

    ref auto program() {
        return _prog;
    }

private:
    Array!Pass _passes;
    RC!ProgramAsset _prog;
}

auto makeDefaultMaterial(AssetSystem sys) {
    auto p = RC!MaterialAsset();
    p._prog = sys.program(S!"__default__");

    Pass pass;
    pass.prog = sys.program(S!"__default__");
    pass.outViews ~= MAIN_VIEW;
    p._passes ~= pass;


    return p;
}
