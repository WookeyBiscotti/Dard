module dard.systems.config_dir.value;

import std.variant;

import dard.types.math.vector;

alias Value = Algebraic!(bool, long, string, Vector2f, Vector2u);

struct EngineValue {
    enum Access {
        STATIC,
        DYNAMIC,
    }

    Access access = Access.STATIC;
    Value value;
}

alias ValueTree = EngineValue[string];
