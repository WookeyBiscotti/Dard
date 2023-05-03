module dard.systems.ui.ui;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;

import sdl;

import dard.systems.ui;

class UiSystem : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = context.system!Broker();

        auto window = context.system!WindowSystem;
        _root = new SimpleGroupWidget(this);

        _root.size(cast(Vector2f) window.size());

        subscribe!WindowResized(window, (ref WindowResized e) {
            _root.size(cast(Vector2f) e.newSize);
        });

        subscribe!WindowEvent(window, (ref WindowEvent e) {
            if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_DOWN) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);
                auto ue = UIMouseButtonPressed(p);
                Widget w = _root;
                while (w) {
                    w = w.onPressed(ue);
                }
            } else if (e.e.type == SDL_EventType.SDL_EVENT_MOUSE_BUTTON_UP) {
                auto p = Vector2f(e.e.button.x, e.e.button.y);
                auto ue = UIMouseButtonReleased(p);
                Widget w = _root;
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
        return _root;
    }

    void update() {
        _root.draw();
    }

private:
    GroupWidget _root;

    Widget _lastHovered;
}
