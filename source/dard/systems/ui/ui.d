module dard.systems.ui.ui;

import dard.base.system;
import dard.base.context;
import dard.types.memory;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;
import dard.systems.ui;
import dard.types.vector;

import sdl;

class UiSystem : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = ImplTransceiverData(this, context.system!Broker);

        auto window = context.system!WindowSystem;
        _root = UniquePtr!SimpleGroupWidget(this);

        _root.size(cast(Vector2f) window.size());

        subscribe!WindowResized(window, (ref WindowResized e) {
            _root.size(cast(Vector2f) e.newSize);
        });

        subscribe!WindowEvent(window, (ref WindowEvent e) {
            if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_DOWN) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);
                auto ue = UIMouseButtonPressed(p);
                Widget w = _root.get();
                while (w) {
                    w = w.onPressed(ue);
                }
            } else if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_UP) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);
                auto ue = UIMouseButtonReleased(p);
                Widget w = _root.get();
                while (w) {
                    w = w.onReleased(ue);
                }
            } else if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_MOTION) {
                auto p = Vector2f(e.e.motion.x, e.e.motion.y);
                Widget w = _root.widgetUnderPoint(p);
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
        _root.draw();
    }

private:
    UniquePtr!GroupWidget _root;

    Widget _lastHovered;
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
