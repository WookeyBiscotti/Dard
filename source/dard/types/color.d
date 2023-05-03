module dard.types.color;

import nanovg;

struct Color {
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a = ubyte.max;

    NVGcolor opCast(NVGcolor)() const {
        NVGcolor c = void;
        c.rgba = [r / 255.0f, g / 255.0f, b / 255.0f, a / 255.0f];

        return c;
    }

    Color opBinary(string op : "*", T)(T v) const if (__traits(isArithmetic, T)) {
        import std.algorithm;

        return Color(cast(ubyte) min(max(cast(ushort)(r * v), ubyte.min), ubyte.max),
                cast(ubyte) min(max(cast(ushort)(g * v), ubyte.min), ubyte.max),
                cast(ubyte) min(max(cast(ushort)(b * v), ubyte.min), ubyte.max));
    }

    Color makeDarker(float d) const {
        const s = (1 - d);

        return this * s;
    }

    Color makeLighter(float d) const {
        const s = (1 + d);

        return this * s;
    }

}
