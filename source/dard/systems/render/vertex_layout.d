module dard.systems.render.vertex_layout;

import bindbc.bgfx;

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
