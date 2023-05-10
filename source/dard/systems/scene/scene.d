module dard.systems.scene.scene;

import dard.base.system;
import dard.systems.broker;

class Scene : System, Transceiver {
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = ImplTransceiverData(this, context.system!Broker);
    }

}
