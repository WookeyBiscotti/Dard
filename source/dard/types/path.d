module dard.types.path;

import dard.types.string;

alias Path = string;

auto P(string p)() {
    return p;
}
