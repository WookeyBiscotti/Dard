module dard.types.vector;

public import automem.array : Array2 = Array;
public import std.experimental.allocator.mallocator : Mallocator;

alias Array(T) = Array2!(T, Mallocator);

import dard.types.memory;

import std.traits;
import std.algorithm;

struct Vector(T) {
    enum IsCopyable = isCopyable!T;

    this(size_t initSize) {
        realloc(initSize);
    }

    void opPostMove(inout ref Vector!T) inout {
    }

    ~this() {
        if (_store.ptr) {
            Delete(_store);
        }
    }

    static if (IsCopyable) {
        void pushBack(in T value) {
            if (_size + 1 > _store.length) {
                expand();
            }
            _store[_size] = cast(T) value;
            _size++;
        }
    }

    void emplaceBack(Args...)(auto ref Args args) {
        if (_size + 1 > _store.length) {
            expand();
        }
        import core.lifetime;

        emplace(&_store[_size], args);
        _size++;
    }

    static if (IsCopyable) {
        void opIndexAssign(T)(in T value, size_t idx) {
            _store[idx] = cast(T) value;
        }
    }

    ref opIndex(size_t idx) inout {
        return _store[idx];
    }

    void resize(size_t newSize) {
        if (newSize < _size) {
            foreach (i; newSize .. _size) {
                _destroy(_store[i]);
            }
        } else if (newSize > _store.length) {
            realloc(newSize);
        }
        _size = newSize;
    }

    void popBack() {
        resize(length - 1);
    }

    bool empty() const {
        return _size == 0;
    }

    void opOpAssign(string op : "~")(T value) {
        pushBack(value);
    }

    int opApply(scope int delegate(ref T) dg) {
        foreach (i; 0 .. _size) {
            auto res = dg(_store[i]);
            if (res) {

                return res;
            }
        }

        return 0;
    }

    int opApply(int delegate(ref const T) dg) const {
        foreach (i; 0 .. _size) {
            auto res = dg(_store[i]);
            if (res) {

                return res;
            }
        }

        return 0;
    }

    size_t length() const {
        return _size;
    }

    void clear() {
        if (_size != 0) {
            realloc(0);
        }
    }

    alias opDollar = length;

private:
    void expand() {
        assert(_store.length == _size);

        immutable newCapacity = _store.length < 4 ? 8 : (_store.length * 3) / 2;
        realloc(newCapacity);
    }

    void realloc(size_t newCapacity) {
        assert(newCapacity != _store.length);

        auto arr = newCapacity > 0 ? NewArray!T(newCapacity) : _store[0 .. 0];

        immutable auto newSize = min(_size, newCapacity);

        static if (hasElaborateMove!T) {
            for (size_t i = 0; i != newSize; ++i) {
                move(_store[i], arr[i]);
            }
        } else {
            for (size_t i = 0; i != newSize; ++i) {
                arr[i] = _store[i];
            }
        }

        if (newCapacity < _size) {
            if (newCapacity != 0) {
                for (size_t i = newSize; i != _size; ++i) {
                    _destroy(arr[i]);
                }
            }
        }
        _store = arr;
    }

    static if (is(T == class) || is(T == interface)) {
        void _destroy(ref T v) {
        }
    } else {
        void _destroy(ref T v) {
            destroy(v);
        }
    }

    T[] _store;
    size_t _size;
}

unittest {
    Vector!int ia;
    foreach (i; 0 .. 100) {
        ia.pushBack(i);
    }
    foreach (i; 0 .. 100) {
        assert(ia[i] == i);
    }

    foreach (i; 0 .. 100) {
        ia[i] = 99 - i;
    }
    foreach (i; 0 .. 100) {
        assert(ia[i] == 99 - i);
    }
}

unittest {
    struct A {
        this(int* d_) {
            d = d_;
        }

        ~this() {
            if (d) {
                (*d)++;
            }
        }

        void opAssign(in A other) {
            d = cast(int*) other.d;
        }

        void opPostMove(inout ref A) inout nothrow {
        }

        int* d;
    }

    int d = 0;
    {
        Vector!A ia;
        foreach (i; 0 .. 100) {
            ia.emplaceBack(&d);
        }
    }

    assert(d == 100);
}
