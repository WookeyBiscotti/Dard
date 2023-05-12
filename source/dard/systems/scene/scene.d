module dard.systems.scene.scene;

import dard.base.system;
import dard.systems.broker;

public import core.time : Duration;

class Scene : Transceiver {
    mixin ImplTransceiver;

    this(Context context) {
        _context = context;

        _broker = ImplTransceiverData(this, context.system!Broker);
    }

    abstract void activate();
    abstract void deactivate();

    abstract void update(Duration frameDuration);

    Context context() {
        return _context;
    }

private:
    Context _context;
}
