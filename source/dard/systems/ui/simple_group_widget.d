module dard.systems.ui.simple_group_widget;

import dard.systems.ui;

import std.algorithm;

class SimpleGroupWidget : GroupWidget {
    this(UiSystem system) {
        super(system);
    }

    override Widget addChild(Widget c) {
        if (!contains(c)) {
            _childs ~= c;
        }

        return c;
    }

    override Widget removeChild(Widget c) {
        _childs.remove!(e => e == c);

        return c;
    }

    override bool contains(Widget c) const {
        foreach (el; _childs) {
            if (el == c) {
                return true;
            }
        }

        return false;
    }

    override void draw() {
        foreach (c; _childs) {
            c.draw();
        }
    }

    override Widget onPressed(const ref UIMouseButtonPressed e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onReleased(const ref UIMouseButtonReleased e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onHovered(ref const UIHovered e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onUnhovered(ref const UIUnhovered e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onMouseMove(ref const UIMouseMove e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget widgetUnderPoint(Vector2f p) {
        import dard.utils.geometry.algs;

        foreach (c; _childs) {
            if (intersectionBoxPoint(c.realPosition(), c.realSize(), p)) {
                return c.widgetUnderPoint(p);
            }
        }

        return this;
    }

private:
    Widget findWidgetUnderPoint(Vector2f p) {
        import dard.utils.geometry.algs;

        foreach (c; _childs) {
            if (intersectionBoxPoint(c.realPosition(), c.realSize(), p)) {
                return c;
            }
        }

        return null;
    }

    Widget[] _childs;
}
