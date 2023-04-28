module dard.systems.ui_dir.widget;

import dard.systems.ui;
import dard.systems.broker;

import dard.types.math.vector;

import dard.systems.ui_dir.group_widget;

enum Corner {
    LeftUp,
    LeftDown,
    RightUp,
    RightDown,
}

class Widget : Transceiver {
    mixin ImplTransceiver;

    this(UiSystem system, GroupWidget parent = null) {
        _system = system;
        _broker = system.context.system!Broker;
    }

    auto minSize() const {
        return _minSize;
    }

    auto minSize(Vector2f minSize) {
        _minSize = minSize;

        return this;
    }

    auto maxSize() const {
        return _maxSize;
    }

    auto maxSize(Vector2f maxSize) {
        _maxSize = maxSize;

        return this;
    }

    auto position() const {
        return _pos;
    }

    auto position(Vector2f position) {
        _pos = position;

        return this;
    }

    auto size() const {
        return _size;
    }

    auto size(Vector2f size) {
        _size = size;

        return this;
    }

    auto partSize() const {
        return _partSize;
    }

    auto partSize(Vector2f partSize) {
        _partSize = partSize;

        return this;
    }

    auto partPosition() const {
        return _partPos;
    }

    auto partPosition(Vector2f partPos) {
        _partPos = partPos;

        return this;
    }

    auto parent() const {
        return _parent;
    }

    auto parent(GroupWidget parent) {
        _parent = parent;

        return this;
    }

    auto part() const {
        return _isPart;
    }

    auto part(bool isPart) {
        _isPart = isPart;

        return this;
    }

    auto corner() const {
        return _corner;
    }

    auto corner(Corner corner) {
        _corner = corner;

        return this;
    }

    final Vector2f realPosition() const {
        if (!_parent) {
            return _pos;
        }
        Vector2f pos = _parent.realPosition();
        final switch (_corner) {
        case Corner.LeftUp:
            // pos += Vector2f();
            break;
        case Corner.LeftDown:
            pos += Vector2f(_pos.x, _parent.size().y - _pos.y);
            break;
        case Corner.RightUp:
            pos += Vector2f(_parent.size().x - _pos.x, _pos.y);
            break;
        case Corner.RightDown:
            pos += Vector2f(_parent.size().x - _pos.x, _parent.size().y - _pos.y);
            break;
        }

        return pos;
    }

private:
    UiSystem _system;

    GroupWidget _parent;

    Corner _corner = Corner.LeftUp;

    Vector2f _minSize;
    Vector2f _maxSize;

    Vector2f _size;
    Vector2f _pos;

    bool _isPart;
    Vector2f _partSize;
    Vector2f _partPos;
}
