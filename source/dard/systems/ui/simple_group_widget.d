module dard.systems.ui.simple_group_widget;

import dard.systems.ui;
import dard.systems.logger;
import dard.types.vector;
import dard.types.memory;

import std.algorithm;

class SimpleGroupWidget : GroupWidget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    ~this() {
        while (!_childs.empty()) {
            auto c = _childs[$ - 1];
            _childs.popBack();
            Delete(c);
        }
    }

    override void addChild(Widget c) {
        if (!contains(c)) {
            _childs ~= c;
        }
        if (c.parent() != this) {
            c.parent(this);
        }
    }

    override Widget removeChild(Widget c) {
        for (auto i = 0; i != _childs.length; ++i) {
            if (_childs[i] == c) {
                auto p = _childs[i];
                _childs[i] = _childs[$ - 1];
                _childs.popBack();

                return p;
            }
        }

        return null;
    }

    override const(Widget) contains(Widget c) const {
        for (auto i = 0; i != _childs.length; ++i) {
            if (_childs[i] == c) {
                return _childs[i];
            }
        }

        return null;
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

protected:
    Widget findWidgetUnderPoint(Vector2f p) {
        import dard.utils.geometry.algs;

        foreach (c; _childs) {
            if (intersectionBoxPoint(c.realPosition(), c.realSize(), p)) {
                return c;
            }
        }

        return null;
    }

    Array!Widget _childs;
}
