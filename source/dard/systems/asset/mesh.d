module dard.systems.asset.mesh;

import bindbc.bgfx;

import dard.systems.render;
import dard.types.memory;
import dard.types.string;
import dard.types.vector;
import dard.base.context;
import dard.systems.asset;
import dard.types.math.vector;
import dard.types.math.matrix;
import dard.types.ref_count;
import dard.systems.asset.binary_data;

import std.stdio;

import dard.systems.filesystem.utils;

// package ulong readT(T)(ref File f, ref T p)
// if (!is(T == class) && !is(T == interface)) {
//     ubyte[T.sizeof]* arr = cast(ubyte[T.sizeof]*)&p;

//     return f.rawRead(*arr).length;
// }

// package ulong readData(ref File f, ubyte* data, uint size) {
//     ubyte[] arr = data[0 .. size];

//     return f.rawRead(arr).length;
// }

struct MeshAsset {
public:
    // this(File file, VertexLayout layout) {
    //     _data = NewArray!(ubyte)(file.size());
    //     file.rawRead(_data);
    //     _memoryOwned = true;
    // }
    @disable this(this);

    this(Context context, File file, in String name) {
        // dfmt off
        immutable uint kChunkVertexBuffer = *cast(uint*) cast(char*)['V', 'B', ' ', '\1'];
        immutable uint kChunkVertexBufferCompressed =  *cast(uint*) cast(char*)['V', 'B', 'C', '\0'];
        immutable uint kChunkIndexBuffer =  *cast(uint*) cast(char*)['I', 'B', ' ', '\0'];
        immutable uint kChunkIndexBufferCompressed =  *cast(uint*) cast(char*)['I', 'B', 'C', '\1'];
        immutable uint kChunkPrimitive =  *cast(uint*) cast(char*)['P', 'R', 'I', '\0'];
        // dfmt on

        Group group;
        uint chunk;
        while (file.readT(chunk) == 4) {
            switch (chunk) {
            case kChunkVertexBuffer: {
                    file.readT(group.sphere);
                    file.readT(group.aabb);
                    file.readT(group.obb);

                    _layout.read(file);

                    ushort stride = _layout.bgfx().stride;

                    file.readT(group.numVertices);
                    auto mem = bgfx_alloc(group.numVertices * stride);
                    file.readData(cast(ubyte*) mem.data, mem.size);

                    group.vbh = bgfx_create_vertex_buffer(mem, &_layout.bgfx(),
                            BGFX_BUFFER_COMPUTE_READ);
                }
                break;
            case kChunkIndexBuffer: {
                    file.readT(group.numIndices);
                    auto mem = bgfx_alloc(group.numIndices * 2);
                    file.readData(cast(ubyte*) mem.data, mem.size);

                    group.ibh = bgfx_create_index_buffer(mem, BGFX_BUFFER_COMPUTE_READ);
                }
                break;
            case kChunkPrimitive: {
                    ushort len;
                    file.readT(len);

                    String ms;
                    ms.data.resize(len, 0);
                    file.readData(cast(ubyte*) ms.data.data.ptr, len);

                    ushort num;
                    file.readT(num);

                    for (ushort ii = 0; ii < num; ++ii) {
                        file.readT(len);

                        String ps;
                        ps.data.resize(len, 0);
                        file.readData(cast(ubyte*) ps.data.data.ptr, len);

                        Primitive prim;
                        file.readT(prim.startIndex);
                        file.readT(prim.numIndices);
                        file.readT(prim.startVertex);
                        file.readT(prim.numVertices);
                        file.readT(prim.sphere);
                        file.readT(prim.aabb);
                        file.readT(prim.obb);

                        group.prims ~= prim;
                    }

                    _groups ~= group;
                    group = group.init;
                }
                break;
            default:
            }
        }
    }

    // static auto makeQuad(in V3 position, in V3 origin, in V3 normal, in V2 size) {
    //     RC!MeshAsset ma;
    //     ma._layout = VertexLayout().begin().add(Attribute.BGFX_ATTRIB_POSITION, 3,
    //             AttributeType.BGFX_ATTRIB_TYPE_FLOAT).add(Attribute.BGFX_ATTRIB_TEXCOORD0,
    //             2, AttributeType.BGFX_ATTRIB_TYPE_FLOAT).end();

    //     return ma;
    // }

    // Point in center of quad
    // this(in V3 position, in V3 origin, in V3 normal, in V2 size, in VertexLayout layout) {
    // }

