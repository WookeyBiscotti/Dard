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

    void end() {
        bgfx_vertex_layout_end(&_layout);
    }

    const ref auto bgfx() {
        return _layout;
    }

private:
    bgfx_vertex_layout_t _layout;
}
