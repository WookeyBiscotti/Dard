module dard.systems.ui.simple_group_widget;

import dard.systems.ui;
import dard.systems.logger;
import dard.types.vector;
import dard.types.memory;

import std.algorithm;
import std.exception;

class SimpleGroupWidget : GroupWidget {
    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    void logAll() const {
        foreach (size_t i; 0 .. this.childsCount) {
            log(cast(void*)(cast(SimpleGroupWidget) this).child(i));
        }
    }

    ~this() {
        import std.stdio;

        log(cast(void*) this);
        log(this.childsCount);

        logAll();

        while (!_childs.empty()) {
            auto c = _childs[$ - 1];
            writeln(typeid(this), " ", cast(void*) this);
            writeln("WTF ", cast(void*) c);
            writeln(typeid(c));
            _childs.popBack();
            Delete(c);
        }
    }

    override void addChild(Widget c) {

        assert(c !is null);

        if (!contains(c)) {
            _childs ~= c;
        }
        if (c.parent() != this) {
            c.parent(this);
        }

        logAll();
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
        logAll();
        return null;
    }

    override const(Widget) contains(Widget c) const {
        for (auto i = 0; i != _childs.length; ++i) {
            if (_childs[i] == c) {
                return _childs[i];
            }
        }
        logAll();

        return null;
    }

    override void draw() {
        foreach (c; _childs) {
            c.draw();
        }
        logAll();
    }

    override Widget onPressed(in UIMouseButtonPressed e) {
        logAll();
        return findWidgetUnderPoint(e.p);
    }

    override Widget onReleased(in UIMouseButtonReleased e) {
        logAll();
        return findWidgetUnderPoint(e.p);
    }

    override Widget onHovered(in UIHovered e) {
        logAll();
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
        logAll();
        return null;
    }

    override size_t childsCount() const {
        return _childs.length;
    }

    override Widget child(size_t idx) {
        if (idx < _childs.length) {
            return _childs[idx];
        }

        return null;
    }

    // invariant () {
    //     foreach (c; _childs) {
    //         if (c is null) {
    //             enforce(false);
    //             assert(false);
    //         }
    //     }
    // }

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