    this(const void[] vertextBuffer, const ushort[] indexBuffer, in VertexLayout layout) {
        _layout = layout;
        Group group;
        Primitive p;
        p.numIndices = uint.max;
        p.numVertices = uint.max;
        p.startIndex = 0;
        p.startVertex = 0;
        group.prims ~= p;
        auto vm = bgfx_make_ref(vertextBuffer.ptr, cast(uint) vertextBuffer.length);
        group.vbh = bgfx_create_vertex_buffer(vm, &_layout.bgfx(), BGFX_BUFFER_COMPUTE_READ);
        auto im = bgfx_make_ref(indexBuffer.ptr, cast(uint)(indexBuffer.length * ushort.sizeof));
        group.ibh = bgfx_create_index_buffer(im, BGFX_BUFFER_COMPUTE_READ);

        group.numVertices = ushort.max;
        group.numIndices = uint.max;

        _groups ~= group;
    }

    void submit(bgfx_view_id_t id, bgfx_program_handle_t program,
            const(float)* mtx, ulong state = BGFX_STATE_MASK) {

        if (BGFX_STATE_MASK == state) {
            state = 0 | BGFX_STATE_WRITE_RGB | BGFX_STATE_WRITE_A | BGFX_STATE_WRITE_Z
                | BGFX_STATE_DEPTH_TEST_LESS | BGFX_STATE_CULL_CW | BGFX_STATE_MSAA;
        }

        bgfx_set_transform(mtx, 1);
        bgfx_set_state(state, 0);

        foreach (const ref Group g; _groups) {
            bgfx_set_index_buffer(g.ibh, 0, g.numIndices);
            bgfx_set_vertex_buffer(0, g.vbh, 0, g.numVertices);

            bgfx_submit(id, program, 0, BGFX_DISCARD_INDEX_BUFFER | BGFX_DISCARD_VERTEX_STREAMS);
        }

        bgfx_discard(BGFX_DISCARD_ALL);
    }

    ~this() {
        foreach (const ref Group g; _groups) {
            bgfx_destroy_vertex_buffer(g.vbh);
            bgfx_destroy_index_buffer(g.ibh);
        }
    }

private:
    VertexLayout _layout;
    Array!Group _groups;
}

auto makeDefaultCudeMesh() {
    auto defaultCubeVertexLayout() {
        VertexLayout l;
        l.begin();
        l.add(Attribute.BGFX_ATTRIB_POSITION, 3, AttributeType.BGFX_ATTRIB_TYPE_FLOAT);
        // l.add(Attribute.BGFX_ATTRIB_NORMAL, 3, AttributeType.BGFX_ATTRIB_TYPE_UINT8, true, true);
        l.add(Attribute.BGFX_ATTRIB_COLOR0, 4, AttributeType.BGFX_ATTRIB_TYPE_UINT8, true);
        l.end();

        return l;
    }

    struct DefaultCubeVertex {
        float x;
        float y;
        float z;

        // ubyte nx;
        // ubyte ny;
        // ubyte nz;

        uint rgba;
    }

    immutable DefaultCubeVertex[] defaultCubeVerteces = [
        {-1.0f, 1.0f, 1.0f, 0xff000000}, {1.0f, 1.0f, 1.0f, 0xff0000ff},
        {-1.0f, -1.0f, 1.0f, 0xff00ff00}, {1.0f, -1.0f, 1.0f, 0xff00ffff},
        {-1.0f, 1.0f, -1.0f, 0xffff0000}, {1.0f, 1.0f, -1.0f, 0xffff00ff},
        {-1.0f, -1.0f, -1.0f, 0xffffff00}, {1.0f, -1.0f, -1.0f, 0xffffffff},
    ];

    immutable ushort[] defaultCubeTriList = [
        0, 1, 2, // 0
        1, 3, 2, 4, 6, 5, // 2
        5, 6, 7, 0, 2, 4, // 4
        4, 2, 6, 1, 5, 3, // 6
        5, 7, 3, 0, 4, 1, // 8
        4, 5, 1, 2, 3, 6, // 10
        6, 3, 7,
    ];

    return RC!MeshAsset(cast(const void[]) defaultCubeVerteces,
            defaultCubeTriList, defaultCubeVertexLayout());
}

package {
    struct AABB {
        V3 min = [0, 0, 0];
        V3 max = [0, 0, 0];
    }

    struct OBB {
        Mat4f m = Mat4f.identity;
    }

    struct Sphere {
        V3 min = [0, 0, 0];
        float r = 0;
    }

    struct Primitive {
        uint startIndex;
        uint numIndices;
        uint startVertex;
        uint numVertices;

        Sphere sphere;
        AABB aabb;
        OBB obb;
    }

    struct Group {
        bgfx_vertex_buffer_handle_t vbh = bgfx_vertex_buffer_handle_t(ushort.max);
        bgfx_index_buffer_handle_t ibh = bgfx_index_buffer_handle_t(ushort.max);

        ushort numVertices;
        // ubyte* vertices;
        uint numIndices;
        // ushort* indices;

        Sphere sphere;
        AABB aabb;
        OBB obb;
        Array!Primitive prims;
    }
}
