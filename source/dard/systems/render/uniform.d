module dard.systems.render.uniform;

import dard.types.string;
import dard.types.color;
import dard.types.memory;
import dard.systems.asset.texture;
import dard.types.math.vector;
import dard.systems.broker;
import dard.base.context;

import bindbc.bgfx;

alias UniformType = bgfx_uniform_type_t;

alias UNIFORM_TYPE_SAMPLER = UniformType.BGFX_UNIFORM_TYPE_SAMPLER;
alias UNIFORM_TYPE_VEC4 = UniformType.BGFX_UNIFORM_TYPE_VEC4;
alias UNIFORM_TYPE_MAT3 = UniformType.BGFX_UNIFORM_TYPE_MAT3;
alias UNIFORM_TYPE_MAT4 = UniformType.BGFX_UNIFORM_TYPE_MAT4;

class UniformOld : Transceiver {
    mixin ImplTransceiver;

    this(Context context, in String name, UniformType ut, ushort ne = 1) {
        _uh = bgfx_create_uniform(name.ptr, ut, ne);
    }

    ~this() {
        if (_uh.idx != ushort.max) {
            bgfx_destroy_uniform(_uh);
        }
    }

    auto bgfx() {
        return _uh;
    }

protected:
    bgfx_uniform_handle_t _uh;
}

struct Uniform {
    this(in String name, UniformType ut, ushort ne = 1) {
        _uh = bgfx_create_uniform(name.ptr, ut, ne);
    }

    ~this() {
        if (_uh.idx != ushort.max) {
            bgfx_destroy_uniform(_uh);
        }
    }

    void set(T : float)(T v) {
        bgfx_uniform_info_t info;
        bgfx_get_uniform_info(_uh, &info);
        assert(info.type == bgfx_uniform_type_t.BGFX_UNIFORM_TYPE_VEC4);
        Vector4f uv;
        uv.x = v;
        bgfx_set_uniform(_uh, &uv, 1);
    }

    void set(T : Vector4f)(T v) {
        bgfx_uniform_info_t info;
        bgfx_get_uniform_info(_uh, &info);
        assert(info.type == bgfx_uniform_type_t.BGFX_UNIFORM_TYPE_VEC4);
        bgfx_set_uniform(_uh, &v, 1);
    }

    void set(T : Vector3f)(T v) {
        bgfx_uniform_info_t info;
        bgfx_get_uniform_info(_uh, &info);
        assert(info.type == bgfx_uniform_type_t.BGFX_UNIFORM_TYPE_VEC4);
        Vector4f uv;
        uv = v;
        bgfx_set_uniform(_uh, &v, 1);
    }

    void set(T : Color)(T v) {
        bgfx_uniform_info_t info;
        bgfx_get_uniform_info(_uh, &info);
        assert(info.type == bgfx_uniform_type_t.BGFX_UNIFORM_TYPE_VEC4);

        Vector4f uv;
        uv.x = v.r / 255.0f;
        uv.y = v.g / 255.0f;
        uv.z = v.b / 255.0f;
        uv.w = v.a / 255.0f;
        bgfx_set_uniform(_uh, &uv, 1);
    }

    void set(T : SharedPtr!TextureAsset)(T v) {
        bgfx_uniform_info_t info;
        bgfx_get_uniform_info(_uh, &info);
        assert(info.type == bgfx_uniform_type_t.BGFX_UNIFORM_TYPE_SAMPLER);
        auto tid = v.bgfx();
        bgfx_set_uniform(_uh, &tid, 1);
    }

    auto bgfx() {
        return _uh;
    }

protected:
    bgfx_uniform_handle_t _uh;
}
