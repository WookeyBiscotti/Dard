module dard.systems.broker.transceiver;

import dard.systems.broker;
public import dard.types.hash_map;

alias EventDlg(E) = void delegate(in E);
alias EventRawDlg = void delegate(const void* E);

mixin template ImplTransceiver() {
    static assert(is(typeof(this) : Transceiver));

    HashMap!(TypeInfo, HashMap!(Transceiver, EventRawDlg, true), true) _dlgs;

    HashMap!(Transceiver, HashMap!(TypeInfo, bool)) _senders;

    ~this() {
        foreach (type, ref dgs; _dlgs) {
            while (dgs.length) {
                dgs.front.key.unsubscribe(this);
            }
        }
        unsubscribe();
    }

    final override void send(TypeInfo t, const(void)* e) {
        foreach (ref d; _dlgs.require(t)) {
            d(e);
        }
    }

    final override void subscribe(TypeInfo t, Transceiver s, EventRawDlg dlg) {
        _senders.require(s).require(t);
        s.addListner(t, this, dlg);
    }

    final override void unsubscribe(TypeInfo t, Transceiver s) {
        s.removeListner(t, this);
        _senders.require(s).remove(t);
    }

    final override void unsubscribe(Transceiver s) {
        s.removeListner(this);
        _senders.remove(s);
    }

    final override void unsubscribe() {
        foreach (s, ref v; _senders) {
            (cast(Transceiver) s).removeListner(this);
        }
        _senders.clear();
    }

    final override void addListner(TypeInfo t, Transceiver r, EventRawDlg dlg) {
        // _dlgs.require(t).require(r) = dlg;
        // import std.stdio;

        // writeln(dlg.ptr);
        _dlgs.require(t).require(r) = dlg;
    }

    final override void removeListner(TypeInfo t, Transceiver r) {
        _dlgs.require(t).remove(r);
    }

    final override void removeListner(Transceiver r) {
        foreach (ref rs; _dlgs) {
            rs.remove(r);
        }
    }

    final override void removeAllListners() {
        foreach (dgs; _dlgs) {
            while (!dgs.length) {
                dgs.front.key.unsubscribe(this);
            }
        }
        _dlgs.clear();
    }

    void send(E)(in E e) {
        send(typeid(E), cast(const void*)&e);
    }

    void subscribe(E)(Transceiver s, EventDlg!E dlg) {
        subscribe(typeid(E), s, (const void* e) {
            dlg(*(cast(const E*) e));
        });
    }

    void unsubscribe(E)(Transceiver s) {
        unsubscribe(typeid(E), s);
    }
}

interface Transceiver {
    void send(TypeInfo t, const(void)* e);
    void subscribe(TypeInfo t, Transceiver sender, EventRawDlg dlg);

    void unsubscribe(TypeInfo t, Transceiver receiver);
    void unsubscribe(Transceiver receiver);
    void unsubscribe();

    void addListner(TypeInfo t, Transceiver r, EventRawDlg dlg);

    void removeListner(TypeInfo t, Transceiver r);
    void removeListner(Transceiver r);
    void removeAllListners();
}
