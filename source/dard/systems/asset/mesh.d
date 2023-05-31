module dard.systems.asset.mesh;

import bindbc.bgfx;

import dard.systems.render;
import dard.types.memory;
import dard.types.string;
import dard.base.context;
import dard.systems.asset;

import std.stdio;

struct MeshAsset {
public:
    // this(File file, VertexLayout layout) {
    //     _data = NewArray!(ubyte)(file.size());
    //     file.rawRead(_data);
    //     _memoryOwned = true;
    // }

    this(Context context, in File data, in String name) {
    }

    this(const void[] vertextBuffer, const ushort[] indexBuffer, in VertexLayout layout) {
        _layout = layout;
        auto vm = bgfx_make_ref(vertextBuffer.ptr, vertextBuffer.sizeof);
        _vbh = bgfx_create_vertex_buffer(vm, &_layout.bgfx(), BGFX_BUFFER_COMPUTE_READ);

        auto im = bgfx_make_ref(indexBuffer.ptr, indexBuffer.sizeof);
        _ibh = bgfx_create_index_buffer(im, BGFX_BUFFER_COMPUTE_READ);
    }

    ~this() {
        if (_memoryOwned) {
            Delete!ubyte(_data);
        }
    }

private:
    ubyte[] _data;

    bgfx_vertex_buffer_handle_t _vbh;
    bgfx_index_buffer_handle_t _ibh;

    bool _memoryOwned;
    VertexLayout _layout;
}
