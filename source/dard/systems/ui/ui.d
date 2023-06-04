module dard.systems.ui.ui;

import dard.base.system;
import dard.base.context;
import dard.types.memory;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;
import dard.systems.ui;
import dard.systems.logger;
import dard.types.vector;

import sdl;

class UiSystem : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);

        auto window = context.system!WindowSystem;
        _root = makeUnique!SimpleGroupWidget(this);

        _root.size(cast(Vector2f) window.size());

        subscribe!WindowResized(window, (in WindowResized e) {
            _root.get().size(cast(Vector2f) e.newSize);
        });

        subscribe!WindowEvent(window, (in WindowEvent e) {
            if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_DOWN) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);
                auto ue = UIMouseButtonPressed(p);
                Widget w = _root.get();
                while (w) {
                    auto sw = w;
                    w = w.onPressed(ue);
                    if (!w) {
                        _lastDraged = sw;
                        _lastDraged.onDragStart(UIMouseDragStart(p, false));
                    }
                }
            } else if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_UP) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);

                if (_lastDraged) {
                    _lastDraged.onDragStart(UIMouseDragStart(p, false));
                    _lastDraged = null;
                }

                auto ue = UIMouseButtonReleased(p);
                Widget w = _root.get();
                while (w) {
                    w = w.onReleased(ue);
                }
            } else if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_MOTION) {
                auto p = Vector2f(e.e.motion.x, e.e.motion.y);
                if (_lastDraged) {
                    _lastDraged.onDrag(UIMouseDrag(p, false));
                }

                Widget w = _root.get().widgetUnderPoint(p);
                if (w) {
                    if (_lastHovered != w) {
                        if (_lastHovered) {
                            auto ue = UIUnhovered(p);
                            _lastHovered.onUnhovered(ue);
                        }
                        auto ue = UIHovered(p);
                        w.onHovered(ue);
                        _lastHovered = w;
                    } else {
                        auto ue = UIMouseMove(p);
                        _lastHovered.onMouseMove(ue);
                    }
                } else {
                    if (_lastHovered) {
                        auto ue = UIUnhovered(p);
                        _lastHovered.onUnhovered(ue);
                    }
                    _lastHovered = w;
                }
            }
        });
    }

    GroupWidget root() {
        return _root.get();
    }

    void update() {
        _root.get().draw();
    }

    void removeWidget(Widget w) {
        if (_lastDraged == w) {
            _lastDraged = null;
        }
        if (_lastHovered == w) {
            _lastHovered = null;
        }
    }

private:
    UniquePtr!GroupWidget _root;

    Widget _lastHovered;
    Widget _lastDraged;
}

unittest {
    import std.stdio;
    import std.conv;
    import core.memory;

    GC.enable();

    class A {
        ~this() {
            writeln("A::~this()");
        }

        int[1024000] d;
    }

    class B {
        A[string] d;
        alias d this;
    }

    auto p = new B;

    {
        p = (new A[string]);

        foreach (i; 0 .. 2) {
            p[i.to!string] = new A();
        }

        // GC.runFinalizers(GC.addrOf(cast(void*) p));

        p = null;
    }
    writeln(GC.stats());
    writeln(GC.profileStats());

    GC.collect();
    GC.minimize();

    writeln(GC.stats());
    writeln(GC.profileStats());

    writeln("scope end");

    GC.collect();
    GC.minimize();
    writeln("scope end2");
}
