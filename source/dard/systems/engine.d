module dard.systems.engine;

import dard.base.system;
import dard.systems.logger;
import dard.base.context;
import core.time;
import core.thread;

class Engine : System {
public:
    this(Context context) {
        super(context);
    }

    void run() {
        context.createSystem!Logger();
        
        log("Systems initializing");
        
        import dard.systems.window;
        context.createSystem!Window();

        auto frameDuration = dur!"seconds"(1) / 60;
        while (true) {
            immutable auto t1 = MonoTime.currTime();
            immutable auto t2 = MonoTime.currTime();

            immutable auto dt = t2 - t1;
            if (dt < frameDuration) {
                Thread.sleep(frameDuration - dt);
            }
        }
    }
}
