module dard.types.list;

import std.traits;
import std.stdio;
import dard.types.memory;
import core.lifetime;

struct List(V, bool AddGcRange) {
    enum IsRef = is(V == class) || is(V == interface) || isPointer!V;
    static if (IsRef) {
        alias RefType = V;
        alias ValueType = V;
    } else {
        alias RefType = V*;
        alias ValueType = V;
    }

    alias This = List!(V, AddGcRange);

public:
    enum IsCopyable = isCopyable!V;

    static if (IsCopyable) {
        this(ref const This other) {
            auto it = other.cbegin();
            while (!it.isEnd()) {
                pushBack(*it);
                ++it;
            }
        }
    } else {
        @disable this(this);
    }

    void opPostMove(this This)(ref This) nothrow {
    }

    static if (IsCopyable) {
        void opAssign(in This other) {
            clear();

            auto it = other.cbegin();
            while (!it.isEnd()) {
                pushBack(*it);
                ++it;
            }
        }
    } else {
        @disable void opAssign(in This other);
    }

    N* extractNode(N)(IteratorTemplated!N it) if (is(N : Node) || is(N : const(Node))) {
        assert(!it.isEnd());
        assert(it.node == _begin || it.node.p);

        if (it.node == _begin) {
            if (_end == _begin) {
                _begin = _end = null;
            } else {
                _begin = _begin.n;
            }
        } else if (it.node == _end) {
            _end = _end.p;
        } else {
            (cast(Node*) it.node).p.n = (cast(Node*) it.node).n;
            (cast(Node*) it.node).n.p = (cast(Node*) it.node).p;
        }

        --_size;

        return it.node;
    }

    void pushBack(Node* n) {
        n.n = null;
        if (_size == 0) {
            n.p = null;
            _begin = _end = n;
        } else {
            _end.n = n;

            n.p = _end;
            _end = n;
        }

        ++_size;
    }

    ~this() {
        clear();
    }

    static if (IsCopyable) {
        void pushBack(in V v) {
            emplaceBack();
            _end.v = v;
            // core.lifetime.move(v, _end.v);
        }
    }

    void emplaceBack(Args...)(auto ref Args args) {
        static if (!IsRef) {
            auto n = New!Node(_end, cast(Node*) null);
            emplace!V(&n.v, args);
        } else {
            auto n = New!Node(_end, cast(Node*) null, v);
        }

        static if (AddGcRange) {
            import core.memory : GC;

            GC.addRange(n, Node.sizeof, typeid(Node));
        }

        pushBack(n);
    }

    int opApply(scope int delegate(ref V) dg) {
        auto it = Iterator(_begin);
        while (!it.isEnd()) {
            auto res = dg(*it);
            if (res) {

                return res;
            }
            ++it;
        }

        return 0;
    }

    int opApply(scope int delegate(const ref V) dg) const {
        auto it = ConstIterator(_begin);
        while (!it.isEnd()) {
            auto res = dg(*it);
            if (res) {

                return res;
            }
            ++it;
        }

        return 0;
    }

    auto begin() {
        return Iterator(_begin);
    }

    auto cbegin() const {
        return ConstIterator(_begin);
    }

    ref front() {
        return _begin.v;
    }

    ref back() {
        return _end.v;
    }

    auto lenght() const {
        return _size;
    }

    void erase(Iterator it) {
        auto p = it.node;
        Delete(extractNode(it));

        static if (AddGcRange) {
            import core.memory : GC;

            GC.removeRange(p);
        }
    }

    void clear() {
        auto node = _begin;
        while (node) {
            auto next = node.n;
            Delete(node);
            static if (AddGcRange) {
                import core.memory : GC;

                GC.removeRange(node);
            }
            node = next;
        }
        _begin = _end = null;

        _size = 0;
    }

private:
    void logList() {
        auto it = cbegin();
        while (!it.isEnd()) {
            writef!"[0x%s](%s)->"(it.node, &it.node.v);
            ++it;
        }
        write("\n");
    }

    struct IteratorTemplated(N) {
        this(N* n) {
            node = n;
        }

        void opUnary(string s : "++")() {
            node = node.n;
        }

        auto ref opUnary(string s : "*")() {
            return node.v;
        }

        bool isEnd() const {
            return !node;
        }

    private:
        N* node;
    }

    alias Iterator = IteratorTemplated!Node;
    alias ConstIterator = IteratorTemplated!(const(Node));

    struct Node {
        this(Args...)(Node* p, Node* n, auto ref Args args) {
            v = ValueType(args);
            p = p;
            n = n;
        }

        this(Node* p, Node* n) {
            v = V.init;

            p = p;
            n = n;
        }

        ValueType v;
        Node* p = void;
        Node* n = void;
    }

    size_t _size;

    Node* _begin;
    Node* _end;
}

unittest {
    struct A {
        this(int* d_) {
            d = d_;
        }

        this(this) @disable;

        ~this() {
            if (d) {
                (*d)++;
            }
        }

        int* d;
    }

    int d = 0;
    {
        List!(A, false) l;
        l.emplaceBack(&d);
        assert(l.lenght == 1);
        l.emplaceBack(&d);
        assert(l.lenght == 2);
        l.emplaceBack(&d);
        assert(l.lenght == 3);
    }

    assert(d == 3);
}

unittest {
    struct A {
        this(int* d_) {
            d = d_;
        }

        this(this) @disable;

        ~this() {
            if (d) {
                (*d)++;
            }
        }

        int* d;
    }

    int d = 0;
    {
        List!(A, false) l;
        l.emplaceBack(&d);
        assert(l.lenght == 1);
        l.emplaceBack(&d);
        assert(l.lenght == 2);
        l.emplaceBack(&d);
        assert(l.lenght == 3);
    }
    assert(d == 3);

    void constApply(const List!(int, false) l) {
        foreach (ref key; l) {
        }
    }

    List!(int, false) l;
    l.pushBack(1);
    l.pushBack(2);

    constApply(l);
}
