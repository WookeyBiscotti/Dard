module dard.systems.window.window;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;
import dard.types.string;

import dard.systems.config;
import dard.systems.broker;

import core.thread;

import sdl;

import dard.systems.window.events;

class WindowSystem : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _co = ConfigObserver(context.system!ConfigSystem);

        immutable auto windowSize = context.system!ConfigSystem
            .value!Vector2u(WINDOW_RESULUTION);
        const auto appName = context.system!ConfigSystem
            .value!String(APPLICATION_NAME);
        const auto windowFullscreen = context.system!ConfigSystem
            .value!bool(WINDOW_FULLSCREEN);

        SDL_SetHint("SDL_VIDEO_DRIVER", "x11");
        SDL_Init(SDL_InitFlags.SDL_INIT_VIDEO);

        _window = SDL_CreateWindow(appName.ptr, windowSize.x, windowSize.y,
                SDL_WindowFlags.SDL_WINDOW_RESIZABLE);

        fullscreen(windowFullscreen);

        _co.subscribe(WINDOW_RESULUTION, (in String, in EngineValue v) {
            auto r = v.value.peek!Vector2u;
            if (r) {
                size(*r);
            }
        });

        _co.subscribe(WINDOW_FULLSCREEN, (in String, in EngineValue v) {
            auto r = v.value.peek!bool;
            if (r) {
                fullscreen(*r);
            }
        });
    }

    ~this() {
        SDL_DestroyWindow(_window);
        SDL_Quit();
    }

    void update() {
        SDL_Event re = void;
        while (SDL_PollEvent(&re)) {
            if (re.type == SDL_EventType.SDL_EVENT_WINDOW_CLOSE_REQUESTED) {
                send(WindowClose());
            } else if (re.type == SDL_EventType.SDL_EVENT_WINDOW_RESIZED) {
                WindowResized e;
                e.newSize.x = re.window.data1;
                e.newSize.y = re.window.data2;

                context().system!ConfigSystem.setValue(WINDOW_RESULUTION,
                        EngineValue(EngineValue.Access.DYNAMIC,
                            Value(Vector2u(cast(uint) e.newSize.x, cast(uint) e.newSize.y))));

                send(e);
            } else {
                switch (re.type) {
                case SDL_EventType.SDL_EVENT_KEY_DOWN:
                    send(KeyDown(&re.key));
                    break;
                case SDL_EventType.SDL_EVENT_KEY_UP:
                    send(KeyUp(&re.key));
                    break;
                case SDL_EventType.SDL_EVENT_MOUSE_MOTION:
                    send(MouseMove(&re.motion));
                    break;
                default:
                }
                send(WindowEvent(&re));
            }
        }
    }

    final Vector2u size() {
        Vector2i size = void;
        auto res = SDL_GetWindowSize(_window, &size.x, &size.y);
        assert(!res);

        return Vector2u(cast(uint) size.x, cast(uint) size.y);
    }

    final void size(in Vector2u s) {
        if (s == size()) {
            return;
        }

        SDL_SetWindowSize(_window, s.x, s.y);

        send(WindowResized(Vector2i(cast(int) s.x, cast(int) s.y)));
    }

    final void fullscreen(bool f) {
        SDL_SetWindowFullscreen(_window, f ? SDL_bool.SDL_TRUE : SDL_bool.SDL_FALSE);
    }

    auto sdlWindow() {
        return _window;
    }

    bool isKeyPressed(SDL_Scancode sc) const {
        return SDL_GetKeyboardState(null)[sc] != 0;
    }

    void setRelativeMouseMove(bool v) {
        SDL_SetRelativeMouseMode(v ? SDL_bool.SDL_TRUE : SDL_bool.SDL_FALSE);
    }

private:
    SDL_Window* _window = void;
    ConfigObserver _co;
}
