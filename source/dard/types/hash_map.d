module dard.types.hash_map;

public import ikod.containers.hashmap : HashMap;

alias HashSet(K) = HashMap!(K, void*);

ref V getOrDefault(K, V)(ref HashMap!(K, V) h, K k) {
    auto ret = k in h;
    if (ret) {
        return *ret;
    }
    h[k] = V.init;
    return *(k in h);
}

unittest {
    HashMap!(int, string) h;
    getOrDefault(h, 4);

    assert(h[4] == "");
}
