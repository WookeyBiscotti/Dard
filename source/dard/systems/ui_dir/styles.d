module dard.systems.ui_dir.styles;

import dard.types.color;

import std.sumtype;

alias StyleValue = SumType!(float, int, bool, Color);

enum Styles {
    EMPTY_WIDGET_BACKGROUND_COLOR,
    BACKGROUND_COLOR,
}

template defStyleVal(Styles s) {
    static if (s == Styles.EMPTY_WIDGET_BACKGROUND_COLOR) {
        enum defStyleVal = Color(255, 255, 255, 255);
    } else static if (s == Styles.BACKGROUND_COLOR) {
        enum defStyleVal = Color(0, 0, 0, 255);
    }
}
