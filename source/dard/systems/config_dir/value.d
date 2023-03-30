module dard.systems.config_dir.value;

import std.variant;

import dard.types.string;
import dard.types.hash_map;
import dard.types.math.vector;

alias Value = Algebraic!(bool, long, String, Vector2f, Vector2u);

struct EngineValue {
    enum Access {
        STATIC,
        DYNAMIC,
    }

    Access access = Access.STATIC;
    Value value;
}

alias ValueTree = HashMap!(String, EngineValue);
