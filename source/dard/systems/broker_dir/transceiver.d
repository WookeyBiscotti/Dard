module dard.systems.broker_dir.transceiver;

import dard.systems.broker;

struct Transceiver {
    this(Broker broker) {
        _broker = broker;
    }

private:
    Broker _broker;
}
