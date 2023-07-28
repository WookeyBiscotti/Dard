module dard.systems.asset.mesh;

import bindbc.bgfx;

import dard.systems.render;
import dard.systems.config;
import dard.types.memory;
import dard.types.string;
import dard.types.vector;
import dard.base.context;
import dard.systems.asset;
import dard.types.math.vector;
import dard.types.math.matrix;
import dard.types.ref_count;
import dard.types.path;
import dard.types.vector;
import dard.systems.asset.binary_data;

import std.stdio;
import std.path;
import std.traits;

import dard.systems.filesystem.utils;

struct MeshAsset {
public:
    @disable this(this);

    this(Context) {
    }

    void deserialize(Context, in ref BinaryData data) {
        // dfmt off
        immutable uint kChunkVertexBuffer = *cast(uint*) cast(char*)['V', 'B', ' ', '\1'];
        immutable uint kChunkVertexBufferCompressed =  *cast(uint*) cast(char*)['V', 'B', 'C', '\0'];
        immutable uint kChunkIndexBuffer =  *cast(uint*) cast(char*)['I', 'B', ' ', '\0'];
        immutable uint kChunkIndexBufferCompressed =  *cast(uint*) cast(char*)['I', 'B', 'C', '\1'];
        immutable uint kChunkPrimitive =  *cast(uint*) cast(char*)['P', 'R', 'I', '\0'];
        // dfmt on

        Group group;
        uint chunk;
        auto ptr = data.data.ptr;
        while (true) {
            if (ptr == data.data.ptr + data.data.length) {
                break;
            }
            readT(ptr, chunk);
            switch (chunk) {
            case kChunkVertexBuffer: {
                    readT(ptr, group.sphere);
                    readT(ptr, group.aabb);
                    readT(ptr, group.obb);

                    _layout.read(ptr);

                    ushort stride = _layout.bgfx().stride;

                    readT(ptr, group.numVertices);
                    auto mem = bgfx_alloc(group.numVertices * stride);
                    readData(ptr, cast(ubyte*) mem.data, mem.size);

                    group.vbh = bgfx_create_vertex_buffer(mem, &_layout.bgfx(),
                            BGFX_BUFFER_COMPUTE_READ);
                }
                break;
            case kChunkIndexBuffer: {
                    readT(ptr, group.numIndices);
                    auto mem = bgfx_alloc(group.numIndices * 2);
                    readData(ptr, cast(ubyte*) mem.data, mem.size);

                    group.ibh = bgfx_create_index_buffer(mem, BGFX_BUFFER_COMPUTE_READ);
                }
                break;
            case kChunkPrimitive: {
                    ushort len;
                    readT(ptr, len);

                    String ms;
                    ms.data.resize(len, 0);
                    readData(ptr, cast(ubyte*) ms.data.data.ptr, len);

                    ushort num;
                    readT(ptr, num);

                    for (ushort ii = 0; ii < num; ++ii) {
                        readT(ptr, len);

                        String ps;
                        ps.data.resize(len, 0);
                        readData(ptr, cast(ubyte*) ps.data.data.ptr, len);

                        Primitive prim;
                        readT(ptr, prim.startIndex);
                        readT(ptr, prim.numIndices);
                        readT(ptr, prim.startVertex);
                        readT(ptr, prim.numVertices);
                        readT(ptr, prim.sphere);
                        readT(ptr, prim.aabb);
                        readT(ptr, prim.obb);

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

    static String assetsPath(Context context) {
        return String(buildPath(context.system!ConfigSystem
                .value!String(APPLICATION_ROOT).toString, "data", "meshes"));
    }

    static String autoPaths(Context context, in String name) {
        return String(buildPath(assetsPath(context), name.toString ~ ".bgms"));
    }

    static auto makeDefaultRC(Context) {
        auto defaultCubeVertexLayout() {
            VertexLayout l;
            l.begin();
            l.add(Attribute.BGFX_ATTRIB_POSITION, 3, AttributeType.BGFX_ATTRIB_TYPE_FLOAT);
            l.add(Attribute.BGFX_ATTRIB_COLOR0, 4, AttributeType.BGFX_ATTRIB_TYPE_UINT8, true);
            l.end();

            return l;
        }

        struct DefaultCubeVertex {
            float x;
            float y;
            float z;

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

        return makeShared!MeshAsset(cast(const void[]) defaultCubeVerteces,
                defaultCubeTriList, defaultCubeVertexLayout());
    }

    // this(Context context, File file, in String name) {
    //     // dfmt off
    //     immutable uint kChunkVertexBuffer = *cast(uint*) cast(char*)['V', 'B', ' ', '\1'];
    //     immutable uint kChunkVertexBufferCompressed =  *cast(uint*) cast(char*)['V', 'B', 'C', '\0'];
    //     immutable uint kChunkIndexBuffer =  *cast(uint*) cast(char*)['I', 'B', ' ', '\0'];
    //     immutable uint kChunkIndexBufferCompressed =  *cast(uint*) cast(char*)['I', 'B', 'C', '\1'];
    //     immutable uint kChunkPrimitive =  *cast(uint*) cast(char*)['P', 'R', 'I', '\0'];
    //     // dfmt on

    //     Group group;
    //     uint chunk;
    //     while (file.readT(chunk) == 4) {
    //         switch (chunk) {
    //         case kChunkVertexBuffer: {
    //                 file.readT(group.sphere);
    //                 file.readT(group.aabb);
    //                 file.readT(group.obb);

    //                 _layout.read(file);

    //                 ushort stride = _layout.bgfx().stride;

    //                 file.readT(group.numVertices);
    //                 auto mem = bgfx_alloc(group.numVertices * stride);
    //                 file.readData(cast(ubyte*) mem.data, mem.size);

    //                 group.vbh = bgfx_create_vertex_buffer(mem, &_layout.bgfx(),
    //                         BGFX_BUFFER_COMPUTE_READ);
    //             }
    //             break;
    //         case kChunkIndexBuffer: {
    //                 file.readT(group.numIndices);
    //                 auto mem = bgfx_alloc(group.numIndices * 2);
    //                 file.readData(cast(ubyte*) mem.data, mem.size);

    //                 group.ibh = bgfx_create_index_buffer(mem, BGFX_BUFFER_COMPUTE_READ);
    //             }
    //             break;
    //         case kChunkPrimitive: {
    //                 ushort len;
    //                 file.readT(len);

    //                 String ms;
    //                 ms.data.resize(len, 0);
    //                 file.readData(cast(ubyte*) ms.data.data.ptr, len);

    //                 ushort num;
    //                 file.readT(num);

    //                 for (ushort ii = 0; ii < num; ++ii) {
    //                     file.readT(len);

    //                     String ps;
    //                     ps.data.resize(len, 0);
    //                     file.readData(cast(ubyte*) ps.data.data.ptr, len);

    //                     Primitive prim;
    //                     file.readT(prim.startIndex);
    //                     file.readT(prim.numIndices);
    //                     file.readT(prim.startVertex);
    //                     file.readT(prim.numVertices);
    //                     file.readT(prim.sphere);
    //                     file.readT(prim.aabb);
    //                     file.readT(prim.obb);

    //                     group.prims ~= prim;
    //                 }

    //                 _groups ~= group;
    //                 group = group.init;
    //             }
    //             break;
    //         default:
    //         }
    //     }
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

        foreach (ref Group g; _groups) {
            bgfx_set_index_buffer(g.ibh, 0, g.numIndices);
            bgfx_set_vertex_buffer(0, g.vbh, 0, g.numVertices);

            bgfx_submit(id, program, 0, BGFX_DISCARD_INDEX_BUFFER | BGFX_DISCARD_VERTEX_STREAMS);
        }

        bgfx_discard(BGFX_DISCARD_ALL);
    }

    ~this() {
        foreach (ref Group g; _groups) {
            bgfx_destroy_vertex_buffer(g.vbh);
            bgfx_destroy_index_buffer(g.ibh);
        }
    }

private:
    VertexLayout _layout;
    Vector!Group _groups;
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
        // ~this() nothrow {
        // }

        // this(const ref Primitive other) nothrow {
        //     startIndex = other.startIndex;
        //     numIndices = other.numIndices;
        //     startVertex = other.startVertex;
        //     numVertices = other.numVertices;

        //     sphere = other.sphere;
        //     aabb = other.aabb;
        //     obb = other.obb;
        //     material = other.material;
        // }

        // void opAssign(in Primitive other) nothrow {
        //     startIndex = other.startIndex;
        //     numIndices = other.numIndices;
        //     startVertex = other.startVertex;
        //     numVertices = other.numVertices;

        //     sphere = other.sphere;
        //     aabb = other.aabb;
        //     obb = other.obb;
        //     try {
        //         material = cast(RC!MaterialAsset) other.material;
        //     } catch (Exception e) {
        //     }
        // }

        uint startIndex;
        uint numIndices;
        uint startVertex;
        uint numVertices;

        Sphere sphere;
        AABB aabb;
        OBB obb;

        RC!MaterialAsset material;
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
        Vector!Primitive prims;
    }
}
