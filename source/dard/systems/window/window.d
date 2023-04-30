module dard.systems.window.window;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

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
        _broker = context.system!Broker();

        immutable auto windowSize = context.system!Config
            .value!Vector2u(WINDOW_RESULUTION);
        const auto appName = context.system!Config
            .value!string(APPLICATION_NAME);

        SDL_SetHint("SDL_VIDEO_DRIVER", "x11");
        SDL_Init(SDL_InitFlags.SDL_INIT_VIDEO);
        _window = SDL_CreateWindow(appName.ptr, windowSize.x, windowSize.y, SDL_WindowFlags
                .SDL_WINDOW_RESIZABLE);
    }

    ~this() {
        SDL_DestroyWindow(_window);
        SDL_Quit();
    }

    void update() {
        SDL_Event re = void;
        while (SDL_PollEvent(&re)) {
            if (re.type == SDL_EventType.SDL_EVENT_WINDOW_CLOSE_REQUESTED) {
                WindowClose e = void;
                send(e);
            } else if (re.type == SDL_EventType.SDL_EVENT_WINDOW_RESIZED) {
                WindowResized e;
                e.newSize.x = re.window.data1;
                e.newSize.y = re.window.data2;
                send(e);
            } else {
                auto e = WindowEvent(&re);
                send(e);
            }
        }
    }

    Vector2u size() {
        Vector2i size = void;
        auto res = SDL_GetWindowSize(_window, &size.x, &size.y);
        assert(!res);

        return Vector2u(cast(uint) size.x, cast(uint) size.y);
    }

    auto sdlWindow() {
        return _window;
    }

private:
    SDL_Window* _window = void;
}
