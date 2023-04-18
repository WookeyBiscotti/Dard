module dard.systems.render;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;
import dard.types.string;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;
import dard.types.nogc_delegate;

import std.exception;
import core.time;

import bindbc.bgfx;

import sdl;

public import dard.systems.window_dir.events;

class Render : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);
        _broker = context.system!Broker;

        auto window = context.system!WindowSystem;

        _windowSize = window.size();

        SDL_SysWMinfo wmi;
        enforce(!SDL_GetWindowWMInfo(context.system!WindowSystem
                .getSDLWindow(), &wmi, 1));

        bgfx_init_t init_ = void;
        bgfx_init_ctor(&init_);
        init_.platformData.ndt = wmi.info.x11.display;
        init_.platformData.nwh = cast(void*) wmi.info.x11.window;
        init_.resolution.width = _windowSize.x;
        init_.resolution.height = _windowSize.y;
        init_.resolution.format = bgfx_texture_format_t
            .BGFX_TEXTURE_FORMAT_RGBA8U;
        enforce(bgfx_init(&init_));

        // bgfx_set_debug(BGFX_DEBUG_TEXT | BGFX_DEBUG_STATS);
        bgfx_set_debug(BGFX_DEBUG_TEXT);

        bgfx_set_view_clear(0, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x303070ff, 1.0f, 0);

        mixin genFunction!"winResize [ref _windowSize](ref WindowResized e) {
            bgfx_reset(e.newSize.x, e.newSize.y, BGFX_RESET_NONE, bgfx_texture_format_t
                .BGFX_TEXTURE_FORMAT_RGBA8U);
            _windowSize = e.newSize;
        }";
        subscribe!WindowResized(window, winResize);

        // bgfx_reset(e.x, e.y, BGFX_RESET_NONE, bgfx_texture_format_t
        //         .BGFX_TEXTURE_FORMAT_RGBA8U);

    }

    ~this() {
        bgfx_shutdown();
    }

    void clear() {
        bgfx_set_view_rect(0, 0, 0, cast(ushort) _windowSize.x, cast(ushort) _windowSize.y);
        bgfx_touch(0);
    }

    void render(Duration dur) {
        bgfx_dbg_text_clear(cast(ubyte) 0, false);
        bgfx_dbg_text_printf(0, 0, 0x0f, "Frame duration %d usecs", cast(int) dur.total!"usecs");

        bgfx_frame(false);
    }

private:
    Vector2u _windowSize;
}
