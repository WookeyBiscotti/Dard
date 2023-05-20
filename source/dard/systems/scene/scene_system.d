module dard.systems.scene.scene_system;

import dard.base.system;
import dard.types.string;
import dard.types.traits;
import dard.types.memory;
import dard.systems.scene;
import dard.systems.logger;

public import dard.base.context : Context;

class SceneSystem : System {
    this(Context context) {
        super(context);
    }

    void addFactory(in String name, MallocRef!Scene delegate(Context context) dg) {
        _factory[name] = dg;
    }

    void addCache(in String name, MallocRef!Scene s) {
        _cache[name] = s;
    }

    Scene scene(in String name) {
        if (auto s = name in _cache) {
            return *s;
        }
        if (auto f = name in _factory) {
            auto s = (*f)(context);
            _cache[name] = s;

            return s;
        }

        return null;
    }

    void eraseCached(in String name) {
        if (auto s = name in _cache) {
            Delete(*s);
        }
    }

    void eraseFactory(in String name) {
        if (auto s = name in _factory) {
            _factory.remove(name);
        }
    }

    void erase(in String name) {
        eraseCached(name);
        eraseFactory(name);
    }

    Scene current() {
        return _current;
    }

    void current(Scene scene) {
        if (_current) {
            _current.deactivate();
        }
        if (scene) {
            scene.activate();
        }
        _current = scene;
    }

private:
    void logAll() {
        foreach (k, v; _cache) {
            log(k, v);
        }
    }

private:
    Scene _current;

    MallocRef!Scene delegate(Context context)[const String] _factory;
    MallocRef!Scene[const String] _cache;
}
