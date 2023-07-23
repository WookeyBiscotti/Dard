module dard.types.memory;

import dard.utils.static_cast;

import std.experimental.allocator.mallocator : Mallocator;
import std.experimental.allocator.gc_allocator : GCAllocator;
import std.experimental.allocator.typed;
import std.typecons : Proxy;
import std.traits;

import dard.systems.logger;

auto makeShared(T, Args...)(ref auto Args args) {
    import core.lifetime : forward;

    return SharedPtr!T.makeShared(forward!args);
}

auto makeUnique(T, Args...)(Args args) {
    return UniquePtr!T.makeUnique(New!T(args));
}

auto makeUniqueFromPtr(T)(T p) {
    UniquePtr!T up;
    up.grab(p);

    return up;
}

import core.stdc.stdlib : malloc, free;
import core.lifetime : emplace;

private alias MyAllocator = TypedAllocator!(Mallocator, AllocFlag.immutableShared);
private alias MyGCAllocator = TypedAllocator!(GCAllocator, AllocFlag.immutableShared);
private __gshared MyAllocator al;
private __gshared MyAllocator alGc;

static bool[string] newNames;

auto New(T, Args...)(auto ref Args args) {
    import core.memory;
    import core.lifetime : emplace, forward;

    static if (is(T == class)) {
        return al.make!(T, Args)(forward!args);

    } else {
        import core.stdc.stdlib;

        // TODO: использовать везде маллок или аллокатор
        auto p = cast(T*) malloc(T.sizeof);
        emplace!(T, Args)(p, forward!args);

        return p;
    }
}

void Delete(T)(T* ptr) {
    try {
        al.dispose!T(ptr);
    } catch (Exception) {
    }
}

auto NewGC(T, Args...)(auto ref Args args) {
    return alGc.make!(T)(args);
}

void DeleteGC(T)(T* ptr) {
    alGc.dispose!T(ptr);
}

void DeleteGC(T)(T ptr) if (is(T == class) || is(T == interface)) {
    alGc.dispose!T(ptr);
}

auto Delete(T)(T ptr) if (is(T == class) || is(T == interface)) {
    al.dispose!T(ptr);
}

auto NewArray(T)(size_t len) {
    import std.stdio;
    import std.algorithm.searching;
    import core.memory;

    auto arr = al.makeArray!T(len);
    // GC.addRange(arr.ptr, (cast(byte[]) arr).length, typeid(T));

    return arr;
}

auto Delete(T)(T[] ptr) {
    al.dispose(ptr);
}

alias UP(T) = UniquePtr!T;

struct UniquePtr(T) if (is(T == class)) {
public:
    alias get this;

    this(UniquePtr!T other) {
        _ptr = other._ptr;
        other._ptr = null;
    }

    static auto makeUnique(T ptr) {
        UniquePtr!T p;
        p._ptr = cast(void*) ptr;

        return p;
    }

    void opPostMove(ref UniquePtr!T) nothrow {
    }

    ~this() {
        reset();
    }

    ref opAssign(OT)(UniquePtr!OT other) {
        reset();

        _ptr = other._ptr;
        other._ptr = null;

        return this;
    }

    this(this) @disable;

    ref T opCast(T)() @disable;

    void moveTo(OT)(ref UniquePtr!OT other) if (is(T : OT)) {
        other.reset();
        other._ptr = _ptr;
        _ptr = null;
    }

    auto moveTo(TT)() if (is(T : TT)) {
        UniquePtr!TT other;
        other._ptr = _ptr;
        _ptr = null;

        return other;
    }

    void moveFrom(OT)(UniquePtr!OT other) if (is(OT : T)) {
        reset();
        _ptr = other._ptr;
        other._ptr = null;
    }

    void moveFrom(OT)(ref UniquePtr!OT other) if (is(OT : T)) {
        reset();
        _ptr = other._ptr;
        other._ptr = null;
    }

    auto get() {
        return cast(T) _ptr;
    }

private:
    void reset() {
        if (_ptr) {
            Delete(cast(T) _ptr);
            _ptr = null;
        }
    }

    void* _ptr;
}

private struct Counter {
    uint shared_;
    uint weak;
}

alias SP(T) = SharedPtr!T;

struct SharedPtr(T) if (is(T == class) || is(T == struct)) {
private:
    static if (is(T == class)) {
        alias Pointer = T;
    } else {
        alias Pointer = T*;
    }

    struct Data(T) {
        Counter counter;
        void* ptr;
        Pointer get() {
            return cast(Pointer) ptr;
        }
    }

    Data!T* _data;
    void* _ptr;

public:
    alias get this;

    static auto makeShared(Args...)(auto ref Args args) {
        import core.lifetime : emplace, forward;

        SharedPtr!T p;

        p._data = New!(Data!T)();
        p._ptr = cast(void*) New!(T, Args)(forward!args);
        p._data.ptr = p._ptr;
        p._data.counter.shared_ = 1;

        return p;
    }

    this(ref return scope const SharedPtr!T other) {
        _data = cast(Data!T*) other._data;
        _ptr = cast(void*) other._ptr;
        if (_data) {
            if (_data.counter.shared_ != 0) {
                _data.counter.shared_++;
            }
        }
    }

    ref opAssign(OT)(SharedPtr!OT other) if (is(T : OT)) {
        reset();

        _data = other._data;
        _ptr = other._ptr;
        if (_data) {
            if (_data.counter.shared_ != 0) {
                _data.counter.shared_++;
            }
        }

        return this;
    }

    ~this() {
        reset();
    }

    void reset() {
        if (!_data) {
            return;
        }

        assert(_data.counter.shared_ != 0, "Impossible situation");

        --_data.counter.shared_;
        if (_data.counter.shared_ == 0) {
            Delete(_data.get());

            if (_data.counter.weak == 0) {
                Delete(_data);
            }
        }
    }

    uint useCount() {
        if (!_data) {
            return 0;
        }
        return _data.counter.shared_;
    }

    Pointer get() {
        return cast(Pointer) _ptr;
    }

    const(Pointer) get() const {
        return cast(Pointer) _ptr;
    }
}

unittest {
    class A {
        this(bool* d) {
            _d = d;
        }

        ~this() {
            *_d = true;
        }

        bool* _d;
        int a;
    }

    bool d = false;
    {
        auto pa = SharedPtr!A.makeShared(&d);
        assert(d == false);
        auto pb = pa;
        pa.get().a = 11;

        assert(pa.get().a == 11);
        assert(pb.get().a == 11);
    }
    assert(d == true);
}
