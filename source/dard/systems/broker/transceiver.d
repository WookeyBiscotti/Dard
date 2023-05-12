module dard.systems.broker.transceiver;

import dard.systems.broker;

struct ImplTransceiverData {
    this() @disable;

    this(Transceiver self, Broker broker) {
        _broker = broker;
        _self = self;
    }

    ~this() {
        _broker.unsubscribeAll(_self);
    }

    ref getRef() inout @property {
        return _broker;
    }

    private Broker _broker;
    private Transceiver _self;

    alias getRef this;
}

mixin template ImplTransceiver() {
    static assert(is(typeof(this) : Transceiver));

    import dard.types.notnull;
    import dard.utils.static_cast;

    ImplTransceiverData _broker;

    void send(E)(in E e) {
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
