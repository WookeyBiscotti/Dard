module dard.systems.asset.program;

import std.stdio;
import std.typecons;
import std.json;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.logger;
import dard.base.context;
import dard.types.string;
import dard.types.memory;

struct ProgramAsset {
    this(Context context, File file, in String name) {
        auto data = NewArray!char(file.size());
        scope (exit)
            Delete(data);
        auto js = parseJSON(data);

        _vs = context.system!AssetSystem.shader(String(js["vs"].str()));
        _fs = context.system!AssetSystem.shader(String(js["fs"].str()));

        _prog = bgfx_create_program(_vs.bgfx(), _fs.bgfx(), false);
    }

    ~this() {
        if (_prog.idx) {
            bgfx_destroy_program(_prog);
        }
    }

private:
    RefCounted!ShaderAsset _vs;
    RefCounted!ShaderAsset _fs;

    bgfx_program_handle_t _prog;
}

auto makeDefaultProgram(AssetSystem sys) {
    auto p = RefCounted!ProgramAsset();
    p._vs = sys.shader(S!"__default.vs__");
    p._fs = sys.shader(S!"__default.fs__");

    p._prog = bgfx_create_program(p._vs.bgfx(), p._fs.bgfx(), false);

    return p;
}
