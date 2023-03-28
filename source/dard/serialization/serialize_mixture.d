module dard.serialization.serialize_mixture;

mixin template SerializeMixture() {
    void save() {
        alias ThisType = typeof(this);
        foreach (i, m; typeof(ThisType.tupleof)) {
            import std.stdio;
            writefln("%s:", i);

            // enum name = ThisType.tupleof[i].stringof;
            // alias typeof(m) type;
            writefln("  S.tupleof[i]: %s", ThisType.tupleof[i].init);
            // writefln("  (type) name : (%s) %s", type.stringof, name);

            // writefln("  m           : %s", m);
            // writefln("  m.stringof  : %s", m.stringof);
        }
    }
}

unittest {
    class TestSer {
        int a;
        float b;

        mixin SerializeMixture;
    }

    auto s = new TestSer;
    s.save();
}
