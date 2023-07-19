module dard.systems.engine;

import dard.base.system;
import dard.base.context;

import dard.types.math.vector;
import dard.types.memory;

import dard.systems.logger;
import dard.systems.render;
import dard.systems.broker;
import dard.systems.ui;
import dard.systems.config;
import dard.systems.window;
import dard.systems.asset;
import dard.systems.scene;
import dard.systems.filesystem;

import core.time;
import core.thread;

class Engine : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);

        context.createSystem!Logger();

        log("Systems initializing");

        context.createSystem!FileSystem();

        context.createSystem!WindowSystem();
        context.createSystem!Render();
        context.createSystem!UiSystem();
        context.createSystem!AssetSystem().initialize();
        context.createSystem!SceneSystem();
    }

    void run() {
        auto config = context.system!ConfigSystem();
        config.load();

        auto window = context.system!WindowSystem();
        auto render = context.system!Render();
        auto ui = context.system!UiSystem();
        auto assets = context.system!AssetSystem();
        auto scenes = context.system!SceneSystem();

        bool isRunning = true;
        subscribe!WindowClose(context.system!WindowSystem, (in WindowClose e) {
            isRunning = false;
        });

        Duration frameDuration = dur!"seconds"(1) / _maxFrames;
        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            import core.memory;
            
            // GC.collect();

            auto scene = scenes.current();
            if (!scene) {
                break;
            }

            window.update();
            render.clear();
            ui.update();

            scene.updateFromEngine(frameDuration);

            // GC.runFinalizers(segment);

            immutable auto t2 = MonoTime.currTime();
            immutable auto dt = t2 - t1;
            render.render(dt);

            immutable auto t3 = MonoTime.currTime();
            auto dt2 = t3 - t1;

            if (dt2 < frameDuration) {
                Thread.sleep(frameDuration - dt2);
                frameDuration = dur!"seconds"(1) / _maxFrames;
            } else {
                frameDuration = dt2;
            }
        }
    }

    uint _maxFrames = 60;
}
