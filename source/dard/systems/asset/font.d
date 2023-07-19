module dard.systems.asset.font;

public import dard.systems.asset.binary_data;

import std.stdio;
import std.string;
import std.path;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.systems.config;
import dard.base.context;
import dard.types.string;
import dard.types.ref_count;
import dard.types.json;
import dard.types.path;

struct FontAsset {
    this(this) @disable;

    this(Context) {
    }

    void deserialize(Context context, in BinaryData data) {
        auto nvg = context.system!Render.nvg();
        String name;
        if (auto found = S!"name" in data.meta) {
            name = *found;
        }

        _nvgFont = nvgCreateFontMem(nvg, name.ptr, cast(ubyte*) data.data()
                .ptr, cast(int) data.data().length, 0);
    }

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", "fonts"));
    }

    static String autoPaths(This)(Context context, in String name) {
        return String(buildPath(This.assetsPath(context), name.toString ~ ".ttf"));
    }

    static auto makeDefaultRC(Context context) {
        import dard.systems.asset.builtin_default_font;

        auto nvg = context.system!Render.nvg();
        auto p = makeShared!FontAsset(context);
        p._nvgFont = nvgCreateFontMem(nvg, "__default__",
                builtin_default_font.ptr, cast(int) builtin_default_font.length, 0);

        return p;
    }

    int nvgFont() const {
        return _nvgFont;
    }

private:
    int _nvgFont = -1;
}
