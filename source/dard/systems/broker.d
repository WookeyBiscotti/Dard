module dard.systems.broker;

import std.typecons;

import dard.base.system;
import dard.base.context;
import dard.types.hash_map;
import dard.types.vector;

import dard.systems.broker_dir.transceiver;

struct Env(A, B) {
    ref A a;
    B b;
}

mixin template qwe () {

}

class Broker : System {
public:
    struct Fn {
        void function(void* e, void* env) fn;
        void* env;
    }

    struct FnWithSender {
        void function(void* e, void* env) fn;
        void* env;
    }

    this(Context contex) {
        super(context);
    }

    void subscribe(E)(Transceiver* s, Transceiver* r, Fn fn) {
        subscribe(typeid(E), s, r, fn);
    }

    void subscribe(E)(Transceiver* r, Fn fn) {
        subscribe(typeid(E), s, r, fn);
    }

    void send(E)(Transceiver* sender, ref E event) {
        send(sender, typeid(E), event);
    }

    void unsubscribe(E)(Transceiver* r) {
        unsubscribeImpl(r, typeid(E));
    }

    void unsubscribe(E)(Transceiver* r, Transceiver* s) {
        if (_currentCallDeep != 0) {
            _deleteRSTWait ~= tuple!(r, s, typeid(E));
            _dirtyFlag = true;

            return;
        }

        unsubscribeImpl(receiver, sender, typeId);
    }

    void unsubscribe(Transceiver* r, Transceiver* s) {
        if (_currentCallDeep != 0) {
            _deleteRSWait ~= tuple(r, s);
            _dirtyFlag = true;

            return;
        }

        unsubscribeImpl(r, s);
    }

    void unsubscribeAll(Transceiver* r) {
        if (_currentCallDeep != 0) {
            _deleteRWait ~= r;
            _dirtyFlag = true;

            return;
        }

        unsubscribeAllImpl(r);
    }

private:
    void subscribe(TypeInfo type, Transceiver* s, Transceiver* r, Fn fn) {
        addNewPersonalListner(r, s, EventFromOneListner(type, fn));
    }

    void send(Transceiver* sender, TypeInfo type, void* e) {
        assert(sender);

        _currentCallDeep++;
        if (auto types = sender in _personalEventsFn) {
            if (auto receivers = type in types[1]) {
                foreach (r; receivers.byValue()) {
                    r.fn.fn(e, r.fn.env);
                }
            }
        }

        _currentCallDeep--;

        if (_currentCallDeep == 0 && _dirtyFlag) {
            foreach (ref r; _deleteRWait) {
                unsubscribeAll(r);
            }
            _deleteRWait.clear();
            foreach (r, s; _deleteRSWait) {
                unsubscribe(r, s);
            }
            _deleteRSWait.clear();
            foreach (r, t; _deleteRTWait) {
                unsubscribeImpl(r, t);
            }
            _deleteRTWait.clear();
            foreach (ref r, ref s, ref t; _deleteRSTWait) {
                unsubscribeImpl(r, s, t);
            }
            _deleteRSTWait.clear();
            foreach (ref r, ref s, ref l; _addPersonalWait) {
                addNewPersonalListnerImpl(r, s, l);
            }
            _addPersonalWait.clear();
            foreach (ref r, ref l; _addWait) {
                addNewListnerImpl(r, l);
            }
            _addWait.clear();

            _dirtyFlag = false;
        }
    }

    void addNewListner(Transceiver* r, EventFromAllListner l) {
        if (_currentCallDeep != 0) {
            _addWait ~= tuple(r, l);
            _dirtyFlag = true;

            return;
        }

        addNewListnerImpl(r, l);
    }

    void addNewPersonalListner(Transceiver* r, Transceiver* s, EventFromOneListner l) {
        if (_currentCallDeep != 0) {
            _addPersonalWait ~= tuple(r, s, l);
            _dirtyFlag = true;

            return;
        }

        addNewPersonalListnerImpl(r, s, l);
    }

    void addNewListnerImpl(Transceiver* r, EventFromAllListner l) {
        _receiversFns.getOrDefault(r).getOrDefault(l.type);
        _eventsFn.getOrDefault(l.type).getOrDefault(r) = l;
    }

    void addNewPersonalListnerImpl(Transceiver* r, Transceiver* s, EventFromOneListner l) {
        _personalReceiversFns.getOrDefault(r).getOrDefault(s).getOrDefault(l.type);
        _personalEventsFn.getOrDefault(s).getOrDefault(l.type).getOrDefault(r) = l;
    }

    void unsubscribeImpl(Transceiver* r, TypeInfo type) {
        if (auto types = r in _receiversFns) {
            types.remove(type);
        }
        if (auto receivers = type in _eventsFn) {
            receivers.remove(r);
        }
    }

    void unsubscribeImpl(Transceiver* r, Transceiver* s, TypeInfo type) {
        _personalEventsFn.getOrDefault(s).getOrDefault(type).remove(r);
        _personalReceiversFns.getOrDefault(r).getOrDefault(s).remove(type);
    }

    void unsubscribeImpl(Transceiver* r, Transceiver* s) {
        if (auto senders = r in _personalReceiversFns) {
            senders.remove(s);
        }
        if (auto types = s in _personalEventsFn) {
            foreach (t; types.byValue()) {
                t.remove(r);
            }
        }
    }

    void unsubscribeAllImpl(Transceiver* t) {
        // remove as sender
        if (auto types = t in _personalEventsFn) {
            foreach (ref receivers; types.byValue()) {
                foreach (const ref receiver; receivers.byKey()) {
                    if (auto senders = receiver in _personalReceiversFns) {
                        senders.remove(t);
                    }
                }
            }
        }
        _personalEventsFn.remove(t);
    }

    struct EventFromOneListner {
        TypeInfo type;
        Fn fn;
    }

    struct EventFromAllListner {
        TypeInfo type;
        FnWithSender fn;
    }

    int _currentCallDeep = 0;
    bool _dirtyFlag = false;

    HashMap!(TypeInfo, HashMap!(Transceiver*, EventFromAllListner)) _eventsFn;
    HashMap!(Transceiver*, HashSet!(TypeInfo)) _receiversFns;

    HashMap!(Transceiver*, HashMap!(Transceiver*, HashSet!(TypeInfo))) _personalReceiversFns;
    HashMap!(Transceiver*, HashMap!(TypeInfo, HashMap!(Transceiver*, EventFromOneListner))) _personalEventsFn;

    Vector!(Transceiver*) _deleteRWait;
    Vector!(Tuple!(Transceiver*  /*r*/ , TypeInfo)) _deleteRTWait;
    Vector!(Tuple!(Transceiver*  /*r*/ , Transceiver*  /*s*/ )) _deleteRSWait;
    Vector!(Tuple!(Transceiver*  /*r*/ , Transceiver*  /*s*/ , TypeInfo)) _deleteRSTWait;

    Vector!(Tuple!(Transceiver*, EventFromAllListner)) _addWait;
    Vector!(Tuple!(Transceiver*  /*r*/ , Transceiver*  /*s*/ , EventFromOneListner)) _addPersonalWait;
}

unittest {
    auto ctx = new Context;
    auto b = new Broker(ctx);

    auto s = new Transceiver(b);
    auto r = new Transceiver(b);

    struct E1 {
    }

    auto fn = Broker.Fn(function void(void* e, void* d) {}, null);

    b.subscribe!E1(s, r, fn);
}
