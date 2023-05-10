module dard.d_wtf.dlgt;

auto wtf_dlgt(T)(T v) if (is(T == class)) {
    return v;
}
