module dard.types.vector;

// import std.container.array;

// import dlib.container.array;

// alias Vector = Array;

import std.traits;
import std.experimental.allocator.mallocator;
import dlib.core.memory;

import dard.types.memory;

/**
 * GC-free dynamic array implementation.
 * Very efficient for small-sized arrays.
 */

struct Vector(T, Allocator = Mallocator) {
public @nogc nothrow:
     ~this() {
        if (_storage.length != 0) {
            Allocator.instance.deallocate(cast(void[]) _storage);
        }
    }

    void resize(size_t newSize) {
        if (newSize > _size) {
            reallocate(newSize);
            for (size_t i = _size; i < newSize; i++) {
                static if (is(T == struct)) {
                    _storage[i].__ctor();
                } else {
                    _storage[i] = T.init;
                }
            }
        } else {
            for (size_t i = newSize; i < _size; i++) {
                destroyNogc(_storage[i]);
            }
        }

        _size = newSize;
    }

    void clear() {
        for (size_t i = 0; i < _size; i++) {
            destroyNogc(_storage[i]);
        }
    }

    void pushBack(T v) {
        if (_size + 1 >= _storage.length) {
            size_t newCapacity = void;
            if (_size == 1) {
                newCapacity = 4;
            } else {
                newCapacity = cast(size_t)((_storage.length + 1) * 1.87);
            }
            reallocate(newCapacity);
        }
        _storage[_size] = v;
        _size++;
    }

    auto opOpAssign(string op)(T c) if (op == "~") {
        pushBack(c);

        return this;
    }

    size_t length() const nothrow {
        return _size;
    }

    alias size = length;

    size_t capacity() const {
        return _storage.length;
    }

    ref inout(T) opIndex(size_t index) inout {
        return _storage[index];
    }

    void opIndexAssign(T t, size_t index) {
        _storage[index] = t;
    }

    int opApply(scope int delegate(size_t i, ref T) @nogc nothrow dg) {
        int result = 0;

        for (size_t i = 0; i != _size; ++i) {
            result = dg(i, _storage[i]);
            if (result) {
                break;
            }
        }

        return 0;
    }

    int opApply(int delegate(ref T) @nogc nothrow dg) {
        int result = 0;

        for (size_t i = 0; i != _size; ++i) {
            result = dg(_storage[i]);
            if (result) {
                break;
            }
        }

        return 0;
    }

    Range range() {
        return Range(&_storage[0], &_storage[0] + _size);
    }

private:
    struct Range {
        T* begin;
        T* end;

        ref T front() {
            return *begin;
        }

        bool empty() const {
            return begin == end;
        }

        void popFront() {
            begin++;
        }
    }

    void reallocate(size_t newCapacity) {
        enum sizeT = T.sizeof;

        auto newStorage = Allocator.instance.allocate(sizeT * newCapacity);
        if (!newStorage) {
            import core.stdc.stdlib;

            exit(-1);
        }
        auto newStorageT = cast(T[]) newStorage;

        import std.algorithm.comparison : min;

        const newSize = min(_size, newCapacity);
        for (uint i = 0; i != newSize; i++) {
            static if (hasMember!(T, "__ctr")) {
                newStorageT[i].__ctr(_storage[i]);
            } else {
                newStorageT[i] = _storage[i];
            }
        }

        for (uint i = 0; i != _size; i++) {
            destroyNogc(_storage[i]);
        }

        Allocator.instance.deallocate(cast(void[]) _storage);

        _storage = newStorageT;
        _size = newSize;
    }

    size_t _size;
    T[] _storage;
}

unittest {
    Vector!(int, Mallocator) v;
    v.resize(100);
    v[11] = 44;
    assert(v[11] == 44);
    assert(v[45] == 0);
}

unittest {
    Vector!(int, Mallocator) v;
    for (int i = 0; i != 100; ++i) {
        v.pushBack(i);
    }
    assert(v.size() == 100);

    for (int i = 0; i != 100; ++i) {
        assert(v[i] == i);
    }

    foreach (i, e; v) {
        assert(v[i] == e);
    }
}
