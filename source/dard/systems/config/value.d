module dard.systems.config.value;

import std.variant;

import dard.types.math.vector;
import dard.types.string;

alias Value = Algebraic!(bool, long, String, Vector2f, Vector2u);

struct EngineValue {
    enum Access {
        STATIC,
        DYNAMIC,
    }

    Access access = Access.STATIC;
    Value value;
}

alias ValueTree = EngineValue[String];
