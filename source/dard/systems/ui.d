module dard.systems.ui;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;

import sdl;

public import dard.systems.ui_dir.group_widget;
public import dard.systems.ui_dir.widget;
public import dard.systems.ui_dir.simple_group_widget;
public import dard.systems.ui_dir.internal_events;

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
                Widget w = _root;
                while (w) {
                    auto ue = UIMouseButtonPressed(p);
                    w = w.onPressed(ue);
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
