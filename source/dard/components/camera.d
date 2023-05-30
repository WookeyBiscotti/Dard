module dard.components.camera;

import dard.base.component;
import dard.types.math.matrix;
import dard.types.math.vector;
import dard.components.transform;
import dard.systems.render;

import dlib.math.transformation;

class Camera : Component {
public:
    static immutable UP = Vector3f(0, 0, 1);

    this(Entity e) {
        super(e);

        _eye = e.get!Transform.position() + Vector3f(10, 0, 0);
        _aspect = entity.context.system!Render.aspect();

        updateViewProj();
    }

    inout ref auto view() {
        return _view;
    }

    inout ref auto proj() {
        return _proj;
    }

private:
    void updateViewProj() {
        _view = lookAtMatrix!float(entity.get!Transform.position(), _eye, _up);
        _proj = perspectiveMatrix(_fov, _aspect, _near, _far);
    }

    Vector3f _eye;
    Vector3f _up = UP;

    float _fov = 45.0f;
    float _aspect;
    float _near = 0.1f;
    float _far = 100.0f;

    bool _dirty = false;
    Mat4f _view;
    Mat4f _proj;
}
