module dard.systems.ui;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;

import sdl;

class UiSystem : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = context.system!Broker();
    }

    ~this() {
    }

    void update() {
    }

private:
}
