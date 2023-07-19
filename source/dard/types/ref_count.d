module dard.types.ref_count;

// import std.typecons;
public import dard.types.memory;

// alias RC(T) = RefCounted!T;
alias RC(T) = SharedPtr!T;
