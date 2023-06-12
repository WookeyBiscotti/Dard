module dard.systems.render.render;

import dard.base.system;
import dard.base.context;
import dard.base.scene;
import dard.types.math.vector;
import dard.types.hash_map;
import dard.types.string;
import dard.types.memory;
import dard.types.ref_count;
import dard.types.vector;

import dard.systems.config;
import dard.systems.broker;
import dard.systems.scene;
import dard.systems.window;
import dard.systems.render;
import dard.systems.logger;
import dard.systems.asset;

import dard.components.camera;
import dard.components.graphic_object;

import std.exception;
import core.time;

import bindbc.bgfx;

import sdl;
public import nanovg;

auto getCurrentRender() {
    return bgfx_get_renderer_type();
}

public alias RenderType = bgfx_renderer_type_t;

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
        init_.debug_ = false;
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

            auto currentScene = context.system!SceneSystem.current;
            if (_objects.containsKey(currentScene)) {
                Array!GraphicObject[MaterialAsset* ] ms;
                foreach (v, k; _objects[currentScene]) {
                    ms.require(v.material) ~= *cast(GraphicObject*)(&v);
                }

                foreach (v, k; _objects[currentScene]) {
                    (cast(GraphicObject*)&v).submit(0);
                }
            }
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

    void addObject(GraphicObject obj) {
        // _objects.require(obj.entity.scene)[obj] = true;
        // _objects.require(obj.entity.scene)[obj] = true;
        // pragma(msg ,typeof(_objects.getOrAdd(obj.entity.scene, HashSet!GraphicObject())));
        _objects.getOrAdd(obj.entity.scene, HashSet!GraphicObject()).opIndexAssign(true, obj);
    }

    void removeObject(GraphicObject obj) {
        _objects.require(obj.entity.scene).remove(obj);
    }

    void registerUniformFactory(in String name, SharedPtr!Uniform function(Context) creator) {
        _uniformsFactory[name] = creator;
    }

    SharedPtr!Uniform uniform(in String name) {
        if (auto u = name in _uniforms) {
            return *u;
        }

        if (auto u = name in _uniformsFactory) {
            auto su = (*u)(context());
            _uniforms[name] = su;

            return su;
        }

        fatal("Cant create uniform:" ~ name);
        assert(0);
    }

    void registerPassFactory(in String name, RC!Pass function(Context) creator) {
        _passesFactory[name] = creator;
    }

    RC!Pass pass(in String name) {
        if (auto u = name in _passes) {
            return *u;
        }

        if (auto u = name in _passesFactory) {
            auto su = (*u)(context());
            _passes[name] = su;

            return su;
        }

        fatal("Cant create pass:" ~ name);
        assert(0);
    }

    // TODO: Удалять неисползуемые юниформы(uniforms)

private:
    HashMap!(Scene, HashSet!GraphicObject) _objects;

    HashMap!(String, SharedPtr!Uniform) _uniforms;
    HashMap!(String, SharedPtr!Uniform function(Context)) _uniformsFactory;

    HashMap!(String, RC!Pass) _passes;
    HashMap!(String, RC!Pass function(Context)) _passesFactory;

    NVGcontext* _nvgContext;
    Vector2u _windowSize;

    Camera _mainCamera;
}

struct RenderPass {

}
