module dard.types.string;

public import dlib.text.str : String;

auto Str(string s)() {
    return String(s);
}
