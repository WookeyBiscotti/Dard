module dard.systems.asset.program;

import std.stdio;
import std.typecons;
import std.json;
import std.path;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.systems.logger;
import dard.base.context;
import dard.types.string;
import dard.types.memory;
import dard.types.ref_count;
import dard.types.path;

struct ProgramAsset {
    this(this) @disable;

    this(Context) {
    }

    void deserialize(Context context, in JSONValue js) {
        _vs = context.system!AssetSystem
            .get!ShaderAssetVS(String(js["vs"].str()));
        _fs = context.system!AssetSystem
            .get!ShaderAssetFS(String(js["fs"].str()));

        _prog = bgfx_create_program(_vs.bgfx(), _fs.bgfx(), false);
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", P!"programs"));
    }

    static String autoPaths(Context context, in String name) {
        return String(buildPath(assetsPath(context), name.toString));
    }

    static auto makeDefaultRC(Context context) {
        auto p = makeShared!ProgramAsset();
        p._vs = context.system!AssetSystem
            .get!ShaderAssetVS(S!"__default__");
        p._fs = context.system!AssetSystem
            .get!ShaderAssetFS(S!"__default__");

        p._prog = bgfx_create_program(p._vs.bgfx(), p._fs.bgfx(), false);
        assert(p._prog.idx != ushort.max, "Invalid idx");

        return p;
    }

    auto bgfx() const {
        return _prog;
    }

    ~this() nothrow {
        if (_prog.idx) {
            auto i = _prog.idx;
            bgfx_destroy_program(_prog);
        }
    }

private:
    RC!ShaderAssetVS _vs;
    RC!ShaderAssetFS _fs;

    bgfx_program_handle_t _prog;
}
