module dard.systems.ui.check_text;

import dard.systems.ui;
import dard.types.memory;

class CheckText : LayoutGroup {
    this(UiSystem system, GroupWidget parent = null, in String label = "") {
        super(system, parent);
        layout(LayoutGroup.Layout.HORIZONTAL);
        minSize(Vector2f(defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT),
                defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
        indentLeft(5);
        indentRight(5);

        LayoutGroup.make!TextPanel(label);
        LayoutGroup.make!CheckBox();
        // maxSize(Vector2f(defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT),
        //         defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));
    }

    // override void addChild(Widget c) {
    // }

    // override Widget removeChild(Widget c) {
    //     return null;
    // }

    // override void eraseChild(Widget c) {
    // }
}
