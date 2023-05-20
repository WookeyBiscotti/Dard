module dard.systems.ui.text;

public import dard.types.color;
public import dard.types.string;
import dard.types.math.vector;

import nanovg;

// import std.string;
import core.lifetime;

struct Text {
    Color fontColor;
    Vector2f p = [0, 0];

    void draw(NVGcontext* nvg) {
        auto s = size(nvg);

        nvgFontFaceId(nvg, _nvgFont);
        nvgFontSize(nvg, _fontSize);
        nvgFontBlur(nvg, 0);
        nvgFillColor(nvg, cast(NVGcolor) fontColor);
        nvgText(nvg, p.x, p.y + s.y, _text.ptr, null);
    }

    void drawShadow(NVGcontext* nvg, Color color, float blur, Vector2f dp = Vector2f(0, 0)) {
        auto s = size(nvg);

        nvgFontFaceId(nvg, _nvgFont);
        nvgFontSize(nvg, _fontSize);
        nvgFontBlur(nvg, blur);
        nvgFillColor(nvg, cast(NVGcolor) color);
        nvgText(nvg, p.x + dp.x, p.y + dp.y + s.y, _text.ptr, null);
    }

    void nvgFont(int id) {
        _nvgFont = id;
        _dirt = true;
    }

    void fontSize(float size) {
        _fontSize = size;
        _dirt = true;
    }

    void text(String text) {
        move(text, _text);
        _dirt = true;
    }

    Vector2f size(NVGcontext* nvg) {
        if (_dirt) {
            nvgSave(nvg);
            scope (exit)
                nvgRestore(nvg);
            nvgReset(nvg);

            nvgFontFaceId(nvg, _nvgFont);
            nvgFontSize(nvg, _fontSize);
            float[4] bounds = void;
            nvgTextBounds(nvg, 0.0f, 0.0f, _text.ptr, null, bounds.ptr);
            _size.x = bounds[2] - bounds[0];
            _size.y = /*bounds[3] */ -bounds[1];
            // _size.y = bounds[3] - bounds[1];

            _dirt = false;
        }

        return _size;
    }

private:
    bool _dirt;
    Vector2f _size;
    int _nvgFont;
    float _fontSize = 10;
    String _text;
}
