module dard.types.notnull;

struct NotNull(T) {
    this() {
        assert(false);
    }

    this(Args...)(auto ref Args args) {
        val = T(args);
    }

    ref getRef() inout @property {
        return val;
    }

    private T val;

    alias getRef this;
}
