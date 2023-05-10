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

import core.time;
import core.thread;

class Engine : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        context.createSystem!Broker;
        _broker = ImplTransceiverData(this, context.system!Broker);
    }

    void run() {
        context.createSystem!Logger();

        log("Systems initializing");

        auto window = context.createSystem!WindowSystem();
        auto render = context.createSystem!Render();
        auto ui = context.createSystem!UiSystem();
        auto assets = context.createSystem!AssetSystem();

        GroupWidget g = New!LayoutGroup(ui, ui.root());
        g.corner(Corner.Center).position(Vector2f(0, 0)).size(Vector2f(100, 100));

        New!SimpleButton(ui, String("btn1"), g);
        New!SimpleButton(ui, String("btn2"), g);

        // ui.root().addChild(cast(SharedPtr!Widget) gr).corner(Corner.Center)
        //     .position(Vector2f(0, 0)).size(Vector2f(100, 100));
        // gr.addChild(btn).size(Vector2f(100, Widget.DontChange));
        // gr.addChild(btn2).size(Vector2f(100, Widget.DontChange));

        // ui.root().addChild(btn).size(Vector2f(100, Widget.DontChange))
        //     .corner(Corner.Center).position(Vector2f(0, 0));
        auto frameDuration = dur!"seconds"(1) / 60;

        bool isRunning = true;
        subscribe!WindowClose(context.system!WindowSystem, (ref WindowClose e) {
            isRunning = false;
        });
        while (isRunning) {
            immutable auto t1 = MonoTime.currTime();

            window.update();
            render.clear();
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
