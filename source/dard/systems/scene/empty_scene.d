module dard.systems.scene.empty_scene;

import dard.systems.scene;
import std.typecons: BlackHole;

// alias EmptyScene = BlackHole!(Scene);

class EmptyScene : Scene {
    this(Context context) {
        super(context);
    }

    override void activate() {
    }

    override void deactivate() {
    }

    override void update(Duration frameDuration) {
    }
}
