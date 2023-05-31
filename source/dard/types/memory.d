module dard.types.memory;

import automem.ref_counted;

// import automem.unique;

import dard.types.unique;
import dard.utils.static_cast;

import std.experimental.allocator.mallocator : Mallocator;
import std.experimental.allocator.typed;

alias SharedPtr(T) = RefCounted!T;
public auto makeShared(T, Args...)(Args args) {
    return RefCounted!T.construct(args);
}

alias UniquePtr(T) = Unique!(T, Mallocator);
public auto makeUnique(T, Args...)(Args args) {
    return UniquePtr!T.construct(args);
}

public auto makeUniqueFromPtr(T)(T p) {
    UniquePtr!T up;
    up.grab(p);

    return up;
}

import core.stdc.stdlib : malloc, free;
import core.lifetime : emplace;

private alias MyAllocator = TypedAllocator!(Mallocator, AllocFlag.immutableShared);
private __gshared MyAllocator al;

auto New(T, Args...)(Args args) {
    return al.make!(T)(args);
}

auto Delete(T)(T* ptr) {
    al.dispose!T(ptr);
}

auto Delete(T)(T ptr) if (is(T == class) || is(T == interface)) {
    al.dispose!T(ptr);
}

auto NewArray(T, Args...)(size_t len) {
    return al.makeArray!T(len);
}

auto Delete(T)(T[] ptr) {
    al.dispose(ptr);
}

// private struct Counter {
//     uint shared_;
//     uint weak;
// }

// struct SharedPtr2(T) if (is(T == class)) {
// private:
//     struct Data(T) {
//         Counter counter;
//         void* ptr;
//         T get() {
//             return cast(T) ptr;
//         }
//     }

//     Data!T* _data;

//     this(Args...)(Args args) {

//     }

// public:

// }

// import std.traits;
// import core.lifetime;
// import std.experimental.allocator.mallocator;

// package struct RefCountSharedData {
//     size_t shared_;
//     size_t weak;
// }

// struct PtrData(T) {
//     this(TT)(const ref PtrData o) if (is(T == TT) || is(T : TT)) {
//         d = o.d;
//         p = o.p;
//     }

//     RefCountSharedData* d;
//     T* p;
// }

// // template<class T>
// // class SharedPtr {
// // 	template<class TT>
// // 	friend class SharedPtr;

// // 	template<class TT>
// // 	friend class WeakPtr;

// // 	template<class TT>
// // 	friend class EnableSharedFromThis;

// //   public:
// // 	template<class... Args>
// // 	static SharedPtr make(Args&&... args) noexcept {
// // 		SharedPtr sp;
// // 		auto p = std::launder<detail::RefCountSharedDataAnd<T>>(reinterpret_cast<detail::RefCountSharedDataAnd<T>*>(
// // 		    std::aligned_alloc(alignof(detail::RefCountSharedDataAnd<T>), sizeof(detail::RefCountSharedDataAnd<T>))));
// // 		sp._pd.d = &p->contersBlock;
// // 		sp._pd.d->shared = 1;
// // 		sp._pd.d->weak = 0;
// // 		sp._pd.p = &p->objStorage;

// // 		processEnableIf(&sp, &p->objStorage);

// // 		new (sp._pd.p) T(std::forward<Args>(args)...);
// // 		return sp;
// // 	}

// //   private:
// // 	template<class TT>
// // 	static void processEnableIf(SharedPtr* sp, EnableSharedFromThis<TT>* p) {
// // 		p->_pd = sp->_pd;
// // 	}

// // 	static void processEnableIf(...) {}

// //   public:
// // 	template<class TT>
// // 	SharedPtr<TT> cast() const {
// // 		auto ptr = SharedPtr<TT>();
// // 		ptr._pd.d = _pd.d;
// // 		ptr._pd.p = static_cast<TT*>(_pd.p);
// // 		if (_pd.d && _pd.d->shared != 0) {
// // 			_pd.d->shared++;
// // 		}

// // 		return ptr;
// // 	}

// // 	SharedPtr(): _pd{} {}
// // 	SharedPtr(std::nullptr_t): SharedPtr() {}
// // 	SharedPtr(detail::PtrData<T> o): _pd(o) {}

// // 	template<class TT>
// // 	SharedPtr(const SharedPtr<TT>& other) noexcept: _pd(other._pd) {
// // 		static_assert(std::is_same_v<T, TT> || std::is_base_of_v<T, TT>);
// // 		if (_pd.d && _pd.d->shared != 0) {
// // 			_pd.d->shared++;
// // 		}
// // 	}

// // 	template<class TT>
// // 	SharedPtr(SharedPtr<TT>&& other) noexcept: _pd(other._pd) {
// // 		static_assert(std::is_same_v<T, TT> || std::is_base_of_v<T, TT>);
// // 		other._pd = {};
// // 	}

