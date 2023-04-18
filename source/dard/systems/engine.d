module dard.systems.engine;

import dard.base.system;
import dard.systems.logger;
import dard.systems.render;
import dard.base.context;
import dard.systems.broker;
import dard.types.nogc_delegate;
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
        mixin genFunction!("winClose [ref isRunning](ref WindowClose e){
            isRunning = false;
        }");
        subscribe!WindowClose(context.system!WindowSystem, winClose);

        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            render.clear();
            window.update();

            immutable auto t2 = MonoTime.currTime();

            immutable auto dt = t2 - t1;

            render.render(dt);
            if (dt < frameDuration) {
                Thread.sleep(frameDuration - dt);
            }
        }
    }
}
