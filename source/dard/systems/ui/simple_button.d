module dard.systems.ui.simple_button;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;

class SimpleButton : Widget {
    this(UiSystem system, string label, GroupWidget parent = null) {
        super(system, parent);

        minSize(Vector2f(0, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));

        auto nvg = system.context.system!Render.nvg();

        _text.text(label);
        _text.nvgFont(nvgFindFont(nvg, defStyleVal!(Styles.DEFAULT_FONT)));
        _text.fontColor = defStyleVal!(Styles.DEFAULT_FONT_COLOR);
        _text.fontSize(defStyleVal!(Styles.DEFAULT_FONT_SIZE));

    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();

        nvg.nvgSave();
        scope (exit) {
            nvg.nvgRestore();
        }

        const p = realPosition();
        const s = realSize();

        nvg.nvgBeginPath();
        nvg.nvgRoundedRect(p.x, p.y, s.x, s.y, 5);
        float textDy = -0.5f;
        if (_state) {
            auto paint = nvg.nvgLinearGradient(p.x, p.y, p.x, p.y + s.y,
                    cast(NVGcolor) defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeDarker(0.2f),
                    cast(NVGcolor) defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeLighter(0.2f));
            nvg.nvgFillPaint(paint);
            textDy = 0.5f;
        } else {
            auto paint = nvg.nvgLinearGradient(p.x, p.y, p.x, p.y + s.y,
                    cast(NVGcolor) defStyleVal!(Styles.WIDGET_UP_COLOR).makeDarker(0.2f),
                    cast(NVGcolor) defStyleVal!(Styles.WIDGET_UP_COLOR).makeLighter(0.2f));
            nvgFillPaint(nvg, paint);
        }
        nvg.nvgFill();
        nvgStrokeWidth(nvg, 1);
        nvgStrokeColor(nvg, nvgRGB(0, 0, 0));
        nvgStroke(nvg);

        _text.p.x = p.x + 0.5f * (s.x - _text.size(nvg).x);
        _text.p.y = p.y + _text.size(nvg).y + textDy + 0.5f * (s.y - _text.size(nvg).y);

        _text.drawShadow(nvg, Color(0, 0, 0), 3, Vector2f(0, 2));
        _text.draw(nvg);
    }

    override Widget onPressed(ref const UIMouseButtonPressed e) {
        _state = true;

        return null;
    }

    override Widget onReleased(const ref UIMouseButtonReleased) {
        _state = false;

        return null;
    }

    override Widget onUnhovered(ref const UIUnhovered e) {
        _state = false;

        return null;
    }

private:
    bool _state;
    Text _text;
}
