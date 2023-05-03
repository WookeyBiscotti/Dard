module dard.systems.engine;

import dard.base.system;
import dard.base.context;

import dard.types.math.vector;

import dard.systems.logger;
import dard.systems.render;
import dard.systems.broker;
import dard.systems.ui;
import dard.systems.window;
import dard.systems.asset;

import core.time;
import core.thread;

class Engine : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        context.createSystem!Broker;
        _broker = context.system!Broker;
    }

    void run() {
        context.createSystem!Logger();

        log("Systems initializing");

        auto window = context.createSystem!WindowSystem();
        auto render = context.createSystem!Render();
        auto ui = context.createSystem!UiSystem();
        auto assets = context.createSystem!AssetSystem();

        ui.root().addChild(new SimpleButton(ui, "Abcdefg", ui.root()))
            .size(Vector2f(100, Widget.DontChange)).corner(Corner.Center).position(Vector2f(0, 0));
        auto frameDuration = dur!"seconds"(1) / 60;

        bool isRunning = true;
        subscribe!WindowClose(context.system!WindowSystem, (ref WindowClose e) {
            isRunning = false;
        });
        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            render.clear();
            window.update();
            ui.update();

            // import core.memory;
            // GC.collect();

            immutable auto t2 = MonoTime.currTime();
            immutable auto dt = t2 - t1;
            render.render(dt);

            immutable auto t3 = MonoTime.currTime();
            auto dt2 = t3 - t1;
            if (dt2 < frameDuration) {
                Thread.sleep(frameDuration - dt2);
            }
        }
    }
}
