module dard.types.smart_ptr;

import automem.ref_counted;
import automem.unique;

alias SharedPtr(T) = RefCounted!T;
alias Unique(T) = automem.unique.Unique!T;
