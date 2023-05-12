module dard.systems.ui.layout_group;

import dard.systems.ui;
import dard.systems.logger;
import dard.types.vector;
import dard.types.small_vector;
import dard.types.memory;

import std.algorithm.mutation;

class LayoutGroup : SimpleGroupWidget {
    enum Layout {
        VERICAL,
        HORIZONTAL,
    }

    enum GravityV {
        NONE,
        UP,
        DOWN,
    }

    enum GravityH {
        NONE,
        LEFT,
        RIGHT,
    }

    this(UiSystem system, GroupWidget parent = null) {
        super(system, parent);
    }

    override void addChild(Widget c) {
        if (!contains(c)) {
            _childs ~= c;

            subscribe!WidgetResized(c, (ref WidgetResized e) {
                updateChildsPositionSize();
            });
        }

        if (c.parent() != this) {
            c.parent(this);
        }

        updateChildsPositionSize();
    }

    override Widget removeChild(Widget c) {
        for (auto i = 0; i != _childs.length; ++i) {
            if (_childs[i] == c) {
                move(_childs[i], _childs[$ - 1]);
                _childs.popBack();

                unsubscribe!WidgetResized(c);

                updateChildsPositionSize();

                return c;
            }
        }

        return null;
    }

    override Widget size(Vector2f newSize) {
        auto saved = realSize();
        auto res = super.size(newSize);
        if (realSize() != saved) {
            updateChildsPositionSize();
        }

        return res;
    }

    LayoutGroup distanceBetweenChildren(float distanceBetweenChildren) {
        _distanceBetweenChildren = distanceBetweenChildren;

        return this;
    }

    // LayoutGroup
    // Vector2f _indentTopLeft = [0, 0];
    // Vector2f _indentBotRight = [0, 0];

private:
    void updateChildsPositionSize() {
        if (_recursion) {
            return;
        }

        _recursion = true;
        scope (exit) {
            _recursion = false;
        }

        enum EPSILON = 0.01f;

        if (_childs.empty()) {
            return;
        }

        alias CT = ref float function(ref Vector2f) pure nothrow @nogc @safe;

        auto stacker = delegate void(CT C, int gravityDir) {
            foreach (ref c; _childs) {
                C(c._size) = 0;
            }

            auto count = _childs.length();
            const freeSpace = C(_size) - ((count > 1
                    ? count - 1 : 0) * _distanceBetweenChildren + C(
                    _indentBotRight) + C(_indentTopLeft));

            float w = freeSpace;
            auto dw = w / count;
            foreach (ref c; _childs) {
                if (C(c._minSize) > dw) {
                    w -= C(c._minSize);
                    --count;
                    if (count != 0) {
                        dw = w / count;
                    }
                }
            }

            if (w >= EPSILON) {
                foreach (ref c; _childs) {
                    w -= (C(c._maxSize) - C(c._minSize));
                    if (w < EPSILON) {
                        break;
                    }
                }
                if (w > EPSILON) {
                    // места много и мы не в состоянии его заполнить
                    w = freeSpace;
                    foreach (ref c; _childs) {
                        C(c._size) = C(c._maxSize);
                        w -= C(c._size);
                    }

                    dw = w / _childs.length();

                    w = C(_indentTopLeft);
                    foreach (ref c; _childs) {
                        Vector2f pos = [0, 0];
                        C(pos) = w + dw * (1 + gravityDir) / 2;
                        c.position(pos);
                        w += C(c._size) + dw;
                        if (&c != &_childs[$ - 1]) {
                            w += _distanceBetweenChildren;
                        }
                    }

                    return;

                } else // хватает места и мы можем полностью его заполнить
                    while (w < EPSILON) {
                        w = freeSpace;

                        foreach (ref c; _childs) {
                            C(c._size) = C(c._minSize);
                            w -= C(c._minSize);
                        }
                        if (w <= EPSILON) {
                            break;
                        }

                        auto minSize = float.max;
                        SmallVector!(Widget, 16) elms;
                        foreach (ref c; _childs) {
                            elms ~= c;
                            if (C(c._size) < minSize) {
                                minSize = C(c._size);
                            }
                        }

                        while (!!elms.length() && w >= EPSILON && minSize != float.max) {
                            dw = w / elms.length();

                            auto newMinSize = float.max;
                            log(elms.length);
                            foreach (i, ref e; elms) {
                                log(e);
                                if (C(e._maxSize) <= minSize + dw) {
                                    w -= C(e._maxSize) - C(e._size);
                                    C(e._size) = C(e._maxSize);

                                    elms[i] = elms[$ - 1];
                                    elms.removeBack(1);

                                    break;
                                } else if (C(e._size) < dw + minSize) {
                                    w -= (dw + minSize - C(e._size));
                                    C(e._size) = dw + minSize;
                                }
                                if (C(e._size) < newMinSize) {
                                    newMinSize = C(e._size);
                                }

                                if (i + 1 == elms.length) {
                                    minSize = newMinSize;
                                }
                            }
                        }

                        break;
                    }
            } else {
                // все виджеты не помещаются в выделенное место
                warning("We cant put all child widget in parent winget: not enough space");
                foreach (ref c; _childs) {
                    C(c._size) = C(c._minSize);
                }
            }
            foreach (ref c; _childs) {
                auto saved = c._size;
                c._size = Vector2f(0, 0);
                c.size(saved);
            }

            w = C(_indentTopLeft);
            foreach (ref c; _childs) {
                Vector2f pos = [0, 0];
                C(pos) = w;
                c.position(pos);
                w += C(c._size);
                w += _distanceBetweenChildren;
            }

        };

        auto placeOrthogonal = (CT C, int gravityDir /*[-1,1]*/ ) {
            const auto freeSpace = C(_size) - (C(_indentBotRight) + C(_indentTopLeft));

            foreach (ref c; _childs) {
                if (freeSpace >= C(c._minSize) && freeSpace <= C(c._maxSize)) {
                    C(c._size) = freeSpace;
                } else if (freeSpace < C(c._minSize)) {
                    C(c._size) = C(c._minSize);
                } else if (freeSpace > C(c._maxSize)) {
                    C(c._size) = C(c._maxSize);
                    Vector2f pos = c.position();
                    auto dw = freeSpace - C(c._maxSize);
                    C(pos) = dw * (1 + gravityDir) / 2;
                    c.position(pos);
                } else {
                    warning("We cant reach this");
                }
                Vector2f pos = c.position();
                C(pos) += C(_indentTopLeft);
                c.position(pos);
                // c.onPositionChange();
            }
        };

        static int gravityToDir(G)(G g) {
            auto v = cast(int) g;
            if (v == 0) {
                return 0;
            } else if (v == 1) {
                return -1;
            } else {
                return 1;
            }
        }

        if (_layout == Layout.HORIZONTAL) {
            stacker(function ref float(ref Vector2f v) { return v.x; }, gravityToDir(_gravityH));
            placeOrthogonal(function ref float(ref Vector2f v) { return v.y; },
                    gravityToDir(_gravityV));
        } else {
            stacker(function ref float(ref Vector2f v) { return v.y; }, gravityToDir(_gravityV));
            placeOrthogonal(function ref float(ref Vector2f v) { return v.x; },
                    gravityToDir(_gravityH));
        }

    }

    bool _recursion = false;

    Layout _layout;
    GravityV _gravityV;
    GravityH _gravityH;

    float _distanceBetweenChildren = 0;
    Vector2f _indentTopLeft = [0, 0];
    Vector2f _indentBotRight = [0, 0];
}
