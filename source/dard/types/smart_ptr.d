module dard.types.smart_ptr;

import automem.ref_counted;

alias SharedPtr(T) = RefCounted!T;
