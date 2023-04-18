module dard.systems.broker_dir.transceiver;

import dard.systems.broker;

mixin template ImplTransceiver() {
    static assert(is(typeof(this) : Transceiver));

    import dard.types.notnull;
    import dard.utils.static_cast;

    NotNull!Broker _broker;

    void send(E)(ref E e) {
        _broker.send!E(this, e);
    }

    void subscribe(E)(Broker.FnAll!E fn) {
        _broker.subscribe!E(this, fn);
    }

    void subscribe(E)(Transceiver s, Broker.FnOne!E fn) {
        _broker.subscribe!E(s, this, fn);
    }

    void unsubscribe(E)() {
        _broker.unsubscribe!E(this);
    }

    void unsubscribe(E)(Transceiver s) {
        _broker.unsubscribe!E(this, s);
    }

    void unsubscribeAll() {
        _broker.unsubscribeAll(this);
    }
}

interface Transceiver {
}