// // 	template<class TT>
// // 	auto& operator=(const SharedPtr<TT>& other) noexcept {
// // 		static_assert(std::is_same_v<T, TT> || std::is_base_of_v<T, TT>);

// // 		if (this->_pd.d == other._pd.d) {
// // 			return *this;
// // 		}

// // 		reset();

// // 		_pd = other._pd;

// // 		if (_pd.d) {
// // 			_pd.d->shared++;
// // 		}

// // 		return *this;
// // 	}

// // 	template<class TT>
// // 	auto& operator=(SharedPtr<TT>&& other) noexcept {
// // 		static_assert(std::is_same_v<T, TT> || std::is_base_of_v<T, TT>);

// // 		if (this->_pd.d == other._pd.d) {
// // 			return *this;
// // 		}

// // 		reset();

// // 		_pd = other._pd;
// // 		other._pd = {};

// // 		return *this;
// // 	}

// // 	void reset() {
// // 		assert(!_pd.d || _pd.d->shared > 0);
// // 		if (_pd.d && --_pd.d->shared == 0) {
// // 			if (_pd.d->weak == 0) {
// // 				destroyAndReleaseMemory(_pd);
// // 			} else {
// // 				_pd.p->~T();
// // 			}
// // 		}
// // 		_pd = {};
// // 	}

// // 	~SharedPtr() { reset(); }

// // 	operator bool() const { return _pd.d; }

// // 	T& operator*() { return *_pd.p; }

// // 	// T* operator->() { return _pd.p; }
// // 	T* operator->() const { return _pd.p; }

// // 	T* get() const { return _pd.p; }

// // 	unsigned int useCount() const { return _pd.d ? _pd.d->shared : 0; }

// // 	bool unique() const { return useCount() <= 1; }

// // 	auto& operator=(const SharedPtr& other) { return operator=<T>(other); };
// // 	auto& operator=(SharedPtr&& other) { return operator=<T>(std::move(other)); };

// // 	SharedPtr(const SharedPtr& other) noexcept: _pd(other._pd) {
// // 		if (_pd.d && _pd.d->shared != 0) {
// // 			_pd.d->shared++;
// // 		}
// // 	}
// // 	SharedPtr(SharedPtr&& other) noexcept: _pd(other._pd) { other._pd = {}; }

// //   private:
// // 	detail::PtrData<T> _pd{};
// // };

// struct SharedPtr2(T, Allocator = Mallocator)
// if (isAllocator!Allocator && (is(T == class) || is(T == interface))) {
// public:__traits(classInstanceSize, T)
//     static auto make(Args...)(Args args) {
//         SharedPtr!T sp;

//         auto memT = cast(T) Allocator.instance.allocate(__traits(classInstanceSize, T));
//         emplace!T(memT, Args);

//         auto memC = cast(RefCountSharedData!T*) Allocator.instance.allocate(
//                 RefCountSharedData!T.sizeof);
//         emplace!(RefCountSharedData!T)(memC);

//         sp._pd.p = memT;
//         sp._pd.d = memC;

//         return sp;
//     }

//     this(ref return scope const SharedPtr!T o) {
//         sp._pd.p = o._pd.p;
//         sp._pd.d = o._pd.d;
//         sp._pd.d.shared_++;
//     }

//     /**
//        Assign to an lvalue RefCounted
//     */
//     // void opAssign(ref RefCounted other) {

//     //     if (_impl == other._impl)
//     //         return;

//     //     if (_impl !is null)
//     //         release;

//     //     static if (!isGlobal)
//     //         _allocator = other._allocator;

//     //     _impl = other._impl;

//     //     if (_impl !is null)
//     //         inc;
//     // }

//     // /**
//     //    Assign to an rvalue RefCounted
//     //  */
//     // void opAssign(RefCounted other) {
//     //     import std.algorithm : swap;

//     //     swap(_impl, other._impl);
//     //     static if (!isGlobal)
//     //         swap(_allocator, other._allocator);
//     // }

//     // /**
//     //    Dereference the smart pointer and yield a reference
//     //    to the contained type.
//     //  */
//     // ref auto opUnary(string s)() inout if (s == "*") {
//     //     return _impl._get;
//     // }

//     // /**
//     //     Prevent opSlice and opIndex from being hidden by Impl*.
//     //     This comment is deliberately not DDOC.
//     // */
//     // auto ref opSlice(A...)(auto ref A args)
//     // if (__traits(compiles, Type.init.opSlice(args))) {
//     //     return _impl._get.opSlice(args);
//     // }
//     // /// ditto
//     // auto ref opIndex(A...)(auto ref A args)
//     // if (__traits(compiles, Type.init.opIndex(args))) {
//     //     return _impl._get.opIndex(args);
//     // }
//     // /// ditto
//     // auto ref opIndexAssign(A...)(auto ref A args)
//     // if (__traits(compiles, Type.init.opIndexAssign(args))) {
//     //     return _impl._get.opIndexAssign(args);
//     // }

//     //     alias _impl this;

//     // private:

