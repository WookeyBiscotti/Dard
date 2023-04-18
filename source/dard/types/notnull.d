module dard.types.notnull;

import std.traits;

struct NotNull(T) if (is(T == class) || isPointer(T)) {
    this() @disable;

    this(T v) {
        val = v;
    }

    ref getRef() inout @property {
        return val;
    }

    private T val;

    alias getRef this;
}
