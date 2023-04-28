module dard.types.color;

import nanovg;

struct Color {
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;

    NVGcolor opCast(NVGcolor)() const {
        NVGcolor c = void;
        c.rgba = [r / 255.0f, g / 255.0f, b / 255.0f, a / 255.0f];

        return c;
    }

}
