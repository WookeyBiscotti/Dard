module dard.systems.ui.group_widget;

import dard.systems.ui;
public import dard.types.memory : SharedPtr, Delete;

class GroupWidget : Widget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    /// Parent must control childs memory
    abstract void addChild(Widget c);
    /// Parent stop controling childs memory 
    abstract Widget removeChild(Widget c);
    /// Parent destroy children
    void eraseChild(Widget c) {
        Delete(removeChild(c));
    }

    abstract const(Widget) contains(Widget c) const;
}
