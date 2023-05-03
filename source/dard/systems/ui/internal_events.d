module dard.systems.ui.internal_events;

public import dard.types.math.vector;

struct UIHovered {
    Vector2f p;
    bool force = false;
}

struct UIMouseMove {
    Vector2f p;
    bool force = false;
}

struct UIUnhovered {
    Vector2f p;
    bool force = false;
}

struct UIMouseButtonPressed {
    Vector2f p;
    bool force = false;
}

struct UIMouseButtonReleased {
    Vector2f p;
    bool force = false;
}
