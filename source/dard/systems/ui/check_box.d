module dard.systems.ui.check_box;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;

struct CheckBoxRelease {
    bool state;

    alias state this;
}

class CheckBox : Widget {
    this(UiSystem system, GroupWidget parent = null, in String label = Str!"") {
        super(system, parent);

        minSize(Vector2f(defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT),
                defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        maxSize(Vector2f(defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT),
                defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();

        const p = realPosition();
        const s = realSize();

        Rect(p + 0.15f * s, 0.7f * s, defStyleVal!(Styles.WIDGET_INPUT_COLLOR)
                .makeDarker(0.2f), defStyleVal!(Styles.WIDGET_INPUT_COLLOR).makeLighter(0.2f), 1).draw(
                nvg);

        if (_state) {
            Rect(p + 0.35f * s, 0.3f * s, defStyleVal!(Styles.WIDGET_DOWN_COLOR)
                    .makeDarker(0.2f), defStyleVal!(Styles.WIDGET_DOWN_COLOR)
                    .makeLighter(0.2f), 0).draw(nvg);
        }
    }

    override Widget onPressed(ref const UIMouseButtonPressed e) {
        _startChange = true;

        return null;
    }

    override Widget onReleased(const ref UIMouseButtonReleased) {
        if (_startChange) {
            _state = !_state;
            _startChange = false;
        }

        send(ButtonRelease());

        return null;
    }

    override Widget onUnhovered(ref const UIUnhovered e) {
        _startChange = false;

        return null;
    }

private:
    bool _startChange;
    bool _state;
}
