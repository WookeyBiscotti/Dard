module dard.utils.const_cast;

import std.traits;

ref auto const_cast(T)(ref T v) {
    alias unConst = Unconst!T;
    alias Ptr = unConst*;
    return *(cast(Ptr)&v);
}
