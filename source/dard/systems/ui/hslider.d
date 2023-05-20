module dard.systems.ui.hslider;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;
import std.algorithm;

struct SliderRelease {
}

class HSlider : Widget {
    this(UiSystem system, GroupWidget parent = null, float min = 0, float max = 100) {
        super(system, parent);
        _min = min;
        _max = max;

        minSize(Vector2f(0, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        maxSize(Vector2f(float.max, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));

        auto nvg = system.context.system!Render.nvg();

        _text.nvgFont(nvgFindFont(nvg, defStyleVal!(Styles.DEFAULT_FONT)));
        _text.fontColor = defStyleVal!(Styles.DEFAULT_FONT_COLOR);
        _text.fontSize(defStyleVal!(Styles.DEFAULT_FONT_SIZE));

        value(min);
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();

        const p = realPosition();
        const s = realSize();

        Rect(p, s, defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeDarker(0.2f),
                defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeLighter(0.2f), 5).draw(nvg);

        Rect(p + Vector2f(s.y * 0.5f, s.y * 0.5f - 1.5f), Vector2f(s.x - s.y, 3),
                defStyleVal!(Styles.WIDGET_UP_COLOR).makeDarker(0.2f),
                defStyleVal!(Styles.WIDGET_UP_COLOR).makeLighter(0.2f), 1).draw(nvg);

        drawValueBox();

        // Circle(p + Vector2f(s.y * 0.5f + valueToX(), s.y * 0.5f - 1.5f), s.y * 0.25f,
        //         defStyleVal!(Styles.WIDGET_UP_COLOR).makeDarker(0.2f),
        //         defStyleVal!(Styles.WIDGET_UP_COLOR).makeLighter(0.2f)).draw(nvg);
    }

    private float valueToX() const {
        const s = realSize();
        return indent() + (_value - _min) * (s.x - indent() * 2) / (_max - _min);
    }

    override Widget onDragStart(in UIMouseDragStart e) {
        _pressed = true;

        return onDrag(UIMouseDrag(e.p, e.force));
    }

    override Widget onDragStop(in UIMouseDragStop) {
        _pressed = false;

        return null;
    }

    override Widget onDrag(in UIMouseDrag e) {
        if (_pressed) {
            const s = realSize();
            auto p = e.p - realPosition();
            p.x -= 0.5f * s.y;

            if (p.x < 0) {
                value(_min);

                return null;
            }

            if (p.x >= s.x - s.y * 0.5f) {
                value(_max);

                return null;
            }
            p.x /= s.x - s.y;

            value(_min + p.x * (_max - _min));
        }

        return null;
    }

    auto value(float v) {
        if (v == _value) {
            return this;
        }

        import std.conv;
        import std.format;

        _value = min(max(v, _min), _max);

        char[20] buf;
        buf[].sformat("%.2f", _value);
        _text.text(String(buf.ptr));

        return this;
    }

    private void drawValueBox() {
        auto nvg = system().context.system!Render.nvg();

        const p = realPosition();
        const s = realSize();

        const vb = _text.size(nvg);

        Rect(p + Vector2f(valueToX() - vb.x * 0.5f - 2, (s.y - vb.y) * 0.5f - 2),
                vb + Vector2f(4, 4), defStyleVal!(Styles.WIDGET_DOWN_COLOR)
                .makeDarker(0.2f), defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeLighter(0.2f), 5).draw(
                nvg);
        _text.p = p + Vector2f(valueToX() - vb.x * 0.5f, (s.y - vb.y) * 0.5f);
        _text.draw(nvg);
    }

    private float indent() const {
        auto nvg = (cast(Widget) this).system.context.system!Render.nvg();
        const w = realSize().y;
        return max((cast(Text) _text).size(nvg).x, w) * 0.5f;
    }

private:
    bool _pressed = false;
    Text _text;
    float _min;
    float _value;
    float _max;
}
