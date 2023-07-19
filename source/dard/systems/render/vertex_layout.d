module dard.systems.render.vertex_layout;

import bindbc.bgfx;

import std.stdio : File;

import dard.systems.filesystem.utils;
import dard.systems.asset.binary_data;

public import bindbc.bgfx : Attribute = bgfx_attrib_t;
public import bindbc.bgfx : AttributeType = bgfx_attrib_type_t;

struct VertexLayout {
public:
    ref auto begin() {
        bgfx_vertex_layout_begin(&_layout, bgfx_get_renderer_type());

        return this;
    }

    ref auto add(Attribute attr, ubyte num, AttributeType type,
            bool normalized = false, bool asInt = false) {
        bgfx_vertex_layout_add(&_layout, attr, num, type, normalized, asInt);

        return this;
    }

    void read(ref const(ubyte)* ptr) {
        ubyte numAttrs = void;
        readT(ptr, numAttrs);

        ushort stride = void;
        readT(ptr, stride);

        begin();

        for (uint ii = 0; ii < numAttrs; ++ii) {
            ushort offset = void;
            readT(ptr, offset);

            ushort attribId = void;
            readT(ptr, attribId);

            ubyte num = void;
            readT(ptr, num);

            ushort attribTypeId = void;
            readT(ptr, attribTypeId);

            bool normalized = void;
            readT(ptr, normalized);

            bool asInt = void;
            readT(ptr, asInt);

            auto attr = idToAttrib(attribId);
            auto type = idToAttribType(attribTypeId);
            if (Attribute.BGFX_ATTRIB_COUNT != attr && AttributeType.BGFX_ATTRIB_TYPE_COUNT != type) {
                add(attr, num, type, normalized, asInt);
                _layout.offset[attr] = offset;
            }
        }

        end();
        _layout.stride = stride;
    }

    ref auto end() {
        bgfx_vertex_layout_end(&_layout);

        return this;
    }

    ref auto bgfx() {
        return _layout;
    }

    bool contains(in VertexLayout o) const {
        for (uint i = 0; i != Attribute.BGFX_ATTRIB_COUNT; ++i) {
            auto attr = cast(Attribute) i;
            if (bgfx_vertex_layout_has(&_layout, attr)) {
                if (bgfx_vertex_layout_has(&o._layout, attr)) {
                    struct LI {
                        ubyte num = void;
                        AttributeType t = void;
                        bool norm = void;
                        bool isInt = void;
                    }

                    LI l1;
                    bgfx_vertex_layout_decode(&_layout, attr, &l1.num,
                            &l1.t, &l1.norm, &l1.isInt);
                    LI l2;
                    bgfx_vertex_layout_decode(&_layout, attr, &l2.num,
                            &l2.t, &l2.norm, &l2.isInt);

                    if (l1 != l2) {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }

        return true;
    }

private:
    bgfx_vertex_layout_t _layout;
}

struct AttribToId {
    Attribute attr;
    ushort id = void;
}

//dfmt off
static const AttribToId[] s_attribToId =
[
    // NOTICE:
    // Attrib must be in order how it appears in Attrib::Enum! id is
    // unique and should not be changed if new Attribs are added.
    { Attribute.BGFX_ATTRIB_POSITION,  0x0001 },
    { Attribute.BGFX_ATTRIB_NORMAL,    0x0002 },
    { Attribute.BGFX_ATTRIB_TANGENT,   0x0003 },
    { Attribute.BGFX_ATTRIB_BITANGENT, 0x0004 },
    { Attribute.BGFX_ATTRIB_COLOR0,    0x0005 },
    { Attribute.BGFX_ATTRIB_COLOR1,    0x0006 },
    { Attribute.BGFX_ATTRIB_COLOR2,    0x0018 },
    { Attribute.BGFX_ATTRIB_COLOR3,    0x0019 },
    { Attribute.BGFX_ATTRIB_INDICES,   0x000e },
    { Attribute.BGFX_ATTRIB_WEIGHT,    0x000f },
    { Attribute.BGFX_ATTRIB_TEXCOORD0, 0x0010 },
    { Attribute.BGFX_ATTRIB_TEXCOORD1, 0x0011 },
    { Attribute.BGFX_ATTRIB_TEXCOORD2, 0x0012 },
    { Attribute.BGFX_ATTRIB_TEXCOORD3, 0x0013 },
    { Attribute.BGFX_ATTRIB_TEXCOORD4, 0x0014 },
    { Attribute.BGFX_ATTRIB_TEXCOORD5, 0x0015 },
    { Attribute.BGFX_ATTRIB_TEXCOORD6, 0x0016 },
    { Attribute.BGFX_ATTRIB_TEXCOORD7, 0x0017 },
];
//dfmt on

Attribute idToAttrib(ushort id) {
    for (uint ii = 0; ii < s_attribToId.length; ++ii) {
        if (s_attribToId[ii].id == id) {
            return s_attribToId[ii].attr;
        }
    }

    return Attribute.BGFX_ATTRIB_COUNT;
}

struct AttribTypeToId {
    AttributeType type;
    ushort id;
}

//dfmt off
static AttribTypeToId[] s_attribTypeToId =
[
    // NOTICE:
    // AttribType must be in order how it appears in AttribType::Enum!
    // id is unique and should not be changed if new AttribTypes are
    // added.
    { AttributeType.BGFX_ATTRIB_TYPE_UINT8,  0x0001 },
    { AttributeType.BGFX_ATTRIB_TYPE_UINT10, 0x0005 },
    { AttributeType.BGFX_ATTRIB_TYPE_INT16,  0x0002 },
    { AttributeType.BGFX_ATTRIB_TYPE_HALF,   0x0003 },
    { AttributeType.BGFX_ATTRIB_TYPE_FLOAT,  0x0004 },
];
//dfmt on

AttributeType idToAttribType(ushort id) {
    for (uint ii = 0; ii < s_attribTypeToId.length; ++ii) {
        if (s_attribTypeToId[ii].id == id) {
            return s_attribTypeToId[ii].type;
        }
    }

    return AttributeType.BGFX_ATTRIB_TYPE_COUNT;
}
