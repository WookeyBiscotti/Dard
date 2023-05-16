module dard.systems.ui.widget;

import dard.systems.ui;
import dard.systems.broker;
import dard.systems.render;
import dard.systems.logger;

import dard.types.math.vector;

import std.math.traits;
import core.lifetime : move;

enum Corner {
    LeftUp,
    LeftDown,
    RightUp,
    RightDown,
    Center,
}

struct WidgetResized {
    Vector2f newSize;
}

class Widget : Transceiver {
    enum DontChange = float.nan;

    mixin ImplTransceiver;

    this(UiSystem system, GroupWidget parent = null) {
        _system = system;
        _broker = ImplTransceiverData(this, system.context.system!Broker);

        if (parent) {
            this.parent(parent);
        }
    }

    ~this() {
        parent(null);
    }

    auto minSize() const {
        return _minSize;
    }

    auto minSize(Vector2f minSize) {
        if (minSize.x.isNaN()) {
            minSize.x = _minSize.x;
        }
        if (minSize.y.isNaN()) {
            minSize.y = _minSize.y;
        }
        _minSize = minSize;

        auto newSize = _size;
        if (newSize.x < _minSize.x) {
            newSize.x = _minSize.x;
        }
        if (newSize.y < _minSize.y) {
            newSize.y = _minSize.y;
        }

        if (newSize != _size) {
            size(newSize);
        }

        return this;
    }

    auto maxSize() const {
        return _maxSize;
    }

    auto maxSize(Vector2f maxSize) {
        if (maxSize.x.isNaN()) {
            maxSize.x = _maxSize.x;
        }
        if (maxSize.y.isNaN()) {
            maxSize.y = _maxSize.y;
        }
        _maxSize = maxSize;

        auto newSize = _size;
        if (newSize.x > _maxSize.x) {
            newSize.x = _maxSize.x;
        }
        if (newSize.y > _maxSize.y) {
            newSize.y = _maxSize.y;
        }

        if (newSize != _size) {
            size(newSize);
        }

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

    Widget size(Vector2f size) {
        if (size.x.isNaN()) {
            size.x = _size.x;
        }
        if (size.y.isNaN()) {
            size.y = _size.y;
        }

        if (size == _size) {
            return this;
        }

        _size = size;
        if (_size.x > _maxSize.x) {
            _maxSize.x = _size.x;
        }
        if (_size.y > _maxSize.y) {
            _maxSize.y = _size.y;
        }
        if (_size.x < _minSize.x) {
            _minSize.x = _size.x;
        }
        if (_size.y < _minSize.y) {
            _minSize.y = _size.y;
        }

        send(WidgetResized(_size));

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
        if (_parent == parent) {
            return this;
        }

        if (_parent && _parent.contains(this)) {
            _parent.removeChild(this);
        }

        _parent = parent;
        if (_parent && !_parent.contains(this)) {
            _parent.addChild(this);
        }

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

    UiSystem system() {
        return _system;
    }

    final Vector2f realPosition() const {
        if (!_parent) {
            return _pos;
        }
        Vector2f pos = _parent.realPosition();
        final switch (_corner) {
        case Corner.LeftUp:
            pos += _pos;
            break;
        case Corner.LeftDown:
            pos += Vector2f(_pos.x, _parent.realSize().y - _pos.y);
            break;
        case Corner.RightUp:
            pos += Vector2f(_parent.realSize().x - _pos.x - _size.x, _pos.y);
            break;
        case Corner.RightDown:
            pos += Vector2f(_parent.realSize().x - _pos.x,
                    _parent.realSize().y - _pos.y - _size.y);
            break;
        case Corner.Center:
            pos += Vector2f(0.5f * (_parent.realSize()
                    .x - _size.x) + _pos.x, 0.5f * (_parent.realSize().y - _size.y) + _pos.y);
            break;
        }

        return pos;
    }

    final Vector2f realSize() const {
        return _size;
    }

    void draw() {
    }

    Widget onPressed(ref const UIMouseButtonPressed) {
        return null;
    }

    Widget onReleased(ref const UIMouseButtonReleased) {
        return null;
    }

    Widget onHovered(ref const UIHovered) {
        return null;
    }

    Widget onUnhovered(ref const UIUnhovered) {
        return null;
    }

    Widget onMouseMove(ref const UIMouseMove) {
        return null;
    }

    Widget widgetUnderPoint(Vector2f p) {
        return this;
    }

    ref const(String) name() const {
        return _name;
    }

    auto name(String name) {
        move(name, _name);

        return this;
    }

    Widget findChild(in String name) const {
        if (name == _name) {
            return cast(Widget) this;
        }

        return null;
    }
    
protected:
    UiSystem _system;

    GroupWidget _parent;

    Corner _corner = Corner.LeftUp;

    Vector2f _minSize = [0, 0];
    Vector2f _maxSize = [float.max, float.max];

    Vector2f _size = [0, 0];
    Vector2f _pos = [0, 0];

    bool _isPart = false;
    Vector2f _partSize = [0, 0];
    Vector2f _partPos = [0, 0];

    String _name;
}
