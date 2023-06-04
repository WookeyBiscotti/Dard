module dard.base.scene;

import dard.base.entity;
import dard.types.memory;
import dard.types.vector;
public import dard.types.time;

struct SceneUpdate {
}

class Scene : Entity {
    this(Context c) {
        super(c, this, null);
    }

    abstract void activate();
    abstract void deactivate();

    final void updateFromEngine(Duration frameDuration) {
        send(SceneUpdate());

        update(frameDuration);
    }

    abstract void update(Duration frameDuration);
}
