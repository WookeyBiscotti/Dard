module dard.base.scene;

import dard.base.entity;
import dard.types.memory;
import dard.types.vector;

public import dard.types.time;

import std.algorithm;

struct ScenePreUpdate {
}

struct ScenePostUpdate {
}

class Scene : Entity {
    this(Context c) {
        super(c, this, null);
    }

    abstract void activate();
    abstract void deactivate();

    abstract void update(Duration frameDuration);

    final void updateFromEngine(Duration frameDuration) {
        _sceneTime += dur!"hnsecs"(cast(ulong)(frameDuration.total!"hnsecs" * _timeScale));

        send(ScenePreUpdate());

        update(frameDuration);

        send(ScenePostUpdate());
    }

    auto sceneTime() const {
        return _sceneTime;
    }

    void timeScale(float timeScale) {
        _timeScale = max(min(1_000_000, timeScale), 0.000_1f);
    }

    float timeScale() {
        return _timeScale;
    }

private:
    MonoTime _sceneTime;
    // Less than 1 means time is slown down
    float _timeScale = 1.0f;
}
