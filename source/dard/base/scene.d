module dard.base.scene;

import dard.base.entity;
import dard.types.memory;
import dard.types.vector;
public import dard.types.time;

class Scene : Entity {
    this(Context c) {
        super(c, null);
    }

    abstract void activate();
    abstract void deactivate();

    abstract void update(Duration frameDuration);
}
