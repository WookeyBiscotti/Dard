module dard.systems.render.render;

import dard.base.system;
import dard.base.context;
import dard.types.math.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.window;

import dard.components.camera;

import std.exception;
import core.time;

import bindbc.bgfx;

import sdl;
public import nanovg;

class Render : System, Transceiver {
public:
    mixin ImplTransceiver;

    this(Context context) {
        super(context);

        auto window = context.system!WindowSystem;

        _windowSize = window.size();

        SDL_SysWMinfo wmi;
        enforce(!SDL_GetWindowWMInfo(context.system!WindowSystem.sdlWindow(), &wmi, 1));

        bgfx_init_t init_ = void;
        bgfx_init_ctor(&init_);
        init_.platformData.ndt = wmi.info.x11.display;
        init_.platformData.nwh = cast(void*) wmi.info.x11.window;
        init_.resolution.width = _windowSize.x;
        init_.resolution.height = _windowSize.y;
        init_.resolution.format = bgfx_texture_format_t.BGFX_TEXTURE_FORMAT_RGBA8U;
        enforce(bgfx_init(&init_));

        // bgfx_set_debug(BGFX_DEBUG_TEXT | BGFX_DEBUG_STATS);
        bgfx_set_debug(BGFX_DEBUG_TEXT);

        bgfx_set_view_clear(0, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x303070ff, 1.0f, 0);
        // bgfx_set_view_clear(0, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0xffffffff, 1.0f, 0);

        subscribe!WindowResized(window, (in WindowResized e) {
            bgfx_reset(e.newSize.x, e.newSize.y, BGFX_RESET_NONE,
                bgfx_texture_format_t.BGFX_TEXTURE_FORMAT_RGBA8U);
            _windowSize = e.newSize;
        });

        _nvgContext = nvgCreateC(1, 0);
    }

    ~this() {
        _nvgContext.nvgDeleteC();
        bgfx_shutdown();
    }

    void clear() {
        bgfx_set_view_rect(0, 0, 0, cast(ushort) _windowSize.x, cast(ushort) _windowSize.y);
        bgfx_touch(0);

        _nvgContext.nvgBeginFrame(cast(ushort) _windowSize.x, cast(ushort) _windowSize.y, 1.0f);
    }

    void render(Duration dur) {
        bgfx_dbg_text_clear(0, false);
        bgfx_dbg_text_printf(0, 0, 0x0f, "FPS: %d", cast(uint)(1_000_000.0f / dur.total!"usecs"));

        _nvgContext.nvgEndFrame();

        if (_mainCamera) {
            bgfx_set_view_transform(0, &_mainCamera.view.arrayof, &_mainCamera.proj.arrayof);
        }

        bgfx_frame(false);
    }

    float aspect() const {
        return cast(float) _windowSize.x / cast(float) _windowSize.y;
    }

    NVGcontext* nvg() {
        return _nvgContext;
    }

    void mainCamera(Camera c) {
        _mainCamera = c;
    }

    Camera mainCamera() {
        return _mainCamera;
    }

private:
    NVGcontext* _nvgContext;
    Vector2u _windowSize;

    Camera _mainCamera;
}
