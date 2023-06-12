module dard.systems.render.view;

import bindbc.bgfx;

public alias ViewId = bgfx_view_id_t;

enum {
    MAIN_VIEW = ViewId(0),
}
