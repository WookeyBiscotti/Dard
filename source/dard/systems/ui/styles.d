module dard.systems.ui.styles;

import dard.types.color;

import std.sumtype;

alias StyleValue = SumType!(float, int, bool, Color, string);

enum Styles {
    WIDGET_BACKGROUND_COLOR,
    WIDGET_UP_COLOR,
    WIDGET_DOWN_COLOR,
    WIDGET_GRADIENT,
    BACKGROUND_COLOR,
    DEFAULT_FONT_SIZE,
    DEFAULT_FONT,
    DEFAULT_FONT_COLOR,
    DEFAULT_WIDGET_HEIGHT,
}

template defStyleVal(Styles s) {
    static if (s == Styles.WIDGET_BACKGROUND_COLOR) {
        enum defStyleVal = Color(40, 40, 40);
    } else static if (s == Styles.BACKGROUND_COLOR) {
        enum defStyleVal = Color(15, 15, 15);
    } else static if (s == Styles.DEFAULT_FONT_SIZE) {
        enum defStyleVal = 15.0f;
    } else static if (s == Styles.DEFAULT_FONT) {
        enum defStyleVal = "__default__";
    } else static if (s == Styles.DEFAULT_FONT_COLOR) {
        enum defStyleVal = Color(255, 255, 255);
    } else static if (s == Styles.WIDGET_GRADIENT) {
        enum defStyleVal = 0.2f;
    } else static if (s == Styles.WIDGET_UP_COLOR) {
        enum defStyleVal = Color(60, 60, 60);
    } else static if (s == Styles.DEFAULT_WIDGET_HEIGHT) {
        enum defStyleVal = 20.0f;
    } else static if (s == Styles.WIDGET_DOWN_COLOR) {
        enum defStyleVal = Color(40, 40, 40);
    }
}
