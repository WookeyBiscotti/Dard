module dard.systems.ui_dir.group_widget;

import dard.systems.ui_dir.widget;
import dard.systems.ui;

class GroupWidget : Widget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system);
    }

    abstract Widget addChild(Widget c);
    abstract Widget removeChild(Widget c);

    abstract bool contains(Widget c) const;
}
