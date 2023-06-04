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
    static immutable FRONT = Vector3f(1, 0, 0);

    this(Entity e) {
        super(e);

        update();

        subscribe!TransformUpdated(e.transform, _ => update());
    }

    ~this() {
        if (auto rend = entity.context.system!Render) {
            if (rend.mainCamera() == this) {
                rend.mainCamera(null);
            }
        }
    }

    inout ref auto view() {
        return _view;
    }

    inout ref auto proj() {
        return _proj;
    }

    auto fov() {
        return _fov;
    }

    void fov(float fov) {
        _fov = fov;

        _proj = perspectiveMatrix(_fov, _aspect, _near, _far);
    }

    // auto pitch() {
    //     return _euler.x;
    // }

    // void pitchAdd(float v) {
    //     _euler.x += v;

    //     update();
    // }

private:
    void update() {
        auto eye = entity.transform.position + entity.transform.rotation.rotate(FRONT);
        // auto eye = entity.transform.position + FRONT;

        _view = lookAtMatrix!float(entity.transform.position, eye, UP);
        // _view = lookAtMatrix!float(entity.transform.position, eye,
        //         entity.transform.rotation.rotate(UP));

        _aspect = entity.context.system!Render.aspect();
        _proj = perspectiveMatrix(_fov, _aspect, _near, _far);
    }

    // bool _shooterType;

    // Vector3f _eye;
    // Vector3f _euler = [0, 0, 0];

    float _fov = 45.0f;
    float _aspect;
    float _near = 0.1f;
    float _far = 100.0f;

    bool _dirty = false;
    Mat4f _view;
    Mat4f _proj;
}
