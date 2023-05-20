module dard.systems.ui.check_text;

import dard.systems.ui;
import dard.types.memory;

struct CheckTextRelease {
    bool state;

    alias state this;
}

class CheckText : LayoutGroup {
    this(UiSystem system, GroupWidget parent = null, in String label = "") {
        super(system, parent);
        layout(LayoutGroup.Layout.HORIZONTAL);
        minSize(Vector2f(defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT),
                defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        maxSize(Vector2f(float.max, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        indentLeft(5);
        indentRight(5);

        super.addChild(make!TextPanel(label));
        auto cb = make!CheckBox();
        super.addChild(cb);

        subscribe!CheckBoxRelease(cb, e => send(CheckTextRelease(e)));
    }

    override void addChild(Widget c) {
    }

    override Widget removeChild(Widget c) {
        return null;
    }

    override void eraseChild(Widget c) {
    }
}
