module dard.systems.render.uniform;

import dard.types.string;
import dard.systems.broker;

import bindbc.bgfx;

class Uniform {
    this() {
        _uh.idx = ushort.max;
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
