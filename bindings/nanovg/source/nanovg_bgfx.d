extern (C):

struct NVGcontext;

NVGcontext* nvgCreate (int _edgeaa, ushort _viewId);

void nvgDelete (NVGcontext* _ctx);
