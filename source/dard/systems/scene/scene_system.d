module dard.systems.scene.scene_system;

import dard.base.system;
import dard.types.string;
import dard.types.traits;
import dard.types.hash_map;
import dard.types.memory;
import dard.systems.scene;
import dard.systems.logger;

public import dard.base.context : Context;

class SceneSystem : System {
    this(Context context) {
        super(context);
    }

    ~this() {
    }

    void addFactory(in String name, MallocRef!Scene delegate(Context context) dg) {
        _factory[name] = dg;
    }

    void addCache(in String name, MallocRef!Scene s) {
        _cache.require(name).moveFrom(UniquePtr!Scene.makeUnique(s));
    }

    Scene scene(in String name) {
        import core.lifetime;

        if (auto s = name in _cache) {
            return s.get();
        }
        if (auto f = name in _factory) {
            auto s = (*f)(context);
            _cache.require(name).moveFrom(UniquePtr!Scene.makeUnique(s));

            return s;
        }

        return null;
    }

    void eraseCached(in String name) {
        _cache.remove(name);
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
    Scene _current;

    // MallocRef!Scene delegate(Context context)[const String] _factory;
    HashMap!(String, Scene delegate(Context context)) _factory;
    HashMap!(String, UniquePtr!Scene) _cache;
    // UniquePtr!Scene[const String] _cache;
}
