module dard.systems.filesystem.utils;

import std.stdio : File;

// ulong readT(T)(ref File f, ref T p) if (!is(T == class) && !is(T == interface)) {
//     ubyte[T.sizeof]* arr = cast(ubyte[T.sizeof]*)&p;

//     return f.rawRead(*arr).length;
// }

// ulong readData(ref File f, ubyte* data, uint size) {
//     ubyte[] arr = data[0 .. size];

//     return f.rawRead(arr).length;
// }
