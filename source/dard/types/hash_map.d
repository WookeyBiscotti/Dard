module dard.types.hash_map;

public import ikod.containers.hashmap : HashMap;

alias HashSet(K) = HashMap!(K, void*);

// TODO Сделать свою хеш мапу с nogc, текущие известные решения - отвратительны

ref V getOrDefault(K, V)(ref V[K] h, K k) {
    auto ret = k in h;
    if (ret) {
        return *ret;
    }
    h[k] = V.init;
    return *(k in h);
}

unittest {
    string[int] h;
    getOrDefault(h, 4);

    assert(h[4] == "");
}
