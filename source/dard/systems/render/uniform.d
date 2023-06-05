module dard.systems.render.uniform;

import dard.types.string;
import dard.systems.broker;
import dard.base.context;

import bindbc.bgfx;

alias UniformType = bgfx_uniform_type_t;

alias UNIFORM_TYPE_SAMPLER = UniformType.BGFX_UNIFORM_TYPE_SAMPLER;
alias UNIFORM_TYPE_VEC4 = UniformType.BGFX_UNIFORM_TYPE_VEC4;
alias UNIFORM_TYPE_MAT3 = UniformType.BGFX_UNIFORM_TYPE_MAT3;
alias UNIFORM_TYPE_MAT4 = UniformType.BGFX_UNIFORM_TYPE_MAT4;

class Uniform : Transceiver {
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
