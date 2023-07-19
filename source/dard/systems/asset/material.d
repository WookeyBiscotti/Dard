module dard.systems.asset.material;

import std.stdio;
import std.typecons;
import std.json;
import std.path;

import dard.systems.asset;
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

    this(Context) {
    }

    void deserialize(Context context, in JSONValue js) {
        _prog = context.system!AssetSystem
            .get!ProgramAsset(String(js["program"].str()));
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", "materials"));
    }

    static String autoPaths(Context context, in String name) {
        return String(buildPath(assetsPath(context), name.toString));
    }

    static auto makeDefaultRC(Context context) {
        auto p = makeShared!MaterialAsset();
        p._prog = context.system!AssetSystem
            .get!ProgramAsset(S!"__default__");

        return p;
    }

    ~this() nothrow {
    }

    auto program() const {
        return _prog.get();
    }

private:
    RC!ProgramAsset _prog;
}
