module dard.systems.asset.binary_data;

import dard.systems.logger;
import dard.types.string;

struct BinaryData {
    this(String filename) {
        import std.file;

        try {
            data = read(filename);
        } catch (FileException e) {
            warning("Error while loading file: " ~ e.toString());
        }
    }

    this(ubyte[] d) {
        data = d;
    }

    auto to(T : U[], U)() {
        return cast(T) data;
    }

    const void[] data = null;
}