module dard.systems.asset.binary_data;

import dard.systems.logger;
import dard.types.string;
import dard.types.memory;
import std.stdio;

struct BinaryData {
    this(File file) {
        _data = NewArray!(ubyte)(file.size());
        file.rawRead(_data);
        _dataOwned = true;
    }

    @disable this(this);

    this(ubyte[] data) {
        _data = data;
    }

    ~this() {
        if (_dataOwned) {
            Delete!ubyte(_data);
        }
    }

    inout auto data() {
        return _data;
    }

    auto to(T : U[], U)() {
        return cast(T) _data;
    }

private:
    bool _dataOwned;
    ubyte[] _data;
}
