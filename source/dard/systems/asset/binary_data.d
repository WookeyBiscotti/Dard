module dard.systems.asset.binary_data;

import dard.systems.logger;
import dard.types.string;
import dard.types.memory;
import dard.types.hash_map;
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

    inout auto data(T)() {
        return cast(T[]) _data;
    }

    auto to(T : U[], U)() {
        return cast(T) _data;
    }

    HashMap3!(String, String) meta;
private:
    bool _dataOwned;
    ubyte[] _data;
}

void readT(T)(ref const(ubyte)* data, ref T p)
if (!is(T == class) && !is(T == interface)) {
    p = *cast(T*) data;
    data += T.sizeof;
}

void readData(ref const(ubyte)* data, ubyte* outData, uint size) {
    import core.stdc.string;

    memcpy(outData, data, size);
    data += size;
}
