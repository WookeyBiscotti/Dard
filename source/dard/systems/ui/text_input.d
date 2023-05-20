module dard.systems.ui.text_input;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;


class TextInput: Widget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);

        minSize(Vector2f(0, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        maxSize(Vector2f(float.max, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));

        auto nvg = system.context.system!Render.nvg();

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
        _text.p.y = p.y + textDy + 0.5f * (s.y - _text.size(nvg).y);

        _text.drawShadow(nvg, Color(0, 0, 0), 3, Vector2f(0, 5));
        _text.draw(nvg);
    }

    override Widget onPressed(in UIMouseButtonPressed e) {
        _state = true;

        return null;
    }

    override Widget onReleased(in UIMouseButtonReleased) {
        if (_state) {
            _state = false;
            send(ButtonRelease());
        }

        return null;
    }

    override Widget onUnhovered(in UIUnhovered e) {
        _state = false;

        return null;
    }

private:
    bool _state;
    Text _text;
}
