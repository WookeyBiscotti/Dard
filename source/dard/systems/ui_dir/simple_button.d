module dard.systems.ui_dir.simple_button;

import dard.systems.ui;
import dard.systems.render;

class SimpleButton : Widget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();
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
    }

    override Widget onPressed(ref const UIMouseButtonPressed e) {
        _state = !_state;

        return null;
    }

private:
    bool _state;
}
