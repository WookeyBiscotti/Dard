module dard.systems.ui.text_panel;

import dard.systems.ui;
import dard.systems.render;
import dard.systems.asset;

class TextPanel : Widget {
    this(UiSystem system, GroupWidget parent = null, in String label = Str!"") {
        super(system, parent);

        minSize(Vector2f(0, defStyleVal!(Styles.DEFAULT_WIDGET_HEIGHT)));

        auto nvg = system.context.system!Render.nvg();

        _text.text(String(label));
        _text.nvgFont(nvgFindFont(nvg, defStyleVal!(Styles.DEFAULT_FONT)));
        _text.fontColor = defStyleVal!(Styles.DEFAULT_FONT_COLOR);
        _text.fontSize(defStyleVal!(Styles.DEFAULT_FONT_SIZE));
    }

    override void draw() {
        auto nvg = system().context.system!Render.nvg();

        const p = realPosition();
        const s = realSize();

        _text.p.x = p.x + 0.5f * (s.x - _text.size(nvg).x);
        _text.p.y = p.y + 0.5f * (s.y - _text.size(nvg).y) + _text.size(nvg).y;

        _text.drawShadow(nvg, Color(0, 0, 0), 3, Vector2f(0, 2));
        _text.draw(nvg);
    }

private:
    Text _text;
}