//     // static struct Impl {

//     //     static if (is(Type == shared))
//     //         shared size_t _count;
//     //     else
//     //         size_t _count;

//     //     static if (is(Type == class)) {

//     //         align((void*).alignof) void[__traits(classInstanceSize, Type)] _rawMemory;

//     //     } else
//     //         Type _object;

//     //     static if (is(Type == class)) {

//     //         inout(Type) _get() inout
//     //         in (&this !is null)
//     //         do {
//     //             return cast(inout(Type))&_rawMemory[0];
//     //         }

//     //         inout(shared(Type)) _get() inout shared
//     //         in (&this !is null)
//     //         do {
//     //             return cast(inout(shared(Type)))&_rawMemory[0];
//     //         }
//     //     } else { // struct

//     //         ref inout(Type) _get() inout
//     //         in (&this !is null)
//     //         do {
//     //             return _object;
//     //         }

//     //         ref inout(shared(Type)) _get() inout shared
//     //         in (&this !is null)
//     //         do {
//     //             return _object;
//     //         }
//     //     }

//     //     alias _get this;
//     // }

//     // static if (isSingleton)
//     //     alias _allocator = Allocator.instance;
//     // else static if (isTheAllocator) {
//     //     static if (is(Type == shared)) // 'processAllocator' should be used for allocating
//     //         // memory shared across threads
//     //         alias _allocator = processAllocator;
//     //     else
//     //         alias _allocator = theAllocator;
//     // } else
//     //     Allocator _allocator;

//     // static if (is(Type == shared))
//     //     alias ImplType = shared Impl;
//     // else
//     //     alias ImplType = Impl;

//     // public ImplType* _impl; // has to be public or alias this doesn't work

//     // void allocateImpl() {
//     //     import std.traits : hasIndirections;

//     //     _impl = cast(typeof(_impl)) _allocator.allocate(Impl.sizeof);
//     //     _impl._count = 1;

//     //     static if (is(Type == class)) {
//     //         // class representation:
//     //         // void* classInfoPtr
//     //         // void* monitorPtr
//     //         // []    interfaces
//     //         // T...  members
//     //         import core.memory : GC;

//     //         // TypeInfo_Shared has no
//     //         static if (is(Type == shared)) {
//     //             auto flags() {
//     //                 return (cast(TypeInfo_Class) typeid(Type).base).m_flags;
//     //             }
//     //         } else {
//     //             auto flags() {
//     //                 return typeid(Type).m_flags;
//     //             }
//     //         }

//     //         if (supportGC && !(flags & TypeInfo_Class.ClassFlags.noPointers)) // members have pointers: we have to watch the monitor
//     //             // and all members; skip the classInfoPtr
//     //             GC.addRange(cast(void*)&_impl._rawMemory[(void*).sizeof],
//     //                     __traits(classInstanceSize, Type) - (void*).sizeof);
//     //         else // representation doesn't have pointers, just watch the
//     //             // monitor pointer; skip the classInfoPtr
//     //             // need to watch the monitor pointer even if supportGC is false.
//     //             GC.addRange(cast(void*)&_impl._rawMemory[(void*).sizeof], (void*).sizeof);
//     //     } else static if (supportGC && hasIndirections!Type) {
//     //         import core.memory : GC;

//     //         GC.addRange(cast(void*)&_impl._object, Type.sizeof);
//     //     }
//     // }

//     // void release() {
//     //     import std.traits : hasIndirections;
//     //     import core.memory : GC;
//     //     import automem.utils : destruct;

//     //     if (_impl is null)
//     //         return;
//     //     assert(_impl._count > 0, "Trying to release a RefCounted but ref count is 0 or less");

//     //     dec;

//     //     if (_impl._count == 0) {
//     //         () @trusted { destruct(_impl._get); }();
//     //         static if (is(Type == class)) {
//     //             // need to watch the monitor pointer even if supportGC is false.
//     //             () @trusted {
//     //                 GC.removeRange(cast(void*)&_impl._rawMemory[(void*).sizeof]);
//     //             }();
//     //         } else static if (supportGC && hasIndirections!Type) {
//     //             () @trusted { GC.removeRange(cast(void*)&_impl._object); }();
//     //         }
//     //         auto memSlice = () @trusted {
//     //             return (cast(void*) _impl)[0 .. Impl.sizeof];
//     //         }();
//     //         () @trusted { _allocator.deallocate(memSlice); }();
//     //     }
//     // }

//     // void inc() {
//     //     static if (is(Type == shared)) {
//     //         import core.atomic : atomicOp;

//     //         _impl._count.atomicOp!"+="(1);
//     //     } else
//     //         ++_impl._count;
//     // }

//     // void dec() {
//     //     static if (is(Type == shared)) {
//     //         import core.atomic : atomicOp;

//     //         _impl._count.atomicOp!"-="(1);
//     //     } else
//     //         --_impl._count;
//     // }

// private:
//     PtrData!T _pd;
// }
