module dard.utils.geometry.algs;

public import dard.types.math.vector;

bool intersectionBoxPoint(Vector2f bp, Vector2f bs, Vector2f p) {
    return (bp.x <= p.x && p.x <= bp.x + bs.x) && (bp.y <= p.y && p.y <= bp.y + bs.y);
}
