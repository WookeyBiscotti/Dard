module dard.components.transform;

import dlib.math.matrix;
import dlib.math.transformation;
import dlib.math.quaternion;
import dlib.math.utils;

import std.math.constants;

import dard.types.math.vector;
import dard.base.component;

class Transform : Component {
public:
    this(Entity e) {
        super(e);
    }

    auto move(in Vector3f p) {
        _position += p;
        _dirty = true;

        return this;
    }

    auto move(string c)(float l) {
        mixin("_position." ~ c ~ " += l;");
        _dirty = true;

        return this;
    }

    auto rotate(in Quaternionf r) {
        _rotation *= r;
        _dirty = true;

        return this;
    }

    auto rotate(string axis)(float a) {
        mixin("_rotation *= rotationQuaternion!float(Axis." ~ axis ~ ", a);");
        _dirty = true;

        return this;
    }

    auto scale(in Vector3f s) {
        _scale *= s;
        _dirty = true;

        return this;
    }

    auto scale(string c)(float s) {
        mixin("_scale." ~ c ~ " += s;");
        _dirty = true;

        return this;
    }

    auto transformation() {
        if (_dirty) {
            _toWorldSpaceMat = translationMatrix(_position) * _rotation.toMatrix4x4() * scaleMatrix(
                    _scale);

            _dirty = false;
        }

        return _toWorldSpaceMat;
    }

    inout ref auto position() {
        return _position;
    }

private:
    Vector3f _position = [0, 0, 0];
    Vector3f _scale = [1, 1, 1];
    Quaternionf _rotation = Quaternionf.identity();

    bool _dirty = true;
    mat4 _toWorldSpaceMat;
}

unittest {
    mat4 m = mat4.identity() * translationMatrix(Vector3f(1, 1, 1));
    Vector3f p = Vector3f(1, 2, 3) * m;
    assert(p == Vector3f(2, 3, 4));
}

unittest {
    auto q = rotationQuaternion!float(Axis.x, PI / 2);
    auto v1 = Vector3f(0, 1, 0);
    auto v2 = q.rotate(v1);
    auto v3 = Vector3f(0, 0, 1);

    assert((v2 - v3).length() < 0.01);

    auto q2 = q * q;
    v1 = Vector3f(0, -2, 5);
    auto v4 = q2.rotate(v1);

    assert((v1 + v4).length() < 0.01);

    assert(rotationQuaternion!float(Axis.x, 0) == Quaternionf.identity());
}

unittest {
    auto t = new Transform(null);
    auto v = Vector3f(0, 1, 2);

    t.scale(Vector3f(1, 2, 3));
    auto nv = v * t.transformation();
    assert((nv - Vector3f(0, 2, 6)).length() < 0.001);

    t.rotate!"x"(PI_2);
    nv = v * t.transformation();
    assert((nv - Vector3f(0, -6, 2)).length() < 0.001);

    t.move(Vector3f(100, 10, 1));
    nv = v * t.transformation();
    assert((nv - Vector3f(100, 4, 3)).length() < 0.001);
}
