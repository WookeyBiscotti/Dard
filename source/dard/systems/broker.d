module dard.systems.broker;

import std.typecons;

import dard.base.system;
import dard.base.context;
import dard.utils.static_cast;

public import dard.systems.broker_dir.transceiver;

class Broker : System {
public:
    alias FnOne(E) = void delegate(ref E);
    alias FnAll(E) = void delegate(Transceiver s, ref E);

    alias FnOneRaw = void delegate(void* e);
    alias FnAllRaw = void delegate(Transceiver s, void* e);

    this(Context contex) {
        super(context);
    }

    void subscribe(E)(Transceiver s, Transceiver r, FnOne!(E) fn) {
        subscribe(typeid(E), s, r, (void* e) { fn(*(cast(E*) e)); });
    }

    void subscribe(E)(Transceiver r, FnAll!E fn) {
        subscribe(typeid(E), s, r, fn);
    }

    void send(E)(Transceiver sender, ref E event) {
        send(sender, typeid(E), &event);
    }

    void unsubscribe(E)(Transceiver r) {
        unsubscribeImpl(r, typeid(E));
    }

    void unsubscribe(E)(Transceiver r, Transceiver s) {
        if (_currentCallDeep != 0) {
            _deleteRSTWait ~= tuple!(r, s, typeid(E));
            _dirtyFlag = true;

            return;
        }

        unsubscribeImpl(receiver, sender, typeId);
    }

    void unsubscribe(Transceiver r, Transceiver s) {
        if (_currentCallDeep != 0) {
            _deleteRSWait ~= RS(r, s);
            _dirtyFlag = true;

            return;
        }

        unsubscribeImpl(r, s);
    }

    void unsubscribeAll(Transceiver r) {
        if (_currentCallDeep != 0) {
            _deleteRWait ~= r;
            _dirtyFlag = true;

            return;
        }

        unsubscribeAllImpl(r);
    }

private:
    void subscribe(TypeInfo type, Transceiver s, Transceiver r, FnOneRaw fn) {
        addNewPersonalListner(r, s, EventFromOneListner(type, fn));
    }

    void send(Transceiver sender, TypeInfo type, void* e) {
        assert(sender);

        _currentCallDeep++;
        if (auto types = sender in _personalEventsFn) {
            if (auto receivers = type in *types) {
                foreach (r; receivers.byValue()) {
                    r.fn(e);
                }
            }
        }

        _currentCallDeep--;
        if (_currentCallDeep == 0 && _dirtyFlag) {
            foreach (ref r; _deleteRWait) {
                unsubscribeAll(r);
            }
            _deleteRWait = [];
            foreach (ref el; _deleteRSWait) {
                unsubscribe(el.r, el.s);
            }
            _deleteRSWait = [];
            foreach (ref el; _deleteRTWait) {
                unsubscribeImpl(el.r, el.t);
            }
            _deleteRTWait = [];
            foreach (ref el; _deleteRSTWait) {
                unsubscribeImpl(el.r, el.s, el.t);
            }
            _deleteRSTWait = [];
            foreach (ref el; _addPersonalWait) {
                addNewPersonalListnerImpl(el.r, el.s, el.l);
            }
            _addPersonalWait = [];
            foreach (ref el; _addWait) {
                addNewListnerImpl(el.r, el.l);
            }
            _addWait = [];

            _dirtyFlag = false;
        }
    }

    void addNewListner(Transceiver r, EventFromAllListner l) {
        if (_currentCallDeep != 0) {
            _addWait ~= RL(r, l);
            _dirtyFlag = true;

            return;
        }

        addNewListnerImpl(r, l);
    }

    void addNewPersonalListner(Transceiver r, Transceiver s, EventFromOneListner l) {
        if (_currentCallDeep != 0) {
            _addPersonalWait ~= RSL(r, s, l);
            _dirtyFlag = true;

            return;
        }

        addNewPersonalListnerImpl(r, s, l);
    }

    void addNewListnerImpl(Transceiver r, EventFromAllListner l) {
        require(_receiversFns, r).require(l.type);
        _eventsFn.require(l.type).require(r) = l;
    }

    void addNewPersonalListnerImpl(Transceiver r, Transceiver s, EventFromOneListner l) {
        _personalReceiversFns.require(r).require(s).require(l.type);
        _personalEventsFn.require(s).require(l.type).require(r) = l;
    }

    void unsubscribeImpl(Transceiver r, TypeInfo type) {
        if (auto types = r in _receiversFns) {
            (*types).remove(type);
        }
        if (auto receivers = type in _eventsFn) {
            (*receivers).remove(r);
        }
    }

    void unsubscribeImpl(Transceiver r, Transceiver s, TypeInfo type) {
        _personalEventsFn.require(s).require(type).remove(r);
        _personalReceiversFns.require(r).require(s).remove(type);
    }

    void unsubscribeImpl(Transceiver r, Transceiver s) {
        if (auto senders = r in _personalReceiversFns) {
            (*senders).remove(s);
        }
        if (auto types = s in _personalEventsFn) {
            foreach (t; types.byValue()) {
                t.remove(r);
            }
        }
    }

    void unsubscribeAllImpl(Transceiver t) {
        // remove as sender
        if (auto types = t in _personalEventsFn) {
            foreach (ref receivers; types.byValue()) {
                foreach (ref receiver; receivers.byKey()) {
                    if (auto senders = receiver in _personalReceiversFns) {
                        (*senders).remove(t);
                    }
                }
            }
        }
        _personalEventsFn.remove(t);
    }

    struct EventFromOneListner {
        TypeInfo type;
        FnOneRaw fn;
    }

    struct EventFromAllListner {
        TypeInfo type;
        FnAllRaw fn;
    }

    alias UnusedType = bool;

    int _currentCallDeep = 0;
    bool _dirtyFlag = false;

    alias RT = Tuple!(Transceiver, "r", TypeInfo, "t");
    alias RS = Tuple!(Transceiver, "r", Transceiver, "s");
    alias RST = Tuple!(Transceiver, "r", Transceiver, "s", TypeInfo, "t");
    alias RSL = Tuple!(Transceiver, "r", Transceiver, "s", EventFromOneListner, "l");
    alias RL = Tuple!(Transceiver, "r", EventFromAllListner, "l");

    EventFromAllListner[Transceiver][TypeInfo] _eventsFn;
    UnusedType[TypeInfo][Transceiver] _receiversFns;

    UnusedType[TypeInfo][Transceiver][Transceiver] _personalReceiversFns;
    EventFromOneListner[Transceiver][TypeInfo][Transceiver] _personalEventsFn;

    Transceiver[] _deleteRWait;
    RT[] _deleteRTWait;
    RS[] _deleteRSWait;
    RST[] _deleteRSTWait;

    RL[] _addWait;
    RSL[] _addPersonalWait;
}

// unittest {
//     auto ctx = new Context;
//     auto b = new Broker(ctx);

//     auto s = new Transceiver(b);
//     auto r = new Transceiver(b);

//     struct E1 {
//         int s = 14;
//     }

//     int ci = 44;

//     mixin genFunction!(`ff [](ref E1 e){
//         writeln("wtf", e.s);
//     }`);

//     b.subscribe!E1(s, r, ff);
//     auto e = E1(666);
//     b.send!E1(s, e);
// }
