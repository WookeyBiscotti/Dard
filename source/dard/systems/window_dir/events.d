module dard.systems.window_dir.events;

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
