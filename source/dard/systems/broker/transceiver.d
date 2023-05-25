module dard.systems.broker.transceiver;

import dard.systems.broker;

alias EventDlg(E) = void delegate(in E);
alias EventRawDlg = void delegate(const void* E);

mixin template ImplTransceiver() {
    static assert(is(typeof(this) : Transceiver));

    EventRawDlg[Transceiver][TypeInfo] _dlgs;
    bool[TypeInfo][Transceiver] _senders;

    ~this() {
        foreach (ref dgs; _dlgs.byValue()) {
            while (dgs.length) {
                dgs.keys[0].unsubscribe(this);
            }
        }
        unsubscribe();
    }

    final override void send(TypeInfo t, const(void)* e) {
        foreach (ref d; _dlgs.require(t).byValue()) {
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
        foreach (ref s; _senders.byKey()) {
            s.removeListner(this);
        }
        _senders = null;
    }

    final override void addListner(TypeInfo t, Transceiver r, EventRawDlg dlg) {
        _dlgs.require(t).require(r) = dlg;
    }

    final override void removeListner(TypeInfo t, Transceiver r) {
        _dlgs.require(t).remove(r);
    }

    final override void removeListner(Transceiver r) {
        foreach (ref rs; _dlgs.byValue()) {
            rs.remove(r);
        }
    }

    final override void removeAllListners() {
        foreach (const ref dgs; _dlgs.byValue) {
            while (!dgs.length) {
                dgs.keys[0].unsubscribe(this);
            }
        }
        _dlgs = null;
    }

    void send(E)(in E e) {
        send(typeid(E), cast(const void*)&e);
    }

    void subscribe(E)(Transceiver s, EventDlg!E dlg) {
        subscribe(typeid(E), s, (const void* e) { dlg(*(cast(const E*) e)); });
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
