module dard.systems.window;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;
import dard.types.string;

import dard.systems.config;
import core.thread;

import sdl;

class Window : System {
public:
    this(Context context) {
        super(context);

        immutable auto windowSize = context.system!Config
            .value!Vector2u(WINDOW_RESULUTION);
        const auto appName = context.system!Config
            .value!String(APPLICATION_NAME);

        SDL_Init(SDL_InitFlags.SDL_INIT_VIDEO);

        SDL_CreateWindowAndRenderer(windowSize.x, windowSize.y, 0, &_window, &_renderer);
        SDL_SetWindowTitle(_window, appName.ptr);
    }

    ~this() {
        SDL_DestroyRenderer(_renderer);
        SDL_DestroyWindow(_window);

        SDL_Quit();
    }

    void update() {
        
    }

private:
    SDL_Window* _window;
    SDL_Renderer* _renderer;
}
