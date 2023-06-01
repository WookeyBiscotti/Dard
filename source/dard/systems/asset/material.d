module dard.systems.asset.material;

import std.stdio;
import std.typecons;
import std.json;

import dard.systems.asset;
import dard.base.context;
import dard.types.string;
import dard.types.memory;

struct MaterialAsset {
    this(Context context, File file, in String name) {
        auto data = NewArray!char(file.size());
        scope (exit)
            Delete(data);
        auto js = parseJSON(data);

        _prog = context.system!AssetSystem.program(String(js["program"].str()));
    }

private:
    RefCounted!ProgramAsset _prog;
}

auto makeDefaultMaterial(AssetSystem sys) {
    auto p = RefCounted!MaterialAsset();
    p._prog = sys.program(S!"__default__");

    return p;
}
