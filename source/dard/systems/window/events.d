module dard.systems.window.events;

import dard.types.math.vector;
import sdl;

struct WindowClose {
}

struct WindowResized {
    Vector2i newSize;
}

struct WindowEvent {
    SDL_Event* e;
}

struct KeyUp {
    SDL_KeyboardEvent* e;
}

struct KeyDown {
    SDL_KeyboardEvent* e;
}

struct MouseMove {
    SDL_MouseMotionEvent* e;
}
