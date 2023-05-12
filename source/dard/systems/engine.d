module dard.systems.engine;

import dard.base.system;
import dard.base.context;

import dard.types.math.vector;
import dard.types.memory;

import dard.systems.logger;
import dard.systems.render;
import dard.systems.broker;
import dard.systems.ui;
import dard.systems.window;
import dard.systems.asset;
import dard.systems.scene;

import core.time;
import core.thread;

class Engine : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        context.createSystem!Broker;
        _broker = ImplTransceiverData(this, context.system!Broker);

        context.createSystem!Logger();

        log("Systems initializing");

        auto window = context.createSystem!WindowSystem();
        auto render = context.createSystem!Render();
        auto ui = context.createSystem!UiSystem();
        auto assets = context.createSystem!AssetSystem();
        auto scenes = context.createSystem!SceneSystem();
    }

    void run() {
        auto window = context.system!WindowSystem();
        auto render = context.system!Render();
        auto ui = context.system!UiSystem();
        auto assets = context.system!AssetSystem();
        auto scenes = context.system!SceneSystem();

        bool isRunning = true;
        subscribe!WindowClose(context.system!WindowSystem, (ref WindowClose e) {
            isRunning = false;
        });

        Duration frameDuration = dur!"seconds"(1) / _maxFrames;
        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            auto scene = scenes.current();
            if (!scene) {
                break;
            }

            window.update();
            render.clear();
            ui.update();

            scene.update(frameDuration);

            // import core.memory;
            // GC.collect();

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
