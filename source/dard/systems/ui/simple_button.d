module dard.systems.ui.simple_button;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;

struct ButtonRelease {
}

class SimpleButton : Widget {
    this(UiSystem system, GroupWidget parent = null, in String label = Str!"") {
        super(system, parent);

        minSize(Vector2f(0, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));

        auto nvg = system.context.system!Render.nvg();

        _text.text(String(label));
        _text.nvgFont(nvgFindFont(nvg, defStyleVal!(Styles.DEFAULT_FONT)));
        _text.fontColor = defStyleVal!(Styles.DEFAULT_FONT_COLOR);
        _text.fontSize(defStyleVal!(Styles.DEFAULT_FONT_SIZE));
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();

        const p = realPosition();
        const s = realSize();
        float textDy = void;
        if (_state) {
            textDy = 0.5f;
            Rect(p, s, defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeDarker(0.2f),
                    defStyleVal!(Styles.WIDGET_DOWN_COLOR).makeLighter(0.2f), 5).draw(nvg);
        } else {
            textDy = -0.5f;
            Rect(p, s, defStyleVal!(Styles.WIDGET_UP_COLOR).makeDarker(0.2f),
                    defStyleVal!(Styles.WIDGET_UP_COLOR).makeLighter(0.2f), 5).draw(nvg);
        }

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

        send(ButtonRelease());

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
