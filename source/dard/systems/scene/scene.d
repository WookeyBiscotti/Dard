module dard.systems.scene.scene;

import dard.base.system;
import dard.systems.broker;

public import core.time : Duration;

class Scene : System, Transceiver {
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = ImplTransceiverData(this, context.system!Broker);
    }

    abstract void activate();
    abstract void deactivate();

    abstract void update(Duration frameDuration);
}
