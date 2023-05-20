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

    override Widget onPressed(in UIMouseButtonPressed e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onReleased(in UIMouseButtonReleased e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onHovered(in UIHovered e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onUnhovered(in UIUnhovered e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onMouseMove(in UIMouseMove e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onDragStart(in UIMouseDragStart e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onDrag(in UIMouseDrag e) {
        return findWidgetUnderPoint(e.p);
    }

    override Widget onDragStop(in UIMouseDragStop e) {
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

    override Widget findChild(in String name) const {
        auto r = super.findChild(name);
        if (r) {
            return r;
        }

        foreach (c; _childs) {
            r = c.findChild(name);
            if (r) {
                return r;
            }
        }

        return null;
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
