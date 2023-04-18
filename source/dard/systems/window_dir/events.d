module dard.systems.window_dir.events;

import dard.types.math.vector;

struct WindowClose {
}

struct WindowResized {
    Vector2i newSize;
}
