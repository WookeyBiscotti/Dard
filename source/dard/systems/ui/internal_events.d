module dard.systems.ui.internal_events;

public import dard.types.math.vector;

struct UIHovered {
}

struct UIMouseMove {
}

struct UIUnhovered {
}

struct UIMouseButtonPressed {
    Vector2f p;
    bool force = false;
}

struct UIMouseButtonReleased {
    Vector2f p;
    bool force = false;
}
