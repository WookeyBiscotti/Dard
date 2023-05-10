module dard.systems.ui.rect;

public import dard.types.color;
import dard.types.math.vector;

import nanovg;

struct Rect {
    Vector2f p = [0, 0];
    Vector2f s = [0, 0];
    Color c1;
    Color c2;
    float round = 0;

    void draw(NVGcontext* nvg) {
        nvgSave(nvg);
        scope (exit) {
            nvgRestore(nvg);
        }

        nvgBeginPath(nvg);
        nvgRoundedRect(nvg, p.x, p.y, s.x, s.y, round);
        auto paint = nvg.nvgLinearGradient(p.x, p.y, p.x, p.y + s.y,
                cast(NVGcolor) c1, cast(NVGcolor) c2);
        nvgFillPaint(nvg, paint);
        nvgFill(nvg);
        nvgStrokeWidth(nvg, 1);
        nvgStrokeColor(nvg, nvgRGB(0, 0, 0));
        nvgStroke(nvg);
    }
}
