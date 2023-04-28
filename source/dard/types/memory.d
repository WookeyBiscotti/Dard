module dard.types.memory;

void destroyNogc(T)(ref T v) @nogc if (!is(T == class) && !is(T == interface)) {
    import std.traits;

    static if (hasElaborateAssign!T) {
        v.__dtor();
    }
}

void destroyNogc(T)(T v) @nogc if (is(T == class) || is(T == interface)) {
    import std.traits;

    v.__dtor();
}
