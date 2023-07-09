module dard.systems.render.view;

import bindbc.bgfx;

public alias ViewId = bgfx_view_id_t;

enum {
    MAIN_VIEW = ViewId(0),
    GEOMETRY_PASS_VIEW = ViewId(0),
    LIGHT_PASS_VIEW = ViewId(1),
    COMBINE_PASS_VIEW = ViewId(2),
}
