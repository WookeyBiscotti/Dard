module dard.systems.ui.circle;

public import dard.types.color;
import dard.types.math.vector;

import nanovg;

struct Circle {
    Vector2f p = [0, 0];
    float r = 1.0f;
    Color c1;
    Color c2;

    void draw(NVGcontext* nvg) {
        nvgSave(nvg);
        scope (exit) {
            nvgRestore(nvg);
        }

        nvgBeginPath(nvg);
        nvgCircle(nvg, p.x, p.y, r);
        auto paint = nvg.nvgLinearGradient(p.x, p.y - r, p.x, p.y + r,
                cast(NVGcolor) c1, cast(NVGcolor) c2);
        nvgFillPaint(nvg, paint);
        nvgFill(nvg);
        nvgStrokeWidth(nvg, 1);
        nvgStrokeColor(nvg, nvgRGB(0, 0, 0));
        nvgStroke(nvg);
    }
}
