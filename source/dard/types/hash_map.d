module dard.types.hash_map;

alias HashSet(K) = HashMap!(K, bool);

import std.traits;
import std.stdio;
import std.format;
import std.typecons;
import core.lifetime;

import dard.types.memory;
import dard.types.list;
import dard.types.vector;
import dard.utils.const_cast;

struct HashMap(K, V, bool AddGcRange = false) {
    enum IsRef = is(V == class) || is(V == interface) || isPointer!V;
    enum IsCopyable = isCopyable!V;
    enum IsMoveable = hasElaborateMove!V;

    alias This = HashMap!(K, V, AddGcRange);

    static if (IsCopyable) {
        this(ref const This other) {
            clear();

            _values.resize(other._values.length());
            foreach (size_t i; 0 .. other._values.length) {
                _values[i] = other._values[i];
            }
        }
    } else {
        this(this) @disable;
    }

    void opPostMove(inout ref HashMap!(K, V, AddGcRange)) inout nothrow {
    }

    bool containsKey(in K key) {
        return !!(key in this);
    }

    ref require(in K key) {
        if (auto found = key in this) {
            return *found;
        } else {
            emplace(key);
            return *(key in this);
        }
    }

    static if (IsCopyable) {
        void insert(in K key, const V value) {
            if (_size + 1 > _values.length * 0.85) {
                rehash();
            }

            auto hash = hashOf(key);
            auto list = &_values[hash % _values.length];

            foreach (ref v; *list) {
                if (v.key == key) {
                    v.value = cast(V) value;

                    return;
                }
            }

            list.pushBack(Pair(key, value));

            _size++;
        }
    }

    void emplace(Args...)(in K key, auto ref Args args) {
        if (_size + 1 > _values.length * 0.85) {
            rehash();
        }

        auto hash = hashOf(key);
        auto list = &_values[hash % _values.length];

        foreach (ref v; *list) {
            if (v.key == key) {
                destroy!false(v.value);
                core.lifetime.emplace(&v.value, args);

                return;
            }
        }

        list.emplaceBack(key);
        auto p = &list.back();
        destroy!false(p.value);
        core.lifetime.emplace(&p.value, args);

        _size++;
    }

    auto opBinaryRight(string s : "in")(in K key) {
        if (_values.length == 0) {
            return null;
        }

        auto hash = hashOf(key);
        auto list = &_values[hash % _values.length];

        foreach (ref v; *list) {
            if (hashOf(v.key) == hashOf(key) && v.key == key) {
                return &v.value;
            }
        }

        return null;
    }

    auto opBinaryRight(string s : "in")(in K key) const {
        if (_values.length == 0) {
            return null;
        }

        auto hash = hashOf(key);
        auto list = &_values[hash % _values.length];

        foreach (const ref v; *list) {
            if (hashOf(v.key) == hashOf(key) && v.key == key) {
                return &v.value;
            }
        }

        return null;
    }

    static if (IsCopyable) {
        void opAssign(in This other) {
            clear();

            _values.resize(other._values.length());
            foreach (size_t i; 0 .. other._values.length) {
                _values[i] = other._values[i];
            }
        }
    } else {
        @disable void opAssign(in This other);
    }

    ref opIndex(in K key) {
        return *(key in this);
    }

    static if (IsCopyable) {
        void opIndexAssign(in V value, in K key) {
            insert(key, value);
        }
    } else static if (IsMoveable) {
        void opIndexAssign(V value, in K key) {
            this.emplace(key);
            move(value, *(key in this));
        }
    } else {
        void opIndexAssign(V value, in K key) {
            this.emplace(key, value);
        }
    }

    void erase(in K key) {
        if (_size == 0) {
            return;
        }
        auto hash = hashOf(key);
        auto list = &_values[hash % _values.length];

        auto it = list.begin();
        while (!it.isEnd()) {
            const v = &*it;
            if (hashOf(v.key) == hashOf(key) && v.key == key) {
                list.erase(it);

                _size--;

                return;
            }
            ++it;
        }
    }

    alias remove = erase;

    int opApply(scope int delegate(in K key, ref V) dg) {
        foreach (ref list; _values) {
            foreach (ref p; list) {
                auto res = dg(p.key, p.value);
                if (res) {

                    return res;
                }
            }
        }

        return 0;
    }

    int opApply(scope int delegate(ref V) dg) {
        foreach (ref list; _values) {
            foreach (ref p; list) {
                auto res = dg(p.value);
                if (res) {

                    return res;
                }
            }
        }

        return 0;
    }

    void clear() {
        _values.clear();
    }

    auto length() const {
        return _size;
    }

    ref Pair front() {
        foreach (ref list; _values) {
            foreach (ref p; list) {
                return p;
            }
        }

        assert(false);
    }

private:
    invariant () {
        assert(_size < 1000000000);
    }

    void rehash() {
        immutable newSize = _values.length < 4 ? 8 : (_values.length * 3 / 2);
        auto copyValues = Vector!ListType();
        move(_values, copyValues);

        _values.resize(newSize);
        foreach (ref list; copyValues) {
            auto it = list.begin();

            while (!it.isEnd()) {
                auto copy = it;
                ++it;
                auto node = list.extractNode(copy);
                immutable hash = hashOf(node.v.key);
                immutable pos = hash % _values.length;
                _values[pos].pushBack(node);
            }
        }
    }

    static struct Pair {
        K key;
        V value;

        static if (IsCopyable) {
            @disable this(this);

            this(in K k, in V v) {
                key = cast(K) k;
                value = cast(V) v;
            }

            this(scope const ref typeof(this) o) {
                key = cast(K) o.key;
                value = cast(V) o.value;
            }

            this(in K k) {
                key = cast(K) k;
            }

            void opAssign(in Pair o) {
                key = cast(K) o.key;
                value = cast(V) o.value;
            }
        } else {
            @disable void opAssign(in Pair o);

            this(in K k) {
                key = cast(K) k;
            }
        }
    }

    alias ListType = List!(Pair, AddGcRange);

    Vector!(ListType, false) _values;

    size_t _size;
}

unittest {
    HashMap!(string, int) h;

    h.insert("0", 0);
    h.insert("1", 1);
    h.insert("2", 2);
    h.insert("3", 3);

    assert(*("0" in h) == 0);
    assert(*("1" in h) == 1);
    assert(*("2" in h) == 2);
    assert(*("3" in h) == 3);
}

unittest {
    import std.conv;
    import dard.types.string;

    HashMap!(String, int) h;

    foreach (i; 0 .. 1_000_000) {
        h.insert(String(i.to!string), i);
        assert(*(String(i.to!string) in h) == i);
    }

    foreach (i; 0 .. 1_000_000) {
        assert(*(String(i.to!string) in h) == i);
    }
}

unittest {
    import std.conv;
    import dard.types.string;

    HashMap!(String, int) h;

    foreach (i; 0 .. 1_000_000) {
        h[String(i.to!string)] = i;
    }

    foreach (i; 0 .. 1_000_000) {
        assert(h[String(i.to!string)] == i);
    }
}

unittest {
    import std.conv;
    import dard.types.string;

    {
        HashMap!(String, int) h;

        foreach (i; 0 .. 1_000_000) {
            h[String(i.to!string)] = i;
        }

        auto h2 = h;

        foreach (i; 0 .. 1_000_000) {
            assert(h2[String(i.to!string)] == i);
        }
        int i;
    }
}

unittest {
    import std.conv;
    import dard.types.string;

    HashMap!(int, HashMap!(String, int)) h;
}
