module dard.systems.render.pass;

import dard.systems.render;
import dard.types.vector;
import dard.types.ref_count;
import dard.systems.asset.program;

struct Pass {
    Array!ViewId inViews;
    Array!ViewId outViews;
    RC!ProgramAsset prog;
}

