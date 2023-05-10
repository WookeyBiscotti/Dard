module dard.systems.asset.asset;

import dard.base.system;
import dard.base.context;
import dard.systems.logger;
import dard.systems.asset;
import dard.systems.render;
import dard.types.string;

import std.container.util;
import std.typecons;

class AssetSystem : System {
public:
    this(Context context) {
        super(context);
        auto f = RefCounted!FontAsset(BinaryData(builtin_default_font));

        auto nvg = context.system!Render.nvg();

        auto data = f.data.to!(ubyte[]);
        f.nvgFont = nvgCreateFontMem(nvg, "__default__", data.ptr, cast(int) data.length, 0);
        _fonts[String("__default__")] = f;
    }

    void loadFont(String filepath, String name) {
        if (auto f = name in _fonts) {
            warning("This asset alias already in use: " ~ name);

            return;
        }
        auto data = BinaryData(filepath);

        _fonts[name] = FontAsset(data);
    }

    RefCounted!FontAsset font(String name) {
        if (auto f = name in _fonts) {
            return *f;
        }
        warning("Can't find font `" ~ name ~ "`, use default");

        return _fonts[String("__default__")];
    }

private:
    RefCounted!FontAsset[String] _fonts;
}
