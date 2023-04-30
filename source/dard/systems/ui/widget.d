module dard.systems.ui.widget;

import dard.systems.ui;
import dard.systems.broker;
import dard.systems.render;
import dard.systems.logger;

import dard.types.math.vector;

enum Corner {
    LeftUp,
    LeftDown,
    RightUp,
    RightDown,
}

import std.random;

auto rnd = Random(42);

class Widget : Transceiver {
    mixin ImplTransceiver;

    this(UiSystem system, GroupWidget parent = null) {
        _system = system;
        _broker = system.context.system!Broker;

        this.parent(parent);
    }

    auto minSize() const {
        return _minSize;
    }

    auto minSize(Vector2f minSize) {
        _minSize = minSize;
        if (_size.x < _minSize.x) {
            _size.x = _minSize.x;
        }
        if (_size.y < _minSize.y) {
            _size.y = _minSize.y;
        }

        return this;
    }

    auto maxSize() const {
        return _maxSize;
    }

    auto maxSize(Vector2f maxSize) {
        _maxSize = maxSize;
        if (_size.x > _maxSize.x) {
            _size.x = _maxSize.x;
        }
        if (_size.y > _maxSize.y) {
            _size.y = _maxSize.y;
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

    auto size(Vector2f size) {
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
            pos += Vector2f(_parent.size().x - _pos.x - _size.x, _pos.y);
            break;
        case Corner.RightDown:
            pos += Vector2f(_parent.size().x - _pos.x, _parent.size().y - _pos.y - _size.y);
            break;
        }

        return pos;
    }

    final Vector2f realSize() const {
        return _size;
    }

    void draw() {
        auto nvg = system().context.system!Render.nvg();
        nvg.nvgSave();
        scope (exit) {
            nvg.nvgRestore();
        }

        auto p = realPosition();
        auto s = realSize();
        nvg.nvgSave();
        nvg.nvgBeginPath();
        nvg.nvgRect(p.x, p.y, s.x, s.y);
        nvg.nvgFillColor(cast(NVGcolor) defStyleVal!(Styles.EMPTY_WIDGET_BACKGROUND_COLOR));
        nvg.nvgFill();
    }

    Widget onPressed(const ref UIMouseButtonPressed) {
        return null;
    }

    Widget onReleased(const ref UIMouseButtonReleased) {
        return null;
    }

    UiSystem system() {
        return _system;
    }

private:
    UiSystem _system;

    GroupWidget _parent;

    Corner _corner = Corner.LeftUp;

    Vector2f _minSize = [0, 0];
    Vector2f _maxSize = [0, 0];

    Vector2f _size = [0, 0];
    Vector2f _pos = [0, 0];

    bool _isPart = false;
    Vector2f _partSize = [0, 0];
    Vector2f _partPos = [0, 0];
}
