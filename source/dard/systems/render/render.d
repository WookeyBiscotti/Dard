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
import dard.systems.render.lights.point;

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

enum POINT_LIGHTS_COUNT = 8;

final class Render : System, Transceiver {
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

        bgfx_set_view_clear(MAIN_VIEW, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x303070ff, 1.0f, 0);
        // bgfx_set_view_clear(0, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x000000ff, 1.0f, 0);

        subscribe!WindowResized(window, (in WindowResized e) {
            bgfx_reset(e.newSize.x, e.newSize.y, BGFX_RESET_NONE,
                bgfx_texture_format_t.BGFX_TEXTURE_FORMAT_RGBA8U);
            _windowSize = e.newSize;
        });

        _nvgContext = nvgCreateC(1, 0);

        auto pointLightsUniform = getOrCreateUniform(S!"u_PointLights",
                UNIFORM_TYPE_VEC4, 2 * POINT_LIGHTS_COUNT);
        _uniformsCaptured.pushBack(pointLightsUniform);
        _pointLightsUniform = pointLightsUniform.get();
    }

    ~this() {
        _uniformsCaptured.clear();
        _uniforms.clear();
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
                foreach (v, k; _objects[currentScene]) {
                    submitLights(cast(GraphicObject) v);
                    (cast(GraphicObject) v).submit(0);
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
        _objects.require(obj.entity.scene).opIndexAssign(true, obj);
    }

    void removeObject(GraphicObject obj) {
        _objects.require(obj.entity.scene).remove(obj);
    }

    void addLight(PointLight l) {
        _lights.require(l.entity.scene).opIndexAssign(true, l);
    }

    void removeLight(PointLight l) {
        _lights.require(l.entity.scene).remove(l);
    }

    SP!Uniform getOrCreateUniform(in String name, UniformType type, size_t num) {
        if (auto u = name in _uniforms) {
            bgfx_uniform_info_t info;
            bgfx_get_uniform_info(u.bgfx, &info);
            assert(info.type == type);
            assert(info.num == num);

            return *u;
        }

        auto u = makeShared!Uniform(name, UNIFORM_TYPE_VEC4, cast(ushort)(2 * POINT_LIGHTS_COUNT));
        _uniforms[name] = u;

        return u;
    }

    SharedPtr!Uniform uniform(in String name) {
        if (auto u = name in _uniforms) {
            return *u;
        }

        fatal("Cant find uniform:" ~ name);
        assert(0);
    }

    // TODO: Удалять неисползуемые юниформы(uniforms)

private:
    void submitLights(GraphicObject obj) {
        if (!_mainCamera) {
            return;
        }
        auto s = obj.entity().scene();
        Vector4f[POINT_LIGHTS_COUNT * 2] pl;
        foreach (ref p; pl) {
            p = Vector4f(0, 0, 0, 0);
        }
        if (auto lights = s in _lights) {
            if (lights.length > 0) {
                int i = 0;
                foreach (l, v; *lights) {
                    if (i >= POINT_LIGHTS_COUNT) {
                        break;
                    }
                    auto e = (cast(PointLight) l).entity;
                    pl[2 * i].x = e.transform.position.x;
                    pl[2 * i].y = e.transform.position.y;
                    pl[2 * i].z = e.transform.position.z;
                    pl[2 * i].w = 1;
                    pl[2 * i] = pl[2 * i] * _mainCamera.view;
                    pl[2 * i].w = l.r;
                    pl[2 * i + 1].x = l.color.norm!"r";
                    pl[2 * i + 1].y = l.color.norm!"g";
                    pl[2 * i + 1].z = l.color.norm!"b";
                    pl[2 * i + 1].w = l.power;
                    ++i;
                }
            }
        }

        _pointLightsUniform.set(pl);
    }

    HashMap!(Scene, HashSet!GraphicObject) _objects;
    HashMap!(Scene, HashSet!PointLight) _lights;

    HashMap!(String, SharedPtr!Uniform) _uniforms;
    Vector!(SP!Uniform) _uniformsCaptured;

    NVGcontext* _nvgContext;
    Vector2u _windowSize;

    Camera _mainCamera;

    Uniform* _pointLightsUniform;
}
