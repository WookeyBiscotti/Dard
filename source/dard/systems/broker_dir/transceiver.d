module dard.systems.broker_dir.transceiver;

import dard.systems.broker;

mixin template ImplTransceiver() {
    static assert(is(this : Transceiver));

    private Broker _broker;

    void send(E)(ref E e) {
        _broker.send!E(this, e);
    }

    void subscribe(E)(Broker.FnAll fn) {
        _broker.subscribe!E(this, fn);
    }

    void subscribe(E)(Transceiver* s, Broker.FnAll fn) {
        _broker.subscribe!E(s, this, fn);
    }

    void unsubscribe(E)() {
        _broker.unsubscribe!E(this);
    }

    void unsubscribe(E)(Transceiver* s) {
        _broker.unsubscribe!E(this, s);
    }

    void unsubscribeAll() {
        _broker.unsubscribeAll(this);
    }
}

interface Transceiver {
}
