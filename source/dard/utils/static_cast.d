module dard.utils.static_cast;

auto static_cast(T, F)(F from)
        if ((is(T == class) || is(T == interface)) && (
            is(F == class) || is(F == interface)) && (is(T : F) || is(F : T))) {
    return cast(T) cast(T*)(from);
}

unittest {
    class A {
        int a;
    }

    class B : A {
    }

    scope b = new B;
    auto a = cast(A) b;
    auto nb = static_cast!B(a);
    assert(nb == b);
}
