module dard.types.memory;

import automem.ref_counted;

import dard.utils.static_cast;

import std.experimental.allocator.mallocator : Mallocator;
import std.experimental.allocator.typed;
import std.typecons : Proxy;
import std.traits;

import dard.systems.logger;

// alias SharedPtr(T) = RefCounted!T;
// auto makeShared(T, Args...)(Args args) {
//     return RefCounted!T.construct(args);
// }
alias SharedPtr(T) = SharedPtr2!T;
auto makeShared(T, Args...)(Args args) {
    return SharedPtr2!T.makeShared(args);
}

// alias UniquePtr(T) = UniquePtr2!(T);
// public auto makeUnique(T, Args...)(Args args) {
//     return UniquePtr!T.construct(args);
// }

auto makeUnique(T, Args...)(Args args) {
    return UniquePtr!T(New!T(args));
}

auto makeUniqueFromPtr(T)(T p) {
    UniquePtr!T up;
    up.grab(p);

    return up;
}

import core.stdc.stdlib : malloc, free;
import core.lifetime : emplace;

private alias MyAllocator = TypedAllocator!(Mallocator, AllocFlag.immutableShared);
private __gshared MyAllocator al;

auto New(T, Args...)(Args args) {
    log(typeid(T));

    return al.make!(T)(args);
}

auto Delete(T)(T* ptr) {
    al.dispose!T(ptr);
}

auto Delete(T)(T ptr) if (is(T == class) || is(T == interface)) {
    al.dispose!T(ptr);
}

auto NewArray(T, Args...)(size_t len) {
    return al.makeArray!T(len);
}

auto Delete(T)(T[] ptr) {
    al.dispose(ptr);
}

struct UniquePtr(T) if (is(T == class)) {
public:
    alias get this;

    this(T ptr) {
        _ptr = cast(void*) ptr;
    }

    @disable this(this);

    ~this() {
        reset();
    }

    ref opAssign(OT)(UniquePtr!OT other) {
        reset();

        _ptr = other._ptr;
        other._ptr = null;

        return this;
    }

    ref T opCast(T)() @disable;

    void moveTo(OT)(ref UniquePtr!OT other) if (is(T : OT)) {
        other.reset();
        other._ptr = _ptr;
        _ptr = null;
    }

    void moveFrom(OT)(UniquePtr!OT other) if (is(OT : T)) {
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

struct SharedPtr2(T) if (is(T == class)) {
private:
    struct Data(T) {
        Counter counter;
        void* ptr;
        T get() {
            return cast(T) ptr;
        }
    }

    Data!T* _data;
    void* _ptr;

public:
    alias get this;

    static auto makeShared(Args...)(Args args) {
        SharedPtr2!T p;

        p._data = New!(Data!T)();
        p._ptr = cast(void*) New!T(args);
        p._data.ptr = p._ptr;
        p._data.counter.shared_ = 1;

        return p;
    }

    this(ref return scope const SharedPtr2!T other) {
        _data = cast(Data!T*) other._data;
        _ptr = cast(void*) other._ptr;
        if (_data) {
            if (_data.counter.shared_ != 0) {
                _data.counter.shared_++;
            }
        }
    }

    ref opAssign(OT)(ref SharedPtr2!OT other) if (is(T : OT)) {
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

    T get() {
        return cast(T) _ptr;
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
        auto pa = SharedPtr2!A.make(&d);
        assert(d == false);
        auto pb = pa;
        pa.get().a = 11;

        assert(pa.get().a == 11);
        assert(pb.get().a == 11);
    }
    assert(d == true);
}
