module dard.systems.asset;

import dard.base.system;
import dard.base.context;
import dard.systems.logger;

import std.container.util;
import std.typecons;

public import dard.systems.asset_dir.font;

class AssetSystem : System {
public:
    this(Context context) {
        super(context);
        import dard.systems.asset_dir.builtin_default_font;

        _fonts["__default__"] = FontAsset(BinaryData(builtin_default_font));
    }

    void loadFont(string filepath, string name) {
        if (auto f = name in _fonts) {
            warning("This asset alias already in use: " ~ name);

            return;
        }
        auto data = BinaryData(filepath);

        _fonts[name] = FontAsset(data);
    }

    RefCounted!FontAsset font(string name) {
        if (auto f = name in _fonts) {
            return *f;
        }
        warning("Can't find font `" ~ name ~ "`, use default");

        return _fonts["__default__"];
    }

private:
    RefCounted!FontAsset[string] _fonts;
}
