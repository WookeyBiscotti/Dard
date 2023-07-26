module dard.types.color;

import dard.systems.logger;

import nanovg;

struct Color {
    // this(ubyte r, ubyte g, ubyte b) {
    //     r = r;
    //     g = g;
    //     b = b;
    //     // a = a;
    // }

    // this(uint value) {
    //     r = (value & 0xff000000) >> 24;
    //     g = (value & 0x00ff0000) >> 16;
    //     b = (value & 0x0000ff00) >> 8;
    //     a = (value & 0x000000ff) >> 0;
    // }

    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a = ubyte.max;

    float norm(string s)() const {
        return mixin(s) / 255.0f;
    }

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

    static Color fromHex(uint value) {
        Color col;
        col.r = (value & 0xff000000) >> 24;
        col.g = (value & 0x00ff0000) >> 16;
        col.b = (value & 0x0000ff00) >> 8;
        col.a = (value & 0x000000ff) >> 0;
        return col;
    }

    static Color fromNormal(float r, float g, float b, float a = 1.0f) {
        Color col;
        col.r = cast(ubyte)(r * 255);
        col.g = cast(ubyte)(g * 255);
        col.b = cast(ubyte)(b * 255);
        col.a = cast(ubyte)(a * 255);//(1.000, 0.766, 0.336)
        return col;
    }

}
