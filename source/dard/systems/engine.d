module dard.systems.engine;

import dard.base.system;
import dard.systems.logger;
import dard.systems.render;
import dard.base.context;
import dard.systems.broker;
import core.time;
import core.thread;

class Engine : System, Transceiver {
public:
    mixin ImplTransceiver!();

    this(Context context) {
        super(context);
        context.createSystem!Broker;
        _broker = context.system!Broker;
    }

    void run() {
        context.createSystem!Logger();

        log("Systems initializing");

        import dard.systems.window;

        auto window = context.createSystem!WindowSystem();
        auto render = context.createSystem!Render();

        auto frameDuration = dur!"seconds"(1) / 60;

        bool isRunning = true;
        subscribe!WindowClose(context.system!WindowSystem, (ref WindowClose e) {
            isRunning = false;
        });

        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            render.clear();
            window.update();

            import core.memory;
            GC.collect();

            immutable auto t2 = MonoTime.currTime();

            immutable auto dt = t2 - t1;
            render.render(dt);
            if (dt < frameDuration) {
                Thread.sleep(frameDuration - dt);
            }
        }
    }
}
