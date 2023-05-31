module dard.systems.asset.font;

public import dard.systems.asset.binary_data;

import std.stdio;

import bindbc.bgfx;

import dard.systems.asset;
import dard.systems.render;
import dard.base.context;
import dard.types.string;

struct FontAsset {
    // @disable this();
    this(Context context, in BinaryData data, in String name) {
        auto nvg = context.system!Render.nvg();
        nvgFont = nvgCreateFontMem(nvg, name.ptr, cast(ubyte*) data.data.ptr,
                cast(int) data.data.length, 0);
    }

    this(Context context, File file, in String name) {
        auto data = BinaryData(file);
        auto nvg = context.system!Render.nvg();
        nvgFont = nvgCreateFontMem(nvg, name.ptr, data.data().ptr, cast(int) data.data().length, 0);
    }

    int nvgFont = -1;
}
