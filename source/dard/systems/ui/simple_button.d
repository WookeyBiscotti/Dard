module dard.systems.ui.simple_button;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;

class SimpleButton : Widget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();
        auto font = system().context.system!AssetSystem.font("");
        nvg.nvgSave();
        scope (exit) {
            nvg.nvgRestore();
        }

        auto p = realPosition();
        auto s = realSize();
        nvg.nvgSave();
        nvg.nvgBeginPath();
        nvg.nvgRoundedRect(p.x, p.y, s.x, s.y, 5);
        if (_state) {
            auto paint = nvg.nvgLinearGradient(p.x, p.y, p.x, p.y + s.y, nvgRGB(30, 30, 30), nvgRGB(50, 50, 50));
            nvg.nvgFillPaint(paint);
        } else {
            auto paint = nvg.nvgLinearGradient(p.x, p.y, p.x, p.y + s.y, nvgRGB(50, 50, 50), nvgRGB(70, 70, 70));
            nvg.nvgFillPaint(paint);
        }
        nvg.nvgFill();
        nvgStrokeWidth(nvg, 1);
        nvgStrokeColor(nvg, nvgRGB(0, 0, 0));
        nvgStroke(nvg);

        const char* txt = "Text me up.";
        nvgFontFace(nvg, "sans-bold");
        nvgFontSize(nvg, 18.0f);

        // nvgTextAlign(nvg, NVG_ALIGN_CENTER | NVG_ALIGN_MIDDLE);

        // nvgCreateFont(ctx, name, filename);
        nvgFontBlur(nvg, 2);
        nvgFillColor(nvg, nvgRGBA(0, 0, 0, 128));
        nvgTextBox(nvg, 30.0f, 30.0f, 10.0f, txt, null);
        // nvgText(vg, x + w / 2, y + 16 + 1, title, NULL);
    }

    override Widget onPressed(ref const UIMouseButtonPressed e) {
        _state = !_state;

        return null;
    }

private:
    bool _state;
}
