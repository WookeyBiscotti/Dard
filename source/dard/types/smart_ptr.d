module dard.types.smart_ptr;

// import automem.ref_counted;
// import automem.ref_counted;
// import automem.unique;
import memutils.refcounted;

alias SharedPtr(T) = RefCounted!T;
// alias Unique(T) = automem.unique.Unique!T;


// automem.ref_counted - гавно, возможно вооьще все реализщации гавно и придется самому писать, но пока   import memutils.refcounted - рабочий вариант

// до
// WTF1 dard.base.context.__unittest_L57_C1.System17F0CDFF12008
// WTF1 dard.base.context.__unittest_L57_C1.System27F0CDFF12008
// WTF5 dard.base.context.__unittest_L57_C1.System17F0CDFF12000
// WTF5 dard.base.context.__unittest_L57_C1.System27F0CDFF12000

// после
// WTF1 dard.base.context.__unittest_L57_C1.System155B7642EB600
// WTF1 dard.base.context.__unittest_L57_C1.System255B7642EA110
// WTF5 dard.base.context.__unittest_L57_C1.System155B7642EBB10
// WTF5 dard.base.context.__unittest_L57_C1.System255B7642E9E80

unittest {
    class A {
        int a = 11;
    }

    auto p = SharedPtr!A();
    assert(p.a == 11);

    p.a = 17;
    assert(p.a == 17);

}
