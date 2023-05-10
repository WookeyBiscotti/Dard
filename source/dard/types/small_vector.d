module dard.types.small_vector;

import dlib.container.array : Array;

alias SmallVector(T, size_t N) = Array!(T, N);
