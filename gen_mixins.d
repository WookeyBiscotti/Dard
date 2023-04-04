// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/format/internal/write.d(1993,40)
(in ref int a) => a

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_0LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_2LU;

// expansion at ../../.dub/packages/memutils-1.0.9/memutils/source/memutils/utils.d(175,2)

	static if (ALLOC.stringof != "PoolStack") {
		ReturnType!(getAllocator!(ALLOC.ident)) thisAllocator(bool is_freeing = false) {
			return getAllocator!(ALLOC.ident)(is_freeing);
		}
	}
	else {
		ReturnType!(ALLOC.top) function() thisAllocator = &ALLOC.top;
	}
	

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/format/spec.d(170,13)
private ubyte _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf;@property bool flDash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 1U) != 0;}
@property void flDash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 1U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))1U);}
@property bool flZero() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 2U) != 0;}
@property void flZero(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 2U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))2U);}
@property bool flSpace() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 4U) != 0;}
@property void flSpace(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 4U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))4U);}
@property bool flPlus() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 8U) != 0;}
@property void flPlus(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 8U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))8U);}
@property bool flHash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 16U) != 0;}
@property void flHash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 16U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))16U);}
@property bool flEqual() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 32U) != 0;}
@property void flEqual(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 32U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))32U);}
@property bool flSeparator() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 64U) != 0;}
@property void flSeparator(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 64U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))64U);}

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(449,16)
cast(T)a < cast(T) b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(449,16)
cast(T)a < cast(T) b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int data = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int count = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias data = _0LU;alias _1LU = Identity!(field[1LU]);alias count = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7015,17)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7032,21)

    case '\u0000':..case '\u0008':case '\u000E':..case '\u001F':case '\u007F':..
    case '\u0084':case '\u0086':..case '\u009F': case '\u0009':..case '\u000C': case '\u0085':

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7041,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7045,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7049,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7053,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7058,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7065,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7069,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7077,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7091,13)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7015,17)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7032,21)

    case '\u0000':..case '\u0008':case '\u000E':..case '\u001F':case '\u007F':..
    case '\u0084':case '\u0086':..case '\u009F': case '\u0009':..case '\u000C': case '\u0085':

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7041,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7045,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7049,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7053,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7058,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7065,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7069,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7077,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/uni/package.d(7091,13)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/array/arrayassign.d(90,5)

        import core.internal.traits : hasElaborateCopyConstructor, Unqual;
        import core.lifetime : copyEmplace;
        import core.stdc.string : memcpy;

        void[] vFrom = (cast(void*) from.ptr)[0 .. from.length];
        void[] vTo = (cast(void*) to.ptr)[0 .. to.length];
        enum elemSize = T.sizeof;

        enforceRawArraysConformable("copy", elemSize, vFrom, vTo, true);

        void[elemSize] tmp = void;

        
        static if (hasElaborateCopyConstructor!T)
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            copyEmplace(from[i], dst);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            
        if (vFrom.ptr < vTo.ptr && vTo.ptr < vFrom.ptr + elemSize * vFrom.length)
            foreach_reverse (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }

        else
            foreach (i, ref dst; to)
            {

            memcpy(&tmp, cast(void*) &dst, elemSize);
            memcpy(cast(void*) &dst, cast(void*) &from[i], elemSize);
            auto elem = cast(Unqual!T*) &tmp;
            destroy(*elem);
        }


        return to;
    

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);alias _2LU = Identity!(field[2LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);alias _2LU = Identity!(field[2LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(728,22)
T x; T y; T z; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(731,22)
T r; T g; T b; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(734,22)
T s; T t; T p; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(728,22)
T x; T y; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(731,22)
T r; T g; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(734,22)
T s; T t; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(728,22)
T x; T y; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(731,22)
T r; T g; 

// expansion at ../../.dub/packages/dlib-1.1.0/dlib/dlib/math/vector.d(734,22)
T s; T t; 

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_0LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_2LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_3LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/variant.d(90,17)
T _field_4LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/internal/memory.d(40,18)
onOutOfMemoryError();

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/internal/memory.d(32,18)
onOutOfMemoryError();

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/time.d(944,9)
return Duration(_hnsecs / value);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/time.d(697,29)
_hnsecs - rhs._hnsecs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/stdio.d(5303,38)
core.stdc.stdio.stdout

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/atomic.d(576,9)
*cast(T*)&val-=mod

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int key = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int value = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias key = _0LU;alias _1LU = Identity!(field[1LU]);alias value = _1LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.key

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(126,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(127,20)
a.value

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(475,37)
a < b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(478,32)
a < b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(475,37)
a > b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(478,32)
a > b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(475,37)
a < b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(478,32)
a < b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(475,37)
a > b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(478,32)
a > b

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(219,13)
alias a = __a ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(220,13)
alias b = __b ;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/functional.d(221,20)
a == b

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at source/dard/types/nogc_delegate.d(101,5)
auto capture = Tuple!(Ref!(typeof(a)), "a", typeof(b)*, "b", typeof(c), "c", )(Ref!(typeof(a))(&a), &b, c, );

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int a = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int b = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(467,13)
enum int c = 0;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias a = _0LU;alias _1LU = Identity!(field[1LU]);alias b = _1LU;alias _2LU = Identity!(field[2LU]);alias c = _2LU;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(646,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);alias _2LU = Identity!(field[2LU]);

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(543,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/core/internal/hash.d(551,5)

    enum bool isChained = is(typeof(seed) : size_t);
    static if (!isChained) enum size_t seed = 0;
    static if (hasCallableToHash!(typeof(val))) //CTFE depends on toHash()
    {
        static if (!__traits(isSame, typeof(val), __traits(parent, val.toHash))
            && is(typeof(val is null)))
        {
            static if (isChained)
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))), seed);
            else
                return hashOf(__traits(getMember, val, __traits(getAliasThis, typeof(val))));
        }
        else
        {
            static if (isChained)
                return hashOf(cast(size_t) val.toHash(), seed);
            else
                return val.toHash();
        }
    }
    else
    {
        import core.internal.convert : toUbyte;
        static if (__traits(hasMember, T, "toHash") && is(typeof(T.toHash) == function))
        {
            // TODO: in the future maybe this should be changed to a static
            // assert(0), because if there's a `toHash` the programmer probably
            // expected it to be called and a compilation failure here will
            // expose a bug in his code.
            //   In the future we also might want to disallow non-const toHash
            // altogether.
            pragma(msg, "Warning: struct "~__traits(identifier, T)
                ~" has method toHash, however it cannot be called with "
                ~typeof(val).stringof~" this.");
            static if (__traits(compiles, __traits(getLocation, T.toHash)))
            {
                enum file = __traits(getLocation, T.toHash)[0];
                enum line = __traits(getLocation, T.toHash)[1].stringof;
                pragma(msg, "  ",__traits(identifier, T),".toHash defined here: ",file,"(",line,")");
            }
        }

        static if (T.tupleof.length == 0)
        {
            return seed;
        }
        else static if ((is(T == struct) && !canBitwiseHash!T) || T.tupleof.length == 1)
        {
            static if (isChained) size_t h = seed;
            static foreach (i, F; typeof(val.tupleof))
            {
                static if (__traits(isStaticArray, F))
                {
                    static if (i == 0 && !isChained) size_t h = 0;
                    static if (F.sizeof > 0 && canBitwiseHash!F)
                        // May use smallBytesHash instead of bytesHash.
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    else
                        // We can avoid the "double hashing" the top-level version uses
                        // for consistency with TypeInfo.getHash.
                        foreach (ref e; val.tupleof[i])
                            h = hashOf(e, h);
                }
                else static if (is(F == struct) || is(F == union))
                {
                    static if (hasCallableToHash!F)
                    {
                        static if (!__traits(isSame, F, __traits(parent, val.tupleof[i].toHash))
                            && is(typeof(val.tupleof[i] is null)))
                        {
                            static if (i == 0 && !isChained)
                                size_t h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)));
                            else
                                h = hashOf(__traits(getMember, val.tupleof[i], __traits(getAliasThis, F)), h);
                        }
                        else
                        {
                            static if (i == 0 && !isChained)
                                size_t h = val.tupleof[i].toHash();
                            else
                                h = hashOf(cast(size_t) val.tupleof[i].toHash(), h);
                        }
                    }
                    else static if (F.tupleof.length == 1)
                    {
                        // Handle the single member case separately to avoid unnecessarily using bytesHash.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i].tupleof[0]);
                        else
                            h = hashOf(val.tupleof[i].tupleof[0], h);
                    }
                    else static if (canBitwiseHash!F)
                    {
                        // May use smallBytesHash instead of bytesHash.
                        static if (i == 0 && !isChained) size_t h = 0;
                        h = bytesHashWithExactSizeAndAlignment!F(toUbyte(val.tupleof[i]), h);
                    }
                    else
                    {
                        // Nothing special happening.
                        static if (i == 0 && !isChained)
                            size_t h = hashOf(val.tupleof[i]);
                        else
                            h = hashOf(val.tupleof[i], h);
                    }
                }
                else
                {
                    // Nothing special happening.
                    static if (i == 0 && !isChained)
                        size_t h = hashOf(val.tupleof[i]);
                    else
                        h = hashOf(val.tupleof[i], h);
                }
            }
            return h;
        }
        else static if (is(typeof(toUbyte(val)) == const(ubyte)[]))//CTFE ready for structs without reference fields
        {
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(toUbyte(val), seed);
        }
        else // CTFE unsupported
        {
            assert(!__ctfe, "unable to compute hash of "~T.stringof~" at compile time");
            const(ubyte)[] bytes = (() @trusted => (cast(const(ubyte)*)&val)[0 .. T.sizeof])();
            // Not using bytesHashWithExactSizeAndAlignment here because
            // the result may differ from typeid(T).hashOf(&val).
            return bytesHashAlignedBy!T(bytes, seed);
        }
    }

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs == rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at /home/alex/.local/share/code-d/bin/compilers/ldc-1.32.0/bin/../import/std/typecons.d(539,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

