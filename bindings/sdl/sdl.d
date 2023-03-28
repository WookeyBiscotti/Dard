
/* Copyright (C) 1991-2020 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */




/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */

/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters */



        
       import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; } // FIXME



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }
    // Replacement for the gcc/clang intrinsic
    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }
    // dmd bug causes a crash if T is passed by value.
    // Works fine with ldc.
    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C++)
{

    alias size_t = c_ulong;

    alias wint_t = uint;

    alias mbstate_t = __mbstate_t;

    alias locale_t = __locale_struct*;

    struct __mbstate_t
    {

        int __count;

        static union _Anonymous_0
        {

            uint __wch;

            char[4] __wchb;
        }

        _Anonymous_0 __value;
    }

    alias __locale_t = __locale_struct*;

    struct __locale_struct
    {

        __locale_data*[13] __locales;

        const(ushort)* __ctype_b;

        const(int)* __ctype_tolower;

        const(int)* __ctype_toupper;

        const(char)*[13] __names;
    }

    alias __FILE = _IO_FILE;
    struct _IO_FILE;

    alias FILE = _IO_FILE;

    alias __sig_atomic_t = int;

    alias __socklen_t = uint;

    alias __intptr_t = c_long;

    alias __caddr_t = char*;

    alias __loff_t = c_long;

    alias __syscall_ulong_t = c_ulong;

    alias __syscall_slong_t = c_long;

    alias __ssize_t = c_long;

    alias __fsword_t = c_long;

    alias __fsfilcnt64_t = c_ulong;

    alias __fsfilcnt_t = c_ulong;

    alias __fsblkcnt64_t = c_ulong;

    alias __fsblkcnt_t = c_ulong;

    alias __blkcnt64_t = c_long;

    alias __blkcnt_t = c_long;

    alias __blksize_t = c_long;

    alias __timer_t = void*;

    alias __clockid_t = int;

    alias __key_t = int;

    alias __daddr_t = int;

    alias __suseconds_t = c_long;

    alias __useconds_t = uint;

    alias __time_t = c_long;

    alias __id_t = uint;

    alias __rlim64_t = c_ulong;

    alias __rlim_t = c_ulong;

    alias __clock_t = c_long;

    struct __fsid_t
    {

        int[2] __val;
    }

    alias __pid_t = int;

    alias __off64_t = c_long;

    alias __off_t = c_long;

    alias __nlink_t = c_ulong;

    alias __mode_t = uint;

    alias __ino64_t = c_ulong;

    alias __ino_t = c_ulong;

    alias __gid_t = uint;

    alias __uid_t = uint;

    alias __dev_t = c_ulong;

    alias __uintmax_t = c_ulong;

    alias __intmax_t = c_long;

    alias __u_quad_t = c_ulong;

    alias __quad_t = c_long;

    alias __uint_least64_t = c_ulong;

    alias __int_least64_t = c_long;

    alias __uint_least32_t = uint;

    alias __int_least32_t = int;

    alias __uint_least16_t = ushort;

    alias __int_least16_t = short;

    alias __uint_least8_t = ubyte;

    alias __int_least8_t = byte;

    alias __uint64_t = c_ulong;

    alias __int64_t = c_long;

    alias __uint32_t = uint;

    alias __int32_t = int;

    alias __uint16_t = ushort;

    alias __int16_t = short;

    alias __uint8_t = ubyte;

    alias __int8_t = byte;

    alias __u_long = c_ulong;

    alias __u_int = uint;

    alias __u_short = ushort;

    alias __u_char = ubyte;

    alias _Float64x = real;

    alias _Float32x = double;

    alias _Float64 = double;

    alias _Float32 = float;

    alias intptr_t = c_ulong;

    alias intmax_t = c_long;

    alias uintmax_t = c_ulong;

    alias int64_t = c_long;

    alias int32_t = int;

    alias int16_t = short;

    alias int8_t = char;

    alias uint64_t = ulong;

    alias uint32_t = uint;

    alias uint16_t = ushort;

    alias uint8_t = ubyte;
    /**
 *  \brief The SDL virtual key representation.
 *
 *  Values of this type are used to represent keyboard keys using the current
 *  layout of the keyboard.  These values include Unicode values representing
 *  the unmodified character that would be generated by pressing the key, or
 *  an SDLK_* constant for those keys that do not generate characters.
 *
 *  A special exception is the number keys at the top of the keyboard which
 *  always map to SDLK_0...SDLK_9, regardless of layout.
 */
    alias SDL_Keycode = int;

    alias SDL_KeyCode = _Anonymous_1;

    enum _Anonymous_1
    {

        SDLK_UNKNOWN = 0,

        SDLK_RETURN = 13,

        SDLK_ESCAPE = 27,

        SDLK_BACKSPACE = 8,

        SDLK_TAB = 9,

        SDLK_SPACE = 32,

        SDLK_EXCLAIM = 33,

        SDLK_QUOTEDBL = 34,

        SDLK_HASH = 35,

        SDLK_PERCENT = 37,

        SDLK_DOLLAR = 36,

        SDLK_AMPERSAND = 38,

        SDLK_QUOTE = 39,

        SDLK_LEFTPAREN = 40,

        SDLK_RIGHTPAREN = 41,

        SDLK_ASTERISK = 42,

        SDLK_PLUS = 43,

        SDLK_COMMA = 44,

        SDLK_MINUS = 45,

        SDLK_PERIOD = 46,

        SDLK_SLASH = 47,

        SDLK_0 = 48,

        SDLK_1 = 49,

        SDLK_2 = 50,

        SDLK_3 = 51,

        SDLK_4 = 52,

        SDLK_5 = 53,

        SDLK_6 = 54,

        SDLK_7 = 55,

        SDLK_8 = 56,

        SDLK_9 = 57,

        SDLK_COLON = 58,

        SDLK_SEMICOLON = 59,

        SDLK_LESS = 60,

        SDLK_EQUALS = 61,

        SDLK_GREATER = 62,

        SDLK_QUESTION = 63,

        SDLK_AT = 64,

        SDLK_LEFTBRACKET = 91,

        SDLK_BACKSLASH = 92,

        SDLK_RIGHTBRACKET = 93,

        SDLK_CARET = 94,

        SDLK_UNDERSCORE = 95,

        SDLK_BACKQUOTE = 96,

        SDLK_a = 97,

        SDLK_b = 98,

        SDLK_c = 99,

        SDLK_d = 100,

        SDLK_e = 101,

        SDLK_f = 102,

        SDLK_g = 103,

        SDLK_h = 104,

        SDLK_i = 105,

        SDLK_j = 106,

        SDLK_k = 107,

        SDLK_l = 108,

        SDLK_m = 109,

        SDLK_n = 110,

        SDLK_o = 111,

        SDLK_p = 112,

        SDLK_q = 113,

        SDLK_r = 114,

        SDLK_s = 115,

        SDLK_t = 116,

        SDLK_u = 117,

        SDLK_v = 118,

        SDLK_w = 119,

        SDLK_x = 120,

        SDLK_y = 121,

        SDLK_z = 122,

        SDLK_CAPSLOCK = 1073741881,

        SDLK_F1 = 1073741882,

        SDLK_F2 = 1073741883,

        SDLK_F3 = 1073741884,

        SDLK_F4 = 1073741885,

        SDLK_F5 = 1073741886,

        SDLK_F6 = 1073741887,

        SDLK_F7 = 1073741888,

        SDLK_F8 = 1073741889,

        SDLK_F9 = 1073741890,

        SDLK_F10 = 1073741891,

        SDLK_F11 = 1073741892,

        SDLK_F12 = 1073741893,

        SDLK_PRINTSCREEN = 1073741894,

        SDLK_SCROLLLOCK = 1073741895,

        SDLK_PAUSE = 1073741896,

        SDLK_INSERT = 1073741897,

        SDLK_HOME = 1073741898,

        SDLK_PAGEUP = 1073741899,

        SDLK_DELETE = 127,

        SDLK_END = 1073741901,

        SDLK_PAGEDOWN = 1073741902,

        SDLK_RIGHT = 1073741903,

        SDLK_LEFT = 1073741904,

        SDLK_DOWN = 1073741905,

        SDLK_UP = 1073741906,

        SDLK_NUMLOCKCLEAR = 1073741907,

        SDLK_KP_DIVIDE = 1073741908,

        SDLK_KP_MULTIPLY = 1073741909,

        SDLK_KP_MINUS = 1073741910,

        SDLK_KP_PLUS = 1073741911,

        SDLK_KP_ENTER = 1073741912,

        SDLK_KP_1 = 1073741913,

        SDLK_KP_2 = 1073741914,

        SDLK_KP_3 = 1073741915,

        SDLK_KP_4 = 1073741916,

        SDLK_KP_5 = 1073741917,

        SDLK_KP_6 = 1073741918,

        SDLK_KP_7 = 1073741919,

        SDLK_KP_8 = 1073741920,

        SDLK_KP_9 = 1073741921,

        SDLK_KP_0 = 1073741922,

        SDLK_KP_PERIOD = 1073741923,

        SDLK_APPLICATION = 1073741925,

        SDLK_POWER = 1073741926,

        SDLK_KP_EQUALS = 1073741927,

        SDLK_F13 = 1073741928,

        SDLK_F14 = 1073741929,

        SDLK_F15 = 1073741930,

        SDLK_F16 = 1073741931,

        SDLK_F17 = 1073741932,

        SDLK_F18 = 1073741933,

        SDLK_F19 = 1073741934,

        SDLK_F20 = 1073741935,

        SDLK_F21 = 1073741936,

        SDLK_F22 = 1073741937,

        SDLK_F23 = 1073741938,

        SDLK_F24 = 1073741939,

        SDLK_EXECUTE = 1073741940,

        SDLK_HELP = 1073741941,

        SDLK_MENU = 1073741942,

        SDLK_SELECT = 1073741943,

        SDLK_STOP = 1073741944,

        SDLK_AGAIN = 1073741945,

        SDLK_UNDO = 1073741946,

        SDLK_CUT = 1073741947,

        SDLK_COPY = 1073741948,

        SDLK_PASTE = 1073741949,

        SDLK_FIND = 1073741950,

        SDLK_MUTE = 1073741951,

        SDLK_VOLUMEUP = 1073741952,

        SDLK_VOLUMEDOWN = 1073741953,

        SDLK_KP_COMMA = 1073741957,

        SDLK_KP_EQUALSAS400 = 1073741958,

        SDLK_ALTERASE = 1073741977,

        SDLK_SYSREQ = 1073741978,

        SDLK_CANCEL = 1073741979,

        SDLK_CLEAR = 1073741980,

        SDLK_PRIOR = 1073741981,

        SDLK_RETURN2 = 1073741982,

        SDLK_SEPARATOR = 1073741983,

        SDLK_OUT = 1073741984,

        SDLK_OPER = 1073741985,

        SDLK_CLEARAGAIN = 1073741986,

        SDLK_CRSEL = 1073741987,

        SDLK_EXSEL = 1073741988,

        SDLK_KP_00 = 1073742000,

        SDLK_KP_000 = 1073742001,

        SDLK_THOUSANDSSEPARATOR = 1073742002,

        SDLK_DECIMALSEPARATOR = 1073742003,

        SDLK_CURRENCYUNIT = 1073742004,

        SDLK_CURRENCYSUBUNIT = 1073742005,

        SDLK_KP_LEFTPAREN = 1073742006,

        SDLK_KP_RIGHTPAREN = 1073742007,

        SDLK_KP_LEFTBRACE = 1073742008,

        SDLK_KP_RIGHTBRACE = 1073742009,

        SDLK_KP_TAB = 1073742010,

        SDLK_KP_BACKSPACE = 1073742011,

        SDLK_KP_A = 1073742012,

        SDLK_KP_B = 1073742013,

        SDLK_KP_C = 1073742014,

        SDLK_KP_D = 1073742015,

        SDLK_KP_E = 1073742016,

        SDLK_KP_F = 1073742017,

        SDLK_KP_XOR = 1073742018,

        SDLK_KP_POWER = 1073742019,

        SDLK_KP_PERCENT = 1073742020,

        SDLK_KP_LESS = 1073742021,

        SDLK_KP_GREATER = 1073742022,

        SDLK_KP_AMPERSAND = 1073742023,

        SDLK_KP_DBLAMPERSAND = 1073742024,

        SDLK_KP_VERTICALBAR = 1073742025,

        SDLK_KP_DBLVERTICALBAR = 1073742026,

        SDLK_KP_COLON = 1073742027,

        SDLK_KP_HASH = 1073742028,

        SDLK_KP_SPACE = 1073742029,

        SDLK_KP_AT = 1073742030,

        SDLK_KP_EXCLAM = 1073742031,

        SDLK_KP_MEMSTORE = 1073742032,

        SDLK_KP_MEMRECALL = 1073742033,

        SDLK_KP_MEMCLEAR = 1073742034,

        SDLK_KP_MEMADD = 1073742035,

        SDLK_KP_MEMSUBTRACT = 1073742036,

        SDLK_KP_MEMMULTIPLY = 1073742037,

        SDLK_KP_MEMDIVIDE = 1073742038,

        SDLK_KP_PLUSMINUS = 1073742039,

        SDLK_KP_CLEAR = 1073742040,

        SDLK_KP_CLEARENTRY = 1073742041,

        SDLK_KP_BINARY = 1073742042,

        SDLK_KP_OCTAL = 1073742043,

        SDLK_KP_DECIMAL = 1073742044,

        SDLK_KP_HEXADECIMAL = 1073742045,

        SDLK_LCTRL = 1073742048,

        SDLK_LSHIFT = 1073742049,

        SDLK_LALT = 1073742050,

        SDLK_LGUI = 1073742051,

        SDLK_RCTRL = 1073742052,

        SDLK_RSHIFT = 1073742053,

        SDLK_RALT = 1073742054,

        SDLK_RGUI = 1073742055,

        SDLK_MODE = 1073742081,

        SDLK_AUDIONEXT = 1073742082,

        SDLK_AUDIOPREV = 1073742083,

        SDLK_AUDIOSTOP = 1073742084,

        SDLK_AUDIOPLAY = 1073742085,

        SDLK_AUDIOMUTE = 1073742086,

        SDLK_MEDIASELECT = 1073742087,

        SDLK_WWW = 1073742088,

        SDLK_MAIL = 1073742089,

        SDLK_CALCULATOR = 1073742090,

        SDLK_COMPUTER = 1073742091,

        SDLK_AC_SEARCH = 1073742092,

        SDLK_AC_HOME = 1073742093,

        SDLK_AC_BACK = 1073742094,

        SDLK_AC_FORWARD = 1073742095,

        SDLK_AC_STOP = 1073742096,

        SDLK_AC_REFRESH = 1073742097,

        SDLK_AC_BOOKMARKS = 1073742098,

        SDLK_BRIGHTNESSDOWN = 1073742099,

        SDLK_BRIGHTNESSUP = 1073742100,

        SDLK_DISPLAYSWITCH = 1073742101,

        SDLK_KBDILLUMTOGGLE = 1073742102,

        SDLK_KBDILLUMDOWN = 1073742103,

        SDLK_KBDILLUMUP = 1073742104,

        SDLK_EJECT = 1073742105,

        SDLK_SLEEP = 1073742106,

        SDLK_APP1 = 1073742107,

        SDLK_APP2 = 1073742108,

        SDLK_AUDIOREWIND = 1073742109,

        SDLK_AUDIOFASTFORWARD = 1073742110,

        SDLK_SOFTLEFT = 1073742111,

        SDLK_SOFTRIGHT = 1073742112,

        SDLK_CALL = 1073742113,

        SDLK_ENDCALL = 1073742114,
    }
    enum SDLK_UNKNOWN = _Anonymous_1.SDLK_UNKNOWN;
    enum SDLK_RETURN = _Anonymous_1.SDLK_RETURN;
    enum SDLK_ESCAPE = _Anonymous_1.SDLK_ESCAPE;
    enum SDLK_BACKSPACE = _Anonymous_1.SDLK_BACKSPACE;
    enum SDLK_TAB = _Anonymous_1.SDLK_TAB;
    enum SDLK_SPACE = _Anonymous_1.SDLK_SPACE;
    enum SDLK_EXCLAIM = _Anonymous_1.SDLK_EXCLAIM;
    enum SDLK_QUOTEDBL = _Anonymous_1.SDLK_QUOTEDBL;
    enum SDLK_HASH = _Anonymous_1.SDLK_HASH;
    enum SDLK_PERCENT = _Anonymous_1.SDLK_PERCENT;
    enum SDLK_DOLLAR = _Anonymous_1.SDLK_DOLLAR;
    enum SDLK_AMPERSAND = _Anonymous_1.SDLK_AMPERSAND;
    enum SDLK_QUOTE = _Anonymous_1.SDLK_QUOTE;
    enum SDLK_LEFTPAREN = _Anonymous_1.SDLK_LEFTPAREN;
    enum SDLK_RIGHTPAREN = _Anonymous_1.SDLK_RIGHTPAREN;
    enum SDLK_ASTERISK = _Anonymous_1.SDLK_ASTERISK;
    enum SDLK_PLUS = _Anonymous_1.SDLK_PLUS;
    enum SDLK_COMMA = _Anonymous_1.SDLK_COMMA;
    enum SDLK_MINUS = _Anonymous_1.SDLK_MINUS;
    enum SDLK_PERIOD = _Anonymous_1.SDLK_PERIOD;
    enum SDLK_SLASH = _Anonymous_1.SDLK_SLASH;
    enum SDLK_0 = _Anonymous_1.SDLK_0;
    enum SDLK_1 = _Anonymous_1.SDLK_1;
    enum SDLK_2 = _Anonymous_1.SDLK_2;
    enum SDLK_3 = _Anonymous_1.SDLK_3;
    enum SDLK_4 = _Anonymous_1.SDLK_4;
    enum SDLK_5 = _Anonymous_1.SDLK_5;
    enum SDLK_6 = _Anonymous_1.SDLK_6;
    enum SDLK_7 = _Anonymous_1.SDLK_7;
    enum SDLK_8 = _Anonymous_1.SDLK_8;
    enum SDLK_9 = _Anonymous_1.SDLK_9;
    enum SDLK_COLON = _Anonymous_1.SDLK_COLON;
    enum SDLK_SEMICOLON = _Anonymous_1.SDLK_SEMICOLON;
    enum SDLK_LESS = _Anonymous_1.SDLK_LESS;
    enum SDLK_EQUALS = _Anonymous_1.SDLK_EQUALS;
    enum SDLK_GREATER = _Anonymous_1.SDLK_GREATER;
    enum SDLK_QUESTION = _Anonymous_1.SDLK_QUESTION;
    enum SDLK_AT = _Anonymous_1.SDLK_AT;
    enum SDLK_LEFTBRACKET = _Anonymous_1.SDLK_LEFTBRACKET;
    enum SDLK_BACKSLASH = _Anonymous_1.SDLK_BACKSLASH;
    enum SDLK_RIGHTBRACKET = _Anonymous_1.SDLK_RIGHTBRACKET;
    enum SDLK_CARET = _Anonymous_1.SDLK_CARET;
    enum SDLK_UNDERSCORE = _Anonymous_1.SDLK_UNDERSCORE;
    enum SDLK_BACKQUOTE = _Anonymous_1.SDLK_BACKQUOTE;
    enum SDLK_a = _Anonymous_1.SDLK_a;
    enum SDLK_b = _Anonymous_1.SDLK_b;
    enum SDLK_c = _Anonymous_1.SDLK_c;
    enum SDLK_d = _Anonymous_1.SDLK_d;
    enum SDLK_e = _Anonymous_1.SDLK_e;
    enum SDLK_f = _Anonymous_1.SDLK_f;
    enum SDLK_g = _Anonymous_1.SDLK_g;
    enum SDLK_h = _Anonymous_1.SDLK_h;
    enum SDLK_i = _Anonymous_1.SDLK_i;
    enum SDLK_j = _Anonymous_1.SDLK_j;
    enum SDLK_k = _Anonymous_1.SDLK_k;
    enum SDLK_l = _Anonymous_1.SDLK_l;
    enum SDLK_m = _Anonymous_1.SDLK_m;
    enum SDLK_n = _Anonymous_1.SDLK_n;
    enum SDLK_o = _Anonymous_1.SDLK_o;
    enum SDLK_p = _Anonymous_1.SDLK_p;
    enum SDLK_q = _Anonymous_1.SDLK_q;
    enum SDLK_r = _Anonymous_1.SDLK_r;
    enum SDLK_s = _Anonymous_1.SDLK_s;
    enum SDLK_t = _Anonymous_1.SDLK_t;
    enum SDLK_u = _Anonymous_1.SDLK_u;
    enum SDLK_v = _Anonymous_1.SDLK_v;
    enum SDLK_w = _Anonymous_1.SDLK_w;
    enum SDLK_x = _Anonymous_1.SDLK_x;
    enum SDLK_y = _Anonymous_1.SDLK_y;
    enum SDLK_z = _Anonymous_1.SDLK_z;
    enum SDLK_CAPSLOCK = _Anonymous_1.SDLK_CAPSLOCK;
    enum SDLK_F1 = _Anonymous_1.SDLK_F1;
    enum SDLK_F2 = _Anonymous_1.SDLK_F2;
    enum SDLK_F3 = _Anonymous_1.SDLK_F3;
    enum SDLK_F4 = _Anonymous_1.SDLK_F4;
    enum SDLK_F5 = _Anonymous_1.SDLK_F5;
    enum SDLK_F6 = _Anonymous_1.SDLK_F6;
    enum SDLK_F7 = _Anonymous_1.SDLK_F7;
    enum SDLK_F8 = _Anonymous_1.SDLK_F8;
    enum SDLK_F9 = _Anonymous_1.SDLK_F9;
    enum SDLK_F10 = _Anonymous_1.SDLK_F10;
    enum SDLK_F11 = _Anonymous_1.SDLK_F11;
    enum SDLK_F12 = _Anonymous_1.SDLK_F12;
    enum SDLK_PRINTSCREEN = _Anonymous_1.SDLK_PRINTSCREEN;
    enum SDLK_SCROLLLOCK = _Anonymous_1.SDLK_SCROLLLOCK;
    enum SDLK_PAUSE = _Anonymous_1.SDLK_PAUSE;
    enum SDLK_INSERT = _Anonymous_1.SDLK_INSERT;
    enum SDLK_HOME = _Anonymous_1.SDLK_HOME;
    enum SDLK_PAGEUP = _Anonymous_1.SDLK_PAGEUP;
    enum SDLK_DELETE = _Anonymous_1.SDLK_DELETE;
    enum SDLK_END = _Anonymous_1.SDLK_END;
    enum SDLK_PAGEDOWN = _Anonymous_1.SDLK_PAGEDOWN;
    enum SDLK_RIGHT = _Anonymous_1.SDLK_RIGHT;
    enum SDLK_LEFT = _Anonymous_1.SDLK_LEFT;
    enum SDLK_DOWN = _Anonymous_1.SDLK_DOWN;
    enum SDLK_UP = _Anonymous_1.SDLK_UP;
    enum SDLK_NUMLOCKCLEAR = _Anonymous_1.SDLK_NUMLOCKCLEAR;
    enum SDLK_KP_DIVIDE = _Anonymous_1.SDLK_KP_DIVIDE;
    enum SDLK_KP_MULTIPLY = _Anonymous_1.SDLK_KP_MULTIPLY;
    enum SDLK_KP_MINUS = _Anonymous_1.SDLK_KP_MINUS;
    enum SDLK_KP_PLUS = _Anonymous_1.SDLK_KP_PLUS;
    enum SDLK_KP_ENTER = _Anonymous_1.SDLK_KP_ENTER;
    enum SDLK_KP_1 = _Anonymous_1.SDLK_KP_1;
    enum SDLK_KP_2 = _Anonymous_1.SDLK_KP_2;
    enum SDLK_KP_3 = _Anonymous_1.SDLK_KP_3;
    enum SDLK_KP_4 = _Anonymous_1.SDLK_KP_4;
    enum SDLK_KP_5 = _Anonymous_1.SDLK_KP_5;
    enum SDLK_KP_6 = _Anonymous_1.SDLK_KP_6;
    enum SDLK_KP_7 = _Anonymous_1.SDLK_KP_7;
    enum SDLK_KP_8 = _Anonymous_1.SDLK_KP_8;
    enum SDLK_KP_9 = _Anonymous_1.SDLK_KP_9;
    enum SDLK_KP_0 = _Anonymous_1.SDLK_KP_0;
    enum SDLK_KP_PERIOD = _Anonymous_1.SDLK_KP_PERIOD;
    enum SDLK_APPLICATION = _Anonymous_1.SDLK_APPLICATION;
    enum SDLK_POWER = _Anonymous_1.SDLK_POWER;
    enum SDLK_KP_EQUALS = _Anonymous_1.SDLK_KP_EQUALS;
    enum SDLK_F13 = _Anonymous_1.SDLK_F13;
    enum SDLK_F14 = _Anonymous_1.SDLK_F14;
    enum SDLK_F15 = _Anonymous_1.SDLK_F15;
    enum SDLK_F16 = _Anonymous_1.SDLK_F16;
    enum SDLK_F17 = _Anonymous_1.SDLK_F17;
    enum SDLK_F18 = _Anonymous_1.SDLK_F18;
    enum SDLK_F19 = _Anonymous_1.SDLK_F19;
    enum SDLK_F20 = _Anonymous_1.SDLK_F20;
    enum SDLK_F21 = _Anonymous_1.SDLK_F21;
    enum SDLK_F22 = _Anonymous_1.SDLK_F22;
    enum SDLK_F23 = _Anonymous_1.SDLK_F23;
    enum SDLK_F24 = _Anonymous_1.SDLK_F24;
    enum SDLK_EXECUTE = _Anonymous_1.SDLK_EXECUTE;
    enum SDLK_HELP = _Anonymous_1.SDLK_HELP;
    enum SDLK_MENU = _Anonymous_1.SDLK_MENU;
    enum SDLK_SELECT = _Anonymous_1.SDLK_SELECT;
    enum SDLK_STOP = _Anonymous_1.SDLK_STOP;
    enum SDLK_AGAIN = _Anonymous_1.SDLK_AGAIN;
    enum SDLK_UNDO = _Anonymous_1.SDLK_UNDO;
    enum SDLK_CUT = _Anonymous_1.SDLK_CUT;
    enum SDLK_COPY = _Anonymous_1.SDLK_COPY;
    enum SDLK_PASTE = _Anonymous_1.SDLK_PASTE;
    enum SDLK_FIND = _Anonymous_1.SDLK_FIND;
    enum SDLK_MUTE = _Anonymous_1.SDLK_MUTE;
    enum SDLK_VOLUMEUP = _Anonymous_1.SDLK_VOLUMEUP;
    enum SDLK_VOLUMEDOWN = _Anonymous_1.SDLK_VOLUMEDOWN;
    enum SDLK_KP_COMMA = _Anonymous_1.SDLK_KP_COMMA;
    enum SDLK_KP_EQUALSAS400 = _Anonymous_1.SDLK_KP_EQUALSAS400;
    enum SDLK_ALTERASE = _Anonymous_1.SDLK_ALTERASE;
    enum SDLK_SYSREQ = _Anonymous_1.SDLK_SYSREQ;
    enum SDLK_CANCEL = _Anonymous_1.SDLK_CANCEL;
    enum SDLK_CLEAR = _Anonymous_1.SDLK_CLEAR;
    enum SDLK_PRIOR = _Anonymous_1.SDLK_PRIOR;
    enum SDLK_RETURN2 = _Anonymous_1.SDLK_RETURN2;
    enum SDLK_SEPARATOR = _Anonymous_1.SDLK_SEPARATOR;
    enum SDLK_OUT = _Anonymous_1.SDLK_OUT;
    enum SDLK_OPER = _Anonymous_1.SDLK_OPER;
    enum SDLK_CLEARAGAIN = _Anonymous_1.SDLK_CLEARAGAIN;
    enum SDLK_CRSEL = _Anonymous_1.SDLK_CRSEL;
    enum SDLK_EXSEL = _Anonymous_1.SDLK_EXSEL;
    enum SDLK_KP_00 = _Anonymous_1.SDLK_KP_00;
    enum SDLK_KP_000 = _Anonymous_1.SDLK_KP_000;
    enum SDLK_THOUSANDSSEPARATOR = _Anonymous_1.SDLK_THOUSANDSSEPARATOR;
    enum SDLK_DECIMALSEPARATOR = _Anonymous_1.SDLK_DECIMALSEPARATOR;
    enum SDLK_CURRENCYUNIT = _Anonymous_1.SDLK_CURRENCYUNIT;
    enum SDLK_CURRENCYSUBUNIT = _Anonymous_1.SDLK_CURRENCYSUBUNIT;
    enum SDLK_KP_LEFTPAREN = _Anonymous_1.SDLK_KP_LEFTPAREN;
    enum SDLK_KP_RIGHTPAREN = _Anonymous_1.SDLK_KP_RIGHTPAREN;
    enum SDLK_KP_LEFTBRACE = _Anonymous_1.SDLK_KP_LEFTBRACE;
    enum SDLK_KP_RIGHTBRACE = _Anonymous_1.SDLK_KP_RIGHTBRACE;
    enum SDLK_KP_TAB = _Anonymous_1.SDLK_KP_TAB;
    enum SDLK_KP_BACKSPACE = _Anonymous_1.SDLK_KP_BACKSPACE;
    enum SDLK_KP_A = _Anonymous_1.SDLK_KP_A;
    enum SDLK_KP_B = _Anonymous_1.SDLK_KP_B;
    enum SDLK_KP_C = _Anonymous_1.SDLK_KP_C;
    enum SDLK_KP_D = _Anonymous_1.SDLK_KP_D;
    enum SDLK_KP_E = _Anonymous_1.SDLK_KP_E;
    enum SDLK_KP_F = _Anonymous_1.SDLK_KP_F;
    enum SDLK_KP_XOR = _Anonymous_1.SDLK_KP_XOR;
    enum SDLK_KP_POWER = _Anonymous_1.SDLK_KP_POWER;
    enum SDLK_KP_PERCENT = _Anonymous_1.SDLK_KP_PERCENT;
    enum SDLK_KP_LESS = _Anonymous_1.SDLK_KP_LESS;
    enum SDLK_KP_GREATER = _Anonymous_1.SDLK_KP_GREATER;
    enum SDLK_KP_AMPERSAND = _Anonymous_1.SDLK_KP_AMPERSAND;
    enum SDLK_KP_DBLAMPERSAND = _Anonymous_1.SDLK_KP_DBLAMPERSAND;
    enum SDLK_KP_VERTICALBAR = _Anonymous_1.SDLK_KP_VERTICALBAR;
    enum SDLK_KP_DBLVERTICALBAR = _Anonymous_1.SDLK_KP_DBLVERTICALBAR;
    enum SDLK_KP_COLON = _Anonymous_1.SDLK_KP_COLON;
    enum SDLK_KP_HASH = _Anonymous_1.SDLK_KP_HASH;
    enum SDLK_KP_SPACE = _Anonymous_1.SDLK_KP_SPACE;
    enum SDLK_KP_AT = _Anonymous_1.SDLK_KP_AT;
    enum SDLK_KP_EXCLAM = _Anonymous_1.SDLK_KP_EXCLAM;
    enum SDLK_KP_MEMSTORE = _Anonymous_1.SDLK_KP_MEMSTORE;
    enum SDLK_KP_MEMRECALL = _Anonymous_1.SDLK_KP_MEMRECALL;
    enum SDLK_KP_MEMCLEAR = _Anonymous_1.SDLK_KP_MEMCLEAR;
    enum SDLK_KP_MEMADD = _Anonymous_1.SDLK_KP_MEMADD;
    enum SDLK_KP_MEMSUBTRACT = _Anonymous_1.SDLK_KP_MEMSUBTRACT;
    enum SDLK_KP_MEMMULTIPLY = _Anonymous_1.SDLK_KP_MEMMULTIPLY;
    enum SDLK_KP_MEMDIVIDE = _Anonymous_1.SDLK_KP_MEMDIVIDE;
    enum SDLK_KP_PLUSMINUS = _Anonymous_1.SDLK_KP_PLUSMINUS;
    enum SDLK_KP_CLEAR = _Anonymous_1.SDLK_KP_CLEAR;
    enum SDLK_KP_CLEARENTRY = _Anonymous_1.SDLK_KP_CLEARENTRY;
    enum SDLK_KP_BINARY = _Anonymous_1.SDLK_KP_BINARY;
    enum SDLK_KP_OCTAL = _Anonymous_1.SDLK_KP_OCTAL;
    enum SDLK_KP_DECIMAL = _Anonymous_1.SDLK_KP_DECIMAL;
    enum SDLK_KP_HEXADECIMAL = _Anonymous_1.SDLK_KP_HEXADECIMAL;
    enum SDLK_LCTRL = _Anonymous_1.SDLK_LCTRL;
    enum SDLK_LSHIFT = _Anonymous_1.SDLK_LSHIFT;
    enum SDLK_LALT = _Anonymous_1.SDLK_LALT;
    enum SDLK_LGUI = _Anonymous_1.SDLK_LGUI;
    enum SDLK_RCTRL = _Anonymous_1.SDLK_RCTRL;
    enum SDLK_RSHIFT = _Anonymous_1.SDLK_RSHIFT;
    enum SDLK_RALT = _Anonymous_1.SDLK_RALT;
    enum SDLK_RGUI = _Anonymous_1.SDLK_RGUI;
    enum SDLK_MODE = _Anonymous_1.SDLK_MODE;
    enum SDLK_AUDIONEXT = _Anonymous_1.SDLK_AUDIONEXT;
    enum SDLK_AUDIOPREV = _Anonymous_1.SDLK_AUDIOPREV;
    enum SDLK_AUDIOSTOP = _Anonymous_1.SDLK_AUDIOSTOP;
    enum SDLK_AUDIOPLAY = _Anonymous_1.SDLK_AUDIOPLAY;
    enum SDLK_AUDIOMUTE = _Anonymous_1.SDLK_AUDIOMUTE;
    enum SDLK_MEDIASELECT = _Anonymous_1.SDLK_MEDIASELECT;
    enum SDLK_WWW = _Anonymous_1.SDLK_WWW;
    enum SDLK_MAIL = _Anonymous_1.SDLK_MAIL;
    enum SDLK_CALCULATOR = _Anonymous_1.SDLK_CALCULATOR;
    enum SDLK_COMPUTER = _Anonymous_1.SDLK_COMPUTER;
    enum SDLK_AC_SEARCH = _Anonymous_1.SDLK_AC_SEARCH;
    enum SDLK_AC_HOME = _Anonymous_1.SDLK_AC_HOME;
    enum SDLK_AC_BACK = _Anonymous_1.SDLK_AC_BACK;
    enum SDLK_AC_FORWARD = _Anonymous_1.SDLK_AC_FORWARD;
    enum SDLK_AC_STOP = _Anonymous_1.SDLK_AC_STOP;
    enum SDLK_AC_REFRESH = _Anonymous_1.SDLK_AC_REFRESH;
    enum SDLK_AC_BOOKMARKS = _Anonymous_1.SDLK_AC_BOOKMARKS;
    enum SDLK_BRIGHTNESSDOWN = _Anonymous_1.SDLK_BRIGHTNESSDOWN;
    enum SDLK_BRIGHTNESSUP = _Anonymous_1.SDLK_BRIGHTNESSUP;
    enum SDLK_DISPLAYSWITCH = _Anonymous_1.SDLK_DISPLAYSWITCH;
    enum SDLK_KBDILLUMTOGGLE = _Anonymous_1.SDLK_KBDILLUMTOGGLE;
    enum SDLK_KBDILLUMDOWN = _Anonymous_1.SDLK_KBDILLUMDOWN;
    enum SDLK_KBDILLUMUP = _Anonymous_1.SDLK_KBDILLUMUP;
    enum SDLK_EJECT = _Anonymous_1.SDLK_EJECT;
    enum SDLK_SLEEP = _Anonymous_1.SDLK_SLEEP;
    enum SDLK_APP1 = _Anonymous_1.SDLK_APP1;
    enum SDLK_APP2 = _Anonymous_1.SDLK_APP2;
    enum SDLK_AUDIOREWIND = _Anonymous_1.SDLK_AUDIOREWIND;
    enum SDLK_AUDIOFASTFORWARD = _Anonymous_1.SDLK_AUDIOFASTFORWARD;
    enum SDLK_SOFTLEFT = _Anonymous_1.SDLK_SOFTLEFT;
    enum SDLK_SOFTRIGHT = _Anonymous_1.SDLK_SOFTRIGHT;
    enum SDLK_CALL = _Anonymous_1.SDLK_CALL;
    enum SDLK_ENDCALL = _Anonymous_1.SDLK_ENDCALL;
    /**
 * \brief Enumeration of valid key mods (possibly OR'd together).
 */
    alias SDL_Keymod = _Anonymous_2;
    /**
 * \brief Enumeration of valid key mods (possibly OR'd together).
 */
    enum _Anonymous_2
    {

        SDL_KMOD_NONE = 0,

        SDL_KMOD_LSHIFT = 1,

        SDL_KMOD_RSHIFT = 2,

        SDL_KMOD_LCTRL = 64,

        SDL_KMOD_RCTRL = 128,

        SDL_KMOD_LALT = 256,

        SDL_KMOD_RALT = 512,

        SDL_KMOD_LGUI = 1024,

        SDL_KMOD_RGUI = 2048,

        SDL_KMOD_NUM = 4096,

        SDL_KMOD_CAPS = 8192,

        SDL_KMOD_MODE = 16384,

        SDL_KMOD_SCROLL = 32768,

        SDL_KMOD_CTRL = 192,

        SDL_KMOD_SHIFT = 3,

        SDL_KMOD_ALT = 768,

        SDL_KMOD_GUI = 3072,

        SDL_KMOD_RESERVED = 32768,
    }
    enum SDL_KMOD_NONE = _Anonymous_2.SDL_KMOD_NONE;
    enum SDL_KMOD_LSHIFT = _Anonymous_2.SDL_KMOD_LSHIFT;
    enum SDL_KMOD_RSHIFT = _Anonymous_2.SDL_KMOD_RSHIFT;
    enum SDL_KMOD_LCTRL = _Anonymous_2.SDL_KMOD_LCTRL;
    enum SDL_KMOD_RCTRL = _Anonymous_2.SDL_KMOD_RCTRL;
    enum SDL_KMOD_LALT = _Anonymous_2.SDL_KMOD_LALT;
    enum SDL_KMOD_RALT = _Anonymous_2.SDL_KMOD_RALT;
    enum SDL_KMOD_LGUI = _Anonymous_2.SDL_KMOD_LGUI;
    enum SDL_KMOD_RGUI = _Anonymous_2.SDL_KMOD_RGUI;
    enum SDL_KMOD_NUM = _Anonymous_2.SDL_KMOD_NUM;
    enum SDL_KMOD_CAPS = _Anonymous_2.SDL_KMOD_CAPS;
    enum SDL_KMOD_MODE = _Anonymous_2.SDL_KMOD_MODE;
    enum SDL_KMOD_SCROLL = _Anonymous_2.SDL_KMOD_SCROLL;
    enum SDL_KMOD_CTRL = _Anonymous_2.SDL_KMOD_CTRL;
    enum SDL_KMOD_SHIFT = _Anonymous_2.SDL_KMOD_SHIFT;
    enum SDL_KMOD_ALT = _Anonymous_2.SDL_KMOD_ALT;
    enum SDL_KMOD_GUI = _Anonymous_2.SDL_KMOD_GUI;
    enum SDL_KMOD_RESERVED = _Anonymous_2.SDL_KMOD_RESERVED;
    /**
 *  \brief The SDL keyboard scancode representation.
 *
 *  Values of this type are used to represent keyboard keys, among other places
 *  in the \link SDL_Keysym::scancode key.keysym.scancode \endlink field of the
 *  SDL_Event structure.
 *
 *  The values in this enumeration are based on the USB usage page standard:
 *  https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
 */
    alias SDL_Scancode = _Anonymous_3;
    /**
 *  \brief The SDL keyboard scancode representation.
 *
 *  Values of this type are used to represent keyboard keys, among other places
 *  in the \link SDL_Keysym::scancode key.keysym.scancode \endlink field of the
 *  SDL_Event structure.
 *
 *  The values in this enumeration are based on the USB usage page standard:
 *  https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
 */
    enum _Anonymous_3
    {

        SDL_SCANCODE_UNKNOWN = 0,

        SDL_SCANCODE_A = 4,

        SDL_SCANCODE_B = 5,

        SDL_SCANCODE_C = 6,

        SDL_SCANCODE_D = 7,

        SDL_SCANCODE_E = 8,

        SDL_SCANCODE_F = 9,

        SDL_SCANCODE_G = 10,

        SDL_SCANCODE_H = 11,

        SDL_SCANCODE_I = 12,

        SDL_SCANCODE_J = 13,

        SDL_SCANCODE_K = 14,

        SDL_SCANCODE_L = 15,

        SDL_SCANCODE_M = 16,

        SDL_SCANCODE_N = 17,

        SDL_SCANCODE_O = 18,

        SDL_SCANCODE_P = 19,

        SDL_SCANCODE_Q = 20,

        SDL_SCANCODE_R = 21,

        SDL_SCANCODE_S = 22,

        SDL_SCANCODE_T = 23,

        SDL_SCANCODE_U = 24,

        SDL_SCANCODE_V = 25,

        SDL_SCANCODE_W = 26,

        SDL_SCANCODE_X = 27,

        SDL_SCANCODE_Y = 28,

        SDL_SCANCODE_Z = 29,

        SDL_SCANCODE_1 = 30,

        SDL_SCANCODE_2 = 31,

        SDL_SCANCODE_3 = 32,

        SDL_SCANCODE_4 = 33,

        SDL_SCANCODE_5 = 34,

        SDL_SCANCODE_6 = 35,

        SDL_SCANCODE_7 = 36,

        SDL_SCANCODE_8 = 37,

        SDL_SCANCODE_9 = 38,

        SDL_SCANCODE_0 = 39,

        SDL_SCANCODE_RETURN = 40,

        SDL_SCANCODE_ESCAPE = 41,

        SDL_SCANCODE_BACKSPACE = 42,

        SDL_SCANCODE_TAB = 43,

        SDL_SCANCODE_SPACE = 44,

        SDL_SCANCODE_MINUS = 45,

        SDL_SCANCODE_EQUALS = 46,

        SDL_SCANCODE_LEFTBRACKET = 47,

        SDL_SCANCODE_RIGHTBRACKET = 48,
        /**< Located at the lower left of the return
                                  *   key on ISO keyboards and at the right end
                                  *   of the QWERTY row on ANSI keyboards.
                                  *   Produces REVERSE SOLIDUS (backslash) and
                                  *   VERTICAL LINE in a US layout, REVERSE
                                  *   SOLIDUS and VERTICAL LINE in a UK Mac
                                  *   layout, NUMBER SIGN and TILDE in a UK
                                  *   Windows layout, DOLLAR SIGN and POUND SIGN
                                  *   in a Swiss German layout, NUMBER SIGN and
                                  *   APOSTROPHE in a German layout, GRAVE
                                  *   ACCENT and POUND SIGN in a French Mac
                                  *   layout, and ASTERISK and MICRO SIGN in a
                                  *   French Windows layout.
                                  */
        SDL_SCANCODE_BACKSLASH = 49,
        /**< ISO USB keyboards actually use this code
                                  *   instead of 49 for the same key, but all
                                  *   OSes I've seen treat the two codes
                                  *   identically. So, as an implementor, unless
                                  *   your keyboard generates both of those
                                  *   codes and your OS treats them differently,
                                  *   you should generate SDL_SCANCODE_BACKSLASH
                                  *   instead of this code. As a user, you
                                  *   should not rely on this code because SDL
                                  *   will never generate it with most (all?)
                                  *   keyboards.
                                  */
        SDL_SCANCODE_NONUSHASH = 50,

        SDL_SCANCODE_SEMICOLON = 51,

        SDL_SCANCODE_APOSTROPHE = 52,
        /**< Located in the top left corner (on both ANSI
                              *   and ISO keyboards). Produces GRAVE ACCENT and
                              *   TILDE in a US Windows layout and in US and UK
                              *   Mac layouts on ANSI keyboards, GRAVE ACCENT
                              *   and NOT SIGN in a UK Windows layout, SECTION
                              *   SIGN and PLUS-MINUS SIGN in US and UK Mac
                              *   layouts on ISO keyboards, SECTION SIGN and
                              *   DEGREE SIGN in a Swiss German layout (Mac:
                              *   only on ISO keyboards), CIRCUMFLEX ACCENT and
                              *   DEGREE SIGN in a German layout (Mac: only on
                              *   ISO keyboards), SUPERSCRIPT TWO and TILDE in a
                              *   French Windows layout, COMMERCIAL AT and
                              *   NUMBER SIGN in a French Mac layout on ISO
                              *   keyboards, and LESS-THAN SIGN and GREATER-THAN
                              *   SIGN in a Swiss German, German, or French Mac
                              *   layout on ANSI keyboards.
                              */
        SDL_SCANCODE_GRAVE = 53,

        SDL_SCANCODE_COMMA = 54,

        SDL_SCANCODE_PERIOD = 55,

        SDL_SCANCODE_SLASH = 56,

        SDL_SCANCODE_CAPSLOCK = 57,

        SDL_SCANCODE_F1 = 58,

        SDL_SCANCODE_F2 = 59,

        SDL_SCANCODE_F3 = 60,

        SDL_SCANCODE_F4 = 61,

        SDL_SCANCODE_F5 = 62,

        SDL_SCANCODE_F6 = 63,

        SDL_SCANCODE_F7 = 64,

        SDL_SCANCODE_F8 = 65,

        SDL_SCANCODE_F9 = 66,

        SDL_SCANCODE_F10 = 67,

        SDL_SCANCODE_F11 = 68,

        SDL_SCANCODE_F12 = 69,

        SDL_SCANCODE_PRINTSCREEN = 70,

        SDL_SCANCODE_SCROLLLOCK = 71,

        SDL_SCANCODE_PAUSE = 72,
        /**< insert on PC, help on some Mac keyboards (but
                                   does send code 73, not 117) */
        SDL_SCANCODE_INSERT = 73,

        SDL_SCANCODE_HOME = 74,

        SDL_SCANCODE_PAGEUP = 75,

        SDL_SCANCODE_DELETE = 76,

        SDL_SCANCODE_END = 77,

        SDL_SCANCODE_PAGEDOWN = 78,

        SDL_SCANCODE_RIGHT = 79,

        SDL_SCANCODE_LEFT = 80,

        SDL_SCANCODE_DOWN = 81,

        SDL_SCANCODE_UP = 82,
        /**< num lock on PC, clear on Mac keyboards
                                     */
        SDL_SCANCODE_NUMLOCKCLEAR = 83,

        SDL_SCANCODE_KP_DIVIDE = 84,

        SDL_SCANCODE_KP_MULTIPLY = 85,

        SDL_SCANCODE_KP_MINUS = 86,

        SDL_SCANCODE_KP_PLUS = 87,

        SDL_SCANCODE_KP_ENTER = 88,

        SDL_SCANCODE_KP_1 = 89,

        SDL_SCANCODE_KP_2 = 90,

        SDL_SCANCODE_KP_3 = 91,

        SDL_SCANCODE_KP_4 = 92,

        SDL_SCANCODE_KP_5 = 93,

        SDL_SCANCODE_KP_6 = 94,

        SDL_SCANCODE_KP_7 = 95,

        SDL_SCANCODE_KP_8 = 96,

        SDL_SCANCODE_KP_9 = 97,

        SDL_SCANCODE_KP_0 = 98,

        SDL_SCANCODE_KP_PERIOD = 99,
        /**< This is the additional key that ISO
                                        *   keyboards have over ANSI ones,
                                        *   located between left shift and Y.
                                        *   Produces GRAVE ACCENT and TILDE in a
                                        *   US or UK Mac layout, REVERSE SOLIDUS
                                        *   (backslash) and VERTICAL LINE in a
                                        *   US or UK Windows layout, and
                                        *   LESS-THAN SIGN and GREATER-THAN SIGN
                                        *   in a Swiss German, German, or French
                                        *   layout. */
        SDL_SCANCODE_NONUSBACKSLASH = 100,
        /**< windows contextual menu, compose */
        SDL_SCANCODE_APPLICATION = 101,
        /**< The USB document says this is a status flag,
                               *   not a physical key - but some Mac keyboards
                               *   do have a power key. */
        SDL_SCANCODE_POWER = 102,

        SDL_SCANCODE_KP_EQUALS = 103,

        SDL_SCANCODE_F13 = 104,

        SDL_SCANCODE_F14 = 105,

        SDL_SCANCODE_F15 = 106,

        SDL_SCANCODE_F16 = 107,

        SDL_SCANCODE_F17 = 108,

        SDL_SCANCODE_F18 = 109,

        SDL_SCANCODE_F19 = 110,

        SDL_SCANCODE_F20 = 111,

        SDL_SCANCODE_F21 = 112,

        SDL_SCANCODE_F22 = 113,

        SDL_SCANCODE_F23 = 114,

        SDL_SCANCODE_F24 = 115,

        SDL_SCANCODE_EXECUTE = 116,
        /**< AL Integrated Help Center */
        SDL_SCANCODE_HELP = 117,
        /**< Menu (show menu) */
        SDL_SCANCODE_MENU = 118,

        SDL_SCANCODE_SELECT = 119,
        /**< AC Stop */
        SDL_SCANCODE_STOP = 120,
        /**< AC Redo/Repeat */
        SDL_SCANCODE_AGAIN = 121,
        /**< AC Undo */
        SDL_SCANCODE_UNDO = 122,
        /**< AC Cut */
        SDL_SCANCODE_CUT = 123,
        /**< AC Copy */
        SDL_SCANCODE_COPY = 124,
        /**< AC Paste */
        SDL_SCANCODE_PASTE = 125,
        /**< AC Find */
        SDL_SCANCODE_FIND = 126,

        SDL_SCANCODE_MUTE = 127,

        SDL_SCANCODE_VOLUMEUP = 128,

        SDL_SCANCODE_VOLUMEDOWN = 129,

        SDL_SCANCODE_KP_COMMA = 133,

        SDL_SCANCODE_KP_EQUALSAS400 = 134,
        /**< used on Asian keyboards, see
                                            footnotes in USB doc */
        SDL_SCANCODE_INTERNATIONAL1 = 135,

        SDL_SCANCODE_INTERNATIONAL2 = 136,
        /**< Yen */
        SDL_SCANCODE_INTERNATIONAL3 = 137,

        SDL_SCANCODE_INTERNATIONAL4 = 138,

        SDL_SCANCODE_INTERNATIONAL5 = 139,

        SDL_SCANCODE_INTERNATIONAL6 = 140,

        SDL_SCANCODE_INTERNATIONAL7 = 141,

        SDL_SCANCODE_INTERNATIONAL8 = 142,

        SDL_SCANCODE_INTERNATIONAL9 = 143,
        /**< Hangul/English toggle */
        SDL_SCANCODE_LANG1 = 144,
        /**< Hanja conversion */
        SDL_SCANCODE_LANG2 = 145,
        /**< Katakana */
        SDL_SCANCODE_LANG3 = 146,
        /**< Hiragana */
        SDL_SCANCODE_LANG4 = 147,
        /**< Zenkaku/Hankaku */
        SDL_SCANCODE_LANG5 = 148,
        /**< reserved */
        SDL_SCANCODE_LANG6 = 149,
        /**< reserved */
        SDL_SCANCODE_LANG7 = 150,
        /**< reserved */
        SDL_SCANCODE_LANG8 = 151,
        /**< reserved */
        SDL_SCANCODE_LANG9 = 152,
        /**< Erase-Eaze */
        SDL_SCANCODE_ALTERASE = 153,

        SDL_SCANCODE_SYSREQ = 154,
        /**< AC Cancel */
        SDL_SCANCODE_CANCEL = 155,

        SDL_SCANCODE_CLEAR = 156,

        SDL_SCANCODE_PRIOR = 157,

        SDL_SCANCODE_RETURN2 = 158,

        SDL_SCANCODE_SEPARATOR = 159,

        SDL_SCANCODE_OUT = 160,

        SDL_SCANCODE_OPER = 161,

        SDL_SCANCODE_CLEARAGAIN = 162,

        SDL_SCANCODE_CRSEL = 163,

        SDL_SCANCODE_EXSEL = 164,

        SDL_SCANCODE_KP_00 = 176,

        SDL_SCANCODE_KP_000 = 177,

        SDL_SCANCODE_THOUSANDSSEPARATOR = 178,

        SDL_SCANCODE_DECIMALSEPARATOR = 179,

        SDL_SCANCODE_CURRENCYUNIT = 180,

        SDL_SCANCODE_CURRENCYSUBUNIT = 181,

        SDL_SCANCODE_KP_LEFTPAREN = 182,

        SDL_SCANCODE_KP_RIGHTPAREN = 183,

        SDL_SCANCODE_KP_LEFTBRACE = 184,

        SDL_SCANCODE_KP_RIGHTBRACE = 185,

        SDL_SCANCODE_KP_TAB = 186,

        SDL_SCANCODE_KP_BACKSPACE = 187,

        SDL_SCANCODE_KP_A = 188,

        SDL_SCANCODE_KP_B = 189,

        SDL_SCANCODE_KP_C = 190,

        SDL_SCANCODE_KP_D = 191,

        SDL_SCANCODE_KP_E = 192,

        SDL_SCANCODE_KP_F = 193,

        SDL_SCANCODE_KP_XOR = 194,

        SDL_SCANCODE_KP_POWER = 195,

        SDL_SCANCODE_KP_PERCENT = 196,

        SDL_SCANCODE_KP_LESS = 197,

        SDL_SCANCODE_KP_GREATER = 198,

        SDL_SCANCODE_KP_AMPERSAND = 199,

        SDL_SCANCODE_KP_DBLAMPERSAND = 200,

        SDL_SCANCODE_KP_VERTICALBAR = 201,

        SDL_SCANCODE_KP_DBLVERTICALBAR = 202,

        SDL_SCANCODE_KP_COLON = 203,

        SDL_SCANCODE_KP_HASH = 204,

        SDL_SCANCODE_KP_SPACE = 205,

        SDL_SCANCODE_KP_AT = 206,

        SDL_SCANCODE_KP_EXCLAM = 207,

        SDL_SCANCODE_KP_MEMSTORE = 208,

        SDL_SCANCODE_KP_MEMRECALL = 209,

        SDL_SCANCODE_KP_MEMCLEAR = 210,

        SDL_SCANCODE_KP_MEMADD = 211,

        SDL_SCANCODE_KP_MEMSUBTRACT = 212,

        SDL_SCANCODE_KP_MEMMULTIPLY = 213,

        SDL_SCANCODE_KP_MEMDIVIDE = 214,

        SDL_SCANCODE_KP_PLUSMINUS = 215,

        SDL_SCANCODE_KP_CLEAR = 216,

        SDL_SCANCODE_KP_CLEARENTRY = 217,

        SDL_SCANCODE_KP_BINARY = 218,

        SDL_SCANCODE_KP_OCTAL = 219,

        SDL_SCANCODE_KP_DECIMAL = 220,

        SDL_SCANCODE_KP_HEXADECIMAL = 221,

        SDL_SCANCODE_LCTRL = 224,

        SDL_SCANCODE_LSHIFT = 225,
        /**< alt, option */
        SDL_SCANCODE_LALT = 226,
        /**< windows, command (apple), meta */
        SDL_SCANCODE_LGUI = 227,

        SDL_SCANCODE_RCTRL = 228,

        SDL_SCANCODE_RSHIFT = 229,
        /**< alt gr, option */
        SDL_SCANCODE_RALT = 230,
        /**< windows, command (apple), meta */
        SDL_SCANCODE_RGUI = 231,
        /**< I'm not sure if this is really not covered
                                 *   by any of the above, but since there's a
                                 *   special SDL_KMOD_MODE for it I'm adding it here
                                 */
        SDL_SCANCODE_MODE = 257,

        SDL_SCANCODE_AUDIONEXT = 258,

        SDL_SCANCODE_AUDIOPREV = 259,

        SDL_SCANCODE_AUDIOSTOP = 260,

        SDL_SCANCODE_AUDIOPLAY = 261,

        SDL_SCANCODE_AUDIOMUTE = 262,

        SDL_SCANCODE_MEDIASELECT = 263,
        /**< AL Internet Browser */
        SDL_SCANCODE_WWW = 264,

        SDL_SCANCODE_MAIL = 265,
        /**< AL Calculator */
        SDL_SCANCODE_CALCULATOR = 266,

        SDL_SCANCODE_COMPUTER = 267,
        /**< AC Search */
        SDL_SCANCODE_AC_SEARCH = 268,
        /**< AC Home */
        SDL_SCANCODE_AC_HOME = 269,
        /**< AC Back */
        SDL_SCANCODE_AC_BACK = 270,
        /**< AC Forward */
        SDL_SCANCODE_AC_FORWARD = 271,
        /**< AC Stop */
        SDL_SCANCODE_AC_STOP = 272,
        /**< AC Refresh */
        SDL_SCANCODE_AC_REFRESH = 273,
        /**< AC Bookmarks */
        SDL_SCANCODE_AC_BOOKMARKS = 274,

        SDL_SCANCODE_BRIGHTNESSDOWN = 275,

        SDL_SCANCODE_BRIGHTNESSUP = 276,
        /**< display mirroring/dual display
                                           switch, video mode switch */
        SDL_SCANCODE_DISPLAYSWITCH = 277,

        SDL_SCANCODE_KBDILLUMTOGGLE = 278,

        SDL_SCANCODE_KBDILLUMDOWN = 279,

        SDL_SCANCODE_KBDILLUMUP = 280,

        SDL_SCANCODE_EJECT = 281,
        /**< SC System Sleep */
        SDL_SCANCODE_SLEEP = 282,

        SDL_SCANCODE_APP1 = 283,

        SDL_SCANCODE_APP2 = 284,

        SDL_SCANCODE_AUDIOREWIND = 285,

        SDL_SCANCODE_AUDIOFASTFORWARD = 286,
        /**< Usually situated below the display on phones and
                                      used as a multi-function feature key for selecting
                                      a software defined function shown on the bottom left
                                      of the display. */
        SDL_SCANCODE_SOFTLEFT = 287,
        /**< Usually situated below the display on phones and
                                       used as a multi-function feature key for selecting
                                       a software defined function shown on the bottom right
                                       of the display. */
        SDL_SCANCODE_SOFTRIGHT = 288,
        /**< Used for accepting phone calls. */
        SDL_SCANCODE_CALL = 289,
        /**< Used for rejecting phone calls. */
        SDL_SCANCODE_ENDCALL = 290,
        /**< not a key, just marks the number of scancodes
                                 for array bounds */
        SDL_NUM_SCANCODES = 512,
    }
    enum SDL_SCANCODE_UNKNOWN = _Anonymous_3.SDL_SCANCODE_UNKNOWN;
    enum SDL_SCANCODE_A = _Anonymous_3.SDL_SCANCODE_A;
    enum SDL_SCANCODE_B = _Anonymous_3.SDL_SCANCODE_B;
    enum SDL_SCANCODE_C = _Anonymous_3.SDL_SCANCODE_C;
    enum SDL_SCANCODE_D = _Anonymous_3.SDL_SCANCODE_D;
    enum SDL_SCANCODE_E = _Anonymous_3.SDL_SCANCODE_E;
    enum SDL_SCANCODE_F = _Anonymous_3.SDL_SCANCODE_F;
    enum SDL_SCANCODE_G = _Anonymous_3.SDL_SCANCODE_G;
    enum SDL_SCANCODE_H = _Anonymous_3.SDL_SCANCODE_H;
    enum SDL_SCANCODE_I = _Anonymous_3.SDL_SCANCODE_I;
    enum SDL_SCANCODE_J = _Anonymous_3.SDL_SCANCODE_J;
    enum SDL_SCANCODE_K = _Anonymous_3.SDL_SCANCODE_K;
    enum SDL_SCANCODE_L = _Anonymous_3.SDL_SCANCODE_L;
    enum SDL_SCANCODE_M = _Anonymous_3.SDL_SCANCODE_M;
    enum SDL_SCANCODE_N = _Anonymous_3.SDL_SCANCODE_N;
    enum SDL_SCANCODE_O = _Anonymous_3.SDL_SCANCODE_O;
    enum SDL_SCANCODE_P = _Anonymous_3.SDL_SCANCODE_P;
    enum SDL_SCANCODE_Q = _Anonymous_3.SDL_SCANCODE_Q;
    enum SDL_SCANCODE_R = _Anonymous_3.SDL_SCANCODE_R;
    enum SDL_SCANCODE_S = _Anonymous_3.SDL_SCANCODE_S;
    enum SDL_SCANCODE_T = _Anonymous_3.SDL_SCANCODE_T;
    enum SDL_SCANCODE_U = _Anonymous_3.SDL_SCANCODE_U;
    enum SDL_SCANCODE_V = _Anonymous_3.SDL_SCANCODE_V;
    enum SDL_SCANCODE_W = _Anonymous_3.SDL_SCANCODE_W;
    enum SDL_SCANCODE_X = _Anonymous_3.SDL_SCANCODE_X;
    enum SDL_SCANCODE_Y = _Anonymous_3.SDL_SCANCODE_Y;
    enum SDL_SCANCODE_Z = _Anonymous_3.SDL_SCANCODE_Z;
    enum SDL_SCANCODE_1 = _Anonymous_3.SDL_SCANCODE_1;
    enum SDL_SCANCODE_2 = _Anonymous_3.SDL_SCANCODE_2;
    enum SDL_SCANCODE_3 = _Anonymous_3.SDL_SCANCODE_3;
    enum SDL_SCANCODE_4 = _Anonymous_3.SDL_SCANCODE_4;
    enum SDL_SCANCODE_5 = _Anonymous_3.SDL_SCANCODE_5;
    enum SDL_SCANCODE_6 = _Anonymous_3.SDL_SCANCODE_6;
    enum SDL_SCANCODE_7 = _Anonymous_3.SDL_SCANCODE_7;
    enum SDL_SCANCODE_8 = _Anonymous_3.SDL_SCANCODE_8;
    enum SDL_SCANCODE_9 = _Anonymous_3.SDL_SCANCODE_9;
    enum SDL_SCANCODE_0 = _Anonymous_3.SDL_SCANCODE_0;
    enum SDL_SCANCODE_RETURN = _Anonymous_3.SDL_SCANCODE_RETURN;
    enum SDL_SCANCODE_ESCAPE = _Anonymous_3.SDL_SCANCODE_ESCAPE;
    enum SDL_SCANCODE_BACKSPACE = _Anonymous_3.SDL_SCANCODE_BACKSPACE;
    enum SDL_SCANCODE_TAB = _Anonymous_3.SDL_SCANCODE_TAB;
    enum SDL_SCANCODE_SPACE = _Anonymous_3.SDL_SCANCODE_SPACE;
    enum SDL_SCANCODE_MINUS = _Anonymous_3.SDL_SCANCODE_MINUS;
    enum SDL_SCANCODE_EQUALS = _Anonymous_3.SDL_SCANCODE_EQUALS;
    enum SDL_SCANCODE_LEFTBRACKET = _Anonymous_3.SDL_SCANCODE_LEFTBRACKET;
    enum SDL_SCANCODE_RIGHTBRACKET = _Anonymous_3.SDL_SCANCODE_RIGHTBRACKET;
    enum SDL_SCANCODE_BACKSLASH = _Anonymous_3.SDL_SCANCODE_BACKSLASH;
    enum SDL_SCANCODE_NONUSHASH = _Anonymous_3.SDL_SCANCODE_NONUSHASH;
    enum SDL_SCANCODE_SEMICOLON = _Anonymous_3.SDL_SCANCODE_SEMICOLON;
    enum SDL_SCANCODE_APOSTROPHE = _Anonymous_3.SDL_SCANCODE_APOSTROPHE;
    enum SDL_SCANCODE_GRAVE = _Anonymous_3.SDL_SCANCODE_GRAVE;
    enum SDL_SCANCODE_COMMA = _Anonymous_3.SDL_SCANCODE_COMMA;
    enum SDL_SCANCODE_PERIOD = _Anonymous_3.SDL_SCANCODE_PERIOD;
    enum SDL_SCANCODE_SLASH = _Anonymous_3.SDL_SCANCODE_SLASH;
    enum SDL_SCANCODE_CAPSLOCK = _Anonymous_3.SDL_SCANCODE_CAPSLOCK;
    enum SDL_SCANCODE_F1 = _Anonymous_3.SDL_SCANCODE_F1;
    enum SDL_SCANCODE_F2 = _Anonymous_3.SDL_SCANCODE_F2;
    enum SDL_SCANCODE_F3 = _Anonymous_3.SDL_SCANCODE_F3;
    enum SDL_SCANCODE_F4 = _Anonymous_3.SDL_SCANCODE_F4;
    enum SDL_SCANCODE_F5 = _Anonymous_3.SDL_SCANCODE_F5;
    enum SDL_SCANCODE_F6 = _Anonymous_3.SDL_SCANCODE_F6;
    enum SDL_SCANCODE_F7 = _Anonymous_3.SDL_SCANCODE_F7;
    enum SDL_SCANCODE_F8 = _Anonymous_3.SDL_SCANCODE_F8;
    enum SDL_SCANCODE_F9 = _Anonymous_3.SDL_SCANCODE_F9;
    enum SDL_SCANCODE_F10 = _Anonymous_3.SDL_SCANCODE_F10;
    enum SDL_SCANCODE_F11 = _Anonymous_3.SDL_SCANCODE_F11;
    enum SDL_SCANCODE_F12 = _Anonymous_3.SDL_SCANCODE_F12;
    enum SDL_SCANCODE_PRINTSCREEN = _Anonymous_3.SDL_SCANCODE_PRINTSCREEN;
    enum SDL_SCANCODE_SCROLLLOCK = _Anonymous_3.SDL_SCANCODE_SCROLLLOCK;
    enum SDL_SCANCODE_PAUSE = _Anonymous_3.SDL_SCANCODE_PAUSE;
    enum SDL_SCANCODE_INSERT = _Anonymous_3.SDL_SCANCODE_INSERT;
    enum SDL_SCANCODE_HOME = _Anonymous_3.SDL_SCANCODE_HOME;
    enum SDL_SCANCODE_PAGEUP = _Anonymous_3.SDL_SCANCODE_PAGEUP;
    enum SDL_SCANCODE_DELETE = _Anonymous_3.SDL_SCANCODE_DELETE;
    enum SDL_SCANCODE_END = _Anonymous_3.SDL_SCANCODE_END;
    enum SDL_SCANCODE_PAGEDOWN = _Anonymous_3.SDL_SCANCODE_PAGEDOWN;
    enum SDL_SCANCODE_RIGHT = _Anonymous_3.SDL_SCANCODE_RIGHT;
    enum SDL_SCANCODE_LEFT = _Anonymous_3.SDL_SCANCODE_LEFT;
    enum SDL_SCANCODE_DOWN = _Anonymous_3.SDL_SCANCODE_DOWN;
    enum SDL_SCANCODE_UP = _Anonymous_3.SDL_SCANCODE_UP;
    enum SDL_SCANCODE_NUMLOCKCLEAR = _Anonymous_3.SDL_SCANCODE_NUMLOCKCLEAR;
    enum SDL_SCANCODE_KP_DIVIDE = _Anonymous_3.SDL_SCANCODE_KP_DIVIDE;
    enum SDL_SCANCODE_KP_MULTIPLY = _Anonymous_3.SDL_SCANCODE_KP_MULTIPLY;
    enum SDL_SCANCODE_KP_MINUS = _Anonymous_3.SDL_SCANCODE_KP_MINUS;
    enum SDL_SCANCODE_KP_PLUS = _Anonymous_3.SDL_SCANCODE_KP_PLUS;
    enum SDL_SCANCODE_KP_ENTER = _Anonymous_3.SDL_SCANCODE_KP_ENTER;
    enum SDL_SCANCODE_KP_1 = _Anonymous_3.SDL_SCANCODE_KP_1;
    enum SDL_SCANCODE_KP_2 = _Anonymous_3.SDL_SCANCODE_KP_2;
    enum SDL_SCANCODE_KP_3 = _Anonymous_3.SDL_SCANCODE_KP_3;
    enum SDL_SCANCODE_KP_4 = _Anonymous_3.SDL_SCANCODE_KP_4;
    enum SDL_SCANCODE_KP_5 = _Anonymous_3.SDL_SCANCODE_KP_5;
    enum SDL_SCANCODE_KP_6 = _Anonymous_3.SDL_SCANCODE_KP_6;
    enum SDL_SCANCODE_KP_7 = _Anonymous_3.SDL_SCANCODE_KP_7;
    enum SDL_SCANCODE_KP_8 = _Anonymous_3.SDL_SCANCODE_KP_8;
    enum SDL_SCANCODE_KP_9 = _Anonymous_3.SDL_SCANCODE_KP_9;
    enum SDL_SCANCODE_KP_0 = _Anonymous_3.SDL_SCANCODE_KP_0;
    enum SDL_SCANCODE_KP_PERIOD = _Anonymous_3.SDL_SCANCODE_KP_PERIOD;
    enum SDL_SCANCODE_NONUSBACKSLASH = _Anonymous_3.SDL_SCANCODE_NONUSBACKSLASH;
    enum SDL_SCANCODE_APPLICATION = _Anonymous_3.SDL_SCANCODE_APPLICATION;
    enum SDL_SCANCODE_POWER = _Anonymous_3.SDL_SCANCODE_POWER;
    enum SDL_SCANCODE_KP_EQUALS = _Anonymous_3.SDL_SCANCODE_KP_EQUALS;
    enum SDL_SCANCODE_F13 = _Anonymous_3.SDL_SCANCODE_F13;
    enum SDL_SCANCODE_F14 = _Anonymous_3.SDL_SCANCODE_F14;
    enum SDL_SCANCODE_F15 = _Anonymous_3.SDL_SCANCODE_F15;
    enum SDL_SCANCODE_F16 = _Anonymous_3.SDL_SCANCODE_F16;
    enum SDL_SCANCODE_F17 = _Anonymous_3.SDL_SCANCODE_F17;
    enum SDL_SCANCODE_F18 = _Anonymous_3.SDL_SCANCODE_F18;
    enum SDL_SCANCODE_F19 = _Anonymous_3.SDL_SCANCODE_F19;
    enum SDL_SCANCODE_F20 = _Anonymous_3.SDL_SCANCODE_F20;
    enum SDL_SCANCODE_F21 = _Anonymous_3.SDL_SCANCODE_F21;
    enum SDL_SCANCODE_F22 = _Anonymous_3.SDL_SCANCODE_F22;
    enum SDL_SCANCODE_F23 = _Anonymous_3.SDL_SCANCODE_F23;
    enum SDL_SCANCODE_F24 = _Anonymous_3.SDL_SCANCODE_F24;
    enum SDL_SCANCODE_EXECUTE = _Anonymous_3.SDL_SCANCODE_EXECUTE;
    enum SDL_SCANCODE_HELP = _Anonymous_3.SDL_SCANCODE_HELP;
    enum SDL_SCANCODE_MENU = _Anonymous_3.SDL_SCANCODE_MENU;
    enum SDL_SCANCODE_SELECT = _Anonymous_3.SDL_SCANCODE_SELECT;
    enum SDL_SCANCODE_STOP = _Anonymous_3.SDL_SCANCODE_STOP;
    enum SDL_SCANCODE_AGAIN = _Anonymous_3.SDL_SCANCODE_AGAIN;
    enum SDL_SCANCODE_UNDO = _Anonymous_3.SDL_SCANCODE_UNDO;
    enum SDL_SCANCODE_CUT = _Anonymous_3.SDL_SCANCODE_CUT;
    enum SDL_SCANCODE_COPY = _Anonymous_3.SDL_SCANCODE_COPY;
    enum SDL_SCANCODE_PASTE = _Anonymous_3.SDL_SCANCODE_PASTE;
    enum SDL_SCANCODE_FIND = _Anonymous_3.SDL_SCANCODE_FIND;
    enum SDL_SCANCODE_MUTE = _Anonymous_3.SDL_SCANCODE_MUTE;
    enum SDL_SCANCODE_VOLUMEUP = _Anonymous_3.SDL_SCANCODE_VOLUMEUP;
    enum SDL_SCANCODE_VOLUMEDOWN = _Anonymous_3.SDL_SCANCODE_VOLUMEDOWN;
    enum SDL_SCANCODE_KP_COMMA = _Anonymous_3.SDL_SCANCODE_KP_COMMA;
    enum SDL_SCANCODE_KP_EQUALSAS400 = _Anonymous_3.SDL_SCANCODE_KP_EQUALSAS400;
    enum SDL_SCANCODE_INTERNATIONAL1 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL1;
    enum SDL_SCANCODE_INTERNATIONAL2 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL2;
    enum SDL_SCANCODE_INTERNATIONAL3 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL3;
    enum SDL_SCANCODE_INTERNATIONAL4 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL4;
    enum SDL_SCANCODE_INTERNATIONAL5 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL5;
    enum SDL_SCANCODE_INTERNATIONAL6 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL6;
    enum SDL_SCANCODE_INTERNATIONAL7 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL7;
    enum SDL_SCANCODE_INTERNATIONAL8 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL8;
    enum SDL_SCANCODE_INTERNATIONAL9 = _Anonymous_3.SDL_SCANCODE_INTERNATIONAL9;
    enum SDL_SCANCODE_LANG1 = _Anonymous_3.SDL_SCANCODE_LANG1;
    enum SDL_SCANCODE_LANG2 = _Anonymous_3.SDL_SCANCODE_LANG2;
    enum SDL_SCANCODE_LANG3 = _Anonymous_3.SDL_SCANCODE_LANG3;
    enum SDL_SCANCODE_LANG4 = _Anonymous_3.SDL_SCANCODE_LANG4;
    enum SDL_SCANCODE_LANG5 = _Anonymous_3.SDL_SCANCODE_LANG5;
    enum SDL_SCANCODE_LANG6 = _Anonymous_3.SDL_SCANCODE_LANG6;
    enum SDL_SCANCODE_LANG7 = _Anonymous_3.SDL_SCANCODE_LANG7;
    enum SDL_SCANCODE_LANG8 = _Anonymous_3.SDL_SCANCODE_LANG8;
    enum SDL_SCANCODE_LANG9 = _Anonymous_3.SDL_SCANCODE_LANG9;
    enum SDL_SCANCODE_ALTERASE = _Anonymous_3.SDL_SCANCODE_ALTERASE;
    enum SDL_SCANCODE_SYSREQ = _Anonymous_3.SDL_SCANCODE_SYSREQ;
    enum SDL_SCANCODE_CANCEL = _Anonymous_3.SDL_SCANCODE_CANCEL;
    enum SDL_SCANCODE_CLEAR = _Anonymous_3.SDL_SCANCODE_CLEAR;
    enum SDL_SCANCODE_PRIOR = _Anonymous_3.SDL_SCANCODE_PRIOR;
    enum SDL_SCANCODE_RETURN2 = _Anonymous_3.SDL_SCANCODE_RETURN2;
    enum SDL_SCANCODE_SEPARATOR = _Anonymous_3.SDL_SCANCODE_SEPARATOR;
    enum SDL_SCANCODE_OUT = _Anonymous_3.SDL_SCANCODE_OUT;
    enum SDL_SCANCODE_OPER = _Anonymous_3.SDL_SCANCODE_OPER;
    enum SDL_SCANCODE_CLEARAGAIN = _Anonymous_3.SDL_SCANCODE_CLEARAGAIN;
    enum SDL_SCANCODE_CRSEL = _Anonymous_3.SDL_SCANCODE_CRSEL;
    enum SDL_SCANCODE_EXSEL = _Anonymous_3.SDL_SCANCODE_EXSEL;
    enum SDL_SCANCODE_KP_00 = _Anonymous_3.SDL_SCANCODE_KP_00;
    enum SDL_SCANCODE_KP_000 = _Anonymous_3.SDL_SCANCODE_KP_000;
    enum SDL_SCANCODE_THOUSANDSSEPARATOR = _Anonymous_3.SDL_SCANCODE_THOUSANDSSEPARATOR;
    enum SDL_SCANCODE_DECIMALSEPARATOR = _Anonymous_3.SDL_SCANCODE_DECIMALSEPARATOR;
    enum SDL_SCANCODE_CURRENCYUNIT = _Anonymous_3.SDL_SCANCODE_CURRENCYUNIT;
    enum SDL_SCANCODE_CURRENCYSUBUNIT = _Anonymous_3.SDL_SCANCODE_CURRENCYSUBUNIT;
    enum SDL_SCANCODE_KP_LEFTPAREN = _Anonymous_3.SDL_SCANCODE_KP_LEFTPAREN;
    enum SDL_SCANCODE_KP_RIGHTPAREN = _Anonymous_3.SDL_SCANCODE_KP_RIGHTPAREN;
    enum SDL_SCANCODE_KP_LEFTBRACE = _Anonymous_3.SDL_SCANCODE_KP_LEFTBRACE;
    enum SDL_SCANCODE_KP_RIGHTBRACE = _Anonymous_3.SDL_SCANCODE_KP_RIGHTBRACE;
    enum SDL_SCANCODE_KP_TAB = _Anonymous_3.SDL_SCANCODE_KP_TAB;
    enum SDL_SCANCODE_KP_BACKSPACE = _Anonymous_3.SDL_SCANCODE_KP_BACKSPACE;
    enum SDL_SCANCODE_KP_A = _Anonymous_3.SDL_SCANCODE_KP_A;
    enum SDL_SCANCODE_KP_B = _Anonymous_3.SDL_SCANCODE_KP_B;
    enum SDL_SCANCODE_KP_C = _Anonymous_3.SDL_SCANCODE_KP_C;
    enum SDL_SCANCODE_KP_D = _Anonymous_3.SDL_SCANCODE_KP_D;
    enum SDL_SCANCODE_KP_E = _Anonymous_3.SDL_SCANCODE_KP_E;
    enum SDL_SCANCODE_KP_F = _Anonymous_3.SDL_SCANCODE_KP_F;
    enum SDL_SCANCODE_KP_XOR = _Anonymous_3.SDL_SCANCODE_KP_XOR;
    enum SDL_SCANCODE_KP_POWER = _Anonymous_3.SDL_SCANCODE_KP_POWER;
    enum SDL_SCANCODE_KP_PERCENT = _Anonymous_3.SDL_SCANCODE_KP_PERCENT;
    enum SDL_SCANCODE_KP_LESS = _Anonymous_3.SDL_SCANCODE_KP_LESS;
    enum SDL_SCANCODE_KP_GREATER = _Anonymous_3.SDL_SCANCODE_KP_GREATER;
    enum SDL_SCANCODE_KP_AMPERSAND = _Anonymous_3.SDL_SCANCODE_KP_AMPERSAND;
    enum SDL_SCANCODE_KP_DBLAMPERSAND = _Anonymous_3.SDL_SCANCODE_KP_DBLAMPERSAND;
    enum SDL_SCANCODE_KP_VERTICALBAR = _Anonymous_3.SDL_SCANCODE_KP_VERTICALBAR;
    enum SDL_SCANCODE_KP_DBLVERTICALBAR = _Anonymous_3.SDL_SCANCODE_KP_DBLVERTICALBAR;
    enum SDL_SCANCODE_KP_COLON = _Anonymous_3.SDL_SCANCODE_KP_COLON;
    enum SDL_SCANCODE_KP_HASH = _Anonymous_3.SDL_SCANCODE_KP_HASH;
    enum SDL_SCANCODE_KP_SPACE = _Anonymous_3.SDL_SCANCODE_KP_SPACE;
    enum SDL_SCANCODE_KP_AT = _Anonymous_3.SDL_SCANCODE_KP_AT;
    enum SDL_SCANCODE_KP_EXCLAM = _Anonymous_3.SDL_SCANCODE_KP_EXCLAM;
    enum SDL_SCANCODE_KP_MEMSTORE = _Anonymous_3.SDL_SCANCODE_KP_MEMSTORE;
    enum SDL_SCANCODE_KP_MEMRECALL = _Anonymous_3.SDL_SCANCODE_KP_MEMRECALL;
    enum SDL_SCANCODE_KP_MEMCLEAR = _Anonymous_3.SDL_SCANCODE_KP_MEMCLEAR;
    enum SDL_SCANCODE_KP_MEMADD = _Anonymous_3.SDL_SCANCODE_KP_MEMADD;
    enum SDL_SCANCODE_KP_MEMSUBTRACT = _Anonymous_3.SDL_SCANCODE_KP_MEMSUBTRACT;
    enum SDL_SCANCODE_KP_MEMMULTIPLY = _Anonymous_3.SDL_SCANCODE_KP_MEMMULTIPLY;
    enum SDL_SCANCODE_KP_MEMDIVIDE = _Anonymous_3.SDL_SCANCODE_KP_MEMDIVIDE;
    enum SDL_SCANCODE_KP_PLUSMINUS = _Anonymous_3.SDL_SCANCODE_KP_PLUSMINUS;
    enum SDL_SCANCODE_KP_CLEAR = _Anonymous_3.SDL_SCANCODE_KP_CLEAR;
    enum SDL_SCANCODE_KP_CLEARENTRY = _Anonymous_3.SDL_SCANCODE_KP_CLEARENTRY;
    enum SDL_SCANCODE_KP_BINARY = _Anonymous_3.SDL_SCANCODE_KP_BINARY;
    enum SDL_SCANCODE_KP_OCTAL = _Anonymous_3.SDL_SCANCODE_KP_OCTAL;
    enum SDL_SCANCODE_KP_DECIMAL = _Anonymous_3.SDL_SCANCODE_KP_DECIMAL;
    enum SDL_SCANCODE_KP_HEXADECIMAL = _Anonymous_3.SDL_SCANCODE_KP_HEXADECIMAL;
    enum SDL_SCANCODE_LCTRL = _Anonymous_3.SDL_SCANCODE_LCTRL;
    enum SDL_SCANCODE_LSHIFT = _Anonymous_3.SDL_SCANCODE_LSHIFT;
    enum SDL_SCANCODE_LALT = _Anonymous_3.SDL_SCANCODE_LALT;
    enum SDL_SCANCODE_LGUI = _Anonymous_3.SDL_SCANCODE_LGUI;
    enum SDL_SCANCODE_RCTRL = _Anonymous_3.SDL_SCANCODE_RCTRL;
    enum SDL_SCANCODE_RSHIFT = _Anonymous_3.SDL_SCANCODE_RSHIFT;
    enum SDL_SCANCODE_RALT = _Anonymous_3.SDL_SCANCODE_RALT;
    enum SDL_SCANCODE_RGUI = _Anonymous_3.SDL_SCANCODE_RGUI;
    enum SDL_SCANCODE_MODE = _Anonymous_3.SDL_SCANCODE_MODE;
    enum SDL_SCANCODE_AUDIONEXT = _Anonymous_3.SDL_SCANCODE_AUDIONEXT;
    enum SDL_SCANCODE_AUDIOPREV = _Anonymous_3.SDL_SCANCODE_AUDIOPREV;
    enum SDL_SCANCODE_AUDIOSTOP = _Anonymous_3.SDL_SCANCODE_AUDIOSTOP;
    enum SDL_SCANCODE_AUDIOPLAY = _Anonymous_3.SDL_SCANCODE_AUDIOPLAY;
    enum SDL_SCANCODE_AUDIOMUTE = _Anonymous_3.SDL_SCANCODE_AUDIOMUTE;
    enum SDL_SCANCODE_MEDIASELECT = _Anonymous_3.SDL_SCANCODE_MEDIASELECT;
    enum SDL_SCANCODE_WWW = _Anonymous_3.SDL_SCANCODE_WWW;
    enum SDL_SCANCODE_MAIL = _Anonymous_3.SDL_SCANCODE_MAIL;
    enum SDL_SCANCODE_CALCULATOR = _Anonymous_3.SDL_SCANCODE_CALCULATOR;
    enum SDL_SCANCODE_COMPUTER = _Anonymous_3.SDL_SCANCODE_COMPUTER;
    enum SDL_SCANCODE_AC_SEARCH = _Anonymous_3.SDL_SCANCODE_AC_SEARCH;
    enum SDL_SCANCODE_AC_HOME = _Anonymous_3.SDL_SCANCODE_AC_HOME;
    enum SDL_SCANCODE_AC_BACK = _Anonymous_3.SDL_SCANCODE_AC_BACK;
    enum SDL_SCANCODE_AC_FORWARD = _Anonymous_3.SDL_SCANCODE_AC_FORWARD;
    enum SDL_SCANCODE_AC_STOP = _Anonymous_3.SDL_SCANCODE_AC_STOP;
    enum SDL_SCANCODE_AC_REFRESH = _Anonymous_3.SDL_SCANCODE_AC_REFRESH;
    enum SDL_SCANCODE_AC_BOOKMARKS = _Anonymous_3.SDL_SCANCODE_AC_BOOKMARKS;
    enum SDL_SCANCODE_BRIGHTNESSDOWN = _Anonymous_3.SDL_SCANCODE_BRIGHTNESSDOWN;
    enum SDL_SCANCODE_BRIGHTNESSUP = _Anonymous_3.SDL_SCANCODE_BRIGHTNESSUP;
    enum SDL_SCANCODE_DISPLAYSWITCH = _Anonymous_3.SDL_SCANCODE_DISPLAYSWITCH;
    enum SDL_SCANCODE_KBDILLUMTOGGLE = _Anonymous_3.SDL_SCANCODE_KBDILLUMTOGGLE;
    enum SDL_SCANCODE_KBDILLUMDOWN = _Anonymous_3.SDL_SCANCODE_KBDILLUMDOWN;
    enum SDL_SCANCODE_KBDILLUMUP = _Anonymous_3.SDL_SCANCODE_KBDILLUMUP;
    enum SDL_SCANCODE_EJECT = _Anonymous_3.SDL_SCANCODE_EJECT;
    enum SDL_SCANCODE_SLEEP = _Anonymous_3.SDL_SCANCODE_SLEEP;
    enum SDL_SCANCODE_APP1 = _Anonymous_3.SDL_SCANCODE_APP1;
    enum SDL_SCANCODE_APP2 = _Anonymous_3.SDL_SCANCODE_APP2;
    enum SDL_SCANCODE_AUDIOREWIND = _Anonymous_3.SDL_SCANCODE_AUDIOREWIND;
    enum SDL_SCANCODE_AUDIOFASTFORWARD = _Anonymous_3.SDL_SCANCODE_AUDIOFASTFORWARD;
    enum SDL_SCANCODE_SOFTLEFT = _Anonymous_3.SDL_SCANCODE_SOFTLEFT;
    enum SDL_SCANCODE_SOFTRIGHT = _Anonymous_3.SDL_SCANCODE_SOFTRIGHT;
    enum SDL_SCANCODE_CALL = _Anonymous_3.SDL_SCANCODE_CALL;
    enum SDL_SCANCODE_ENDCALL = _Anonymous_3.SDL_SCANCODE_ENDCALL;
    enum SDL_NUM_SCANCODES = _Anonymous_3.SDL_NUM_SCANCODES;

    alias SDL_bool = _Anonymous_4;

    enum _Anonymous_4
    {

        SDL_FALSE = 0,

        SDL_TRUE = 1,
    }
    enum SDL_FALSE = _Anonymous_4.SDL_FALSE;
    enum SDL_TRUE = _Anonymous_4.SDL_TRUE;

    alias Sint8 = char;

    alias Uint8 = ubyte;

    alias Sint16 = short;

    alias Uint16 = ushort;

    alias Sint32 = int;

    alias Uint32 = uint;

    alias Sint64 = c_long;

    alias Uint64 = c_ulong;

    alias SDL_DUMMY_ENUM = _Anonymous_5;

    enum _Anonymous_5
    {

        DUMMY_ENUM_VALUE = 0,
    }
    enum DUMMY_ENUM_VALUE = _Anonymous_5.DUMMY_ENUM_VALUE;
    static if(!is(typeof(SDL_PRIX32))) {
        private enum enumMixinStr_SDL_PRIX32 = `enum SDL_PRIX32 = "X";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIX32); }))) {
            mixin(enumMixinStr_SDL_PRIX32);
        }
    }




    static if(!is(typeof(SDL_PRIx32))) {
        private enum enumMixinStr_SDL_PRIx32 = `enum SDL_PRIx32 = "x";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIx32); }))) {
            mixin(enumMixinStr_SDL_PRIx32);
        }
    }




    static if(!is(typeof(SDL_PRIu32))) {
        private enum enumMixinStr_SDL_PRIu32 = `enum SDL_PRIu32 = "u";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIu32); }))) {
            mixin(enumMixinStr_SDL_PRIu32);
        }
    }




    static if(!is(typeof(SDL_PRIs32))) {
        private enum enumMixinStr_SDL_PRIs32 = `enum SDL_PRIs32 = "d";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIs32); }))) {
            mixin(enumMixinStr_SDL_PRIs32);
        }
    }




    static if(!is(typeof(SDL_PRIX64))) {
        private enum enumMixinStr_SDL_PRIX64 = `enum SDL_PRIX64 = "lX";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIX64); }))) {
            mixin(enumMixinStr_SDL_PRIX64);
        }
    }




    static if(!is(typeof(SDL_PRIx64))) {
        private enum enumMixinStr_SDL_PRIx64 = `enum SDL_PRIx64 = "lx";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIx64); }))) {
            mixin(enumMixinStr_SDL_PRIx64);
        }
    }




    static if(!is(typeof(SDL_PRIu64))) {
        private enum enumMixinStr_SDL_PRIu64 = `enum SDL_PRIu64 = "lu";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIu64); }))) {
            mixin(enumMixinStr_SDL_PRIu64);
        }
    }




    static if(!is(typeof(SDL_PRIs64))) {
        private enum enumMixinStr_SDL_PRIs64 = `enum SDL_PRIs64 = "ld";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRIs64); }))) {
            mixin(enumMixinStr_SDL_PRIs64);
        }
    }




    static if(!is(typeof(SDL_FLT_EPSILON))) {
        private enum enumMixinStr_SDL_FLT_EPSILON = `enum SDL_FLT_EPSILON = 1.1920928955078125e-07F;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FLT_EPSILON); }))) {
            mixin(enumMixinStr_SDL_FLT_EPSILON);
        }
    }




    static if(!is(typeof(SDL_MIN_UINT64))) {
        private enum enumMixinStr_SDL_MIN_UINT64 = `enum SDL_MIN_UINT64 = ( cast( Uint64 ) ( 0x0000000000000000LU ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_UINT64); }))) {
            mixin(enumMixinStr_SDL_MIN_UINT64);
        }
    }




    static if(!is(typeof(SDL_MAX_UINT64))) {
        private enum enumMixinStr_SDL_MAX_UINT64 = `enum SDL_MAX_UINT64 = ( cast( Uint64 ) 0xFFFFFFFFFFFFFFFFLU );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_UINT64); }))) {
            mixin(enumMixinStr_SDL_MAX_UINT64);
        }
    }




    static if(!is(typeof(SDL_MIN_SINT64))) {
        private enum enumMixinStr_SDL_MIN_SINT64 = `enum SDL_MIN_SINT64 = ( cast( Sint64 ) ( ~ 0x7FFFFFFFFFFFFFFFL ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_SINT64); }))) {
            mixin(enumMixinStr_SDL_MIN_SINT64);
        }
    }




    static if(!is(typeof(SDL_MAX_SINT64))) {
        private enum enumMixinStr_SDL_MAX_SINT64 = `enum SDL_MAX_SINT64 = ( cast( Sint64 ) 0x7FFFFFFFFFFFFFFFL );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_SINT64); }))) {
            mixin(enumMixinStr_SDL_MAX_SINT64);
        }
    }




    static if(!is(typeof(SDL_MIN_UINT32))) {
        private enum enumMixinStr_SDL_MIN_UINT32 = `enum SDL_MIN_UINT32 = ( cast( Uint32 ) 0x00000000 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_UINT32); }))) {
            mixin(enumMixinStr_SDL_MIN_UINT32);
        }
    }




    static if(!is(typeof(SDL_MAX_UINT32))) {
        private enum enumMixinStr_SDL_MAX_UINT32 = `enum SDL_MAX_UINT32 = ( cast( Uint32 ) 0xFFFFFFFFu );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_UINT32); }))) {
            mixin(enumMixinStr_SDL_MAX_UINT32);
        }
    }




    static if(!is(typeof(SDL_MIN_SINT32))) {
        private enum enumMixinStr_SDL_MIN_SINT32 = `enum SDL_MIN_SINT32 = ( cast( Sint32 ) ( ~ 0x7FFFFFFF ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_SINT32); }))) {
            mixin(enumMixinStr_SDL_MIN_SINT32);
        }
    }




    static if(!is(typeof(SDL_MAX_SINT32))) {
        private enum enumMixinStr_SDL_MAX_SINT32 = `enum SDL_MAX_SINT32 = ( cast( Sint32 ) 0x7FFFFFFF );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_SINT32); }))) {
            mixin(enumMixinStr_SDL_MAX_SINT32);
        }
    }




    static if(!is(typeof(SDL_MIN_UINT16))) {
        private enum enumMixinStr_SDL_MIN_UINT16 = `enum SDL_MIN_UINT16 = ( cast( Uint16 ) 0x0000 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_UINT16); }))) {
            mixin(enumMixinStr_SDL_MIN_UINT16);
        }
    }




    static if(!is(typeof(SDL_MAX_UINT16))) {
        private enum enumMixinStr_SDL_MAX_UINT16 = `enum SDL_MAX_UINT16 = ( cast( Uint16 ) 0xFFFF );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_UINT16); }))) {
            mixin(enumMixinStr_SDL_MAX_UINT16);
        }
    }




    static if(!is(typeof(SDL_MIN_SINT16))) {
        private enum enumMixinStr_SDL_MIN_SINT16 = `enum SDL_MIN_SINT16 = ( cast( Sint16 ) ( ~ 0x7FFF ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_SINT16); }))) {
            mixin(enumMixinStr_SDL_MIN_SINT16);
        }
    }




    static if(!is(typeof(SDL_MAX_SINT16))) {
        private enum enumMixinStr_SDL_MAX_SINT16 = `enum SDL_MAX_SINT16 = ( cast( Sint16 ) 0x7FFF );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_SINT16); }))) {
            mixin(enumMixinStr_SDL_MAX_SINT16);
        }
    }




    static if(!is(typeof(SDL_MIN_UINT8))) {
        private enum enumMixinStr_SDL_MIN_UINT8 = `enum SDL_MIN_UINT8 = ( cast( Uint8 ) 0x00 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_UINT8); }))) {
            mixin(enumMixinStr_SDL_MIN_UINT8);
        }
    }




    static if(!is(typeof(SDL_MAX_UINT8))) {
        private enum enumMixinStr_SDL_MAX_UINT8 = `enum SDL_MAX_UINT8 = ( cast( Uint8 ) 0xFF );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_UINT8); }))) {
            mixin(enumMixinStr_SDL_MAX_UINT8);
        }
    }




    static if(!is(typeof(SDL_MIN_SINT8))) {
        private enum enumMixinStr_SDL_MIN_SINT8 = `enum SDL_MIN_SINT8 = ( cast( Sint8 ) ( ~ 0x7F ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIN_SINT8); }))) {
            mixin(enumMixinStr_SDL_MIN_SINT8);
        }
    }




    static if(!is(typeof(SDL_MAX_SINT8))) {
        private enum enumMixinStr_SDL_MAX_SINT8 = `enum SDL_MAX_SINT8 = ( cast( Sint8 ) 0x7F );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_SINT8); }))) {
            mixin(enumMixinStr_SDL_MAX_SINT8);
        }
    }
    static if(!is(typeof(SDL_SIZE_MAX))) {
        private enum enumMixinStr_SDL_SIZE_MAX = `enum SDL_SIZE_MAX = ( cast( size_t ) - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SIZE_MAX); }))) {
            mixin(enumMixinStr_SDL_SIZE_MAX);
        }
    }




    static if(!is(typeof(alloca))) {
        private enum enumMixinStr_alloca = `enum alloca = __builtin_alloca;`;
        static if(is(typeof({ mixin(enumMixinStr_alloca); }))) {
            mixin(enumMixinStr_alloca);
        }
    }
    static if(!is(typeof(SDL_WINDOW_LACKS_SHAPE))) {
        private enum enumMixinStr_SDL_WINDOW_LACKS_SHAPE = `enum SDL_WINDOW_LACKS_SHAPE = - 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOW_LACKS_SHAPE); }))) {
            mixin(enumMixinStr_SDL_WINDOW_LACKS_SHAPE);
        }
    }




    static if(!is(typeof(SDL_INVALID_SHAPE_ARGUMENT))) {
        private enum enumMixinStr_SDL_INVALID_SHAPE_ARGUMENT = `enum SDL_INVALID_SHAPE_ARGUMENT = - 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_INVALID_SHAPE_ARGUMENT); }))) {
            mixin(enumMixinStr_SDL_INVALID_SHAPE_ARGUMENT);
        }
    }




    static if(!is(typeof(SDL_NONSHAPEABLE_WINDOW))) {
        private enum enumMixinStr_SDL_NONSHAPEABLE_WINDOW = `enum SDL_NONSHAPEABLE_WINDOW = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NONSHAPEABLE_WINDOW); }))) {
            mixin(enumMixinStr_SDL_NONSHAPEABLE_WINDOW);
        }
    }






    static if(!is(typeof(SDL_STANDARD_GRAVITY))) {
        private enum enumMixinStr_SDL_STANDARD_GRAVITY = `enum SDL_STANDARD_GRAVITY = 9.80665f;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_STANDARD_GRAVITY); }))) {
            mixin(enumMixinStr_SDL_STANDARD_GRAVITY);
        }
    }
    static if(!is(typeof(SDL_RW_SEEK_END))) {
        private enum enumMixinStr_SDL_RW_SEEK_END = `enum SDL_RW_SEEK_END = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RW_SEEK_END); }))) {
            mixin(enumMixinStr_SDL_RW_SEEK_END);
        }
    }




    static if(!is(typeof(SDL_RW_SEEK_CUR))) {
        private enum enumMixinStr_SDL_RW_SEEK_CUR = `enum SDL_RW_SEEK_CUR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RW_SEEK_CUR); }))) {
            mixin(enumMixinStr_SDL_RW_SEEK_CUR);
        }
    }




    static if(!is(typeof(SDL_RW_SEEK_SET))) {
        private enum enumMixinStr_SDL_RW_SEEK_SET = `enum SDL_RW_SEEK_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RW_SEEK_SET); }))) {
            mixin(enumMixinStr_SDL_RW_SEEK_SET);
        }
    }




    static if(!is(typeof(SDL_RWOPS_MEMORY_RO))) {
        private enum enumMixinStr_SDL_RWOPS_MEMORY_RO = `enum SDL_RWOPS_MEMORY_RO = 5U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_MEMORY_RO); }))) {
            mixin(enumMixinStr_SDL_RWOPS_MEMORY_RO);
        }
    }




    static if(!is(typeof(SDL_RWOPS_MEMORY))) {
        private enum enumMixinStr_SDL_RWOPS_MEMORY = `enum SDL_RWOPS_MEMORY = 4U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_MEMORY); }))) {
            mixin(enumMixinStr_SDL_RWOPS_MEMORY);
        }
    }




    static if(!is(typeof(SDL_RWOPS_JNIFILE))) {
        private enum enumMixinStr_SDL_RWOPS_JNIFILE = `enum SDL_RWOPS_JNIFILE = 3U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_JNIFILE); }))) {
            mixin(enumMixinStr_SDL_RWOPS_JNIFILE);
        }
    }




    static if(!is(typeof(SDL_RWOPS_STDFILE))) {
        private enum enumMixinStr_SDL_RWOPS_STDFILE = `enum SDL_RWOPS_STDFILE = 2U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_STDFILE); }))) {
            mixin(enumMixinStr_SDL_RWOPS_STDFILE);
        }
    }




    static if(!is(typeof(SDL_RWOPS_WINFILE))) {
        private enum enumMixinStr_SDL_RWOPS_WINFILE = `enum SDL_RWOPS_WINFILE = 1U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_WINFILE); }))) {
            mixin(enumMixinStr_SDL_RWOPS_WINFILE);
        }
    }




    static if(!is(typeof(SDL_RWOPS_UNKNOWN))) {
        private enum enumMixinStr_SDL_RWOPS_UNKNOWN = `enum SDL_RWOPS_UNKNOWN = 0U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RWOPS_UNKNOWN); }))) {
            mixin(enumMixinStr_SDL_RWOPS_UNKNOWN);
        }
    }
    static if(!is(typeof(__LINUX__))) {
        private enum enumMixinStr___LINUX__ = `enum __LINUX__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___LINUX__); }))) {
            mixin(enumMixinStr___LINUX__);
        }
    }
    static if(!is(typeof(SDL_Colour))) {
        private enum enumMixinStr_SDL_Colour = `enum SDL_Colour = SDL_Color;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_Colour); }))) {
            mixin(enumMixinStr_SDL_Colour);
        }
    }
    static if(!is(typeof(SDL_ALPHA_TRANSPARENT))) {
        private enum enumMixinStr_SDL_ALPHA_TRANSPARENT = `enum SDL_ALPHA_TRANSPARENT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ALPHA_TRANSPARENT); }))) {
            mixin(enumMixinStr_SDL_ALPHA_TRANSPARENT);
        }
    }




    static if(!is(typeof(SDL_ALPHA_OPAQUE))) {
        private enum enumMixinStr_SDL_ALPHA_OPAQUE = `enum SDL_ALPHA_OPAQUE = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ALPHA_OPAQUE); }))) {
            mixin(enumMixinStr_SDL_ALPHA_OPAQUE);
        }
    }




    static if(!is(typeof(SDL_PI_D))) {
        private enum enumMixinStr_SDL_PI_D = `enum SDL_PI_D = 3.141592653589793238462643383279502884;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PI_D); }))) {
            mixin(enumMixinStr_SDL_PI_D);
        }
    }




    static if(!is(typeof(SDL_PI_F))) {
        private enum enumMixinStr_SDL_PI_F = `enum SDL_PI_F = 3.141592653589793238462643383279502884F;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PI_F); }))) {
            mixin(enumMixinStr_SDL_PI_F);
        }
    }






    static if(!is(typeof(SDL_WINDOW_INPUT_GRABBED))) {
        private enum enumMixinStr_SDL_WINDOW_INPUT_GRABBED = `enum SDL_WINDOW_INPUT_GRABBED = SDL_WINDOW_INPUT_GRABBED_renamed_SDL_WINDOW_MOUSE_GRABBED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOW_INPUT_GRABBED); }))) {
            mixin(enumMixinStr_SDL_WINDOW_INPUT_GRABBED);
        }
    }




    static if(!is(typeof(SDL_SetWindowDisplayMode))) {
        private enum enumMixinStr_SDL_SetWindowDisplayMode = `enum SDL_SetWindowDisplayMode = SDL_SetWindowDisplayMode_renamed_SDL_SetWindowFullscreenMode;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SetWindowDisplayMode); }))) {
            mixin(enumMixinStr_SDL_SetWindowDisplayMode);
        }
    }




    static if(!is(typeof(SDL_IsScreenSaverEnabled))) {
        private enum enumMixinStr_SDL_IsScreenSaverEnabled = `enum SDL_IsScreenSaverEnabled = SDL_IsScreenSaverEnabled_renamed_SDL_ScreenSaverEnabled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IsScreenSaverEnabled); }))) {
            mixin(enumMixinStr_SDL_IsScreenSaverEnabled);
        }
    }




    static if(!is(typeof(SDL_GetWindowDisplayMode))) {
        private enum enumMixinStr_SDL_GetWindowDisplayMode = `enum SDL_GetWindowDisplayMode = SDL_GetWindowDisplayMode_renamed_SDL_GetWindowFullscreenMode;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetWindowDisplayMode); }))) {
            mixin(enumMixinStr_SDL_GetWindowDisplayMode);
        }
    }




    static if(!is(typeof(SDL_GetWindowDisplayIndex))) {
        private enum enumMixinStr_SDL_GetWindowDisplayIndex = `enum SDL_GetWindowDisplayIndex = SDL_GetWindowDisplayIndex_renamed_SDL_GetDisplayForWindow;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetWindowDisplayIndex); }))) {
            mixin(enumMixinStr_SDL_GetWindowDisplayIndex);
        }
    }




    static if(!is(typeof(SDL_GetRectDisplayIndex))) {
        private enum enumMixinStr_SDL_GetRectDisplayIndex = `enum SDL_GetRectDisplayIndex = SDL_GetRectDisplayIndex_renamed_SDL_GetDisplayForRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetRectDisplayIndex); }))) {
            mixin(enumMixinStr_SDL_GetRectDisplayIndex);
        }
    }




    static if(!is(typeof(SDL_GetPointDisplayIndex))) {
        private enum enumMixinStr_SDL_GetPointDisplayIndex = `enum SDL_GetPointDisplayIndex = SDL_GetPointDisplayIndex_renamed_SDL_GetDisplayForPoint;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetPointDisplayIndex); }))) {
            mixin(enumMixinStr_SDL_GetPointDisplayIndex);
        }
    }




    static if(!is(typeof(SDL_GetClosestDisplayMode))) {
        private enum enumMixinStr_SDL_GetClosestDisplayMode = `enum SDL_GetClosestDisplayMode = SDL_GetClosestDisplayMode_renamed_SDL_GetClosestFullscreenDisplayMode;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetClosestDisplayMode); }))) {
            mixin(enumMixinStr_SDL_GetClosestDisplayMode);
        }
    }




    static if(!is(typeof(SDL_GetTicks64))) {
        private enum enumMixinStr_SDL_GetTicks64 = `enum SDL_GetTicks64 = SDL_GetTicks64_renamed_SDL_GetTicks;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetTicks64); }))) {
            mixin(enumMixinStr_SDL_GetTicks64);
        }
    }




    static if(!is(typeof(SDL_RenderGetD3D9Device))) {
        private enum enumMixinStr_SDL_RenderGetD3D9Device = `enum SDL_RenderGetD3D9Device = SDL_RenderGetD3D9Device_renamed_SDL_GetRenderD3D9Device;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetD3D9Device); }))) {
            mixin(enumMixinStr_SDL_RenderGetD3D9Device);
        }
    }




    static if(!is(typeof(SDL_RenderGetD3D11Device))) {
        private enum enumMixinStr_SDL_RenderGetD3D11Device = `enum SDL_RenderGetD3D11Device = SDL_RenderGetD3D11Device_renamed_SDL_GetRenderD3D11Device;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetD3D11Device); }))) {
            mixin(enumMixinStr_SDL_RenderGetD3D11Device);
        }
    }




    static if(!is(typeof(SDL_UpperBlitScaled))) {
        private enum enumMixinStr_SDL_UpperBlitScaled = `enum SDL_UpperBlitScaled = SDL_UpperBlitScaled_renamed_SDL_BlitSurfaceScaled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_UpperBlitScaled); }))) {
            mixin(enumMixinStr_SDL_UpperBlitScaled);
        }
    }




    static if(!is(typeof(SDL_UpperBlit))) {
        private enum enumMixinStr_SDL_UpperBlit = `enum SDL_UpperBlit = SDL_UpperBlit_renamed_SDL_BlitSurface;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_UpperBlit); }))) {
            mixin(enumMixinStr_SDL_UpperBlit);
        }
    }




    static if(!is(typeof(SDL_SetColorKey))) {
        private enum enumMixinStr_SDL_SetColorKey = `enum SDL_SetColorKey = SDL_SetColorKey_renamed_SDL_SetSurfaceColorKey;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SetColorKey); }))) {
            mixin(enumMixinStr_SDL_SetColorKey);
        }
    }




    static if(!is(typeof(SDL_SetClipRect))) {
        private enum enumMixinStr_SDL_SetClipRect = `enum SDL_SetClipRect = SDL_SetClipRect_renamed_SDL_SetSurfaceClipRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SetClipRect); }))) {
            mixin(enumMixinStr_SDL_SetClipRect);
        }
    }




    static if(!is(typeof(SDL_LowerBlitScaled))) {
        private enum enumMixinStr_SDL_LowerBlitScaled = `enum SDL_LowerBlitScaled = SDL_LowerBlitScaled_renamed_SDL_BlitSurfaceUncheckedScaled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LowerBlitScaled); }))) {
            mixin(enumMixinStr_SDL_LowerBlitScaled);
        }
    }




    static if(!is(typeof(SDL_LowerBlit))) {
        private enum enumMixinStr_SDL_LowerBlit = `enum SDL_LowerBlit = SDL_LowerBlit_renamed_SDL_BlitSurfaceUnchecked;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LowerBlit); }))) {
            mixin(enumMixinStr_SDL_LowerBlit);
        }
    }




    static if(!is(typeof(SDL_HasSurfaceRLE))) {
        private enum enumMixinStr_SDL_HasSurfaceRLE = `enum SDL_HasSurfaceRLE = SDL_HasSurfaceRLE_renamed_SDL_SurfaceHasRLE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HasSurfaceRLE); }))) {
            mixin(enumMixinStr_SDL_HasSurfaceRLE);
        }
    }




    static if(!is(typeof(SDL_HasColorKey))) {
        private enum enumMixinStr_SDL_HasColorKey = `enum SDL_HasColorKey = SDL_HasColorKey_renamed_SDL_SurfaceHasColorKey;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HasColorKey); }))) {
            mixin(enumMixinStr_SDL_HasColorKey);
        }
    }




    static if(!is(typeof(SDL_GetColorKey))) {
        private enum enumMixinStr_SDL_GetColorKey = `enum SDL_GetColorKey = SDL_GetColorKey_renamed_SDL_GetSurfaceColorKey;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetColorKey); }))) {
            mixin(enumMixinStr_SDL_GetColorKey);
        }
    }




    static if(!is(typeof(SDL_GetClipRect))) {
        private enum enumMixinStr_SDL_GetClipRect = `enum SDL_GetClipRect = SDL_GetClipRect_renamed_SDL_GetSurfaceClipRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetClipRect); }))) {
            mixin(enumMixinStr_SDL_GetClipRect);
        }
    }




    static if(!is(typeof(SDL_FreeSurface))) {
        private enum enumMixinStr_SDL_FreeSurface = `enum SDL_FreeSurface = SDL_FreeSurface_renamed_SDL_DestroySurface;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeSurface); }))) {
            mixin(enumMixinStr_SDL_FreeSurface);
        }
    }




    static if(!is(typeof(SDL_FillRects))) {
        private enum enumMixinStr_SDL_FillRects = `enum SDL_FillRects = SDL_FillRects_renamed_SDL_FillSurfaceRects;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FillRects); }))) {
            mixin(enumMixinStr_SDL_FillRects);
        }
    }




    static if(!is(typeof(SDL_FillRect))) {
        private enum enumMixinStr_SDL_FillRect = `enum SDL_FillRect = SDL_FillRect_renamed_SDL_FillSurfaceRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FillRect); }))) {
            mixin(enumMixinStr_SDL_FillRect);
        }
    }




    static if(!is(typeof(SDL_SensorUpdate))) {
        private enum enumMixinStr_SDL_SensorUpdate = `enum SDL_SensorUpdate = SDL_SensorUpdate_renamed_SDL_UpdateSensors;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorUpdate); }))) {
            mixin(enumMixinStr_SDL_SensorUpdate);
        }
    }




    static if(!is(typeof(SDL_SensorOpen))) {
        private enum enumMixinStr_SDL_SensorOpen = `enum SDL_SensorOpen = SDL_SensorOpen_renamed_SDL_OpenSensor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorOpen); }))) {
            mixin(enumMixinStr_SDL_SensorOpen);
        }
    }




    static if(!is(typeof(SDL_SensorGetType))) {
        private enum enumMixinStr_SDL_SensorGetType = `enum SDL_SensorGetType = SDL_SensorGetType_renamed_SDL_GetSensorType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorGetType); }))) {
            mixin(enumMixinStr_SDL_SensorGetType);
        }
    }




    static if(!is(typeof(SDL_SensorGetNonPortableType))) {
        private enum enumMixinStr_SDL_SensorGetNonPortableType = `enum SDL_SensorGetNonPortableType = SDL_SensorGetNonPortableType_renamed_SDL_GetSensorNonPortableType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorGetNonPortableType); }))) {
            mixin(enumMixinStr_SDL_SensorGetNonPortableType);
        }
    }




    static if(!is(typeof(SDL_SensorGetName))) {
        private enum enumMixinStr_SDL_SensorGetName = `enum SDL_SensorGetName = SDL_SensorGetName_renamed_SDL_GetSensorName;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorGetName); }))) {
            mixin(enumMixinStr_SDL_SensorGetName);
        }
    }




    static if(!is(typeof(SDL_SensorGetInstanceID))) {
        private enum enumMixinStr_SDL_SensorGetInstanceID = `enum SDL_SensorGetInstanceID = SDL_SensorGetInstanceID_renamed_SDL_GetSensorInstanceID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorGetInstanceID); }))) {
            mixin(enumMixinStr_SDL_SensorGetInstanceID);
        }
    }




    static if(!is(typeof(SDL_SensorGetData))) {
        private enum enumMixinStr_SDL_SensorGetData = `enum SDL_SensorGetData = SDL_SensorGetData_renamed_SDL_GetSensorData;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorGetData); }))) {
            mixin(enumMixinStr_SDL_SensorGetData);
        }
    }




    static if(!is(typeof(SDL_SensorFromInstanceID))) {
        private enum enumMixinStr_SDL_SensorFromInstanceID = `enum SDL_SensorFromInstanceID = SDL_SensorFromInstanceID_renamed_SDL_GetSensorFromInstanceID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorFromInstanceID); }))) {
            mixin(enumMixinStr_SDL_SensorFromInstanceID);
        }
    }




    static if(!is(typeof(SDL_SensorClose))) {
        private enum enumMixinStr_SDL_SensorClose = `enum SDL_SensorClose = SDL_SensorClose_renamed_SDL_CloseSensor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SensorClose); }))) {
            mixin(enumMixinStr_SDL_SensorClose);
        }
    }




    static if(!is(typeof(SDL_FreeRW))) {
        private enum enumMixinStr_SDL_FreeRW = `enum SDL_FreeRW = SDL_FreeRW_renamed_SDL_DestroyRW;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeRW); }))) {
            mixin(enumMixinStr_SDL_FreeRW);
        }
    }




    static if(!is(typeof(SDL_AllocRW))) {
        private enum enumMixinStr_SDL_AllocRW = `enum SDL_AllocRW = SDL_AllocRW_renamed_SDL_CreateRW;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AllocRW); }))) {
            mixin(enumMixinStr_SDL_AllocRW);
        }
    }




    static if(!is(typeof(RW_SEEK_SET))) {
        private enum enumMixinStr_RW_SEEK_SET = `enum RW_SEEK_SET = RW_SEEK_SET_renamed_SDL_RW_SEEK_SET;`;
        static if(is(typeof({ mixin(enumMixinStr_RW_SEEK_SET); }))) {
            mixin(enumMixinStr_RW_SEEK_SET);
        }
    }




    static if(!is(typeof(RW_SEEK_END))) {
        private enum enumMixinStr_RW_SEEK_END = `enum RW_SEEK_END = RW_SEEK_END_renamed_SDL_RW_SEEK_END;`;
        static if(is(typeof({ mixin(enumMixinStr_RW_SEEK_END); }))) {
            mixin(enumMixinStr_RW_SEEK_END);
        }
    }




    static if(!is(typeof(RW_SEEK_CUR))) {
        private enum enumMixinStr_RW_SEEK_CUR = `enum RW_SEEK_CUR = RW_SEEK_CUR_renamed_SDL_RW_SEEK_CUR;`;
        static if(is(typeof({ mixin(enumMixinStr_RW_SEEK_CUR); }))) {
            mixin(enumMixinStr_RW_SEEK_CUR);
        }
    }




    static if(!is(typeof(SDL_ScaleModeNearest))) {
        private enum enumMixinStr_SDL_ScaleModeNearest = `enum SDL_ScaleModeNearest = SDL_ScaleModeNearest_renamed_SDL_SCALEMODE_NEAREST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ScaleModeNearest); }))) {
            mixin(enumMixinStr_SDL_ScaleModeNearest);
        }
    }




    static if(!is(typeof(SDL_ScaleModeLinear))) {
        private enum enumMixinStr_SDL_ScaleModeLinear = `enum SDL_ScaleModeLinear = SDL_ScaleModeLinear_renamed_SDL_SCALEMODE_LINEAR;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ScaleModeLinear); }))) {
            mixin(enumMixinStr_SDL_ScaleModeLinear);
        }
    }




    static if(!is(typeof(SDL_ScaleModeBest))) {
        private enum enumMixinStr_SDL_ScaleModeBest = `enum SDL_ScaleModeBest = SDL_ScaleModeBest_renamed_SDL_SCALEMODE_BEST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ScaleModeBest); }))) {
            mixin(enumMixinStr_SDL_ScaleModeBest);
        }
    }




    static if(!is(typeof(SDL_RenderWindowToLogical))) {
        private enum enumMixinStr_SDL_RenderWindowToLogical = `enum SDL_RenderWindowToLogical = SDL_RenderWindowToLogical_renamed_SDL_RenderCoordinatesFromWindow;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderWindowToLogical); }))) {
            mixin(enumMixinStr_SDL_RenderWindowToLogical);
        }
    }




    static if(!is(typeof(SDL_RenderSetViewport))) {
        private enum enumMixinStr_SDL_RenderSetViewport = `enum SDL_RenderSetViewport = SDL_RenderSetViewport_renamed_SDL_SetRenderViewport;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderSetViewport); }))) {
            mixin(enumMixinStr_SDL_RenderSetViewport);
        }
    }




    static if(!is(typeof(SDL_RenderSetVSync))) {
        private enum enumMixinStr_SDL_RenderSetVSync = `enum SDL_RenderSetVSync = SDL_RenderSetVSync_renamed_SDL_SetRenderVSync;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderSetVSync); }))) {
            mixin(enumMixinStr_SDL_RenderSetVSync);
        }
    }




    static if(!is(typeof(SDL_RenderSetScale))) {
        private enum enumMixinStr_SDL_RenderSetScale = `enum SDL_RenderSetScale = SDL_RenderSetScale_renamed_SDL_SetRenderScale;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderSetScale); }))) {
            mixin(enumMixinStr_SDL_RenderSetScale);
        }
    }




    static if(!is(typeof(SDL_RenderSetLogicalSize))) {
        private enum enumMixinStr_SDL_RenderSetLogicalSize = `enum SDL_RenderSetLogicalSize = SDL_RenderSetLogicalSize_renamed_SDL_SetRenderLogicalPresentation;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderSetLogicalSize); }))) {
            mixin(enumMixinStr_SDL_RenderSetLogicalSize);
        }
    }




    static if(!is(typeof(SDL_RenderSetClipRect))) {
        private enum enumMixinStr_SDL_RenderSetClipRect = `enum SDL_RenderSetClipRect = SDL_RenderSetClipRect_renamed_SDL_SetRenderClipRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderSetClipRect); }))) {
            mixin(enumMixinStr_SDL_RenderSetClipRect);
        }
    }




    static if(!is(typeof(SDL_RenderLogicalToWindow))) {
        private enum enumMixinStr_SDL_RenderLogicalToWindow = `enum SDL_RenderLogicalToWindow = SDL_RenderLogicalToWindow_renamed_SDL_RenderCoordinatesToWindow;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderLogicalToWindow); }))) {
            mixin(enumMixinStr_SDL_RenderLogicalToWindow);
        }
    }




    static if(!is(typeof(SDL_RenderIsClipEnabled))) {
        private enum enumMixinStr_SDL_RenderIsClipEnabled = `enum SDL_RenderIsClipEnabled = SDL_RenderIsClipEnabled_renamed_SDL_RenderClipEnabled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderIsClipEnabled); }))) {
            mixin(enumMixinStr_SDL_RenderIsClipEnabled);
        }
    }




    static if(!is(typeof(SDL_RenderGetWindow))) {
        private enum enumMixinStr_SDL_RenderGetWindow = `enum SDL_RenderGetWindow = SDL_RenderGetWindow_renamed_SDL_GetRenderWindow;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetWindow); }))) {
            mixin(enumMixinStr_SDL_RenderGetWindow);
        }
    }




    static if(!is(typeof(SDL_RenderGetViewport))) {
        private enum enumMixinStr_SDL_RenderGetViewport = `enum SDL_RenderGetViewport = SDL_RenderGetViewport_renamed_SDL_GetRenderViewport;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetViewport); }))) {
            mixin(enumMixinStr_SDL_RenderGetViewport);
        }
    }




    static if(!is(typeof(SDL_RenderGetScale))) {
        private enum enumMixinStr_SDL_RenderGetScale = `enum SDL_RenderGetScale = SDL_RenderGetScale_renamed_SDL_GetRenderScale;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetScale); }))) {
            mixin(enumMixinStr_SDL_RenderGetScale);
        }
    }




    static if(!is(typeof(SDL_RenderGetMetalLayer))) {
        private enum enumMixinStr_SDL_RenderGetMetalLayer = `enum SDL_RenderGetMetalLayer = SDL_RenderGetMetalLayer_renamed_SDL_GetRenderMetalLayer;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetMetalLayer); }))) {
            mixin(enumMixinStr_SDL_RenderGetMetalLayer);
        }
    }




    static if(!is(typeof(SDL_RenderGetMetalCommandEncoder))) {
        private enum enumMixinStr_SDL_RenderGetMetalCommandEncoder = `enum SDL_RenderGetMetalCommandEncoder = SDL_RenderGetMetalCommandEncoder_renamed_SDL_GetRenderMetalCommandEncoder;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetMetalCommandEncoder); }))) {
            mixin(enumMixinStr_SDL_RenderGetMetalCommandEncoder);
        }
    }




    static if(!is(typeof(SDL_RenderGetLogicalSize))) {
        private enum enumMixinStr_SDL_RenderGetLogicalSize = `enum SDL_RenderGetLogicalSize = SDL_RenderGetLogicalSize_renamed_SDL_GetRenderLogicalPresentation;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetLogicalSize); }))) {
            mixin(enumMixinStr_SDL_RenderGetLogicalSize);
        }
    }




    static if(!is(typeof(SDL_RenderGetClipRect))) {
        private enum enumMixinStr_SDL_RenderGetClipRect = `enum SDL_RenderGetClipRect = SDL_RenderGetClipRect_renamed_SDL_GetRenderClipRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderGetClipRect); }))) {
            mixin(enumMixinStr_SDL_RenderGetClipRect);
        }
    }




    static if(!is(typeof(SDL_RenderFillRectsF))) {
        private enum enumMixinStr_SDL_RenderFillRectsF = `enum SDL_RenderFillRectsF = SDL_RenderFillRectsF_renamed_SDL_RenderFillRects;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderFillRectsF); }))) {
            mixin(enumMixinStr_SDL_RenderFillRectsF);
        }
    }




    static if(!is(typeof(SDL_RenderFillRectF))) {
        private enum enumMixinStr_SDL_RenderFillRectF = `enum SDL_RenderFillRectF = SDL_RenderFillRectF_renamed_SDL_RenderFillRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderFillRectF); }))) {
            mixin(enumMixinStr_SDL_RenderFillRectF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawRectsF))) {
        private enum enumMixinStr_SDL_RenderDrawRectsF = `enum SDL_RenderDrawRectsF = SDL_RenderDrawRectsF_renamed_SDL_RenderRects;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawRectsF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawRectsF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawRects))) {
        private enum enumMixinStr_SDL_RenderDrawRects = `enum SDL_RenderDrawRects = SDL_RenderDrawRects_renamed_SDL_RenderRects;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawRects); }))) {
            mixin(enumMixinStr_SDL_RenderDrawRects);
        }
    }




    static if(!is(typeof(SDL_RenderDrawRectF))) {
        private enum enumMixinStr_SDL_RenderDrawRectF = `enum SDL_RenderDrawRectF = SDL_RenderDrawRectF_renamed_SDL_RenderRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawRectF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawRectF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawRect))) {
        private enum enumMixinStr_SDL_RenderDrawRect = `enum SDL_RenderDrawRect = SDL_RenderDrawRect_renamed_SDL_RenderRect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawRect); }))) {
            mixin(enumMixinStr_SDL_RenderDrawRect);
        }
    }




    static if(!is(typeof(SDL_RenderDrawPointsF))) {
        private enum enumMixinStr_SDL_RenderDrawPointsF = `enum SDL_RenderDrawPointsF = SDL_RenderDrawPointsF_renamed_SDL_RenderPoints;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawPointsF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawPointsF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawPoints))) {
        private enum enumMixinStr_SDL_RenderDrawPoints = `enum SDL_RenderDrawPoints = SDL_RenderDrawPoints_renamed_SDL_RenderPoints;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawPoints); }))) {
            mixin(enumMixinStr_SDL_RenderDrawPoints);
        }
    }




    static if(!is(typeof(SDL_RenderDrawPointF))) {
        private enum enumMixinStr_SDL_RenderDrawPointF = `enum SDL_RenderDrawPointF = SDL_RenderDrawPointF_renamed_SDL_RenderPoint;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawPointF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawPointF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawPoint))) {
        private enum enumMixinStr_SDL_RenderDrawPoint = `enum SDL_RenderDrawPoint = SDL_RenderDrawPoint_renamed_SDL_RenderPoint;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawPoint); }))) {
            mixin(enumMixinStr_SDL_RenderDrawPoint);
        }
    }




    static if(!is(typeof(SDL_RenderDrawLinesF))) {
        private enum enumMixinStr_SDL_RenderDrawLinesF = `enum SDL_RenderDrawLinesF = SDL_RenderDrawLinesF_renamed_SDL_RenderLines;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawLinesF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawLinesF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawLines))) {
        private enum enumMixinStr_SDL_RenderDrawLines = `enum SDL_RenderDrawLines = SDL_RenderDrawLines_renamed_SDL_RenderLines;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawLines); }))) {
            mixin(enumMixinStr_SDL_RenderDrawLines);
        }
    }




    static if(!is(typeof(SDL_RenderDrawLineF))) {
        private enum enumMixinStr_SDL_RenderDrawLineF = `enum SDL_RenderDrawLineF = SDL_RenderDrawLineF_renamed_SDL_RenderLine;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawLineF); }))) {
            mixin(enumMixinStr_SDL_RenderDrawLineF);
        }
    }




    static if(!is(typeof(SDL_RenderDrawLine))) {
        private enum enumMixinStr_SDL_RenderDrawLine = `enum SDL_RenderDrawLine = SDL_RenderDrawLine_renamed_SDL_RenderLine;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderDrawLine); }))) {
            mixin(enumMixinStr_SDL_RenderDrawLine);
        }
    }




    static if(!is(typeof(SDL_RenderCopyF))) {
        private enum enumMixinStr_SDL_RenderCopyF = `enum SDL_RenderCopyF = SDL_RenderCopyF_renamed_SDL_RenderTexture;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderCopyF); }))) {
            mixin(enumMixinStr_SDL_RenderCopyF);
        }
    }




    static if(!is(typeof(SDL_RenderCopyExF))) {
        private enum enumMixinStr_SDL_RenderCopyExF = `enum SDL_RenderCopyExF = SDL_RenderCopyExF_renamed_SDL_RenderTextureRotated;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderCopyExF); }))) {
            mixin(enumMixinStr_SDL_RenderCopyExF);
        }
    }




    static if(!is(typeof(SDL_RenderCopyEx))) {
        private enum enumMixinStr_SDL_RenderCopyEx = `enum SDL_RenderCopyEx = SDL_RenderCopyEx_renamed_SDL_RenderTextureRotated;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderCopyEx); }))) {
            mixin(enumMixinStr_SDL_RenderCopyEx);
        }
    }




    static if(!is(typeof(SDL_RenderCopy))) {
        private enum enumMixinStr_SDL_RenderCopy = `enum SDL_RenderCopy = SDL_RenderCopy_renamed_SDL_RenderTexture;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RenderCopy); }))) {
            mixin(enumMixinStr_SDL_RenderCopy);
        }
    }




    static if(!is(typeof(SDL_GetRendererOutputSize))) {
        private enum enumMixinStr_SDL_GetRendererOutputSize = `enum SDL_GetRendererOutputSize = SDL_GetRendererOutputSize_renamed_SDL_GetCurrentRenderOutputSize;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GetRendererOutputSize); }))) {
            mixin(enumMixinStr_SDL_GetRendererOutputSize);
        }
    }




    static if(!is(typeof(SDL_UnionRect))) {
        private enum enumMixinStr_SDL_UnionRect = `enum SDL_UnionRect = SDL_UnionRect_renamed_SDL_GetRectUnion;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_UnionRect); }))) {
            mixin(enumMixinStr_SDL_UnionRect);
        }
    }




    static if(!is(typeof(SDL_UnionFRect))) {
        private enum enumMixinStr_SDL_UnionFRect = `enum SDL_UnionFRect = SDL_UnionFRect_renamed_SDL_GetRectUnionFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_UnionFRect); }))) {
            mixin(enumMixinStr_SDL_UnionFRect);
        }
    }




    static if(!is(typeof(SDL_RectEquals))) {
        private enum enumMixinStr_SDL_RectEquals = `enum SDL_RectEquals = SDL_RectEquals_renamed_SDL_RectsEqual;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RectEquals); }))) {
            mixin(enumMixinStr_SDL_RectEquals);
        }
    }




    static if(!is(typeof(SDL_PointInFRect))) {
        private enum enumMixinStr_SDL_PointInFRect = `enum SDL_PointInFRect = SDL_PointInFRect_renamed_SDL_PointInRectFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PointInFRect); }))) {
            mixin(enumMixinStr_SDL_PointInFRect);
        }
    }




    static if(!is(typeof(SDL_IntersectRectAndLine))) {
        private enum enumMixinStr_SDL_IntersectRectAndLine = `enum SDL_IntersectRectAndLine = SDL_IntersectRectAndLine_renamed_SDL_GetRectAndLineIntersection;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IntersectRectAndLine); }))) {
            mixin(enumMixinStr_SDL_IntersectRectAndLine);
        }
    }




    static if(!is(typeof(SDL_IntersectRect))) {
        private enum enumMixinStr_SDL_IntersectRect = `enum SDL_IntersectRect = SDL_IntersectRect_renamed_SDL_GetRectIntersection;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IntersectRect); }))) {
            mixin(enumMixinStr_SDL_IntersectRect);
        }
    }




    static if(!is(typeof(SDL_IntersectFRectAndLine))) {
        private enum enumMixinStr_SDL_IntersectFRectAndLine = `enum SDL_IntersectFRectAndLine = SDL_IntersectFRectAndLine_renamed_SDL_GetRectAndLineIntersectionFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IntersectFRectAndLine); }))) {
            mixin(enumMixinStr_SDL_IntersectFRectAndLine);
        }
    }




    static if(!is(typeof(SDL_IntersectFRect))) {
        private enum enumMixinStr_SDL_IntersectFRect = `enum SDL_IntersectFRect = SDL_IntersectFRect_renamed_SDL_GetRectIntersectionFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IntersectFRect); }))) {
            mixin(enumMixinStr_SDL_IntersectFRect);
        }
    }




    static if(!is(typeof(SDL_HasIntersectionF))) {
        private enum enumMixinStr_SDL_HasIntersectionF = `enum SDL_HasIntersectionF = SDL_HasIntersectionF_renamed_SDL_HasRectIntersectionFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HasIntersectionF); }))) {
            mixin(enumMixinStr_SDL_HasIntersectionF);
        }
    }




    static if(!is(typeof(SDL_HasIntersection))) {
        private enum enumMixinStr_SDL_HasIntersection = `enum SDL_HasIntersection = SDL_HasIntersection_renamed_SDL_HasRectIntersection;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HasIntersection); }))) {
            mixin(enumMixinStr_SDL_HasIntersection);
        }
    }




    static if(!is(typeof(SDL_FRectEqualsEpsilon))) {
        private enum enumMixinStr_SDL_FRectEqualsEpsilon = `enum SDL_FRectEqualsEpsilon = SDL_FRectEqualsEpsilon_renamed_SDL_RectsEqualEpsilon;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FRectEqualsEpsilon); }))) {
            mixin(enumMixinStr_SDL_FRectEqualsEpsilon);
        }
    }




    static if(!is(typeof(SDL_FRectEquals))) {
        private enum enumMixinStr_SDL_FRectEquals = `enum SDL_FRectEquals = SDL_FRectEquals_renamed_SDL_RectsEqualFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FRectEquals); }))) {
            mixin(enumMixinStr_SDL_FRectEquals);
        }
    }




    static if(!is(typeof(SDL_ICONV_ERROR))) {
        private enum enumMixinStr_SDL_ICONV_ERROR = `enum SDL_ICONV_ERROR = cast( size_t ) - 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ICONV_ERROR); }))) {
            mixin(enumMixinStr_SDL_ICONV_ERROR);
        }
    }




    static if(!is(typeof(SDL_ICONV_E2BIG))) {
        private enum enumMixinStr_SDL_ICONV_E2BIG = `enum SDL_ICONV_E2BIG = cast( size_t ) - 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ICONV_E2BIG); }))) {
            mixin(enumMixinStr_SDL_ICONV_E2BIG);
        }
    }




    static if(!is(typeof(SDL_ICONV_EILSEQ))) {
        private enum enumMixinStr_SDL_ICONV_EILSEQ = `enum SDL_ICONV_EILSEQ = cast( size_t ) - 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ICONV_EILSEQ); }))) {
            mixin(enumMixinStr_SDL_ICONV_EILSEQ);
        }
    }




    static if(!is(typeof(SDL_ICONV_EINVAL))) {
        private enum enumMixinStr_SDL_ICONV_EINVAL = `enum SDL_ICONV_EINVAL = cast( size_t ) - 4;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ICONV_EINVAL); }))) {
            mixin(enumMixinStr_SDL_ICONV_EINVAL);
        }
    }




    static if(!is(typeof(SDL_FRectEmpty))) {
        private enum enumMixinStr_SDL_FRectEmpty = `enum SDL_FRectEmpty = SDL_FRectEmpty_renamed_SDL_RectEmptyFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FRectEmpty); }))) {
            mixin(enumMixinStr_SDL_FRectEmpty);
        }
    }




    static if(!is(typeof(SDL_EnclosePoints))) {
        private enum enumMixinStr_SDL_EnclosePoints = `enum SDL_EnclosePoints = SDL_EnclosePoints_renamed_SDL_GetRectEnclosingPoints;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_EnclosePoints); }))) {
            mixin(enumMixinStr_SDL_EnclosePoints);
        }
    }




    static if(!is(typeof(SDL_EncloseFPoints))) {
        private enum enumMixinStr_SDL_EncloseFPoints = `enum SDL_EncloseFPoints = SDL_EncloseFPoints_renamed_SDL_GetRectEnclosingPointsFloat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_EncloseFPoints); }))) {
            mixin(enumMixinStr_SDL_EncloseFPoints);
        }
    }




    static if(!is(typeof(SDL_PixelFormatEnumToMasks))) {
        private enum enumMixinStr_SDL_PixelFormatEnumToMasks = `enum SDL_PixelFormatEnumToMasks = SDL_PixelFormatEnumToMasks_renamed_SDL_GetMasksForPixelFormatEnum;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PixelFormatEnumToMasks); }))) {
            mixin(enumMixinStr_SDL_PixelFormatEnumToMasks);
        }
    }




    static if(!is(typeof(SDL_MasksToPixelFormatEnum))) {
        private enum enumMixinStr_SDL_MasksToPixelFormatEnum = `enum SDL_MasksToPixelFormatEnum = SDL_MasksToPixelFormatEnum_renamed_SDL_GetPixelFormatEnumForMasks;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MasksToPixelFormatEnum); }))) {
            mixin(enumMixinStr_SDL_MasksToPixelFormatEnum);
        }
    }




    static if(!is(typeof(SDL_FreePalette))) {
        private enum enumMixinStr_SDL_FreePalette = `enum SDL_FreePalette = SDL_FreePalette_renamed_SDL_DestroyPalette;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreePalette); }))) {
            mixin(enumMixinStr_SDL_FreePalette);
        }
    }




    static if(!is(typeof(SDL_FreeFormat))) {
        private enum enumMixinStr_SDL_FreeFormat = `enum SDL_FreeFormat = SDL_FreeFormat_renamed_SDL_DestroyPixelFormat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeFormat); }))) {
            mixin(enumMixinStr_SDL_FreeFormat);
        }
    }




    static if(!is(typeof(SDL_AllocPalette))) {
        private enum enumMixinStr_SDL_AllocPalette = `enum SDL_AllocPalette = SDL_AllocPalette_renamed_SDL_CreatePalette;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AllocPalette); }))) {
            mixin(enumMixinStr_SDL_AllocPalette);
        }
    }
    static if(!is(typeof(SDL_AllocFormat))) {
        private enum enumMixinStr_SDL_AllocFormat = `enum SDL_AllocFormat = SDL_AllocFormat_renamed_SDL_CreatePixelFormat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AllocFormat); }))) {
            mixin(enumMixinStr_SDL_AllocFormat);
        }
    }




    static if(!is(typeof(SDL_FreeCursor))) {
        private enum enumMixinStr_SDL_FreeCursor = `enum SDL_FreeCursor = SDL_FreeCursor_renamed_SDL_DestroyCursor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeCursor); }))) {
            mixin(enumMixinStr_SDL_FreeCursor);
        }
    }




    static if(!is(typeof(KMOD_SHIFT))) {
        private enum enumMixinStr_KMOD_SHIFT = `enum KMOD_SHIFT = KMOD_SHIFT_renamed_SDL_KMOD_SHIFT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_SHIFT); }))) {
            mixin(enumMixinStr_KMOD_SHIFT);
        }
    }




    static if(!is(typeof(KMOD_SCROLL))) {
        private enum enumMixinStr_KMOD_SCROLL = `enum KMOD_SCROLL = KMOD_SCROLL_renamed_SDL_KMOD_SCROLL;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_SCROLL); }))) {
            mixin(enumMixinStr_KMOD_SCROLL);
        }
    }




    static if(!is(typeof(KMOD_RSHIFT))) {
        private enum enumMixinStr_KMOD_RSHIFT = `enum KMOD_RSHIFT = KMOD_RSHIFT_renamed_SDL_KMOD_RSHIFT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_RSHIFT); }))) {
            mixin(enumMixinStr_KMOD_RSHIFT);
        }
    }




    static if(!is(typeof(KMOD_RGUI))) {
        private enum enumMixinStr_KMOD_RGUI = `enum KMOD_RGUI = KMOD_RGUI_renamed_SDL_KMOD_RGUI;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_RGUI); }))) {
            mixin(enumMixinStr_KMOD_RGUI);
        }
    }




    static if(!is(typeof(KMOD_RESERVED))) {
        private enum enumMixinStr_KMOD_RESERVED = `enum KMOD_RESERVED = KMOD_RESERVED_renamed_SDL_KMOD_RESERVED;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_RESERVED); }))) {
            mixin(enumMixinStr_KMOD_RESERVED);
        }
    }






    static if(!is(typeof(KMOD_RCTRL))) {
        private enum enumMixinStr_KMOD_RCTRL = `enum KMOD_RCTRL = KMOD_RCTRL_renamed_SDL_KMOD_RCTRL;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_RCTRL); }))) {
            mixin(enumMixinStr_KMOD_RCTRL);
        }
    }




    static if(!is(typeof(KMOD_RALT))) {
        private enum enumMixinStr_KMOD_RALT = `enum KMOD_RALT = KMOD_RALT_renamed_SDL_KMOD_RALT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_RALT); }))) {
            mixin(enumMixinStr_KMOD_RALT);
        }
    }




    static if(!is(typeof(KMOD_NUM))) {
        private enum enumMixinStr_KMOD_NUM = `enum KMOD_NUM = KMOD_NUM_renamed_SDL_KMOD_NUM;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_NUM); }))) {
            mixin(enumMixinStr_KMOD_NUM);
        }
    }




    static if(!is(typeof(KMOD_NONE))) {
        private enum enumMixinStr_KMOD_NONE = `enum KMOD_NONE = KMOD_NONE_renamed_SDL_KMOD_NONE;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_NONE); }))) {
            mixin(enumMixinStr_KMOD_NONE);
        }
    }






    static if(!is(typeof(KMOD_MODE))) {
        private enum enumMixinStr_KMOD_MODE = `enum KMOD_MODE = KMOD_MODE_renamed_SDL_KMOD_MODE;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_MODE); }))) {
            mixin(enumMixinStr_KMOD_MODE);
        }
    }




    static if(!is(typeof(KMOD_LSHIFT))) {
        private enum enumMixinStr_KMOD_LSHIFT = `enum KMOD_LSHIFT = KMOD_LSHIFT_renamed_SDL_KMOD_LSHIFT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_LSHIFT); }))) {
            mixin(enumMixinStr_KMOD_LSHIFT);
        }
    }






    static if(!is(typeof(KMOD_LGUI))) {
        private enum enumMixinStr_KMOD_LGUI = `enum KMOD_LGUI = KMOD_LGUI_renamed_SDL_KMOD_LGUI;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_LGUI); }))) {
            mixin(enumMixinStr_KMOD_LGUI);
        }
    }




    static if(!is(typeof(KMOD_LCTRL))) {
        private enum enumMixinStr_KMOD_LCTRL = `enum KMOD_LCTRL = KMOD_LCTRL_renamed_SDL_KMOD_LCTRL;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_LCTRL); }))) {
            mixin(enumMixinStr_KMOD_LCTRL);
        }
    }




    static if(!is(typeof(KMOD_LALT))) {
        private enum enumMixinStr_KMOD_LALT = `enum KMOD_LALT = KMOD_LALT_renamed_SDL_KMOD_LALT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_LALT); }))) {
            mixin(enumMixinStr_KMOD_LALT);
        }
    }




    static if(!is(typeof(KMOD_GUI))) {
        private enum enumMixinStr_KMOD_GUI = `enum KMOD_GUI = KMOD_GUI_renamed_SDL_KMOD_GUI;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_GUI); }))) {
            mixin(enumMixinStr_KMOD_GUI);
        }
    }




    static if(!is(typeof(KMOD_CTRL))) {
        private enum enumMixinStr_KMOD_CTRL = `enum KMOD_CTRL = KMOD_CTRL_renamed_SDL_KMOD_CTRL;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_CTRL); }))) {
            mixin(enumMixinStr_KMOD_CTRL);
        }
    }




    static if(!is(typeof(KMOD_CAPS))) {
        private enum enumMixinStr_KMOD_CAPS = `enum KMOD_CAPS = KMOD_CAPS_renamed_SDL_KMOD_CAPS;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_CAPS); }))) {
            mixin(enumMixinStr_KMOD_CAPS);
        }
    }




    static if(!is(typeof(KMOD_ALT))) {
        private enum enumMixinStr_KMOD_ALT = `enum KMOD_ALT = KMOD_ALT_renamed_SDL_KMOD_ALT;`;
        static if(is(typeof({ mixin(enumMixinStr_KMOD_ALT); }))) {
            mixin(enumMixinStr_KMOD_ALT);
        }
    }




    static if(!is(typeof(SDL_IsTextInputShown))) {
        private enum enumMixinStr_SDL_IsTextInputShown = `enum SDL_IsTextInputShown = SDL_IsTextInputShown_renamed_SDL_TextInputShown;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IsTextInputShown); }))) {
            mixin(enumMixinStr_SDL_IsTextInputShown);
        }
    }




    static if(!is(typeof(SDL_SWSURFACE))) {
        private enum enumMixinStr_SDL_SWSURFACE = `enum SDL_SWSURFACE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SWSURFACE); }))) {
            mixin(enumMixinStr_SDL_SWSURFACE);
        }
    }




    static if(!is(typeof(SDL_PREALLOC))) {
        private enum enumMixinStr_SDL_PREALLOC = `enum SDL_PREALLOC = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PREALLOC); }))) {
            mixin(enumMixinStr_SDL_PREALLOC);
        }
    }




    static if(!is(typeof(SDL_RLEACCEL))) {
        private enum enumMixinStr_SDL_RLEACCEL = `enum SDL_RLEACCEL = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RLEACCEL); }))) {
            mixin(enumMixinStr_SDL_RLEACCEL);
        }
    }




    static if(!is(typeof(SDL_DONTFREE))) {
        private enum enumMixinStr_SDL_DONTFREE = `enum SDL_DONTFREE = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DONTFREE); }))) {
            mixin(enumMixinStr_SDL_DONTFREE);
        }
    }




    static if(!is(typeof(SDL_SIMD_ALIGNED))) {
        private enum enumMixinStr_SDL_SIMD_ALIGNED = `enum SDL_SIMD_ALIGNED = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SIMD_ALIGNED); }))) {
            mixin(enumMixinStr_SDL_SIMD_ALIGNED);
        }
    }






    static if(!is(typeof(SDL_IsTextInputActive))) {
        private enum enumMixinStr_SDL_IsTextInputActive = `enum SDL_IsTextInputActive = SDL_IsTextInputActive_renamed_SDL_TextInputActive;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IsTextInputActive); }))) {
            mixin(enumMixinStr_SDL_IsTextInputActive);
        }
    }




    static if(!is(typeof(SDL_IsScreenKeyboardShown))) {
        private enum enumMixinStr_SDL_IsScreenKeyboardShown = `enum SDL_IsScreenKeyboardShown = SDL_IsScreenKeyboardShown_renamed_SDL_ScreenKeyboardShown;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IsScreenKeyboardShown); }))) {
            mixin(enumMixinStr_SDL_IsScreenKeyboardShown);
        }
    }




    static if(!is(typeof(SDL_JoystickUpdate))) {
        private enum enumMixinStr_SDL_JoystickUpdate = `enum SDL_JoystickUpdate = SDL_JoystickUpdate_renamed_SDL_UpdateJoysticks;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickUpdate); }))) {
            mixin(enumMixinStr_SDL_JoystickUpdate);
        }
    }




    static if(!is(typeof(SDL_JoystickSetVirtualHat))) {
        private enum enumMixinStr_SDL_JoystickSetVirtualHat = `enum SDL_JoystickSetVirtualHat = SDL_JoystickSetVirtualHat_renamed_SDL_SetJoystickVirtualHat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSetVirtualHat); }))) {
            mixin(enumMixinStr_SDL_JoystickSetVirtualHat);
        }
    }




    static if(!is(typeof(SDL_JoystickSetVirtualButton))) {
        private enum enumMixinStr_SDL_JoystickSetVirtualButton = `enum SDL_JoystickSetVirtualButton = SDL_JoystickSetVirtualButton_renamed_SDL_SetJoystickVirtualButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSetVirtualButton); }))) {
            mixin(enumMixinStr_SDL_JoystickSetVirtualButton);
        }
    }




    static if(!is(typeof(SDL_JoystickSetVirtualAxis))) {
        private enum enumMixinStr_SDL_JoystickSetVirtualAxis = `enum SDL_JoystickSetVirtualAxis = SDL_JoystickSetVirtualAxis_renamed_SDL_SetJoystickVirtualAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSetVirtualAxis); }))) {
            mixin(enumMixinStr_SDL_JoystickSetVirtualAxis);
        }
    }




    static if(!is(typeof(SDL_JoystickSetPlayerIndex))) {
        private enum enumMixinStr_SDL_JoystickSetPlayerIndex = `enum SDL_JoystickSetPlayerIndex = SDL_JoystickSetPlayerIndex_renamed_SDL_SetJoystickPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSetPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_JoystickSetPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_JoystickSetLED))) {
        private enum enumMixinStr_SDL_JoystickSetLED = `enum SDL_JoystickSetLED = SDL_JoystickSetLED_renamed_SDL_SetJoystickLED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSetLED); }))) {
            mixin(enumMixinStr_SDL_JoystickSetLED);
        }
    }




    static if(!is(typeof(SDL_JoystickSendEffect))) {
        private enum enumMixinStr_SDL_JoystickSendEffect = `enum SDL_JoystickSendEffect = SDL_JoystickSendEffect_renamed_SDL_SendJoystickEffect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickSendEffect); }))) {
            mixin(enumMixinStr_SDL_JoystickSendEffect);
        }
    }




    static if(!is(typeof(SDL_JoystickRumbleTriggers))) {
        private enum enumMixinStr_SDL_JoystickRumbleTriggers = `enum SDL_JoystickRumbleTriggers = SDL_JoystickRumbleTriggers_renamed_SDL_RumbleJoystickTriggers;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickRumbleTriggers); }))) {
            mixin(enumMixinStr_SDL_JoystickRumbleTriggers);
        }
    }




    static if(!is(typeof(SDL_JoystickRumble))) {
        private enum enumMixinStr_SDL_JoystickRumble = `enum SDL_JoystickRumble = SDL_JoystickRumble_renamed_SDL_RumbleJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickRumble); }))) {
            mixin(enumMixinStr_SDL_JoystickRumble);
        }
    }




    static if(!is(typeof(SDL_JoystickPath))) {
        private enum enumMixinStr_SDL_JoystickPath = `enum SDL_JoystickPath = SDL_JoystickPath_renamed_SDL_GetJoystickPath;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickPath); }))) {
            mixin(enumMixinStr_SDL_JoystickPath);
        }
    }




    static if(!is(typeof(SDL_JoystickOpen))) {
        private enum enumMixinStr_SDL_JoystickOpen = `enum SDL_JoystickOpen = SDL_JoystickOpen_renamed_SDL_OpenJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickOpen); }))) {
            mixin(enumMixinStr_SDL_JoystickOpen);
        }
    }




    static if(!is(typeof(SDL_JoystickNumHats))) {
        private enum enumMixinStr_SDL_JoystickNumHats = `enum SDL_JoystickNumHats = SDL_JoystickNumHats_renamed_SDL_GetNumJoystickHats;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickNumHats); }))) {
            mixin(enumMixinStr_SDL_JoystickNumHats);
        }
    }




    static if(!is(typeof(SDL_JoystickNumButtons))) {
        private enum enumMixinStr_SDL_JoystickNumButtons = `enum SDL_JoystickNumButtons = SDL_JoystickNumButtons_renamed_SDL_GetNumJoystickButtons;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickNumButtons); }))) {
            mixin(enumMixinStr_SDL_JoystickNumButtons);
        }
    }






    static if(!is(typeof(SDL_JoystickNumAxes))) {
        private enum enumMixinStr_SDL_JoystickNumAxes = `enum SDL_JoystickNumAxes = SDL_JoystickNumAxes_renamed_SDL_GetNumJoystickAxes;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickNumAxes); }))) {
            mixin(enumMixinStr_SDL_JoystickNumAxes);
        }
    }




    static if(!is(typeof(SDL_JoystickName))) {
        private enum enumMixinStr_SDL_JoystickName = `enum SDL_JoystickName = SDL_JoystickName_renamed_SDL_GetJoystickName;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickName); }))) {
            mixin(enumMixinStr_SDL_JoystickName);
        }
    }






    static if(!is(typeof(SDL_JoystickIsVirtual))) {
        private enum enumMixinStr_SDL_JoystickIsVirtual = `enum SDL_JoystickIsVirtual = SDL_JoystickIsVirtual_renamed_SDL_IsJoystickVirtual;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickIsVirtual); }))) {
            mixin(enumMixinStr_SDL_JoystickIsVirtual);
        }
    }




    static if(!is(typeof(SDL_JoystickInstanceID))) {
        private enum enumMixinStr_SDL_JoystickInstanceID = `enum SDL_JoystickInstanceID = SDL_JoystickInstanceID_renamed_SDL_GetJoystickInstanceID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickInstanceID); }))) {
            mixin(enumMixinStr_SDL_JoystickInstanceID);
        }
    }




    static if(!is(typeof(SDL_JoystickGetVendor))) {
        private enum enumMixinStr_SDL_JoystickGetVendor = `enum SDL_JoystickGetVendor = SDL_JoystickGetVendor_renamed_SDL_GetJoystickVendor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetVendor); }))) {
            mixin(enumMixinStr_SDL_JoystickGetVendor);
        }
    }




    static if(!is(typeof(SDL_JoystickGetType))) {
        private enum enumMixinStr_SDL_JoystickGetType = `enum SDL_JoystickGetType = SDL_JoystickGetType_renamed_SDL_GetJoystickType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetType); }))) {
            mixin(enumMixinStr_SDL_JoystickGetType);
        }
    }




    static if(!is(typeof(SDL_JoystickGetSerial))) {
        private enum enumMixinStr_SDL_JoystickGetSerial = `enum SDL_JoystickGetSerial = SDL_JoystickGetSerial_renamed_SDL_GetJoystickSerial;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetSerial); }))) {
            mixin(enumMixinStr_SDL_JoystickGetSerial);
        }
    }




    static if(!is(typeof(SDL_JoystickGetProductVersion))) {
        private enum enumMixinStr_SDL_JoystickGetProductVersion = `enum SDL_JoystickGetProductVersion = SDL_JoystickGetProductVersion_renamed_SDL_GetJoystickProductVersion;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetProductVersion); }))) {
            mixin(enumMixinStr_SDL_JoystickGetProductVersion);
        }
    }




    static if(!is(typeof(SDL_JoystickGetProduct))) {
        private enum enumMixinStr_SDL_JoystickGetProduct = `enum SDL_JoystickGetProduct = SDL_JoystickGetProduct_renamed_SDL_GetJoystickProduct;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetProduct); }))) {
            mixin(enumMixinStr_SDL_JoystickGetProduct);
        }
    }




    static if(!is(typeof(SDL_JoystickGetPlayerIndex))) {
        private enum enumMixinStr_SDL_JoystickGetPlayerIndex = `enum SDL_JoystickGetPlayerIndex = SDL_JoystickGetPlayerIndex_renamed_SDL_GetJoystickPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_JoystickGetPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_JoystickGetHat))) {
        private enum enumMixinStr_SDL_JoystickGetHat = `enum SDL_JoystickGetHat = SDL_JoystickGetHat_renamed_SDL_GetJoystickHat;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetHat); }))) {
            mixin(enumMixinStr_SDL_JoystickGetHat);
        }
    }




    static if(!is(typeof(SDL_JoystickGetGUIDString))) {
        private enum enumMixinStr_SDL_JoystickGetGUIDString = `enum SDL_JoystickGetGUIDString = SDL_JoystickGetGUIDString_renamed_SDL_GetJoystickGUIDString;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetGUIDString); }))) {
            mixin(enumMixinStr_SDL_JoystickGetGUIDString);
        }
    }




    static if(!is(typeof(SDL_JoystickGetGUIDFromString))) {
        private enum enumMixinStr_SDL_JoystickGetGUIDFromString = `enum SDL_JoystickGetGUIDFromString = SDL_JoystickGetGUIDFromString_renamed_SDL_GetJoystickGUIDFromString;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetGUIDFromString); }))) {
            mixin(enumMixinStr_SDL_JoystickGetGUIDFromString);
        }
    }




    static if(!is(typeof(SDL_JoystickGetGUID))) {
        private enum enumMixinStr_SDL_JoystickGetGUID = `enum SDL_JoystickGetGUID = SDL_JoystickGetGUID_renamed_SDL_GetJoystickGUID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetGUID); }))) {
            mixin(enumMixinStr_SDL_JoystickGetGUID);
        }
    }




    static if(!is(typeof(SDL_JoystickGetFirmwareVersion))) {
        private enum enumMixinStr_SDL_JoystickGetFirmwareVersion = `enum SDL_JoystickGetFirmwareVersion = SDL_JoystickGetFirmwareVersion_renamed_SDL_GetJoystickFirmwareVersion;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetFirmwareVersion); }))) {
            mixin(enumMixinStr_SDL_JoystickGetFirmwareVersion);
        }
    }




    static if(!is(typeof(SDL_JoystickGetButton))) {
        private enum enumMixinStr_SDL_JoystickGetButton = `enum SDL_JoystickGetButton = SDL_JoystickGetButton_renamed_SDL_GetJoystickButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetButton); }))) {
            mixin(enumMixinStr_SDL_JoystickGetButton);
        }
    }




    static if(!is(typeof(SDL_JoystickGetAxisInitialState))) {
        private enum enumMixinStr_SDL_JoystickGetAxisInitialState = `enum SDL_JoystickGetAxisInitialState = SDL_JoystickGetAxisInitialState_renamed_SDL_GetJoystickAxisInitialState;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetAxisInitialState); }))) {
            mixin(enumMixinStr_SDL_JoystickGetAxisInitialState);
        }
    }




    static if(!is(typeof(SDL_JoystickGetAxis))) {
        private enum enumMixinStr_SDL_JoystickGetAxis = `enum SDL_JoystickGetAxis = SDL_JoystickGetAxis_renamed_SDL_GetJoystickAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetAxis); }))) {
            mixin(enumMixinStr_SDL_JoystickGetAxis);
        }
    }




    static if(!is(typeof(SDL_JoystickGetAttached))) {
        private enum enumMixinStr_SDL_JoystickGetAttached = `enum SDL_JoystickGetAttached = SDL_JoystickGetAttached_renamed_SDL_JoystickConnected;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickGetAttached); }))) {
            mixin(enumMixinStr_SDL_JoystickGetAttached);
        }
    }




    static if(!is(typeof(SDL_JoystickFromPlayerIndex))) {
        private enum enumMixinStr_SDL_JoystickFromPlayerIndex = `enum SDL_JoystickFromPlayerIndex = SDL_JoystickFromPlayerIndex_renamed_SDL_GetJoystickFromPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickFromPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_JoystickFromPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_JoystickFromInstanceID))) {
        private enum enumMixinStr_SDL_JoystickFromInstanceID = `enum SDL_JoystickFromInstanceID = SDL_JoystickFromInstanceID_renamed_SDL_GetJoystickFromInstanceID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickFromInstanceID); }))) {
            mixin(enumMixinStr_SDL_JoystickFromInstanceID);
        }
    }




    static if(!is(typeof(SDL_JoystickDetachVirtual))) {
        private enum enumMixinStr_SDL_JoystickDetachVirtual = `enum SDL_JoystickDetachVirtual = SDL_JoystickDetachVirtual_renamed_SDL_DetachVirtualJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickDetachVirtual); }))) {
            mixin(enumMixinStr_SDL_JoystickDetachVirtual);
        }
    }




    static if(!is(typeof(SDL_JoystickCurrentPowerLevel))) {
        private enum enumMixinStr_SDL_JoystickCurrentPowerLevel = `enum SDL_JoystickCurrentPowerLevel = SDL_JoystickCurrentPowerLevel_renamed_SDL_GetJoystickPowerLevel;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickCurrentPowerLevel); }))) {
            mixin(enumMixinStr_SDL_JoystickCurrentPowerLevel);
        }
    }




    static if(!is(typeof(SDL_JoystickClose))) {
        private enum enumMixinStr_SDL_JoystickClose = `enum SDL_JoystickClose = SDL_JoystickClose_renamed_SDL_CloseJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickClose); }))) {
            mixin(enumMixinStr_SDL_JoystickClose);
        }
    }




    static if(!is(typeof(SDL_JoystickAttachVirtualEx))) {
        private enum enumMixinStr_SDL_JoystickAttachVirtualEx = `enum SDL_JoystickAttachVirtualEx = SDL_JoystickAttachVirtualEx_renamed_SDL_AttachVirtualJoystickEx;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickAttachVirtualEx); }))) {
            mixin(enumMixinStr_SDL_JoystickAttachVirtualEx);
        }
    }




    static if(!is(typeof(SDL_JoystickAttachVirtual))) {
        private enum enumMixinStr_SDL_JoystickAttachVirtual = `enum SDL_JoystickAttachVirtual = SDL_JoystickAttachVirtual_renamed_SDL_AttachVirtualJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JoystickAttachVirtual); }))) {
            mixin(enumMixinStr_SDL_JoystickAttachVirtual);
        }
    }




    static if(!is(typeof(SDL_JOYSTICK_TYPE_GAMECONTROLLER))) {
        private enum enumMixinStr_SDL_JOYSTICK_TYPE_GAMECONTROLLER = `enum SDL_JOYSTICK_TYPE_GAMECONTROLLER = SDL_JOYSTICK_TYPE_GAMECONTROLLER_renamed_SDL_JOYSTICK_TYPE_GAMEPAD;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYSTICK_TYPE_GAMECONTROLLER); }))) {
            mixin(enumMixinStr_SDL_JOYSTICK_TYPE_GAMECONTROLLER);
        }
    }




    static if(!is(typeof(SDL_IsGameController))) {
        private enum enumMixinStr_SDL_IsGameController = `enum SDL_IsGameController = SDL_IsGameController_renamed_SDL_IsGamepad;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IsGameController); }))) {
            mixin(enumMixinStr_SDL_IsGameController);
        }
    }




    static if(!is(typeof(SDL_INIT_GAMECONTROLLER))) {
        private enum enumMixinStr_SDL_INIT_GAMECONTROLLER = `enum SDL_INIT_GAMECONTROLLER = SDL_INIT_GAMECONTROLLER_renamed_SDL_INIT_GAMEPAD;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_INIT_GAMECONTROLLER); }))) {
            mixin(enumMixinStr_SDL_INIT_GAMECONTROLLER);
        }
    }




    static if(!is(typeof(SDL_GameControllerUpdate))) {
        private enum enumMixinStr_SDL_GameControllerUpdate = `enum SDL_GameControllerUpdate = SDL_GameControllerUpdate_renamed_SDL_UpdateGamepads;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerUpdate); }))) {
            mixin(enumMixinStr_SDL_GameControllerUpdate);
        }
    }




    static if(!is(typeof(SDL_GameControllerType))) {
        private enum enumMixinStr_SDL_GameControllerType = `enum SDL_GameControllerType = SDL_GameControllerType_renamed_SDL_GamepadType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerType); }))) {
            mixin(enumMixinStr_SDL_GameControllerType);
        }
    }




    static if(!is(typeof(SDL_GameControllerSetSensorEnabled))) {
        private enum enumMixinStr_SDL_GameControllerSetSensorEnabled = `enum SDL_GameControllerSetSensorEnabled = SDL_GameControllerSetSensorEnabled_renamed_SDL_SetGamepadSensorEnabled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerSetSensorEnabled); }))) {
            mixin(enumMixinStr_SDL_GameControllerSetSensorEnabled);
        }
    }




    static if(!is(typeof(SDL_GameControllerSetPlayerIndex))) {
        private enum enumMixinStr_SDL_GameControllerSetPlayerIndex = `enum SDL_GameControllerSetPlayerIndex = SDL_GameControllerSetPlayerIndex_renamed_SDL_SetGamepadPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerSetPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_GameControllerSetPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_GameControllerSetLED))) {
        private enum enumMixinStr_SDL_GameControllerSetLED = `enum SDL_GameControllerSetLED = SDL_GameControllerSetLED_renamed_SDL_SetGamepadLED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerSetLED); }))) {
            mixin(enumMixinStr_SDL_GameControllerSetLED);
        }
    }




    static if(!is(typeof(SDL_GameControllerSendEffect))) {
        private enum enumMixinStr_SDL_GameControllerSendEffect = `enum SDL_GameControllerSendEffect = SDL_GameControllerSendEffect_renamed_SDL_SendGamepadEffect;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerSendEffect); }))) {
            mixin(enumMixinStr_SDL_GameControllerSendEffect);
        }
    }




    static if(!is(typeof(SDL_GameControllerRumbleTriggers))) {
        private enum enumMixinStr_SDL_GameControllerRumbleTriggers = `enum SDL_GameControllerRumbleTriggers = SDL_GameControllerRumbleTriggers_renamed_SDL_RumbleGamepadTriggers;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerRumbleTriggers); }))) {
            mixin(enumMixinStr_SDL_GameControllerRumbleTriggers);
        }
    }




    static if(!is(typeof(SDL_GameControllerRumble))) {
        private enum enumMixinStr_SDL_GameControllerRumble = `enum SDL_GameControllerRumble = SDL_GameControllerRumble_renamed_SDL_RumbleGamepad;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerRumble); }))) {
            mixin(enumMixinStr_SDL_GameControllerRumble);
        }
    }




    static if(!is(typeof(SDL_GameControllerPath))) {
        private enum enumMixinStr_SDL_GameControllerPath = `enum SDL_GameControllerPath = SDL_GameControllerPath_renamed_SDL_GetGamepadPath;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerPath); }))) {
            mixin(enumMixinStr_SDL_GameControllerPath);
        }
    }




    static if(!is(typeof(SDL_GameControllerOpen))) {
        private enum enumMixinStr_SDL_GameControllerOpen = `enum SDL_GameControllerOpen = SDL_GameControllerOpen_renamed_SDL_OpenGamepad;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerOpen); }))) {
            mixin(enumMixinStr_SDL_GameControllerOpen);
        }
    }




    static if(!is(typeof(SDL_GameControllerNumMappings))) {
        private enum enumMixinStr_SDL_GameControllerNumMappings = `enum SDL_GameControllerNumMappings = SDL_GameControllerNumMappings_renamed_SDL_GetNumGamepadMappings;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerNumMappings); }))) {
            mixin(enumMixinStr_SDL_GameControllerNumMappings);
        }
    }




    static if(!is(typeof(SDL_GameControllerName))) {
        private enum enumMixinStr_SDL_GameControllerName = `enum SDL_GameControllerName = SDL_GameControllerName_renamed_SDL_GetGamepadName;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerName); }))) {
            mixin(enumMixinStr_SDL_GameControllerName);
        }
    }




    static if(!is(typeof(SDL_GameControllerMappingForIndex))) {
        private enum enumMixinStr_SDL_GameControllerMappingForIndex = `enum SDL_GameControllerMappingForIndex = SDL_GameControllerMappingForIndex_renamed_SDL_GetGamepadMappingForIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerMappingForIndex); }))) {
            mixin(enumMixinStr_SDL_GameControllerMappingForIndex);
        }
    }




    static if(!is(typeof(SDL_GameControllerMappingForGUID))) {
        private enum enumMixinStr_SDL_GameControllerMappingForGUID = `enum SDL_GameControllerMappingForGUID = SDL_GameControllerMappingForGUID_renamed_SDL_GetGamepadMappingForGUID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerMappingForGUID); }))) {
            mixin(enumMixinStr_SDL_GameControllerMappingForGUID);
        }
    }




    static if(!is(typeof(SDL_GameControllerMappingForDeviceIndex))) {
        private enum enumMixinStr_SDL_GameControllerMappingForDeviceIndex = `enum SDL_GameControllerMappingForDeviceIndex = SDL_GameControllerMappingForDeviceIndex_renamed_SDL_GetGamepadMappingForDeviceIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerMappingForDeviceIndex); }))) {
            mixin(enumMixinStr_SDL_GameControllerMappingForDeviceIndex);
        }
    }




    static if(!is(typeof(SDL_GameControllerMapping))) {
        private enum enumMixinStr_SDL_GameControllerMapping = `enum SDL_GameControllerMapping = SDL_GameControllerMapping_renamed_SDL_GetGamepadMapping;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerMapping); }))) {
            mixin(enumMixinStr_SDL_GameControllerMapping);
        }
    }




    static if(!is(typeof(SDL_GameControllerIsSensorEnabled))) {
        private enum enumMixinStr_SDL_GameControllerIsSensorEnabled = `enum SDL_GameControllerIsSensorEnabled = SDL_GameControllerIsSensorEnabled_renamed_SDL_GamepadSensorEnabled;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerIsSensorEnabled); }))) {
            mixin(enumMixinStr_SDL_GameControllerIsSensorEnabled);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasSensor))) {
        private enum enumMixinStr_SDL_GameControllerHasSensor = `enum SDL_GameControllerHasSensor = SDL_GameControllerHasSensor_renamed_SDL_GamepadHasSensor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasSensor); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasSensor);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasRumbleTriggers))) {
        private enum enumMixinStr_SDL_GameControllerHasRumbleTriggers = `enum SDL_GameControllerHasRumbleTriggers = SDL_GameControllerHasRumbleTriggers_renamed_SDL_GamepadHasRumbleTriggers;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasRumbleTriggers); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasRumbleTriggers);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasRumble))) {
        private enum enumMixinStr_SDL_GameControllerHasRumble = `enum SDL_GameControllerHasRumble = SDL_GameControllerHasRumble_renamed_SDL_GamepadHasRumble;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasRumble); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasRumble);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasLED))) {
        private enum enumMixinStr_SDL_GameControllerHasLED = `enum SDL_GameControllerHasLED = SDL_GameControllerHasLED_renamed_SDL_GamepadHasLED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasLED); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasLED);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasButton))) {
        private enum enumMixinStr_SDL_GameControllerHasButton = `enum SDL_GameControllerHasButton = SDL_GameControllerHasButton_renamed_SDL_GamepadHasButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerHasAxis))) {
        private enum enumMixinStr_SDL_GameControllerHasAxis = `enum SDL_GameControllerHasAxis = SDL_GameControllerHasAxis_renamed_SDL_GamepadHasAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerHasAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerHasAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetVendor))) {
        private enum enumMixinStr_SDL_GameControllerGetVendor = `enum SDL_GameControllerGetVendor = SDL_GameControllerGetVendor_renamed_SDL_GetGamepadVendor;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetVendor); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetVendor);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetType))) {
        private enum enumMixinStr_SDL_GameControllerGetType = `enum SDL_GameControllerGetType = SDL_GameControllerGetType_renamed_SDL_GetGamepadType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetType); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetType);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetTouchpadFinger))) {
        private enum enumMixinStr_SDL_GameControllerGetTouchpadFinger = `enum SDL_GameControllerGetTouchpadFinger = SDL_GameControllerGetTouchpadFinger_renamed_SDL_GetGamepadTouchpadFinger;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetTouchpadFinger); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetTouchpadFinger);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetStringForButton))) {
        private enum enumMixinStr_SDL_GameControllerGetStringForButton = `enum SDL_GameControllerGetStringForButton = SDL_GameControllerGetStringForButton_renamed_SDL_GetGamepadStringForButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetStringForButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetStringForButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetStringForAxis))) {
        private enum enumMixinStr_SDL_GameControllerGetStringForAxis = `enum SDL_GameControllerGetStringForAxis = SDL_GameControllerGetStringForAxis_renamed_SDL_GetGamepadStringForAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetStringForAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetStringForAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetSerial))) {
        private enum enumMixinStr_SDL_GameControllerGetSerial = `enum SDL_GameControllerGetSerial = SDL_GameControllerGetSerial_renamed_SDL_GetGamepadSerial;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetSerial); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetSerial);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetSensorDataRate))) {
        private enum enumMixinStr_SDL_GameControllerGetSensorDataRate = `enum SDL_GameControllerGetSensorDataRate = SDL_GameControllerGetSensorDataRate_renamed_SDL_GetGamepadSensorDataRate;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetSensorDataRate); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetSensorDataRate);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetSensorData))) {
        private enum enumMixinStr_SDL_GameControllerGetSensorData = `enum SDL_GameControllerGetSensorData = SDL_GameControllerGetSensorData_renamed_SDL_GetGamepadSensorData;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetSensorData); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetSensorData);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetProductVersion))) {
        private enum enumMixinStr_SDL_GameControllerGetProductVersion = `enum SDL_GameControllerGetProductVersion = SDL_GameControllerGetProductVersion_renamed_SDL_GetGamepadProductVersion;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetProductVersion); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetProductVersion);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetProduct))) {
        private enum enumMixinStr_SDL_GameControllerGetProduct = `enum SDL_GameControllerGetProduct = SDL_GameControllerGetProduct_renamed_SDL_GetGamepadProduct;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetProduct); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetProduct);
        }
    }






    static if(!is(typeof(SDL_GameControllerGetPlayerIndex))) {
        private enum enumMixinStr_SDL_GameControllerGetPlayerIndex = `enum SDL_GameControllerGetPlayerIndex = SDL_GameControllerGetPlayerIndex_renamed_SDL_GetGamepadPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetNumTouchpads))) {
        private enum enumMixinStr_SDL_GameControllerGetNumTouchpads = `enum SDL_GameControllerGetNumTouchpads = SDL_GameControllerGetNumTouchpads_renamed_SDL_GetNumGamepadTouchpads;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetNumTouchpads); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetNumTouchpads);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetNumTouchpadFingers))) {
        private enum enumMixinStr_SDL_GameControllerGetNumTouchpadFingers = `enum SDL_GameControllerGetNumTouchpadFingers = SDL_GameControllerGetNumTouchpadFingers_renamed_SDL_GetNumGamepadTouchpadFingers;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetNumTouchpadFingers); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetNumTouchpadFingers);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetJoystick))) {
        private enum enumMixinStr_SDL_GameControllerGetJoystick = `enum SDL_GameControllerGetJoystick = SDL_GameControllerGetJoystick_renamed_SDL_GetGamepadJoystick;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetJoystick); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetJoystick);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetFirmwareVersion))) {
        private enum enumMixinStr_SDL_GameControllerGetFirmwareVersion = `enum SDL_GameControllerGetFirmwareVersion = SDL_GameControllerGetFirmwareVersion_renamed_SDL_GetGamepadFirmwareVersion;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetFirmwareVersion); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetFirmwareVersion);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetButtonFromString))) {
        private enum enumMixinStr_SDL_GameControllerGetButtonFromString = `enum SDL_GameControllerGetButtonFromString = SDL_GameControllerGetButtonFromString_renamed_SDL_GetGamepadButtonFromString;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetButtonFromString); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetButtonFromString);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetButton))) {
        private enum enumMixinStr_SDL_GameControllerGetButton = `enum SDL_GameControllerGetButton = SDL_GameControllerGetButton_renamed_SDL_GetGamepadButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetBindForButton))) {
        private enum enumMixinStr_SDL_GameControllerGetBindForButton = `enum SDL_GameControllerGetBindForButton = SDL_GameControllerGetBindForButton_renamed_SDL_GetGamepadBindForButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetBindForButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetBindForButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetBindForAxis))) {
        private enum enumMixinStr_SDL_GameControllerGetBindForAxis = `enum SDL_GameControllerGetBindForAxis = SDL_GameControllerGetBindForAxis_renamed_SDL_GetGamepadBindForAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetBindForAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetBindForAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetAxisFromString))) {
        private enum enumMixinStr_SDL_GameControllerGetAxisFromString = `enum SDL_GameControllerGetAxisFromString = SDL_GameControllerGetAxisFromString_renamed_SDL_GetGamepadAxisFromString;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetAxisFromString); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetAxisFromString);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetAxis))) {
        private enum enumMixinStr_SDL_GameControllerGetAxis = `enum SDL_GameControllerGetAxis = SDL_GameControllerGetAxis_renamed_SDL_GetGamepadAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetAttached))) {
        private enum enumMixinStr_SDL_GameControllerGetAttached = `enum SDL_GameControllerGetAttached = SDL_GameControllerGetAttached_renamed_SDL_GamepadConnected;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetAttached); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetAttached);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetAppleSFSymbolsNameForButton))) {
        private enum enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForButton = `enum SDL_GameControllerGetAppleSFSymbolsNameForButton = SDL_GameControllerGetAppleSFSymbolsNameForButton_renamed_SDL_GetGamepadAppleSFSymbolsNameForButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerGetAppleSFSymbolsNameForAxis))) {
        private enum enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForAxis = `enum SDL_GameControllerGetAppleSFSymbolsNameForAxis = SDL_GameControllerGetAppleSFSymbolsNameForAxis_renamed_SDL_GetGamepadAppleSFSymbolsNameForAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerGetAppleSFSymbolsNameForAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerFromPlayerIndex))) {
        private enum enumMixinStr_SDL_GameControllerFromPlayerIndex = `enum SDL_GameControllerFromPlayerIndex = SDL_GameControllerFromPlayerIndex_renamed_SDL_GetGamepadFromPlayerIndex;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerFromPlayerIndex); }))) {
            mixin(enumMixinStr_SDL_GameControllerFromPlayerIndex);
        }
    }




    static if(!is(typeof(SDL_GameControllerFromInstanceID))) {
        private enum enumMixinStr_SDL_GameControllerFromInstanceID = `enum SDL_GameControllerFromInstanceID = SDL_GameControllerFromInstanceID_renamed_SDL_GetGamepadFromInstanceID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerFromInstanceID); }))) {
            mixin(enumMixinStr_SDL_GameControllerFromInstanceID);
        }
    }




    static if(!is(typeof(SDL_GameControllerClose))) {
        private enum enumMixinStr_SDL_GameControllerClose = `enum SDL_GameControllerClose = SDL_GameControllerClose_renamed_SDL_CloseGamepad;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerClose); }))) {
            mixin(enumMixinStr_SDL_GameControllerClose);
        }
    }




    static if(!is(typeof(SDL_GameControllerButtonBind))) {
        private enum enumMixinStr_SDL_GameControllerButtonBind = `enum SDL_GameControllerButtonBind = SDL_GameControllerButtonBind_renamed_SDL_GamepadBinding;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerButtonBind); }))) {
            mixin(enumMixinStr_SDL_GameControllerButtonBind);
        }
    }




    static if(!is(typeof(SDL_GameControllerButton))) {
        private enum enumMixinStr_SDL_GameControllerButton = `enum SDL_GameControllerButton = SDL_GameControllerButton_renamed_SDL_GamepadButton;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerButton); }))) {
            mixin(enumMixinStr_SDL_GameControllerButton);
        }
    }




    static if(!is(typeof(SDL_GameControllerBindType))) {
        private enum enumMixinStr_SDL_GameControllerBindType = `enum SDL_GameControllerBindType = SDL_GameControllerBindType_renamed_SDL_GamepadBindingType;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerBindType); }))) {
            mixin(enumMixinStr_SDL_GameControllerBindType);
        }
    }




    static if(!is(typeof(SDL_GameControllerAxis))) {
        private enum enumMixinStr_SDL_GameControllerAxis = `enum SDL_GameControllerAxis = SDL_GameControllerAxis_renamed_SDL_GamepadAxis;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerAxis); }))) {
            mixin(enumMixinStr_SDL_GameControllerAxis);
        }
    }




    static if(!is(typeof(SDL_GameControllerAddMappingsFromRW))) {
        private enum enumMixinStr_SDL_GameControllerAddMappingsFromRW = `enum SDL_GameControllerAddMappingsFromRW = SDL_GameControllerAddMappingsFromRW_renamed_SDL_AddGamepadMappingsFromRW;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerAddMappingsFromRW); }))) {
            mixin(enumMixinStr_SDL_GameControllerAddMappingsFromRW);
        }
    }




    static if(!is(typeof(SDL_GameControllerAddMappingsFromFile))) {
        private enum enumMixinStr_SDL_GameControllerAddMappingsFromFile = `enum SDL_GameControllerAddMappingsFromFile = SDL_GameControllerAddMappingsFromFile_renamed_SDL_AddGamepadMappingsFromFile;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerAddMappingsFromFile); }))) {
            mixin(enumMixinStr_SDL_GameControllerAddMappingsFromFile);
        }
    }




    static if(!is(typeof(SDL_GameControllerAddMapping))) {
        private enum enumMixinStr_SDL_GameControllerAddMapping = `enum SDL_GameControllerAddMapping = SDL_GameControllerAddMapping_renamed_SDL_AddGamepadMapping;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameControllerAddMapping); }))) {
            mixin(enumMixinStr_SDL_GameControllerAddMapping);
        }
    }




    static if(!is(typeof(SDL_GameController))) {
        private enum enumMixinStr_SDL_GameController = `enum SDL_GameController = SDL_GameController_renamed_SDL_Gamepad;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_GameController); }))) {
            mixin(enumMixinStr_SDL_GameController);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_XBOXONE))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_XBOXONE = `enum SDL_CONTROLLER_TYPE_XBOXONE = SDL_CONTROLLER_TYPE_XBOXONE_renamed_SDL_GAMEPAD_TYPE_XBOXONE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_XBOXONE); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_XBOXONE);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_XBOX360))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_XBOX360 = `enum SDL_CONTROLLER_TYPE_XBOX360 = SDL_CONTROLLER_TYPE_XBOX360_renamed_SDL_GAMEPAD_TYPE_XBOX360;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_XBOX360); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_XBOX360);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_VIRTUAL))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_VIRTUAL = `enum SDL_CONTROLLER_TYPE_VIRTUAL = SDL_CONTROLLER_TYPE_VIRTUAL_renamed_SDL_GAMEPAD_TYPE_VIRTUAL;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_VIRTUAL); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_VIRTUAL);
        }
    }






    static if(!is(typeof(SDL_CONTROLLER_TYPE_UNKNOWN))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_UNKNOWN = `enum SDL_CONTROLLER_TYPE_UNKNOWN = SDL_CONTROLLER_TYPE_UNKNOWN_renamed_SDL_GAMEPAD_TYPE_UNKNOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_UNKNOWN); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_UNKNOWN);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_PS5))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_PS5 = `enum SDL_CONTROLLER_TYPE_PS5 = SDL_CONTROLLER_TYPE_PS5_renamed_SDL_GAMEPAD_TYPE_PS5;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS5); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS5);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_PS4))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_PS4 = `enum SDL_CONTROLLER_TYPE_PS4 = SDL_CONTROLLER_TYPE_PS4_renamed_SDL_GAMEPAD_TYPE_PS4;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS4); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS4);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_PS3))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_PS3 = `enum SDL_CONTROLLER_TYPE_PS3 = SDL_CONTROLLER_TYPE_PS3_renamed_SDL_GAMEPAD_TYPE_PS3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS3); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_PS3);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_NVIDIA_SHIELD))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_NVIDIA_SHIELD = `enum SDL_CONTROLLER_TYPE_NVIDIA_SHIELD = SDL_CONTROLLER_TYPE_NVIDIA_SHIELD_renamed_SDL_GAMEPAD_TYPE_NVIDIA_SHIELD;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NVIDIA_SHIELD); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NVIDIA_SHIELD);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO = `enum SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO = SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = `enum SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = `enum SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = `enum SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_GOOGLE_STADIA))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_GOOGLE_STADIA = `enum SDL_CONTROLLER_TYPE_GOOGLE_STADIA = SDL_CONTROLLER_TYPE_GOOGLE_STADIA_renamed_SDL_GAMEPAD_TYPE_GOOGLE_STADIA;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_GOOGLE_STADIA); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_GOOGLE_STADIA);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_TYPE_AMAZON_LUNA))) {
        private enum enumMixinStr_SDL_CONTROLLER_TYPE_AMAZON_LUNA = `enum SDL_CONTROLLER_TYPE_AMAZON_LUNA = SDL_CONTROLLER_TYPE_AMAZON_LUNA_renamed_SDL_GAMEPAD_TYPE_AMAZON_LUNA;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_TYPE_AMAZON_LUNA); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_TYPE_AMAZON_LUNA);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_Y))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_Y = `enum SDL_CONTROLLER_BUTTON_Y = SDL_CONTROLLER_BUTTON_Y_renamed_SDL_GAMEPAD_BUTTON_Y;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_Y); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_Y);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_X))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_X = `enum SDL_CONTROLLER_BUTTON_X = SDL_CONTROLLER_BUTTON_X_renamed_SDL_GAMEPAD_BUTTON_X;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_X); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_X);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_TOUCHPAD))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_TOUCHPAD = `enum SDL_CONTROLLER_BUTTON_TOUCHPAD = SDL_CONTROLLER_BUTTON_TOUCHPAD_renamed_SDL_GAMEPAD_BUTTON_TOUCHPAD;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_TOUCHPAD); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_TOUCHPAD);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_START))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_START = `enum SDL_CONTROLLER_BUTTON_START = SDL_CONTROLLER_BUTTON_START_renamed_SDL_GAMEPAD_BUTTON_START;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_START); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_START);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_RIGHTSTICK))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSTICK = `enum SDL_CONTROLLER_BUTTON_RIGHTSTICK = SDL_CONTROLLER_BUTTON_RIGHTSTICK_renamed_SDL_GAMEPAD_BUTTON_RIGHT_STICK;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSTICK); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSTICK);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_RIGHTSHOULDER))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = `enum SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = SDL_CONTROLLER_BUTTON_RIGHTSHOULDER_renamed_SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSHOULDER); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_RIGHTSHOULDER);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_PADDLE4))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE4 = `enum SDL_CONTROLLER_BUTTON_PADDLE4 = SDL_CONTROLLER_BUTTON_PADDLE4_renamed_SDL_GAMEPAD_BUTTON_PADDLE4;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE4); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE4);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_PADDLE3))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE3 = `enum SDL_CONTROLLER_BUTTON_PADDLE3 = SDL_CONTROLLER_BUTTON_PADDLE3_renamed_SDL_GAMEPAD_BUTTON_PADDLE3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE3); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE3);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_PADDLE2))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE2 = `enum SDL_CONTROLLER_BUTTON_PADDLE2 = SDL_CONTROLLER_BUTTON_PADDLE2_renamed_SDL_GAMEPAD_BUTTON_PADDLE2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE2); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE2);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_PADDLE1))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE1 = `enum SDL_CONTROLLER_BUTTON_PADDLE1 = SDL_CONTROLLER_BUTTON_PADDLE1_renamed_SDL_GAMEPAD_BUTTON_PADDLE1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE1); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_PADDLE1);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_MISC1))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_MISC1 = `enum SDL_CONTROLLER_BUTTON_MISC1 = SDL_CONTROLLER_BUTTON_MISC1_renamed_SDL_GAMEPAD_BUTTON_MISC1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_MISC1); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_MISC1);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_MAX))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_MAX = `enum SDL_CONTROLLER_BUTTON_MAX = SDL_CONTROLLER_BUTTON_MAX_renamed_SDL_GAMEPAD_BUTTON_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_MAX); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_MAX);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_LEFTSTICK))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSTICK = `enum SDL_CONTROLLER_BUTTON_LEFTSTICK = SDL_CONTROLLER_BUTTON_LEFTSTICK_renamed_SDL_GAMEPAD_BUTTON_LEFT_STICK;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSTICK); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSTICK);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_LEFTSHOULDER))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSHOULDER = `enum SDL_CONTROLLER_BUTTON_LEFTSHOULDER = SDL_CONTROLLER_BUTTON_LEFTSHOULDER_renamed_SDL_GAMEPAD_BUTTON_LEFT_SHOULDER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSHOULDER); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_LEFTSHOULDER);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_INVALID))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_INVALID = `enum SDL_CONTROLLER_BUTTON_INVALID = SDL_CONTROLLER_BUTTON_INVALID_renamed_SDL_GAMEPAD_BUTTON_INVALID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_INVALID); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_INVALID);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_GUIDE))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_GUIDE = `enum SDL_CONTROLLER_BUTTON_GUIDE = SDL_CONTROLLER_BUTTON_GUIDE_renamed_SDL_GAMEPAD_BUTTON_GUIDE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_GUIDE); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_GUIDE);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_DPAD_UP))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_UP = `enum SDL_CONTROLLER_BUTTON_DPAD_UP = SDL_CONTROLLER_BUTTON_DPAD_UP_renamed_SDL_GAMEPAD_BUTTON_DPAD_UP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_UP); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_UP);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_DPAD_RIGHT))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_RIGHT = `enum SDL_CONTROLLER_BUTTON_DPAD_RIGHT = SDL_CONTROLLER_BUTTON_DPAD_RIGHT_renamed_SDL_GAMEPAD_BUTTON_DPAD_RIGHT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_RIGHT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_RIGHT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_DPAD_LEFT))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_LEFT = `enum SDL_CONTROLLER_BUTTON_DPAD_LEFT = SDL_CONTROLLER_BUTTON_DPAD_LEFT_renamed_SDL_GAMEPAD_BUTTON_DPAD_LEFT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_LEFT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_LEFT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_DPAD_DOWN))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_DOWN = `enum SDL_CONTROLLER_BUTTON_DPAD_DOWN = SDL_CONTROLLER_BUTTON_DPAD_DOWN_renamed_SDL_GAMEPAD_BUTTON_DPAD_DOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_DOWN); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_DPAD_DOWN);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_BACK))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_BACK = `enum SDL_CONTROLLER_BUTTON_BACK = SDL_CONTROLLER_BUTTON_BACK_renamed_SDL_GAMEPAD_BUTTON_BACK;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_BACK); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_BACK);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_B))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_B = `enum SDL_CONTROLLER_BUTTON_B = SDL_CONTROLLER_BUTTON_B_renamed_SDL_GAMEPAD_BUTTON_B;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_B); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_B);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BUTTON_A))) {
        private enum enumMixinStr_SDL_CONTROLLER_BUTTON_A = `enum SDL_CONTROLLER_BUTTON_A = SDL_CONTROLLER_BUTTON_A_renamed_SDL_GAMEPAD_BUTTON_A;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_A); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BUTTON_A);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BINDTYPE_NONE))) {
        private enum enumMixinStr_SDL_CONTROLLER_BINDTYPE_NONE = `enum SDL_CONTROLLER_BINDTYPE_NONE = SDL_CONTROLLER_BINDTYPE_NONE_renamed_SDL_GAMEPAD_BINDTYPE_NONE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_NONE); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_NONE);
        }
    }






    static if(!is(typeof(SDL_CONTROLLER_BINDTYPE_HAT))) {
        private enum enumMixinStr_SDL_CONTROLLER_BINDTYPE_HAT = `enum SDL_CONTROLLER_BINDTYPE_HAT = SDL_CONTROLLER_BINDTYPE_HAT_renamed_SDL_GAMEPAD_BINDTYPE_HAT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_HAT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_HAT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BINDTYPE_BUTTON))) {
        private enum enumMixinStr_SDL_CONTROLLER_BINDTYPE_BUTTON = `enum SDL_CONTROLLER_BINDTYPE_BUTTON = SDL_CONTROLLER_BINDTYPE_BUTTON_renamed_SDL_GAMEPAD_BINDTYPE_BUTTON;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_BUTTON); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_BUTTON);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_BINDTYPE_AXIS))) {
        private enum enumMixinStr_SDL_CONTROLLER_BINDTYPE_AXIS = `enum SDL_CONTROLLER_BINDTYPE_AXIS = SDL_CONTROLLER_BINDTYPE_AXIS_renamed_SDL_GAMEPAD_BINDTYPE_AXIS;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_AXIS); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_BINDTYPE_AXIS);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_TRIGGERRIGHT))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERRIGHT = `enum SDL_CONTROLLER_AXIS_TRIGGERRIGHT = SDL_CONTROLLER_AXIS_TRIGGERRIGHT_renamed_SDL_GAMEPAD_AXIS_RIGHT_TRIGGER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERRIGHT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERRIGHT);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_TRIGGERLEFT))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERLEFT = `enum SDL_CONTROLLER_AXIS_TRIGGERLEFT = SDL_CONTROLLER_AXIS_TRIGGERLEFT_renamed_SDL_GAMEPAD_AXIS_LEFT_TRIGGER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERLEFT); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_TRIGGERLEFT);
        }
    }




    static if(!is(typeof(SDL_MS_PER_SECOND))) {
        private enum enumMixinStr_SDL_MS_PER_SECOND = `enum SDL_MS_PER_SECOND = 1000;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MS_PER_SECOND); }))) {
            mixin(enumMixinStr_SDL_MS_PER_SECOND);
        }
    }




    static if(!is(typeof(SDL_US_PER_SECOND))) {
        private enum enumMixinStr_SDL_US_PER_SECOND = `enum SDL_US_PER_SECOND = 1000000;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_US_PER_SECOND); }))) {
            mixin(enumMixinStr_SDL_US_PER_SECOND);
        }
    }




    static if(!is(typeof(SDL_NS_PER_SECOND))) {
        private enum enumMixinStr_SDL_NS_PER_SECOND = `enum SDL_NS_PER_SECOND = 1000000000L;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NS_PER_SECOND); }))) {
            mixin(enumMixinStr_SDL_NS_PER_SECOND);
        }
    }




    static if(!is(typeof(SDL_NS_PER_MS))) {
        private enum enumMixinStr_SDL_NS_PER_MS = `enum SDL_NS_PER_MS = 1000000;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NS_PER_MS); }))) {
            mixin(enumMixinStr_SDL_NS_PER_MS);
        }
    }




    static if(!is(typeof(SDL_NS_PER_US))) {
        private enum enumMixinStr_SDL_NS_PER_US = `enum SDL_NS_PER_US = 1000;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NS_PER_US); }))) {
            mixin(enumMixinStr_SDL_NS_PER_US);
        }
    }
    static if(!is(typeof(SDL_CONTROLLER_AXIS_RIGHTY))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTY = `enum SDL_CONTROLLER_AXIS_RIGHTY = SDL_CONTROLLER_AXIS_RIGHTY_renamed_SDL_GAMEPAD_AXIS_RIGHTY;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTY); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTY);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_RIGHTX))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTX = `enum SDL_CONTROLLER_AXIS_RIGHTX = SDL_CONTROLLER_AXIS_RIGHTX_renamed_SDL_GAMEPAD_AXIS_RIGHTX;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTX); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_RIGHTX);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_MAX))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_MAX = `enum SDL_CONTROLLER_AXIS_MAX = SDL_CONTROLLER_AXIS_MAX_renamed_SDL_GAMEPAD_AXIS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_MAX); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_MAX);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_LEFTY))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_LEFTY = `enum SDL_CONTROLLER_AXIS_LEFTY = SDL_CONTROLLER_AXIS_LEFTY_renamed_SDL_GAMEPAD_AXIS_LEFTY;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_LEFTY); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_LEFTY);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_LEFTX))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_LEFTX = `enum SDL_CONTROLLER_AXIS_LEFTX = SDL_CONTROLLER_AXIS_LEFTX_renamed_SDL_GAMEPAD_AXIS_LEFTX;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_LEFTX); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_LEFTX);
        }
    }




    static if(!is(typeof(SDL_CONTROLLER_AXIS_INVALID))) {
        private enum enumMixinStr_SDL_CONTROLLER_AXIS_INVALID = `enum SDL_CONTROLLER_AXIS_INVALID = SDL_CONTROLLER_AXIS_INVALID_renamed_SDL_GAMEPAD_AXIS_INVALID;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLER_AXIS_INVALID); }))) {
            mixin(enumMixinStr_SDL_CONTROLLER_AXIS_INVALID);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_TAKE_FOCUS))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_TAKE_FOCUS = `enum SDL_WINDOWEVENT_TAKE_FOCUS = SDL_WINDOWEVENT_TAKE_FOCUS_renamed_SDL_EVENT_WINDOW_TAKE_FOCUS;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_TAKE_FOCUS); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_TAKE_FOCUS);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_SIZE_CHANGED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_SIZE_CHANGED = `enum SDL_WINDOWEVENT_SIZE_CHANGED = SDL_WINDOWEVENT_SIZE_CHANGED_renamed_SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_SIZE_CHANGED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_SIZE_CHANGED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_SHOWN))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_SHOWN = `enum SDL_WINDOWEVENT_SHOWN = SDL_WINDOWEVENT_SHOWN_renamed_SDL_EVENT_WINDOW_SHOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_SHOWN); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_SHOWN);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_RESTORED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_RESTORED = `enum SDL_WINDOWEVENT_RESTORED = SDL_WINDOWEVENT_RESTORED_renamed_SDL_EVENT_WINDOW_RESTORED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_RESTORED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_RESTORED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_RESIZED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_RESIZED = `enum SDL_WINDOWEVENT_RESIZED = SDL_WINDOWEVENT_RESIZED_renamed_SDL_EVENT_WINDOW_RESIZED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_RESIZED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_RESIZED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_MOVED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_MOVED = `enum SDL_WINDOWEVENT_MOVED = SDL_WINDOWEVENT_MOVED_renamed_SDL_EVENT_WINDOW_MOVED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_MOVED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_MOVED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_MINIMIZED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_MINIMIZED = `enum SDL_WINDOWEVENT_MINIMIZED = SDL_WINDOWEVENT_MINIMIZED_renamed_SDL_EVENT_WINDOW_MINIMIZED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_MINIMIZED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_MINIMIZED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_MAXIMIZED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_MAXIMIZED = `enum SDL_WINDOWEVENT_MAXIMIZED = SDL_WINDOWEVENT_MAXIMIZED_renamed_SDL_EVENT_WINDOW_MAXIMIZED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_MAXIMIZED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_MAXIMIZED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_LEAVE))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_LEAVE = `enum SDL_WINDOWEVENT_LEAVE = SDL_WINDOWEVENT_LEAVE_renamed_SDL_EVENT_WINDOW_LEAVE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_LEAVE); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_LEAVE);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_ICCPROF_CHANGED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_ICCPROF_CHANGED = `enum SDL_WINDOWEVENT_ICCPROF_CHANGED = SDL_WINDOWEVENT_ICCPROF_CHANGED_renamed_SDL_EVENT_WINDOW_ICCPROF_CHANGED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_ICCPROF_CHANGED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_ICCPROF_CHANGED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_HIT_TEST))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_HIT_TEST = `enum SDL_WINDOWEVENT_HIT_TEST = SDL_WINDOWEVENT_HIT_TEST_renamed_SDL_EVENT_WINDOW_HIT_TEST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_HIT_TEST); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_HIT_TEST);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_HIDDEN))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_HIDDEN = `enum SDL_WINDOWEVENT_HIDDEN = SDL_WINDOWEVENT_HIDDEN_renamed_SDL_EVENT_WINDOW_HIDDEN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_HIDDEN); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_HIDDEN);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_FOCUS_LOST))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_FOCUS_LOST = `enum SDL_WINDOWEVENT_FOCUS_LOST = SDL_WINDOWEVENT_FOCUS_LOST_renamed_SDL_EVENT_WINDOW_FOCUS_LOST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_FOCUS_LOST); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_FOCUS_LOST);
        }
    }






    static if(!is(typeof(SDL_WINDOWEVENT_FOCUS_GAINED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_FOCUS_GAINED = `enum SDL_WINDOWEVENT_FOCUS_GAINED = SDL_WINDOWEVENT_FOCUS_GAINED_renamed_SDL_EVENT_WINDOW_FOCUS_GAINED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_FOCUS_GAINED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_FOCUS_GAINED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_EXPOSED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_EXPOSED = `enum SDL_WINDOWEVENT_EXPOSED = SDL_WINDOWEVENT_EXPOSED_renamed_SDL_EVENT_WINDOW_EXPOSED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_EXPOSED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_EXPOSED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_ENTER))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_ENTER = `enum SDL_WINDOWEVENT_ENTER = SDL_WINDOWEVENT_ENTER_renamed_SDL_EVENT_WINDOW_ENTER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_ENTER); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_ENTER);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_DISPLAY_CHANGED))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_DISPLAY_CHANGED = `enum SDL_WINDOWEVENT_DISPLAY_CHANGED = SDL_WINDOWEVENT_DISPLAY_CHANGED_renamed_SDL_EVENT_WINDOW_DISPLAY_CHANGED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_DISPLAY_CHANGED); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_DISPLAY_CHANGED);
        }
    }




    static if(!is(typeof(SDL_WINDOWEVENT_CLOSE))) {
        private enum enumMixinStr_SDL_WINDOWEVENT_CLOSE = `enum SDL_WINDOWEVENT_CLOSE = SDL_WINDOWEVENT_CLOSE_renamed_SDL_EVENT_WINDOW_CLOSE_REQUESTED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWEVENT_CLOSE); }))) {
            mixin(enumMixinStr_SDL_WINDOWEVENT_CLOSE);
        }
    }




    static if(!is(typeof(SDL_USEREVENT))) {
        private enum enumMixinStr_SDL_USEREVENT = `enum SDL_USEREVENT = SDL_USEREVENT_renamed_SDL_EVENT_USER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_USEREVENT); }))) {
            mixin(enumMixinStr_SDL_USEREVENT);
        }
    }




    static if(!is(typeof(SDL_TOUCH_MOUSEID))) {
        private enum enumMixinStr_SDL_TOUCH_MOUSEID = `enum SDL_TOUCH_MOUSEID = ( cast( Uint32 ) - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TOUCH_MOUSEID); }))) {
            mixin(enumMixinStr_SDL_TOUCH_MOUSEID);
        }
    }




    static if(!is(typeof(SDL_MOUSE_TOUCHID))) {
        private enum enumMixinStr_SDL_MOUSE_TOUCHID = `enum SDL_MOUSE_TOUCHID = ( cast( Sint64 ) - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MOUSE_TOUCHID); }))) {
            mixin(enumMixinStr_SDL_MOUSE_TOUCHID);
        }
    }




    static if(!is(typeof(SDL_TEXTINPUT))) {
        private enum enumMixinStr_SDL_TEXTINPUT = `enum SDL_TEXTINPUT = SDL_TEXTINPUT_renamed_SDL_EVENT_TEXT_INPUT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TEXTINPUT); }))) {
            mixin(enumMixinStr_SDL_TEXTINPUT);
        }
    }




    static if(!is(typeof(SDL_TEXTEDITING_EXT))) {
        private enum enumMixinStr_SDL_TEXTEDITING_EXT = `enum SDL_TEXTEDITING_EXT = SDL_TEXTEDITING_EXT_renamed_SDL_EVENT_TEXT_EDITING_EXT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TEXTEDITING_EXT); }))) {
            mixin(enumMixinStr_SDL_TEXTEDITING_EXT);
        }
    }




    static if(!is(typeof(SDL_TEXTEDITING))) {
        private enum enumMixinStr_SDL_TEXTEDITING = `enum SDL_TEXTEDITING = SDL_TEXTEDITING_renamed_SDL_EVENT_TEXT_EDITING;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TEXTEDITING); }))) {
            mixin(enumMixinStr_SDL_TEXTEDITING);
        }
    }




    static if(!is(typeof(SDL_SYSWMEVENT))) {
        private enum enumMixinStr_SDL_SYSWMEVENT = `enum SDL_SYSWMEVENT = SDL_SYSWMEVENT_renamed_SDL_EVENT_SYSWM;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SYSWMEVENT); }))) {
            mixin(enumMixinStr_SDL_SYSWMEVENT);
        }
    }




    static if(!is(typeof(SDL_SENSORUPDATE))) {
        private enum enumMixinStr_SDL_SENSORUPDATE = `enum SDL_SENSORUPDATE = SDL_SENSORUPDATE_renamed_SDL_EVENT_SENSOR_UPDATE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SENSORUPDATE); }))) {
            mixin(enumMixinStr_SDL_SENSORUPDATE);
        }
    }




    static if(!is(typeof(SDL_RENDER_TARGETS_RESET))) {
        private enum enumMixinStr_SDL_RENDER_TARGETS_RESET = `enum SDL_RENDER_TARGETS_RESET = SDL_RENDER_TARGETS_RESET_renamed_SDL_EVENT_RENDER_TARGETS_RESET;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RENDER_TARGETS_RESET); }))) {
            mixin(enumMixinStr_SDL_RENDER_TARGETS_RESET);
        }
    }




    static if(!is(typeof(SDL_RENDER_DEVICE_RESET))) {
        private enum enumMixinStr_SDL_RENDER_DEVICE_RESET = `enum SDL_RENDER_DEVICE_RESET = SDL_RENDER_DEVICE_RESET_renamed_SDL_EVENT_RENDER_DEVICE_RESET;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RENDER_DEVICE_RESET); }))) {
            mixin(enumMixinStr_SDL_RENDER_DEVICE_RESET);
        }
    }




    static if(!is(typeof(SDL_QUIT))) {
        private enum enumMixinStr_SDL_QUIT = `enum SDL_QUIT = SDL_QUIT_renamed_SDL_EVENT_QUIT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_QUIT); }))) {
            mixin(enumMixinStr_SDL_QUIT);
        }
    }




    static if(!is(typeof(SDL_POLLSENTINEL))) {
        private enum enumMixinStr_SDL_POLLSENTINEL = `enum SDL_POLLSENTINEL = SDL_POLLSENTINEL_renamed_SDL_EVENT_POLL_SENTINEL;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_POLLSENTINEL); }))) {
            mixin(enumMixinStr_SDL_POLLSENTINEL);
        }
    }




    static if(!is(typeof(SDL_MOUSEWHEEL))) {
        private enum enumMixinStr_SDL_MOUSEWHEEL = `enum SDL_MOUSEWHEEL = SDL_MOUSEWHEEL_renamed_SDL_EVENT_MOUSE_WHEEL;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MOUSEWHEEL); }))) {
            mixin(enumMixinStr_SDL_MOUSEWHEEL);
        }
    }




    static if(!is(typeof(SDL_MOUSEMOTION))) {
        private enum enumMixinStr_SDL_MOUSEMOTION = `enum SDL_MOUSEMOTION = SDL_MOUSEMOTION_renamed_SDL_EVENT_MOUSE_MOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MOUSEMOTION); }))) {
            mixin(enumMixinStr_SDL_MOUSEMOTION);
        }
    }




    static if(!is(typeof(SDL_MOUSEBUTTONUP))) {
        private enum enumMixinStr_SDL_MOUSEBUTTONUP = `enum SDL_MOUSEBUTTONUP = SDL_MOUSEBUTTONUP_renamed_SDL_EVENT_MOUSE_BUTTON_UP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MOUSEBUTTONUP); }))) {
            mixin(enumMixinStr_SDL_MOUSEBUTTONUP);
        }
    }




    static if(!is(typeof(SDL_MOUSEBUTTONDOWN))) {
        private enum enumMixinStr_SDL_MOUSEBUTTONDOWN = `enum SDL_MOUSEBUTTONDOWN = SDL_MOUSEBUTTONDOWN_renamed_SDL_EVENT_MOUSE_BUTTON_DOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MOUSEBUTTONDOWN); }))) {
            mixin(enumMixinStr_SDL_MOUSEBUTTONDOWN);
        }
    }




    static if(!is(typeof(SDL_LOCALECHANGED))) {
        private enum enumMixinStr_SDL_LOCALECHANGED = `enum SDL_LOCALECHANGED = SDL_LOCALECHANGED_renamed_SDL_EVENT_LOCALE_CHANGED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LOCALECHANGED); }))) {
            mixin(enumMixinStr_SDL_LOCALECHANGED);
        }
    }






    static if(!is(typeof(SDL_LASTEVENT))) {
        private enum enumMixinStr_SDL_LASTEVENT = `enum SDL_LASTEVENT = SDL_LASTEVENT_renamed_SDL_EVENT_LAST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LASTEVENT); }))) {
            mixin(enumMixinStr_SDL_LASTEVENT);
        }
    }




    static if(!is(typeof(SDL_KEYUP))) {
        private enum enumMixinStr_SDL_KEYUP = `enum SDL_KEYUP = SDL_KEYUP_renamed_SDL_EVENT_KEY_UP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_KEYUP); }))) {
            mixin(enumMixinStr_SDL_KEYUP);
        }
    }




    static if(!is(typeof(SDL_KEYMAPCHANGED))) {
        private enum enumMixinStr_SDL_KEYMAPCHANGED = `enum SDL_KEYMAPCHANGED = SDL_KEYMAPCHANGED_renamed_SDL_EVENT_KEYMAP_CHANGED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_KEYMAPCHANGED); }))) {
            mixin(enumMixinStr_SDL_KEYMAPCHANGED);
        }
    }




    static if(!is(typeof(SDL_KEYDOWN))) {
        private enum enumMixinStr_SDL_KEYDOWN = `enum SDL_KEYDOWN = SDL_KEYDOWN_renamed_SDL_EVENT_KEY_DOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_KEYDOWN); }))) {
            mixin(enumMixinStr_SDL_KEYDOWN);
        }
    }




    static if(!is(typeof(SDL_MAJOR_VERSION))) {
        private enum enumMixinStr_SDL_MAJOR_VERSION = `enum SDL_MAJOR_VERSION = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAJOR_VERSION); }))) {
            mixin(enumMixinStr_SDL_MAJOR_VERSION);
        }
    }




    static if(!is(typeof(SDL_MINOR_VERSION))) {
        private enum enumMixinStr_SDL_MINOR_VERSION = `enum SDL_MINOR_VERSION = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MINOR_VERSION); }))) {
            mixin(enumMixinStr_SDL_MINOR_VERSION);
        }
    }




    static if(!is(typeof(SDL_PATCHLEVEL))) {
        private enum enumMixinStr_SDL_PATCHLEVEL = `enum SDL_PATCHLEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PATCHLEVEL); }))) {
            mixin(enumMixinStr_SDL_PATCHLEVEL);
        }
    }
    static if(!is(typeof(SDL_COMPILEDVERSION))) {
        private enum enumMixinStr_SDL_COMPILEDVERSION = `enum SDL_COMPILEDVERSION = ( ( 3 ) << 24 | ( 0 ) << 8 | ( 0 ) << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_COMPILEDVERSION); }))) {
            mixin(enumMixinStr_SDL_COMPILEDVERSION);
        }
    }






    static if(!is(typeof(SDL_JOYHATMOTION))) {
        private enum enumMixinStr_SDL_JOYHATMOTION = `enum SDL_JOYHATMOTION = SDL_JOYHATMOTION_renamed_SDL_EVENT_JOYSTICK_HAT_MOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYHATMOTION); }))) {
            mixin(enumMixinStr_SDL_JOYHATMOTION);
        }
    }




    static if(!is(typeof(SDL_JOYDEVICEREMOVED))) {
        private enum enumMixinStr_SDL_JOYDEVICEREMOVED = `enum SDL_JOYDEVICEREMOVED = SDL_JOYDEVICEREMOVED_renamed_SDL_EVENT_JOYSTICK_REMOVED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYDEVICEREMOVED); }))) {
            mixin(enumMixinStr_SDL_JOYDEVICEREMOVED);
        }
    }




    static if(!is(typeof(SDL_JOYDEVICEADDED))) {
        private enum enumMixinStr_SDL_JOYDEVICEADDED = `enum SDL_JOYDEVICEADDED = SDL_JOYDEVICEADDED_renamed_SDL_EVENT_JOYSTICK_ADDED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYDEVICEADDED); }))) {
            mixin(enumMixinStr_SDL_JOYDEVICEADDED);
        }
    }




    static if(!is(typeof(SDL_JOYBUTTONUP))) {
        private enum enumMixinStr_SDL_JOYBUTTONUP = `enum SDL_JOYBUTTONUP = SDL_JOYBUTTONUP_renamed_SDL_EVENT_JOYSTICK_BUTTON_UP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYBUTTONUP); }))) {
            mixin(enumMixinStr_SDL_JOYBUTTONUP);
        }
    }




    static if(!is(typeof(SDL_JOYBUTTONDOWN))) {
        private enum enumMixinStr_SDL_JOYBUTTONDOWN = `enum SDL_JOYBUTTONDOWN = SDL_JOYBUTTONDOWN_renamed_SDL_EVENT_JOYSTICK_BUTTON_DOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYBUTTONDOWN); }))) {
            mixin(enumMixinStr_SDL_JOYBUTTONDOWN);
        }
    }




    static if(!is(typeof(SDL_JOYBATTERYUPDATED))) {
        private enum enumMixinStr_SDL_JOYBATTERYUPDATED = `enum SDL_JOYBATTERYUPDATED = SDL_JOYBATTERYUPDATED_renamed_SDL_EVENT_JOYSTICK_BATTERY_UPDATED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYBATTERYUPDATED); }))) {
            mixin(enumMixinStr_SDL_JOYBATTERYUPDATED);
        }
    }






    static if(!is(typeof(SDL_JOYAXISMOTION))) {
        private enum enumMixinStr_SDL_JOYAXISMOTION = `enum SDL_JOYAXISMOTION = SDL_JOYAXISMOTION_renamed_SDL_EVENT_JOYSTICK_AXIS_MOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYAXISMOTION); }))) {
            mixin(enumMixinStr_SDL_JOYAXISMOTION);
        }
    }




    static if(!is(typeof(SDL_FIRSTEVENT))) {
        private enum enumMixinStr_SDL_FIRSTEVENT = `enum SDL_FIRSTEVENT = SDL_FIRSTEVENT_renamed_SDL_EVENT_FIRST;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FIRSTEVENT); }))) {
            mixin(enumMixinStr_SDL_FIRSTEVENT);
        }
    }




    static if(!is(typeof(SDL_FINGERUP))) {
        private enum enumMixinStr_SDL_FINGERUP = `enum SDL_FINGERUP = SDL_FINGERUP_renamed_SDL_EVENT_FINGER_UP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FINGERUP); }))) {
            mixin(enumMixinStr_SDL_FINGERUP);
        }
    }




    static if(!is(typeof(SDL_FINGERMOTION))) {
        private enum enumMixinStr_SDL_FINGERMOTION = `enum SDL_FINGERMOTION = SDL_FINGERMOTION_renamed_SDL_EVENT_FINGER_MOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FINGERMOTION); }))) {
            mixin(enumMixinStr_SDL_FINGERMOTION);
        }
    }




    static if(!is(typeof(SDL_FINGERDOWN))) {
        private enum enumMixinStr_SDL_FINGERDOWN = `enum SDL_FINGERDOWN = SDL_FINGERDOWN_renamed_SDL_EVENT_FINGER_DOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FINGERDOWN); }))) {
            mixin(enumMixinStr_SDL_FINGERDOWN);
        }
    }




    static if(!is(typeof(SDL_DROPTEXT))) {
        private enum enumMixinStr_SDL_DROPTEXT = `enum SDL_DROPTEXT = SDL_DROPTEXT_renamed_SDL_EVENT_DROP_TEXT;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DROPTEXT); }))) {
            mixin(enumMixinStr_SDL_DROPTEXT);
        }
    }




    static if(!is(typeof(SDL_DROPFILE))) {
        private enum enumMixinStr_SDL_DROPFILE = `enum SDL_DROPFILE = SDL_DROPFILE_renamed_SDL_EVENT_DROP_FILE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DROPFILE); }))) {
            mixin(enumMixinStr_SDL_DROPFILE);
        }
    }




    static if(!is(typeof(SDL_WINDOWPOS_UNDEFINED_MASK))) {
        private enum enumMixinStr_SDL_WINDOWPOS_UNDEFINED_MASK = `enum SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000u;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWPOS_UNDEFINED_MASK); }))) {
            mixin(enumMixinStr_SDL_WINDOWPOS_UNDEFINED_MASK);
        }
    }






    static if(!is(typeof(SDL_WINDOWPOS_UNDEFINED))) {
        private enum enumMixinStr_SDL_WINDOWPOS_UNDEFINED = `enum SDL_WINDOWPOS_UNDEFINED = ( 0x1FFF0000u | ( 0 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWPOS_UNDEFINED); }))) {
            mixin(enumMixinStr_SDL_WINDOWPOS_UNDEFINED);
        }
    }






    static if(!is(typeof(SDL_WINDOWPOS_CENTERED_MASK))) {
        private enum enumMixinStr_SDL_WINDOWPOS_CENTERED_MASK = `enum SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000u;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWPOS_CENTERED_MASK); }))) {
            mixin(enumMixinStr_SDL_WINDOWPOS_CENTERED_MASK);
        }
    }






    static if(!is(typeof(SDL_WINDOWPOS_CENTERED))) {
        private enum enumMixinStr_SDL_WINDOWPOS_CENTERED = `enum SDL_WINDOWPOS_CENTERED = ( 0x2FFF0000u | ( 0 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_WINDOWPOS_CENTERED); }))) {
            mixin(enumMixinStr_SDL_WINDOWPOS_CENTERED);
        }
    }






    static if(!is(typeof(SDL_DROPCOMPLETE))) {
        private enum enumMixinStr_SDL_DROPCOMPLETE = `enum SDL_DROPCOMPLETE = SDL_DROPCOMPLETE_renamed_SDL_EVENT_DROP_COMPLETE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DROPCOMPLETE); }))) {
            mixin(enumMixinStr_SDL_DROPCOMPLETE);
        }
    }




    static if(!is(typeof(SDL_DROPBEGIN))) {
        private enum enumMixinStr_SDL_DROPBEGIN = `enum SDL_DROPBEGIN = SDL_DROPBEGIN_renamed_SDL_EVENT_DROP_BEGIN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DROPBEGIN); }))) {
            mixin(enumMixinStr_SDL_DROPBEGIN);
        }
    }




    static if(!is(typeof(SDL_DISPLAYEVENT_ORIENTATION))) {
        private enum enumMixinStr_SDL_DISPLAYEVENT_ORIENTATION = `enum SDL_DISPLAYEVENT_ORIENTATION = SDL_DISPLAYEVENT_ORIENTATION_renamed_SDL_EVENT_DISPLAY_ORIENTATION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DISPLAYEVENT_ORIENTATION); }))) {
            mixin(enumMixinStr_SDL_DISPLAYEVENT_ORIENTATION);
        }
    }




    static if(!is(typeof(SDL_DISPLAYEVENT_MOVED))) {
        private enum enumMixinStr_SDL_DISPLAYEVENT_MOVED = `enum SDL_DISPLAYEVENT_MOVED = SDL_DISPLAYEVENT_MOVED_renamed_SDL_EVENT_DISPLAY_MOVED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DISPLAYEVENT_MOVED); }))) {
            mixin(enumMixinStr_SDL_DISPLAYEVENT_MOVED);
        }
    }




    static if(!is(typeof(SDL_DISPLAYEVENT_DISCONNECTED))) {
        private enum enumMixinStr_SDL_DISPLAYEVENT_DISCONNECTED = `enum SDL_DISPLAYEVENT_DISCONNECTED = SDL_DISPLAYEVENT_DISCONNECTED_renamed_SDL_EVENT_DISPLAY_DISCONNECTED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DISPLAYEVENT_DISCONNECTED); }))) {
            mixin(enumMixinStr_SDL_DISPLAYEVENT_DISCONNECTED);
        }
    }




    static if(!is(typeof(SDL_DISPLAYEVENT_CONNECTED))) {
        private enum enumMixinStr_SDL_DISPLAYEVENT_CONNECTED = `enum SDL_DISPLAYEVENT_CONNECTED = SDL_DISPLAYEVENT_CONNECTED_renamed_SDL_EVENT_DISPLAY_CONNECTED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DISPLAYEVENT_CONNECTED); }))) {
            mixin(enumMixinStr_SDL_DISPLAYEVENT_CONNECTED);
        }
    }




    static if(!is(typeof(SDL_ControllerTouchpadEvent))) {
        private enum enumMixinStr_SDL_ControllerTouchpadEvent = `enum SDL_ControllerTouchpadEvent = SDL_ControllerTouchpadEvent_renamed_SDL_GamepadTouchpadEvent;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ControllerTouchpadEvent); }))) {
            mixin(enumMixinStr_SDL_ControllerTouchpadEvent);
        }
    }




    static if(!is(typeof(SDL_ControllerSensorEvent))) {
        private enum enumMixinStr_SDL_ControllerSensorEvent = `enum SDL_ControllerSensorEvent = SDL_ControllerSensorEvent_renamed_SDL_GamepadSensorEvent;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ControllerSensorEvent); }))) {
            mixin(enumMixinStr_SDL_ControllerSensorEvent);
        }
    }




    static if(!is(typeof(SDL_ControllerDeviceEvent))) {
        private enum enumMixinStr_SDL_ControllerDeviceEvent = `enum SDL_ControllerDeviceEvent = SDL_ControllerDeviceEvent_renamed_SDL_GamepadDeviceEvent;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ControllerDeviceEvent); }))) {
            mixin(enumMixinStr_SDL_ControllerDeviceEvent);
        }
    }




    static if(!is(typeof(SDL_ControllerButtonEvent))) {
        private enum enumMixinStr_SDL_ControllerButtonEvent = `enum SDL_ControllerButtonEvent = SDL_ControllerButtonEvent_renamed_SDL_GamepadButtonEvent;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ControllerButtonEvent); }))) {
            mixin(enumMixinStr_SDL_ControllerButtonEvent);
        }
    }




    static if(!is(typeof(SDL_ControllerAxisEvent))) {
        private enum enumMixinStr_SDL_ControllerAxisEvent = `enum SDL_ControllerAxisEvent = SDL_ControllerAxisEvent_renamed_SDL_GamepadAxisEvent;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ControllerAxisEvent); }))) {
            mixin(enumMixinStr_SDL_ControllerAxisEvent);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERTOUCHPADUP))) {
        private enum enumMixinStr_SDL_CONTROLLERTOUCHPADUP = `enum SDL_CONTROLLERTOUCHPADUP = SDL_CONTROLLERTOUCHPADUP_renamed_SDL_GAMEPADTOUCHPADUP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADUP); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADUP);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERTOUCHPADMOTION))) {
        private enum enumMixinStr_SDL_CONTROLLERTOUCHPADMOTION = `enum SDL_CONTROLLERTOUCHPADMOTION = SDL_CONTROLLERTOUCHPADMOTION_renamed_SDL_GAMEPADTOUCHPADMOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADMOTION); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADMOTION);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERTOUCHPADDOWN))) {
        private enum enumMixinStr_SDL_CONTROLLERTOUCHPADDOWN = `enum SDL_CONTROLLERTOUCHPADDOWN = SDL_CONTROLLERTOUCHPADDOWN_renamed_SDL_GAMEPADTOUCHPADDOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADDOWN); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERTOUCHPADDOWN);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERSENSORUPDATE))) {
        private enum enumMixinStr_SDL_CONTROLLERSENSORUPDATE = `enum SDL_CONTROLLERSENSORUPDATE = SDL_CONTROLLERSENSORUPDATE_renamed_SDL_GAMEPADSENSORUPDATE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERSENSORUPDATE); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERSENSORUPDATE);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERDEVICEREMOVED))) {
        private enum enumMixinStr_SDL_CONTROLLERDEVICEREMOVED = `enum SDL_CONTROLLERDEVICEREMOVED = SDL_CONTROLLERDEVICEREMOVED_renamed_SDL_GAMEPADREMOVED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERDEVICEREMOVED); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERDEVICEREMOVED);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERDEVICEREMAPPED))) {
        private enum enumMixinStr_SDL_CONTROLLERDEVICEREMAPPED = `enum SDL_CONTROLLERDEVICEREMAPPED = SDL_CONTROLLERDEVICEREMAPPED_renamed_SDL_GAMEPADREMAPPED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERDEVICEREMAPPED); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERDEVICEREMAPPED);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERDEVICEADDED))) {
        private enum enumMixinStr_SDL_CONTROLLERDEVICEADDED = `enum SDL_CONTROLLERDEVICEADDED = SDL_CONTROLLERDEVICEADDED_renamed_SDL_GAMEPADADDED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERDEVICEADDED); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERDEVICEADDED);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERBUTTONUP))) {
        private enum enumMixinStr_SDL_CONTROLLERBUTTONUP = `enum SDL_CONTROLLERBUTTONUP = SDL_CONTROLLERBUTTONUP_renamed_SDL_GAMEPADBUTTONUP;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERBUTTONUP); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERBUTTONUP);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERBUTTONDOWN))) {
        private enum enumMixinStr_SDL_CONTROLLERBUTTONDOWN = `enum SDL_CONTROLLERBUTTONDOWN = SDL_CONTROLLERBUTTONDOWN_renamed_SDL_GAMEPADBUTTONDOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERBUTTONDOWN); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERBUTTONDOWN);
        }
    }




    static if(!is(typeof(SDL_CONTROLLERAXISMOTION))) {
        private enum enumMixinStr_SDL_CONTROLLERAXISMOTION = `enum SDL_CONTROLLERAXISMOTION = SDL_CONTROLLERAXISMOTION_renamed_SDL_GAMEPADAXISMOTION;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CONTROLLERAXISMOTION); }))) {
            mixin(enumMixinStr_SDL_CONTROLLERAXISMOTION);
        }
    }




    static if(!is(typeof(SDL_CLIPBOARDUPDATE))) {
        private enum enumMixinStr_SDL_CLIPBOARDUPDATE = `enum SDL_CLIPBOARDUPDATE = SDL_CLIPBOARDUPDATE_renamed_SDL_EVENT_CLIPBOARD_UPDATE;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CLIPBOARDUPDATE); }))) {
            mixin(enumMixinStr_SDL_CLIPBOARDUPDATE);
        }
    }




    static if(!is(typeof(SDL_AUDIODEVICEREMOVED))) {
        private enum enumMixinStr_SDL_AUDIODEVICEREMOVED = `enum SDL_AUDIODEVICEREMOVED = SDL_AUDIODEVICEREMOVED_renamed_SDL_EVENT_AUDIO_DEVICE_REMOVED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIODEVICEREMOVED); }))) {
            mixin(enumMixinStr_SDL_AUDIODEVICEREMOVED);
        }
    }




    static if(!is(typeof(SDL_AUDIODEVICEADDED))) {
        private enum enumMixinStr_SDL_AUDIODEVICEADDED = `enum SDL_AUDIODEVICEADDED = SDL_AUDIODEVICEADDED_renamed_SDL_EVENT_AUDIO_DEVICE_ADDED;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIODEVICEADDED); }))) {
            mixin(enumMixinStr_SDL_AUDIODEVICEADDED);
        }
    }




    static if(!is(typeof(SDL_APP_WILLENTERFOREGROUND))) {
        private enum enumMixinStr_SDL_APP_WILLENTERFOREGROUND = `enum SDL_APP_WILLENTERFOREGROUND = SDL_APP_WILLENTERFOREGROUND_renamed_SDL_EVENT_WILL_ENTER_FOREGROUND;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_WILLENTERFOREGROUND); }))) {
            mixin(enumMixinStr_SDL_APP_WILLENTERFOREGROUND);
        }
    }




    static if(!is(typeof(SDL_APP_WILLENTERBACKGROUND))) {
        private enum enumMixinStr_SDL_APP_WILLENTERBACKGROUND = `enum SDL_APP_WILLENTERBACKGROUND = SDL_APP_WILLENTERBACKGROUND_renamed_SDL_EVENT_WILL_ENTER_BACKGROUND;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_WILLENTERBACKGROUND); }))) {
            mixin(enumMixinStr_SDL_APP_WILLENTERBACKGROUND);
        }
    }




    static if(!is(typeof(SDL_APP_TERMINATING))) {
        private enum enumMixinStr_SDL_APP_TERMINATING = `enum SDL_APP_TERMINATING = SDL_APP_TERMINATING_renamed_SDL_EVENT_TERMINATING;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_TERMINATING); }))) {
            mixin(enumMixinStr_SDL_APP_TERMINATING);
        }
    }




    static if(!is(typeof(SDL_APP_LOWMEMORY))) {
        private enum enumMixinStr_SDL_APP_LOWMEMORY = `enum SDL_APP_LOWMEMORY = SDL_APP_LOWMEMORY_renamed_SDL_EVENT_LOW_MEMORY;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_LOWMEMORY); }))) {
            mixin(enumMixinStr_SDL_APP_LOWMEMORY);
        }
    }




    static if(!is(typeof(SDL_APP_DIDENTERFOREGROUND))) {
        private enum enumMixinStr_SDL_APP_DIDENTERFOREGROUND = `enum SDL_APP_DIDENTERFOREGROUND = SDL_APP_DIDENTERFOREGROUND_renamed_SDL_EVENT_DID_ENTER_FOREGROUND;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_DIDENTERFOREGROUND); }))) {
            mixin(enumMixinStr_SDL_APP_DIDENTERFOREGROUND);
        }
    }




    static if(!is(typeof(SDL_APP_DIDENTERBACKGROUND))) {
        private enum enumMixinStr_SDL_APP_DIDENTERBACKGROUND = `enum SDL_APP_DIDENTERBACKGROUND = SDL_APP_DIDENTERBACKGROUND_renamed_SDL_EVENT_DID_ENTER_BACKGROUND;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_APP_DIDENTERBACKGROUND); }))) {
            mixin(enumMixinStr_SDL_APP_DIDENTERBACKGROUND);
        }
    }




    static if(!is(typeof(SDL_NewAudioStream))) {
        private enum enumMixinStr_SDL_NewAudioStream = `enum SDL_NewAudioStream = SDL_NewAudioStream_renamed_SDL_CreateAudioStream;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NewAudioStream); }))) {
            mixin(enumMixinStr_SDL_NewAudioStream);
        }
    }




    static if(!is(typeof(SDL_FreeWAV))) {
        private enum enumMixinStr_SDL_FreeWAV = `enum SDL_FreeWAV = SDL_FreeWAV_renamed_SDL_free;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeWAV); }))) {
            mixin(enumMixinStr_SDL_FreeWAV);
        }
    }




    static if(!is(typeof(SDL_FreeAudioStream))) {
        private enum enumMixinStr_SDL_FreeAudioStream = `enum SDL_FreeAudioStream = SDL_FreeAudioStream_renamed_SDL_DestroyAudioStream;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FreeAudioStream); }))) {
            mixin(enumMixinStr_SDL_FreeAudioStream);
        }
    }




    static if(!is(typeof(SDL_AudioStreamPut))) {
        private enum enumMixinStr_SDL_AudioStreamPut = `enum SDL_AudioStreamPut = SDL_AudioStreamPut_renamed_SDL_PutAudioStreamData;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AudioStreamPut); }))) {
            mixin(enumMixinStr_SDL_AudioStreamPut);
        }
    }




    static if(!is(typeof(SDL_AudioStreamGet))) {
        private enum enumMixinStr_SDL_AudioStreamGet = `enum SDL_AudioStreamGet = SDL_AudioStreamGet_renamed_SDL_GetAudioStreamData;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AudioStreamGet); }))) {
            mixin(enumMixinStr_SDL_AudioStreamGet);
        }
    }




    static if(!is(typeof(SDL_AudioStreamFlush))) {
        private enum enumMixinStr_SDL_AudioStreamFlush = `enum SDL_AudioStreamFlush = SDL_AudioStreamFlush_renamed_SDL_FlushAudioStream;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AudioStreamFlush); }))) {
            mixin(enumMixinStr_SDL_AudioStreamFlush);
        }
    }




    static if(!is(typeof(SDL_AudioStreamClear))) {
        private enum enumMixinStr_SDL_AudioStreamClear = `enum SDL_AudioStreamClear = SDL_AudioStreamClear_renamed_SDL_ClearAudioStream;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AudioStreamClear); }))) {
            mixin(enumMixinStr_SDL_AudioStreamClear);
        }
    }




    static if(!is(typeof(SDL_AudioStreamAvailable))) {
        private enum enumMixinStr_SDL_AudioStreamAvailable = `enum SDL_AudioStreamAvailable = SDL_AudioStreamAvailable_renamed_SDL_GetAudioStreamAvailable;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AudioStreamAvailable); }))) {
            mixin(enumMixinStr_SDL_AudioStreamAvailable);
        }
    }
    static if(!is(typeof(SDL_MUTEX_MAXWAIT))) {
        private enum enumMixinStr_SDL_MUTEX_MAXWAIT = `enum SDL_MUTEX_MAXWAIT = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MUTEX_MAXWAIT); }))) {
            mixin(enumMixinStr_SDL_MUTEX_MAXWAIT);
        }
    }




    static if(!is(typeof(SDL_MUTEX_TIMEDOUT))) {
        private enum enumMixinStr_SDL_MUTEX_TIMEDOUT = `enum SDL_MUTEX_TIMEDOUT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MUTEX_TIMEDOUT); }))) {
            mixin(enumMixinStr_SDL_MUTEX_TIMEDOUT);
        }
    }




    static if(!is(typeof(SDL_NO_THREAD_SAFETY_ANALYSIS))) {
        private enum enumMixinStr_SDL_NO_THREAD_SAFETY_ANALYSIS = `enum SDL_NO_THREAD_SAFETY_ANALYSIS = SDL_THREAD_ANNOTATION_ATTRIBUTE__ ( no_thread_safety_analysis );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NO_THREAD_SAFETY_ANALYSIS); }))) {
            mixin(enumMixinStr_SDL_NO_THREAD_SAFETY_ANALYSIS);
        }
    }
    static if(!is(typeof(SDL_SCOPED_CAPABILITY))) {
        private enum enumMixinStr_SDL_SCOPED_CAPABILITY = `enum SDL_SCOPED_CAPABILITY = SDL_THREAD_ANNOTATION_ATTRIBUTE__ ( scoped_lockable );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_SCOPED_CAPABILITY); }))) {
            mixin(enumMixinStr_SDL_SCOPED_CAPABILITY);
        }
    }
    static if(!is(typeof(SDL_BUTTON_X2MASK))) {
        private enum enumMixinStr_SDL_BUTTON_X2MASK = `enum SDL_BUTTON_X2MASK = SDL_BUTTON ( SDL_BUTTON_X2 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_X2MASK); }))) {
            mixin(enumMixinStr_SDL_BUTTON_X2MASK);
        }
    }




    static if(!is(typeof(SDL_BUTTON_X1MASK))) {
        private enum enumMixinStr_SDL_BUTTON_X1MASK = `enum SDL_BUTTON_X1MASK = SDL_BUTTON ( SDL_BUTTON_X1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_X1MASK); }))) {
            mixin(enumMixinStr_SDL_BUTTON_X1MASK);
        }
    }




    static if(!is(typeof(SDL_BUTTON_RMASK))) {
        private enum enumMixinStr_SDL_BUTTON_RMASK = `enum SDL_BUTTON_RMASK = SDL_BUTTON ( SDL_BUTTON_RIGHT );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_RMASK); }))) {
            mixin(enumMixinStr_SDL_BUTTON_RMASK);
        }
    }




    static if(!is(typeof(SDL_BUTTON_MMASK))) {
        private enum enumMixinStr_SDL_BUTTON_MMASK = `enum SDL_BUTTON_MMASK = SDL_BUTTON ( SDL_BUTTON_MIDDLE );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_MMASK); }))) {
            mixin(enumMixinStr_SDL_BUTTON_MMASK);
        }
    }




    static if(!is(typeof(SDL_BUTTON_LMASK))) {
        private enum enumMixinStr_SDL_BUTTON_LMASK = `enum SDL_BUTTON_LMASK = SDL_BUTTON ( SDL_BUTTON_LEFT );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_LMASK); }))) {
            mixin(enumMixinStr_SDL_BUTTON_LMASK);
        }
    }




    static if(!is(typeof(SDL_BUTTON_X2))) {
        private enum enumMixinStr_SDL_BUTTON_X2 = `enum SDL_BUTTON_X2 = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_X2); }))) {
            mixin(enumMixinStr_SDL_BUTTON_X2);
        }
    }




    static if(!is(typeof(SDL_BUTTON_X1))) {
        private enum enumMixinStr_SDL_BUTTON_X1 = `enum SDL_BUTTON_X1 = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_X1); }))) {
            mixin(enumMixinStr_SDL_BUTTON_X1);
        }
    }




    static if(!is(typeof(SDL_BUTTON_RIGHT))) {
        private enum enumMixinStr_SDL_BUTTON_RIGHT = `enum SDL_BUTTON_RIGHT = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_RIGHT); }))) {
            mixin(enumMixinStr_SDL_BUTTON_RIGHT);
        }
    }




    static if(!is(typeof(SDL_BUTTON_MIDDLE))) {
        private enum enumMixinStr_SDL_BUTTON_MIDDLE = `enum SDL_BUTTON_MIDDLE = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_MIDDLE); }))) {
            mixin(enumMixinStr_SDL_BUTTON_MIDDLE);
        }
    }




    static if(!is(typeof(SDL_BUTTON_LEFT))) {
        private enum enumMixinStr_SDL_BUTTON_LEFT = `enum SDL_BUTTON_LEFT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BUTTON_LEFT); }))) {
            mixin(enumMixinStr_SDL_BUTTON_LEFT);
        }
    }
    static if(!is(typeof(SDL_MAX_LOG_MESSAGE))) {
        private enum enumMixinStr_SDL_MAX_LOG_MESSAGE = `enum SDL_MAX_LOG_MESSAGE = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MAX_LOG_MESSAGE); }))) {
            mixin(enumMixinStr_SDL_MAX_LOG_MESSAGE);
        }
    }
    static if(!is(typeof(SDLK_SCANCODE_MASK))) {
        private enum enumMixinStr_SDLK_SCANCODE_MASK = `enum SDLK_SCANCODE_MASK = ( 1 << 30 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDLK_SCANCODE_MASK); }))) {
            mixin(enumMixinStr_SDLK_SCANCODE_MASK);
        }
    }
    static if(!is(typeof(SDL_HAT_LEFTDOWN))) {
        private enum enumMixinStr_SDL_HAT_LEFTDOWN = `enum SDL_HAT_LEFTDOWN = ( SDL_HAT_LEFT | SDL_HAT_DOWN );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_LEFTDOWN); }))) {
            mixin(enumMixinStr_SDL_HAT_LEFTDOWN);
        }
    }




    static if(!is(typeof(SDL_HAT_LEFTUP))) {
        private enum enumMixinStr_SDL_HAT_LEFTUP = `enum SDL_HAT_LEFTUP = ( SDL_HAT_LEFT | SDL_HAT_UP );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_LEFTUP); }))) {
            mixin(enumMixinStr_SDL_HAT_LEFTUP);
        }
    }




    static if(!is(typeof(SDL_HAT_RIGHTDOWN))) {
        private enum enumMixinStr_SDL_HAT_RIGHTDOWN = `enum SDL_HAT_RIGHTDOWN = ( SDL_HAT_RIGHT | SDL_HAT_DOWN );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_RIGHTDOWN); }))) {
            mixin(enumMixinStr_SDL_HAT_RIGHTDOWN);
        }
    }




    static if(!is(typeof(SDL_HAT_RIGHTUP))) {
        private enum enumMixinStr_SDL_HAT_RIGHTUP = `enum SDL_HAT_RIGHTUP = ( SDL_HAT_RIGHT | SDL_HAT_UP );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_RIGHTUP); }))) {
            mixin(enumMixinStr_SDL_HAT_RIGHTUP);
        }
    }




    static if(!is(typeof(SDL_HAT_LEFT))) {
        private enum enumMixinStr_SDL_HAT_LEFT = `enum SDL_HAT_LEFT = 0x08;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_LEFT); }))) {
            mixin(enumMixinStr_SDL_HAT_LEFT);
        }
    }




    static if(!is(typeof(SDL_HAT_DOWN))) {
        private enum enumMixinStr_SDL_HAT_DOWN = `enum SDL_HAT_DOWN = 0x04;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_DOWN); }))) {
            mixin(enumMixinStr_SDL_HAT_DOWN);
        }
    }




    static if(!is(typeof(SDL_HAT_RIGHT))) {
        private enum enumMixinStr_SDL_HAT_RIGHT = `enum SDL_HAT_RIGHT = 0x02;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_RIGHT); }))) {
            mixin(enumMixinStr_SDL_HAT_RIGHT);
        }
    }




    static if(!is(typeof(SDL_HAT_UP))) {
        private enum enumMixinStr_SDL_HAT_UP = `enum SDL_HAT_UP = 0x01;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_UP); }))) {
            mixin(enumMixinStr_SDL_HAT_UP);
        }
    }




    static if(!is(typeof(SDL_HAT_CENTERED))) {
        private enum enumMixinStr_SDL_HAT_CENTERED = `enum SDL_HAT_CENTERED = 0x00;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAT_CENTERED); }))) {
            mixin(enumMixinStr_SDL_HAT_CENTERED);
        }
    }




    static if(!is(typeof(SDL_VIRTUAL_JOYSTICK_DESC_VERSION))) {
        private enum enumMixinStr_SDL_VIRTUAL_JOYSTICK_DESC_VERSION = `enum SDL_VIRTUAL_JOYSTICK_DESC_VERSION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_VIRTUAL_JOYSTICK_DESC_VERSION); }))) {
            mixin(enumMixinStr_SDL_VIRTUAL_JOYSTICK_DESC_VERSION);
        }
    }




    static if(!is(typeof(SDL_IPHONE_MAX_GFORCE))) {
        private enum enumMixinStr_SDL_IPHONE_MAX_GFORCE = `enum SDL_IPHONE_MAX_GFORCE = 5.0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_IPHONE_MAX_GFORCE); }))) {
            mixin(enumMixinStr_SDL_IPHONE_MAX_GFORCE);
        }
    }




    static if(!is(typeof(SDL_JOYSTICK_AXIS_MIN))) {
        private enum enumMixinStr_SDL_JOYSTICK_AXIS_MIN = `enum SDL_JOYSTICK_AXIS_MIN = - 32768;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYSTICK_AXIS_MIN); }))) {
            mixin(enumMixinStr_SDL_JOYSTICK_AXIS_MIN);
        }
    }




    static if(!is(typeof(SDL_JOYSTICK_AXIS_MAX))) {
        private enum enumMixinStr_SDL_JOYSTICK_AXIS_MAX = `enum SDL_JOYSTICK_AXIS_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_JOYSTICK_AXIS_MAX); }))) {
            mixin(enumMixinStr_SDL_JOYSTICK_AXIS_MAX);
        }
    }






    static if(!is(typeof(SDL_INIT_EVERYTHING))) {
        private enum enumMixinStr_SDL_INIT_EVERYTHING = `enum SDL_INIT_EVERYTHING = ( SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMEPAD | SDL_INIT_SENSOR );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_INIT_EVERYTHING); }))) {
            mixin(enumMixinStr_SDL_INIT_EVERYTHING);
        }
    }






    static if(!is(typeof(SDL_HINT_TRACKPAD_IS_TOUCH_ONLY))) {
        private enum enumMixinStr_SDL_HINT_TRACKPAD_IS_TOUCH_ONLY = `enum SDL_HINT_TRACKPAD_IS_TOUCH_ONLY = "SDL_TRACKPAD_IS_TOUCH_ONLY";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_TRACKPAD_IS_TOUCH_ONLY); }))) {
            mixin(enumMixinStr_SDL_HINT_TRACKPAD_IS_TOUCH_ONLY);
        }
    }




    static if(!is(typeof(SDL_HINT_KMSDRM_DEVICE_INDEX))) {
        private enum enumMixinStr_SDL_HINT_KMSDRM_DEVICE_INDEX = `enum SDL_HINT_KMSDRM_DEVICE_INDEX = "SDL_KMSDRM_DEVICE_INDEX";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_KMSDRM_DEVICE_INDEX); }))) {
            mixin(enumMixinStr_SDL_HINT_KMSDRM_DEVICE_INDEX);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_DRIVER))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_DRIVER = `enum SDL_HINT_AUDIO_DRIVER = "SDL_AUDIO_DRIVER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_DRIVER); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_DRIVER);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_DRIVER))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_DRIVER = `enum SDL_HINT_VIDEO_DRIVER = "SDL_VIDEO_DRIVER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_DRIVER); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_DRIVER);
        }
    }




    static if(!is(typeof(SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE))) {
        private enum enumMixinStr_SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE = `enum SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE = "SDL_QUIT_ON_LAST_WINDOW_CLOSE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE); }))) {
            mixin(enumMixinStr_SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE);
        }
    }




    static if(!is(typeof(SDL_HINT_X11_WINDOW_TYPE))) {
        private enum enumMixinStr_SDL_HINT_X11_WINDOW_TYPE = `enum SDL_HINT_X11_WINDOW_TYPE = "SDL_X11_WINDOW_TYPE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_X11_WINDOW_TYPE); }))) {
            mixin(enumMixinStr_SDL_HINT_X11_WINDOW_TYPE);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_INCLUDE_MONITORS))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_INCLUDE_MONITORS = `enum SDL_HINT_AUDIO_INCLUDE_MONITORS = "SDL_AUDIO_INCLUDE_MONITORS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_INCLUDE_MONITORS); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_INCLUDE_MONITORS);
        }
    }




    static if(!is(typeof(SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING))) {
        private enum enumMixinStr_SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING = `enum SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING = "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING); }))) {
            mixin(enumMixinStr_SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING);
        }
    }




    static if(!is(typeof(SDL_HINT_DIRECTINPUT_ENABLED))) {
        private enum enumMixinStr_SDL_HINT_DIRECTINPUT_ENABLED = `enum SDL_HINT_DIRECTINPUT_ENABLED = "SDL_DIRECTINPUT_ENABLED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_DIRECTINPUT_ENABLED); }))) {
            mixin(enumMixinStr_SDL_HINT_DIRECTINPUT_ENABLED);
        }
    }




    static if(!is(typeof(SDL_HINT_XINPUT_ENABLED))) {
        private enum enumMixinStr_SDL_HINT_XINPUT_ENABLED = `enum SDL_HINT_XINPUT_ENABLED = "SDL_XINPUT_ENABLED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_XINPUT_ENABLED); }))) {
            mixin(enumMixinStr_SDL_HINT_XINPUT_ENABLED);
        }
    }




    static if(!is(typeof(SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT))) {
        private enum enumMixinStr_SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT = `enum SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT = "SDL_X11_FORCE_OVERRIDE_REDIRECT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT); }))) {
            mixin(enumMixinStr_SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT);
        }
    }




    static if(!is(typeof(SDL_HINT_WINRT_PRIVACY_POLICY_URL))) {
        private enum enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_URL = `enum SDL_HINT_WINRT_PRIVACY_POLICY_URL = "SDL_WINRT_PRIVACY_POLICY_URL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_URL); }))) {
            mixin(enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_URL);
        }
    }




    static if(!is(typeof(SDL_HINT_WINRT_PRIVACY_POLICY_LABEL))) {
        private enum enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_LABEL = `enum SDL_HINT_WINRT_PRIVACY_POLICY_LABEL = "SDL_WINRT_PRIVACY_POLICY_LABEL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_LABEL); }))) {
            mixin(enumMixinStr_SDL_HINT_WINRT_PRIVACY_POLICY_LABEL);
        }
    }




    static if(!is(typeof(SDL_HINT_WINRT_HANDLE_BACK_BUTTON))) {
        private enum enumMixinStr_SDL_HINT_WINRT_HANDLE_BACK_BUTTON = `enum SDL_HINT_WINRT_HANDLE_BACK_BUTTON = "SDL_WINRT_HANDLE_BACK_BUTTON";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINRT_HANDLE_BACK_BUTTON); }))) {
            mixin(enumMixinStr_SDL_HINT_WINRT_HANDLE_BACK_BUTTON);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN))) {
        private enum enumMixinStr_SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN = `enum SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN = "SDL_WINDOW_NO_ACTIVATION_WHEN_SHOWN";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN))) {
        private enum enumMixinStr_SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = `enum SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_USE_D3D9EX))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_USE_D3D9EX = `enum SDL_HINT_WINDOWS_USE_D3D9EX = "SDL_WINDOWS_USE_D3D9EX";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_USE_D3D9EX); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_USE_D3D9EX);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 = `enum SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 = "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = `enum SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = "SDL_WINDOWS_INTRESOURCE_ICON_SMALL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_INTRESOURCE_ICON))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON = `enum SDL_HINT_WINDOWS_INTRESOURCE_ICON = "SDL_WINDOWS_INTRESOURCE_ICON";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_INTRESOURCE_ICON);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL = `enum SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL = "SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS = `enum SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS = "SDL_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP = `enum SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP = "SDL_WINDOWS_ENABLE_MESSAGELOOP";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS = `enum SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS = "SDL_WINDOWS_ENABLE_MENU_MNEMONICS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS);
        }
    }




    static if(!is(typeof(SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING))) {
        private enum enumMixinStr_SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING = `enum SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING = "SDL_WINDOWS_DISABLE_THREAD_NAMING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING); }))) {
            mixin(enumMixinStr_SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING);
        }
    }




    static if(!is(typeof(SDL_HINT_WAVE_TRUNCATION))) {
        private enum enumMixinStr_SDL_HINT_WAVE_TRUNCATION = `enum SDL_HINT_WAVE_TRUNCATION = "SDL_WAVE_TRUNCATION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WAVE_TRUNCATION); }))) {
            mixin(enumMixinStr_SDL_HINT_WAVE_TRUNCATION);
        }
    }




    static if(!is(typeof(SDL_HINT_WAVE_RIFF_CHUNK_SIZE))) {
        private enum enumMixinStr_SDL_HINT_WAVE_RIFF_CHUNK_SIZE = `enum SDL_HINT_WAVE_RIFF_CHUNK_SIZE = "SDL_WAVE_RIFF_CHUNK_SIZE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WAVE_RIFF_CHUNK_SIZE); }))) {
            mixin(enumMixinStr_SDL_HINT_WAVE_RIFF_CHUNK_SIZE);
        }
    }




    static if(!is(typeof(SDL_HINT_WAVE_FACT_CHUNK))) {
        private enum enumMixinStr_SDL_HINT_WAVE_FACT_CHUNK = `enum SDL_HINT_WAVE_FACT_CHUNK = "SDL_WAVE_FACT_CHUNK";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_WAVE_FACT_CHUNK); }))) {
            mixin(enumMixinStr_SDL_HINT_WAVE_FACT_CHUNK);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_X11_XRANDR))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_X11_XRANDR = `enum SDL_HINT_VIDEO_X11_XRANDR = "SDL_VIDEO_X11_XRANDR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_X11_XRANDR); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_X11_XRANDR);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_X11_WINDOW_VISUALID))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_X11_WINDOW_VISUALID = `enum SDL_HINT_VIDEO_X11_WINDOW_VISUALID = "SDL_VIDEO_X11_WINDOW_VISUALID";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_X11_WINDOW_VISUALID); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_X11_WINDOW_VISUALID);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_X11_NET_WM_PING))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_PING = `enum SDL_HINT_VIDEO_X11_NET_WM_PING = "SDL_VIDEO_X11_NET_WM_PING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_PING); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_PING);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = `enum SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_FORCE_EGL))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_FORCE_EGL = `enum SDL_HINT_VIDEO_FORCE_EGL = "SDL_VIDEO_FORCE_EGL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_FORCE_EGL); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_FORCE_EGL);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WIN_D3DCOMPILER))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WIN_D3DCOMPILER = `enum SDL_HINT_VIDEO_WIN_D3DCOMPILER = "SDL_VIDEO_WIN_D3DCOMPILER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WIN_D3DCOMPILER); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WIN_D3DCOMPILER);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN = `enum SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN = "SDL_VIDEO_FOREIGN_WINDOW_VULKAN";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL = `enum SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL = "SDL_VIDEO_FOREIGN_WINDOW_OPENGL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT = `enum SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT = "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP = `enum SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP = "SDL_VIDEO_WAYLAND_EMULATE_MOUSE_WARP";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION = `enum SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION = "SDL_VIDEO_WAYLAND_MODE_EMULATION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = `enum SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = `enum SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = `enum SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES = `enum SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES = "SDL_VIDEO_MAC_FULLSCREEN_SPACES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_EXTERNAL_CONTEXT))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_EXTERNAL_CONTEXT = `enum SDL_HINT_VIDEO_EXTERNAL_CONTEXT = "SDL_VIDEO_EXTERNAL_CONTEXT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_EXTERNAL_CONTEXT); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_EXTERNAL_CONTEXT);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK = `enum SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK = "SDL_VIDEO_EGL_GETDISPLAY_FALLBACK";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_DOUBLE_BUFFER))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_DOUBLE_BUFFER = `enum SDL_HINT_VIDEO_DOUBLE_BUFFER = "SDL_VIDEO_DOUBLE_BUFFER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_DOUBLE_BUFFER); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_DOUBLE_BUFFER);
        }
    }




    static if(!is(typeof(SDL_HINT_VIDEO_ALLOW_SCREENSAVER))) {
        private enum enumMixinStr_SDL_HINT_VIDEO_ALLOW_SCREENSAVER = `enum SDL_HINT_VIDEO_ALLOW_SCREENSAVER = "SDL_VIDEO_ALLOW_SCREENSAVER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VIDEO_ALLOW_SCREENSAVER); }))) {
            mixin(enumMixinStr_SDL_HINT_VIDEO_ALLOW_SCREENSAVER);
        }
    }




    static if(!is(typeof(SDL_HINT_TV_REMOTE_AS_JOYSTICK))) {
        private enum enumMixinStr_SDL_HINT_TV_REMOTE_AS_JOYSTICK = `enum SDL_HINT_TV_REMOTE_AS_JOYSTICK = "SDL_TV_REMOTE_AS_JOYSTICK";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_TV_REMOTE_AS_JOYSTICK); }))) {
            mixin(enumMixinStr_SDL_HINT_TV_REMOTE_AS_JOYSTICK);
        }
    }




    static if(!is(typeof(SDL_HINT_VITA_TOUCH_MOUSE_DEVICE))) {
        private enum enumMixinStr_SDL_HINT_VITA_TOUCH_MOUSE_DEVICE = `enum SDL_HINT_VITA_TOUCH_MOUSE_DEVICE = "SDL_HINT_VITA_TOUCH_MOUSE_DEVICE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_VITA_TOUCH_MOUSE_DEVICE); }))) {
            mixin(enumMixinStr_SDL_HINT_VITA_TOUCH_MOUSE_DEVICE);
        }
    }




    static if(!is(typeof(SDL_HINT_TOUCH_MOUSE_EVENTS))) {
        private enum enumMixinStr_SDL_HINT_TOUCH_MOUSE_EVENTS = `enum SDL_HINT_TOUCH_MOUSE_EVENTS = "SDL_TOUCH_MOUSE_EVENTS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_TOUCH_MOUSE_EVENTS); }))) {
            mixin(enumMixinStr_SDL_HINT_TOUCH_MOUSE_EVENTS);
        }
    }




    static if(!is(typeof(SDL_HINT_TIMER_RESOLUTION))) {
        private enum enumMixinStr_SDL_HINT_TIMER_RESOLUTION = `enum SDL_HINT_TIMER_RESOLUTION = "SDL_TIMER_RESOLUTION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_TIMER_RESOLUTION); }))) {
            mixin(enumMixinStr_SDL_HINT_TIMER_RESOLUTION);
        }
    }




    static if(!is(typeof(SDL_HINT_THREAD_STACK_SIZE))) {
        private enum enumMixinStr_SDL_HINT_THREAD_STACK_SIZE = `enum SDL_HINT_THREAD_STACK_SIZE = "SDL_THREAD_STACK_SIZE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_THREAD_STACK_SIZE); }))) {
            mixin(enumMixinStr_SDL_HINT_THREAD_STACK_SIZE);
        }
    }




    static if(!is(typeof(SDL_HINT_THREAD_PRIORITY_POLICY))) {
        private enum enumMixinStr_SDL_HINT_THREAD_PRIORITY_POLICY = `enum SDL_HINT_THREAD_PRIORITY_POLICY = "SDL_THREAD_PRIORITY_POLICY";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_THREAD_PRIORITY_POLICY); }))) {
            mixin(enumMixinStr_SDL_HINT_THREAD_PRIORITY_POLICY);
        }
    }




    static if(!is(typeof(SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL))) {
        private enum enumMixinStr_SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL = `enum SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL = "SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL); }))) {
            mixin(enumMixinStr_SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL);
        }
    }




    static if(!is(typeof(SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME))) {
        private enum enumMixinStr_SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME = `enum SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME = "SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME); }))) {
            mixin(enumMixinStr_SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME);
        }
    }




    static if(!is(typeof(SDL_HINT_RPI_VIDEO_LAYER))) {
        private enum enumMixinStr_SDL_HINT_RPI_VIDEO_LAYER = `enum SDL_HINT_RPI_VIDEO_LAYER = "SDL_RPI_VIDEO_LAYER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RPI_VIDEO_LAYER); }))) {
            mixin(enumMixinStr_SDL_HINT_RPI_VIDEO_LAYER);
        }
    }




    static if(!is(typeof(SDL_HINT_RETURN_KEY_HIDES_IME))) {
        private enum enumMixinStr_SDL_HINT_RETURN_KEY_HIDES_IME = `enum SDL_HINT_RETURN_KEY_HIDES_IME = "SDL_RETURN_KEY_HIDES_IME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RETURN_KEY_HIDES_IME); }))) {
            mixin(enumMixinStr_SDL_HINT_RETURN_KEY_HIDES_IME);
        }
    }




    static if(!is(typeof(SDL_HINT_PS2_DYNAMIC_VSYNC))) {
        private enum enumMixinStr_SDL_HINT_PS2_DYNAMIC_VSYNC = `enum SDL_HINT_PS2_DYNAMIC_VSYNC = "SDL_PS2_DYNAMIC_VSYNC";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_PS2_DYNAMIC_VSYNC); }))) {
            mixin(enumMixinStr_SDL_HINT_PS2_DYNAMIC_VSYNC);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_VSYNC))) {
        private enum enumMixinStr_SDL_HINT_RENDER_VSYNC = `enum SDL_HINT_RENDER_VSYNC = "SDL_RENDER_VSYNC";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_VSYNC); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_VSYNC);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_SCALE_QUALITY))) {
        private enum enumMixinStr_SDL_HINT_RENDER_SCALE_QUALITY = `enum SDL_HINT_RENDER_SCALE_QUALITY = "SDL_RENDER_SCALE_QUALITY";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_SCALE_QUALITY); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_SCALE_QUALITY);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_OPENGL_SHADERS))) {
        private enum enumMixinStr_SDL_HINT_RENDER_OPENGL_SHADERS = `enum SDL_HINT_RENDER_OPENGL_SHADERS = "SDL_RENDER_OPENGL_SHADERS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_OPENGL_SHADERS); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_OPENGL_SHADERS);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_DRIVER))) {
        private enum enumMixinStr_SDL_HINT_RENDER_DRIVER = `enum SDL_HINT_RENDER_DRIVER = "SDL_RENDER_DRIVER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_DRIVER); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_DRIVER);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_DIRECT3D_THREADSAFE))) {
        private enum enumMixinStr_SDL_HINT_RENDER_DIRECT3D_THREADSAFE = `enum SDL_HINT_RENDER_DIRECT3D_THREADSAFE = "SDL_RENDER_DIRECT3D_THREADSAFE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_DIRECT3D_THREADSAFE); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_DIRECT3D_THREADSAFE);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_DIRECT3D11_DEBUG))) {
        private enum enumMixinStr_SDL_HINT_RENDER_DIRECT3D11_DEBUG = `enum SDL_HINT_RENDER_DIRECT3D11_DEBUG = "SDL_RENDER_DIRECT3D11_DEBUG";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_DIRECT3D11_DEBUG); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_DIRECT3D11_DEBUG);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_LINE_METHOD))) {
        private enum enumMixinStr_SDL_HINT_RENDER_LINE_METHOD = `enum SDL_HINT_RENDER_LINE_METHOD = "SDL_RENDER_LINE_METHOD";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_LINE_METHOD); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_LINE_METHOD);
        }
    }




    static if(!is(typeof(SDL_HINT_RENDER_BATCHING))) {
        private enum enumMixinStr_SDL_HINT_RENDER_BATCHING = `enum SDL_HINT_RENDER_BATCHING = "SDL_RENDER_BATCHING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_RENDER_BATCHING); }))) {
            mixin(enumMixinStr_SDL_HINT_RENDER_BATCHING);
        }
    }




    static if(!is(typeof(SDL_HINT_QTWAYLAND_WINDOW_FLAGS))) {
        private enum enumMixinStr_SDL_HINT_QTWAYLAND_WINDOW_FLAGS = `enum SDL_HINT_QTWAYLAND_WINDOW_FLAGS = "SDL_QTWAYLAND_WINDOW_FLAGS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_QTWAYLAND_WINDOW_FLAGS); }))) {
            mixin(enumMixinStr_SDL_HINT_QTWAYLAND_WINDOW_FLAGS);
        }
    }




    static if(!is(typeof(SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION))) {
        private enum enumMixinStr_SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION = `enum SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION = "SDL_QTWAYLAND_CONTENT_ORIENTATION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION); }))) {
            mixin(enumMixinStr_SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION);
        }
    }




    static if(!is(typeof(SDL_HINT_PREFERRED_LOCALES))) {
        private enum enumMixinStr_SDL_HINT_PREFERRED_LOCALES = `enum SDL_HINT_PREFERRED_LOCALES = "SDL_PREFERRED_LOCALES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_PREFERRED_LOCALES); }))) {
            mixin(enumMixinStr_SDL_HINT_PREFERRED_LOCALES);
        }
    }




    static if(!is(typeof(SDL_HINT_POLL_SENTINEL))) {
        private enum enumMixinStr_SDL_HINT_POLL_SENTINEL = `enum SDL_HINT_POLL_SENTINEL = "SDL_POLL_SENTINEL";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_POLL_SENTINEL); }))) {
            mixin(enumMixinStr_SDL_HINT_POLL_SENTINEL);
        }
    }




    static if(!is(typeof(SDL_HINT_ORIENTATIONS))) {
        private enum enumMixinStr_SDL_HINT_ORIENTATIONS = `enum SDL_HINT_ORIENTATIONS = "SDL_IOS_ORIENTATIONS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ORIENTATIONS); }))) {
            mixin(enumMixinStr_SDL_HINT_ORIENTATIONS);
        }
    }




    static if(!is(typeof(SDL_HINT_OPENGL_ES_DRIVER))) {
        private enum enumMixinStr_SDL_HINT_OPENGL_ES_DRIVER = `enum SDL_HINT_OPENGL_ES_DRIVER = "SDL_OPENGL_ES_DRIVER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_OPENGL_ES_DRIVER); }))) {
            mixin(enumMixinStr_SDL_HINT_OPENGL_ES_DRIVER);
        }
    }




    static if(!is(typeof(SDL_HINT_NO_SIGNAL_HANDLERS))) {
        private enum enumMixinStr_SDL_HINT_NO_SIGNAL_HANDLERS = `enum SDL_HINT_NO_SIGNAL_HANDLERS = "SDL_NO_SIGNAL_HANDLERS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_NO_SIGNAL_HANDLERS); }))) {
            mixin(enumMixinStr_SDL_HINT_NO_SIGNAL_HANDLERS);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_AUTO_CAPTURE))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_AUTO_CAPTURE = `enum SDL_HINT_MOUSE_AUTO_CAPTURE = "SDL_MOUSE_AUTO_CAPTURE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_AUTO_CAPTURE); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_AUTO_CAPTURE);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_TOUCH_EVENTS))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_TOUCH_EVENTS = `enum SDL_HINT_MOUSE_TOUCH_EVENTS = "SDL_MOUSE_TOUCH_EVENTS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_TOUCH_EVENTS); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_TOUCH_EVENTS);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_RELATIVE_WARP_MOTION))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_RELATIVE_WARP_MOTION = `enum SDL_HINT_MOUSE_RELATIVE_WARP_MOTION = "SDL_MOUSE_RELATIVE_WARP_MOTION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_WARP_MOTION); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_WARP_MOTION);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE = `enum SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE = "SDL_MOUSE_RELATIVE_SYSTEM_SCALE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE = `enum SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE = "SDL_MOUSE_RELATIVE_SPEED_SCALE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_RELATIVE_MODE_WARP))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_WARP = `enum SDL_HINT_MOUSE_RELATIVE_MODE_WARP = "SDL_MOUSE_RELATIVE_MODE_WARP";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_WARP); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_WARP);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_RELATIVE_MODE_CENTER))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_CENTER = `enum SDL_HINT_MOUSE_RELATIVE_MODE_CENTER = "SDL_MOUSE_RELATIVE_MODE_CENTER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_CENTER); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_RELATIVE_MODE_CENTER);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_NORMAL_SPEED_SCALE))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_NORMAL_SPEED_SCALE = `enum SDL_HINT_MOUSE_NORMAL_SPEED_SCALE = "SDL_MOUSE_NORMAL_SPEED_SCALE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_NORMAL_SPEED_SCALE); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_NORMAL_SPEED_SCALE);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH = `enum SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH = "SDL_MOUSE_FOCUS_CLICKTHROUGH";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_DOUBLE_CLICK_TIME))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_TIME = `enum SDL_HINT_MOUSE_DOUBLE_CLICK_TIME = "SDL_MOUSE_DOUBLE_CLICK_TIME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_TIME); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_TIME);
        }
    }




    static if(!is(typeof(SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS))) {
        private enum enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS = `enum SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS = "SDL_MOUSE_DOUBLE_CLICK_RADIUS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS); }))) {
            mixin(enumMixinStr_SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS);
        }
    }




    static if(!is(typeof(SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH))) {
        private enum enumMixinStr_SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH = `enum SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH = "SDL_MAC_OPENGL_ASYNC_DISPATCH";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH); }))) {
            mixin(enumMixinStr_SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH);
        }
    }




    static if(!is(typeof(SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK))) {
        private enum enumMixinStr_SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = `enum SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK); }))) {
            mixin(enumMixinStr_SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK);
        }
    }




    static if(!is(typeof(SDL_HINT_MAC_BACKGROUND_APP))) {
        private enum enumMixinStr_SDL_HINT_MAC_BACKGROUND_APP = `enum SDL_HINT_MAC_BACKGROUND_APP = "SDL_MAC_BACKGROUND_APP";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_MAC_BACKGROUND_APP); }))) {
            mixin(enumMixinStr_SDL_HINT_MAC_BACKGROUND_APP);
        }
    }




    static if(!is(typeof(SDL_HINT_LINUX_JOYSTICK_DEADZONES))) {
        private enum enumMixinStr_SDL_HINT_LINUX_JOYSTICK_DEADZONES = `enum SDL_HINT_LINUX_JOYSTICK_DEADZONES = "SDL_LINUX_JOYSTICK_DEADZONES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_LINUX_JOYSTICK_DEADZONES); }))) {
            mixin(enumMixinStr_SDL_HINT_LINUX_JOYSTICK_DEADZONES);
        }
    }




    static if(!is(typeof(SDL_HINT_LINUX_JOYSTICK_CLASSIC))) {
        private enum enumMixinStr_SDL_HINT_LINUX_JOYSTICK_CLASSIC = `enum SDL_HINT_LINUX_JOYSTICK_CLASSIC = "SDL_LINUX_JOYSTICK_CLASSIC";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_LINUX_JOYSTICK_CLASSIC); }))) {
            mixin(enumMixinStr_SDL_HINT_LINUX_JOYSTICK_CLASSIC);
        }
    }




    static if(!is(typeof(SDL_HINT_LINUX_HAT_DEADZONES))) {
        private enum enumMixinStr_SDL_HINT_LINUX_HAT_DEADZONES = `enum SDL_HINT_LINUX_HAT_DEADZONES = "SDL_LINUX_HAT_DEADZONES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_LINUX_HAT_DEADZONES); }))) {
            mixin(enumMixinStr_SDL_HINT_LINUX_HAT_DEADZONES);
        }
    }




    static if(!is(typeof(SDL_HINT_LINUX_DIGITAL_HATS))) {
        private enum enumMixinStr_SDL_HINT_LINUX_DIGITAL_HATS = `enum SDL_HINT_LINUX_DIGITAL_HATS = "SDL_LINUX_DIGITAL_HATS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_LINUX_DIGITAL_HATS); }))) {
            mixin(enumMixinStr_SDL_HINT_LINUX_DIGITAL_HATS);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_DEVICE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_DEVICE = `enum SDL_HINT_JOYSTICK_DEVICE = "SDL_JOYSTICK_DEVICE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_DEVICE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_DEVICE);
        }
    }




    static if(!is(typeof(SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER))) {
        private enum enumMixinStr_SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER = `enum SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER = "SDL_KMSDRM_REQUIRE_DRM_MASTER";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER); }))) {
            mixin(enumMixinStr_SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_THREAD))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_THREAD = `enum SDL_HINT_JOYSTICK_THREAD = "SDL_JOYSTICK_THREAD";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_THREAD); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_THREAD);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_ROG_CHAKRAM))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_ROG_CHAKRAM = `enum SDL_HINT_JOYSTICK_ROG_CHAKRAM = "SDL_JOYSTICK_ROG_CHAKRAM";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_ROG_CHAKRAM); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_ROG_CHAKRAM);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT = `enum SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT = "SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_RAWINPUT))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT = `enum SDL_HINT_JOYSTICK_RAWINPUT = "SDL_JOYSTICK_RAWINPUT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_RAWINPUT);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = "SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE = "SDL_JOYSTICK_HIDAPI_XBOX_ONE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS = "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX_360))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360 = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX_360 = "SDL_JOYSTICK_HIDAPI_XBOX_360";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX_360);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_XBOX))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX = `enum SDL_HINT_JOYSTICK_HIDAPI_XBOX = "SDL_JOYSTICK_HIDAPI_XBOX";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_XBOX);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_WII))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII = `enum SDL_HINT_JOYSTICK_HIDAPI_WII = "SDL_JOYSTICK_HIDAPI_WII";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_WII);
        }
    }




    static if(!is(typeof(_ENDIAN_H))) {
        private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ENDIAN_H); }))) {
            mixin(enumMixinStr__ENDIAN_H);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED = "SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED);
        }
    }




    static if(!is(typeof(LITTLE_ENDIAN))) {
        private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr_LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(BIG_ENDIAN))) {
        private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = __BIG_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); }))) {
            mixin(enumMixinStr_BIG_ENDIAN);
        }
    }




    static if(!is(typeof(PDP_ENDIAN))) {
        private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = __PDP_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); }))) {
            mixin(enumMixinStr_PDP_ENDIAN);
        }
    }




    static if(!is(typeof(BYTE_ORDER))) {
        private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_BYTE_ORDER); }))) {
            mixin(enumMixinStr_BYTE_ORDER);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_SWITCH))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH = `enum SDL_HINT_JOYSTICK_HIDAPI_SWITCH = "SDL_JOYSTICK_HIDAPI_SWITCH";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SWITCH);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_STEAM))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STEAM = `enum SDL_HINT_JOYSTICK_HIDAPI_STEAM = "SDL_JOYSTICK_HIDAPI_STEAM";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STEAM); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STEAM);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_STADIA))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STADIA = `enum SDL_HINT_JOYSTICK_HIDAPI_STADIA = "SDL_JOYSTICK_HIDAPI_STADIA";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STADIA); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_STADIA);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE = `enum SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE = "SDL_JOYSTICK_HIDAPI_PS5_RUMBLE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED = `enum SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED);
        }
    }
    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }






    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS5))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5 = `enum SDL_HINT_JOYSTICK_HIDAPI_PS5 = "SDL_JOYSTICK_HIDAPI_PS5";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS5);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE = `enum SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE = "SDL_JOYSTICK_HIDAPI_PS4_RUMBLE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE);
        }
    }






    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS4))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4 = `enum SDL_HINT_JOYSTICK_HIDAPI_PS4 = "SDL_JOYSTICK_HIDAPI_PS4";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS4);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_PS3))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS3 = `enum SDL_HINT_JOYSTICK_HIDAPI_PS3 = "SDL_JOYSTICK_HIDAPI_PS3";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS3); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_PS3);
        }
    }
    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_SHIELD))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SHIELD = `enum SDL_HINT_JOYSTICK_HIDAPI_SHIELD = "SDL_JOYSTICK_HIDAPI_SHIELD";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SHIELD); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_SHIELD);
        }
    }




    static if(!is(typeof(_ISOC95_SOURCE))) {
        private enum enumMixinStr__ISOC95_SOURCE = `enum _ISOC95_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ISOC95_SOURCE); }))) {
            mixin(enumMixinStr__ISOC95_SOURCE);
        }
    }




    static if(!is(typeof(_ISOC99_SOURCE))) {
        private enum enumMixinStr__ISOC99_SOURCE = `enum _ISOC99_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ISOC99_SOURCE); }))) {
            mixin(enumMixinStr__ISOC99_SOURCE);
        }
    }




    static if(!is(typeof(_ISOC11_SOURCE))) {
        private enum enumMixinStr__ISOC11_SOURCE = `enum _ISOC11_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ISOC11_SOURCE); }))) {
            mixin(enumMixinStr__ISOC11_SOURCE);
        }
    }




    static if(!is(typeof(_ISOC2X_SOURCE))) {
        private enum enumMixinStr__ISOC2X_SOURCE = `enum _ISOC2X_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ISOC2X_SOURCE); }))) {
            mixin(enumMixinStr__ISOC2X_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(_XOPEN_SOURCE))) {
        private enum enumMixinStr__XOPEN_SOURCE = `enum _XOPEN_SOURCE = 700;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_SOURCE); }))) {
            mixin(enumMixinStr__XOPEN_SOURCE);
        }
    }




    static if(!is(typeof(_XOPEN_SOURCE_EXTENDED))) {
        private enum enumMixinStr__XOPEN_SOURCE_EXTENDED = `enum _XOPEN_SOURCE_EXTENDED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_SOURCE_EXTENDED); }))) {
            mixin(enumMixinStr__XOPEN_SOURCE_EXTENDED);
        }
    }




    static if(!is(typeof(_LARGEFILE64_SOURCE))) {
        private enum enumMixinStr__LARGEFILE64_SOURCE = `enum _LARGEFILE64_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LARGEFILE64_SOURCE); }))) {
            mixin(enumMixinStr__LARGEFILE64_SOURCE);
        }
    }




    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC = `enum SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC = "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_LUNA))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_LUNA = `enum SDL_HINT_JOYSTICK_HIDAPI_LUNA = "SDL_JOYSTICK_HIDAPI_LUNA";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_LUNA); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_LUNA);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = `enum SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = "SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS = `enum SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS = "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS = `enum SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS = "SDL_JOYSTICK_HIDAPI_JOY_CONS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE = `enum SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE = "SDL_JOYSTICK_GAMECUBE_RUMBLE_BRAKE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE = `enum SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE = "SDL_JOYSTICK_HIDAPI_GAMECUBE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_HIDAPI))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI = `enum SDL_HINT_JOYSTICK_HIDAPI = "SDL_JOYSTICK_HIDAPI";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_HIDAPI);
        }
    }




    static if(!is(typeof(SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS))) {
        private enum enumMixinStr_SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = `enum SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS); }))) {
            mixin(enumMixinStr_SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS);
        }
    }




    static if(!is(typeof(__GLIBC_USE_ISOC2X))) {
        private enum enumMixinStr___GLIBC_USE_ISOC2X = `enum __GLIBC_USE_ISOC2X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_ISOC2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_ISOC2X);
        }
    }




    static if(!is(typeof(SDL_HINT_IOS_HIDE_HOME_INDICATOR))) {
        private enum enumMixinStr_SDL_HINT_IOS_HIDE_HOME_INDICATOR = `enum SDL_HINT_IOS_HIDE_HOME_INDICATOR = "SDL_IOS_HIDE_HOME_INDICATOR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_IOS_HIDE_HOME_INDICATOR); }))) {
            mixin(enumMixinStr_SDL_HINT_IOS_HIDE_HOME_INDICATOR);
        }
    }




    static if(!is(typeof(SDL_HINT_IME_SUPPORT_EXTENDED_TEXT))) {
        private enum enumMixinStr_SDL_HINT_IME_SUPPORT_EXTENDED_TEXT = `enum SDL_HINT_IME_SUPPORT_EXTENDED_TEXT = "SDL_IME_SUPPORT_EXTENDED_TEXT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_IME_SUPPORT_EXTENDED_TEXT); }))) {
            mixin(enumMixinStr_SDL_HINT_IME_SUPPORT_EXTENDED_TEXT);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(SDL_HINT_IME_SHOW_UI))) {
        private enum enumMixinStr_SDL_HINT_IME_SHOW_UI = `enum SDL_HINT_IME_SHOW_UI = "SDL_IME_SHOW_UI";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_IME_SHOW_UI); }))) {
            mixin(enumMixinStr_SDL_HINT_IME_SHOW_UI);
        }
    }




    static if(!is(typeof(SDL_HINT_IME_INTERNAL_EDITING))) {
        private enum enumMixinStr_SDL_HINT_IME_INTERNAL_EDITING = `enum SDL_HINT_IME_INTERNAL_EDITING = "SDL_IME_INTERNAL_EDITING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_IME_INTERNAL_EDITING); }))) {
            mixin(enumMixinStr_SDL_HINT_IME_INTERNAL_EDITING);
        }
    }




    static if(!is(typeof(SDL_HINT_HIDAPI_IGNORE_DEVICES))) {
        private enum enumMixinStr_SDL_HINT_HIDAPI_IGNORE_DEVICES = `enum SDL_HINT_HIDAPI_IGNORE_DEVICES = "SDL_HIDAPI_IGNORE_DEVICES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_HIDAPI_IGNORE_DEVICES); }))) {
            mixin(enumMixinStr_SDL_HINT_HIDAPI_IGNORE_DEVICES);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(SDL_HINT_GRAB_KEYBOARD))) {
        private enum enumMixinStr_SDL_HINT_GRAB_KEYBOARD = `enum SDL_HINT_GRAB_KEYBOARD = "SDL_GRAB_KEYBOARD";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GRAB_KEYBOARD); }))) {
            mixin(enumMixinStr_SDL_HINT_GRAB_KEYBOARD);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS = `enum SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS = "SDL_GAMECONTROLLER_USE_BUTTON_LABELS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = `enum SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES = `enum SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES = "SDL_GAMECONTROLLER_IGNORE_DEVICES";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLERTYPE))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLERTYPE = `enum SDL_HINT_GAMECONTROLLERTYPE = "SDL_GAMECONTROLLERTYPE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERTYPE); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERTYPE);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLERCONFIG_FILE))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG_FILE = `enum SDL_HINT_GAMECONTROLLERCONFIG_FILE = "SDL_GAMECONTROLLERCONFIG_FILE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG_FILE); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG_FILE);
        }
    }




    static if(!is(typeof(SDL_HINT_GAMECONTROLLERCONFIG))) {
        private enum enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG = `enum SDL_HINT_GAMECONTROLLERCONFIG = "SDL_GAMECONTROLLERCONFIG";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG); }))) {
            mixin(enumMixinStr_SDL_HINT_GAMECONTROLLERCONFIG);
        }
    }




    static if(!is(typeof(__USE_ISOCXX11))) {
        private enum enumMixinStr___USE_ISOCXX11 = `enum __USE_ISOCXX11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOCXX11); }))) {
            mixin(enumMixinStr___USE_ISOCXX11);
        }
    }




    static if(!is(typeof(SDL_HINT_FRAMEBUFFER_ACCELERATION))) {
        private enum enumMixinStr_SDL_HINT_FRAMEBUFFER_ACCELERATION = `enum SDL_HINT_FRAMEBUFFER_ACCELERATION = "SDL_FRAMEBUFFER_ACCELERATION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_FRAMEBUFFER_ACCELERATION); }))) {
            mixin(enumMixinStr_SDL_HINT_FRAMEBUFFER_ACCELERATION);
        }
    }




    static if(!is(typeof(SDL_HINT_FORCE_RAISEWINDOW))) {
        private enum enumMixinStr_SDL_HINT_FORCE_RAISEWINDOW = `enum SDL_HINT_FORCE_RAISEWINDOW = "SDL_HINT_FORCE_RAISEWINDOW";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_FORCE_RAISEWINDOW); }))) {
            mixin(enumMixinStr_SDL_HINT_FORCE_RAISEWINDOW);
        }
    }




    static if(!is(typeof(SDL_HINT_EVENT_LOGGING))) {
        private enum enumMixinStr_SDL_HINT_EVENT_LOGGING = `enum SDL_HINT_EVENT_LOGGING = "SDL_EVENT_LOGGING";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_EVENT_LOGGING); }))) {
            mixin(enumMixinStr_SDL_HINT_EVENT_LOGGING);
        }
    }




    static if(!is(typeof(SDL_HINT_ENABLE_STEAM_CONTROLLERS))) {
        private enum enumMixinStr_SDL_HINT_ENABLE_STEAM_CONTROLLERS = `enum SDL_HINT_ENABLE_STEAM_CONTROLLERS = "SDL_ENABLE_STEAM_CONTROLLERS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ENABLE_STEAM_CONTROLLERS); }))) {
            mixin(enumMixinStr_SDL_HINT_ENABLE_STEAM_CONTROLLERS);
        }
    }




    static if(!is(typeof(SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT))) {
        private enum enumMixinStr_SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = `enum SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT); }))) {
            mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT);
        }
    }




    static if(!is(typeof(SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR))) {
        private enum enumMixinStr_SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR = `enum SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR = "SDL_EMSCRIPTEN_CANVAS_SELECTOR";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR); }))) {
            mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR);
        }
    }




    static if(!is(typeof(SDL_HINT_EMSCRIPTEN_ASYNCIFY))) {
        private enum enumMixinStr_SDL_HINT_EMSCRIPTEN_ASYNCIFY = `enum SDL_HINT_EMSCRIPTEN_ASYNCIFY = "SDL_EMSCRIPTEN_ASYNCIFY";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_ASYNCIFY); }))) {
            mixin(enumMixinStr_SDL_HINT_EMSCRIPTEN_ASYNCIFY);
        }
    }




    static if(!is(typeof(SDL_HINT_DISPLAY_USABLE_BOUNDS))) {
        private enum enumMixinStr_SDL_HINT_DISPLAY_USABLE_BOUNDS = `enum SDL_HINT_DISPLAY_USABLE_BOUNDS = "SDL_DISPLAY_USABLE_BOUNDS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_DISPLAY_USABLE_BOUNDS); }))) {
            mixin(enumMixinStr_SDL_HINT_DISPLAY_USABLE_BOUNDS);
        }
    }




    static if(!is(typeof(SDL_HINT_BMP_SAVE_LEGACY_FORMAT))) {
        private enum enumMixinStr_SDL_HINT_BMP_SAVE_LEGACY_FORMAT = `enum SDL_HINT_BMP_SAVE_LEGACY_FORMAT = "SDL_BMP_SAVE_LEGACY_FORMAT";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_BMP_SAVE_LEGACY_FORMAT); }))) {
            mixin(enumMixinStr_SDL_HINT_BMP_SAVE_LEGACY_FORMAT);
        }
    }




    static if(!is(typeof(SDL_HINT_AUTO_UPDATE_SENSORS))) {
        private enum enumMixinStr_SDL_HINT_AUTO_UPDATE_SENSORS = `enum SDL_HINT_AUTO_UPDATE_SENSORS = "SDL_AUTO_UPDATE_SENSORS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUTO_UPDATE_SENSORS); }))) {
            mixin(enumMixinStr_SDL_HINT_AUTO_UPDATE_SENSORS);
        }
    }




    static if(!is(typeof(SDL_HINT_AUTO_UPDATE_JOYSTICKS))) {
        private enum enumMixinStr_SDL_HINT_AUTO_UPDATE_JOYSTICKS = `enum SDL_HINT_AUTO_UPDATE_JOYSTICKS = "SDL_AUTO_UPDATE_JOYSTICKS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUTO_UPDATE_JOYSTICKS); }))) {
            mixin(enumMixinStr_SDL_HINT_AUTO_UPDATE_JOYSTICKS);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_RESAMPLING_MODE))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_RESAMPLING_MODE = `enum SDL_HINT_AUDIO_RESAMPLING_MODE = "SDL_AUDIO_RESAMPLING_MODE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_RESAMPLING_MODE); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_RESAMPLING_MODE);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_DEVICE_STREAM_ROLE))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_ROLE = `enum SDL_HINT_AUDIO_DEVICE_STREAM_ROLE = "SDL_AUDIO_DEVICE_STREAM_ROLE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_ROLE); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_ROLE);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_DEVICE_STREAM_NAME))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_NAME = `enum SDL_HINT_AUDIO_DEVICE_STREAM_NAME = "SDL_AUDIO_DEVICE_STREAM_NAME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_NAME); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_STREAM_NAME);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_DEVICE_APP_NAME))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_DEVICE_APP_NAME = `enum SDL_HINT_AUDIO_DEVICE_APP_NAME = "SDL_AUDIO_DEVICE_APP_NAME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_APP_NAME); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_DEVICE_APP_NAME);
        }
    }




    static if(!is(typeof(SDL_HINT_AUDIO_CATEGORY))) {
        private enum enumMixinStr_SDL_HINT_AUDIO_CATEGORY = `enum SDL_HINT_AUDIO_CATEGORY = "SDL_AUDIO_CATEGORY";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_AUDIO_CATEGORY); }))) {
            mixin(enumMixinStr_SDL_HINT_AUDIO_CATEGORY);
        }
    }




    static if(!is(typeof(SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION))) {
        private enum enumMixinStr_SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = `enum SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION); }))) {
            mixin(enumMixinStr_SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION);
        }
    }




    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS))) {
        private enum enumMixinStr_SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS = `enum SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS); }))) {
            mixin(enumMixinStr_SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS);
        }
    }




    static if(!is(typeof(SDL_HINT_APP_NAME))) {
        private enum enumMixinStr_SDL_HINT_APP_NAME = `enum SDL_HINT_APP_NAME = "SDL_APP_NAME";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_APP_NAME); }))) {
            mixin(enumMixinStr_SDL_HINT_APP_NAME);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(SDL_HINT_ANDROID_TRAP_BACK_BUTTON))) {
        private enum enumMixinStr_SDL_HINT_ANDROID_TRAP_BACK_BUTTON = `enum SDL_HINT_ANDROID_TRAP_BACK_BUTTON = "SDL_ANDROID_TRAP_BACK_BUTTON";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ANDROID_TRAP_BACK_BUTTON); }))) {
            mixin(enumMixinStr_SDL_HINT_ANDROID_TRAP_BACK_BUTTON);
        }
    }




    static if(!is(typeof(SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO))) {
        private enum enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO = `enum SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO = "SDL_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO); }))) {
            mixin(enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(SDL_HINT_ANDROID_BLOCK_ON_PAUSE))) {
        private enum enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE = `enum SDL_HINT_ANDROID_BLOCK_ON_PAUSE = "SDL_ANDROID_BLOCK_ON_PAUSE";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE); }))) {
            mixin(enumMixinStr_SDL_HINT_ANDROID_BLOCK_ON_PAUSE);
        }
    }




    static if(!is(typeof(SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION))) {
        private enum enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = `enum SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION); }))) {
            mixin(enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION))) {
        private enum enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = `enum SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION); }))) {
            mixin(enumMixinStr_SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION);
        }
    }




    static if(!is(typeof(SDL_HINT_ALLOW_TOPMOST))) {
        private enum enumMixinStr_SDL_HINT_ALLOW_TOPMOST = `enum SDL_HINT_ALLOW_TOPMOST = "SDL_ALLOW_TOPMOST";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ALLOW_TOPMOST); }))) {
            mixin(enumMixinStr_SDL_HINT_ALLOW_TOPMOST);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED))) {
        private enum enumMixinStr_SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED = `enum SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED = "SDL_ALLOW_ALT_TAB_WHILE_GRABBED";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED); }))) {
            mixin(enumMixinStr_SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED);
        }
    }




    static if(!is(typeof(__USE_XOPEN))) {
        private enum enumMixinStr___USE_XOPEN = `enum __USE_XOPEN = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN); }))) {
            mixin(enumMixinStr___USE_XOPEN);
        }
    }




    static if(!is(typeof(SDL_HINT_ACCELEROMETER_AS_JOYSTICK))) {
        private enum enumMixinStr_SDL_HINT_ACCELEROMETER_AS_JOYSTICK = `enum SDL_HINT_ACCELEROMETER_AS_JOYSTICK = "SDL_ACCELEROMETER_AS_JOYSTICK";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HINT_ACCELEROMETER_AS_JOYSTICK); }))) {
            mixin(enumMixinStr_SDL_HINT_ACCELEROMETER_AS_JOYSTICK);
        }
    }




    static if(!is(typeof(__USE_XOPEN_EXTENDED))) {
        private enum enumMixinStr___USE_XOPEN_EXTENDED = `enum __USE_XOPEN_EXTENDED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN_EXTENDED); }))) {
            mixin(enumMixinStr___USE_XOPEN_EXTENDED);
        }
    }




    static if(!is(typeof(__USE_UNIX98))) {
        private enum enumMixinStr___USE_UNIX98 = `enum __USE_UNIX98 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_UNIX98); }))) {
            mixin(enumMixinStr___USE_UNIX98);
        }
    }




    static if(!is(typeof(_LARGEFILE_SOURCE))) {
        private enum enumMixinStr__LARGEFILE_SOURCE = `enum _LARGEFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LARGEFILE_SOURCE); }))) {
            mixin(enumMixinStr__LARGEFILE_SOURCE);
        }
    }
    static if(!is(typeof(__USE_XOPEN2K8XSI))) {
        private enum enumMixinStr___USE_XOPEN2K8XSI = `enum __USE_XOPEN2K8XSI = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8XSI); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8XSI);
        }
    }




    static if(!is(typeof(__USE_XOPEN2KXSI))) {
        private enum enumMixinStr___USE_XOPEN2KXSI = `enum __USE_XOPEN2KXSI = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2KXSI); }))) {
            mixin(enumMixinStr___USE_XOPEN2KXSI);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_INFINITY))) {
        private enum enumMixinStr_SDL_HAPTIC_INFINITY = `enum SDL_HAPTIC_INFINITY = 4294967295U;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_INFINITY); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_INFINITY);
        }
    }




    static if(!is(typeof(__USE_LARGEFILE))) {
        private enum enumMixinStr___USE_LARGEFILE = `enum __USE_LARGEFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_LARGEFILE); }))) {
            mixin(enumMixinStr___USE_LARGEFILE);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_STEERING_AXIS))) {
        private enum enumMixinStr_SDL_HAPTIC_STEERING_AXIS = `enum SDL_HAPTIC_STEERING_AXIS = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_STEERING_AXIS); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_STEERING_AXIS);
        }
    }




    static if(!is(typeof(__USE_LARGEFILE64))) {
        private enum enumMixinStr___USE_LARGEFILE64 = `enum __USE_LARGEFILE64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_LARGEFILE64); }))) {
            mixin(enumMixinStr___USE_LARGEFILE64);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_SPHERICAL))) {
        private enum enumMixinStr_SDL_HAPTIC_SPHERICAL = `enum SDL_HAPTIC_SPHERICAL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_SPHERICAL); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_SPHERICAL);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_CARTESIAN))) {
        private enum enumMixinStr_SDL_HAPTIC_CARTESIAN = `enum SDL_HAPTIC_CARTESIAN = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_CARTESIAN); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_CARTESIAN);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_POLAR))) {
        private enum enumMixinStr_SDL_HAPTIC_POLAR = `enum SDL_HAPTIC_POLAR = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_POLAR); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_POLAR);
        }
    }




    static if(!is(typeof(__USE_GNU))) {
        private enum enumMixinStr___USE_GNU = `enum __USE_GNU = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_GNU); }))) {
            mixin(enumMixinStr___USE_GNU);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_PAUSE))) {
        private enum enumMixinStr_SDL_HAPTIC_PAUSE = `enum SDL_HAPTIC_PAUSE = ( 1u << 15 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_PAUSE); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_PAUSE);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_STATUS))) {
        private enum enumMixinStr_SDL_HAPTIC_STATUS = `enum SDL_HAPTIC_STATUS = ( 1u << 14 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_STATUS); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_STATUS);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_AUTOCENTER))) {
        private enum enumMixinStr_SDL_HAPTIC_AUTOCENTER = `enum SDL_HAPTIC_AUTOCENTER = ( 1u << 13 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_AUTOCENTER); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_AUTOCENTER);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_GAIN))) {
        private enum enumMixinStr_SDL_HAPTIC_GAIN = `enum SDL_HAPTIC_GAIN = ( 1u << 12 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_GAIN); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_GAIN);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_CUSTOM))) {
        private enum enumMixinStr_SDL_HAPTIC_CUSTOM = `enum SDL_HAPTIC_CUSTOM = ( 1u << 11 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_CUSTOM); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_CUSTOM);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_FRICTION))) {
        private enum enumMixinStr_SDL_HAPTIC_FRICTION = `enum SDL_HAPTIC_FRICTION = ( 1u << 10 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_FRICTION); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_FRICTION);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_INERTIA))) {
        private enum enumMixinStr_SDL_HAPTIC_INERTIA = `enum SDL_HAPTIC_INERTIA = ( 1u << 9 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_INERTIA); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_INERTIA);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_DAMPER))) {
        private enum enumMixinStr_SDL_HAPTIC_DAMPER = `enum SDL_HAPTIC_DAMPER = ( 1u << 8 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_DAMPER); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_DAMPER);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_SCANF))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_SPRING))) {
        private enum enumMixinStr_SDL_HAPTIC_SPRING = `enum SDL_HAPTIC_SPRING = ( 1u << 7 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_SPRING); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_SPRING);
        }
    }




    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 31;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }






    static if(!is(typeof(SDL_HAPTIC_RAMP))) {
        private enum enumMixinStr_SDL_HAPTIC_RAMP = `enum SDL_HAPTIC_RAMP = ( 1u << 6 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_RAMP); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_RAMP);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_SAWTOOTHDOWN))) {
        private enum enumMixinStr_SDL_HAPTIC_SAWTOOTHDOWN = `enum SDL_HAPTIC_SAWTOOTHDOWN = ( 1u << 5 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_SAWTOOTHDOWN); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_SAWTOOTHDOWN);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_SAWTOOTHUP))) {
        private enum enumMixinStr_SDL_HAPTIC_SAWTOOTHUP = `enum SDL_HAPTIC_SAWTOOTHUP = ( 1u << 4 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_SAWTOOTHUP); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_SAWTOOTHUP);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_TRIANGLE))) {
        private enum enumMixinStr_SDL_HAPTIC_TRIANGLE = `enum SDL_HAPTIC_TRIANGLE = ( 1u << 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_TRIANGLE); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_TRIANGLE);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_LEFTRIGHT))) {
        private enum enumMixinStr_SDL_HAPTIC_LEFTRIGHT = `enum SDL_HAPTIC_LEFTRIGHT = ( 1u << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_LEFTRIGHT); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_LEFTRIGHT);
        }
    }




    static if(!is(typeof(SDL_HAPTIC_SINE))) {
        private enum enumMixinStr_SDL_HAPTIC_SINE = `enum SDL_HAPTIC_SINE = ( 1u << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_SINE); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_SINE);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_WCHAR_H))) {
        private enum enumMixinStr__WCHAR_H = `enum _WCHAR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__WCHAR_H); }))) {
            mixin(enumMixinStr__WCHAR_H);
        }
    }






    static if(!is(typeof(SDL_HAPTIC_CONSTANT))) {
        private enum enumMixinStr_SDL_HAPTIC_CONSTANT = `enum SDL_HAPTIC_CONSTANT = ( 1u << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_HAPTIC_CONSTANT); }))) {
            mixin(enumMixinStr_SDL_HAPTIC_CONSTANT);
        }
    }
    static if(!is(typeof(SDL_TEXTINPUTEVENT_TEXT_SIZE))) {
        private enum enumMixinStr_SDL_TEXTINPUTEVENT_TEXT_SIZE = `enum SDL_TEXTINPUTEVENT_TEXT_SIZE = ( 32 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TEXTINPUTEVENT_TEXT_SIZE); }))) {
            mixin(enumMixinStr_SDL_TEXTINPUTEVENT_TEXT_SIZE);
        }
    }




    static if(!is(typeof(SDL_TEXTEDITINGEVENT_TEXT_SIZE))) {
        private enum enumMixinStr_SDL_TEXTEDITINGEVENT_TEXT_SIZE = `enum SDL_TEXTEDITINGEVENT_TEXT_SIZE = ( 32 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_TEXTEDITINGEVENT_TEXT_SIZE); }))) {
            mixin(enumMixinStr_SDL_TEXTEDITINGEVENT_TEXT_SIZE);
        }
    }




    static if(!is(typeof(SDL_PRESSED))) {
        private enum enumMixinStr_SDL_PRESSED = `enum SDL_PRESSED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_PRESSED); }))) {
            mixin(enumMixinStr_SDL_PRESSED);
        }
    }




    static if(!is(typeof(SDL_RELEASED))) {
        private enum enumMixinStr_SDL_RELEASED = `enum SDL_RELEASED = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_RELEASED); }))) {
            mixin(enumMixinStr_SDL_RELEASED);
        }
    }
    static if(!is(typeof(WCHAR_MIN))) {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = __WCHAR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MIN); }))) {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }




    static if(!is(typeof(WCHAR_MAX))) {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = __WCHAR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MAX); }))) {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }




    static if(!is(typeof(WEOF))) {
        private enum enumMixinStr_WEOF = `enum WEOF = ( 0xffffffffu );`;
        static if(is(typeof({ mixin(enumMixinStr_WEOF); }))) {
            mixin(enumMixinStr_WEOF);
        }
    }
    static if(!is(typeof(HAS_BROKEN_BSWAP))) {
        private enum enumMixinStr_HAS_BROKEN_BSWAP = `enum HAS_BROKEN_BSWAP = ( 9 == 2 && 4 <= 95 );`;
        static if(is(typeof({ mixin(enumMixinStr_HAS_BROKEN_BSWAP); }))) {
            mixin(enumMixinStr_HAS_BROKEN_BSWAP);
        }
    }




    static if(!is(typeof(HAS_BUILTIN_BSWAP64))) {
        private enum enumMixinStr_HAS_BUILTIN_BSWAP64 = `enum HAS_BUILTIN_BSWAP64 = ( __has_builtin ( __builtin_bswap64 ) ) || ( 9 > 4 || ( 9 == 4 && 4 >= 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_HAS_BUILTIN_BSWAP64); }))) {
            mixin(enumMixinStr_HAS_BUILTIN_BSWAP64);
        }
    }




    static if(!is(typeof(HAS_BUILTIN_BSWAP32))) {
        private enum enumMixinStr_HAS_BUILTIN_BSWAP32 = `enum HAS_BUILTIN_BSWAP32 = ( __has_builtin ( __builtin_bswap32 ) ) || ( 9 > 4 || ( 9 == 4 && 4 >= 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_HAS_BUILTIN_BSWAP32); }))) {
            mixin(enumMixinStr_HAS_BUILTIN_BSWAP32);
        }
    }




    static if(!is(typeof(HAS_BUILTIN_BSWAP16))) {
        private enum enumMixinStr_HAS_BUILTIN_BSWAP16 = `enum HAS_BUILTIN_BSWAP16 = ( __has_builtin ( __builtin_bswap16 ) ) || ( 9 > 4 || ( 9 == 4 && 4 >= 8 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_HAS_BUILTIN_BSWAP16); }))) {
            mixin(enumMixinStr_HAS_BUILTIN_BSWAP16);
        }
    }




    static if(!is(typeof(SDL_FLOATWORDORDER))) {
        private enum enumMixinStr_SDL_FLOATWORDORDER = `enum SDL_FLOATWORDORDER = SDL_BYTEORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FLOATWORDORDER); }))) {
            mixin(enumMixinStr_SDL_FLOATWORDORDER);
        }
    }




    static if(!is(typeof(SDL_BYTEORDER))) {
        private enum enumMixinStr_SDL_BYTEORDER = `enum SDL_BYTEORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BYTEORDER); }))) {
            mixin(enumMixinStr_SDL_BYTEORDER);
        }
    }




    static if(!is(typeof(SDL_BIG_ENDIAN))) {
        private enum enumMixinStr_SDL_BIG_ENDIAN = `enum SDL_BIG_ENDIAN = 4321;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_BIG_ENDIAN); }))) {
            mixin(enumMixinStr_SDL_BIG_ENDIAN);
        }
    }




    static if(!is(typeof(SDL_LIL_ENDIAN))) {
        private enum enumMixinStr_SDL_LIL_ENDIAN = `enum SDL_LIL_ENDIAN = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LIL_ENDIAN); }))) {
            mixin(enumMixinStr_SDL_LIL_ENDIAN);
        }
    }






    static if(!is(typeof(SDL_CACHELINE_SIZE))) {
        private enum enumMixinStr_SDL_CACHELINE_SIZE = `enum SDL_CACHELINE_SIZE = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_CACHELINE_SIZE); }))) {
            mixin(enumMixinStr_SDL_CACHELINE_SIZE);
        }
    }
    static if(!is(typeof(SDL_MALLOC))) {
        private enum enumMixinStr_SDL_MALLOC = `enum SDL_MALLOC = __attribute__ ( ( malloc ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MALLOC); }))) {
            mixin(enumMixinStr_SDL_MALLOC);
        }
    }




    static if(!is(typeof(SDL_FALLTHROUGH))) {
        private enum enumMixinStr_SDL_FALLTHROUGH = `enum SDL_FALLTHROUGH = [ [ fallthrough ] ];`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FALLTHROUGH); }))) {
            mixin(enumMixinStr_SDL_FALLTHROUGH);
        }
    }




    static if(!is(typeof(SDL_NORETURN))) {
        private enum enumMixinStr_SDL_NORETURN = `enum SDL_NORETURN = __attribute__ ( ( noreturn ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NORETURN); }))) {
            mixin(enumMixinStr_SDL_NORETURN);
        }
    }




    static if(!is(typeof(SDL_FORCE_INLINE))) {
        private enum enumMixinStr_SDL_FORCE_INLINE = `enum SDL_FORCE_INLINE = __attribute__ ( ( always_inline ) ) static __inline__;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FORCE_INLINE); }))) {
            mixin(enumMixinStr_SDL_FORCE_INLINE);
        }
    }




    static if(!is(typeof(SDL_INLINE))) {
        private enum enumMixinStr_SDL_INLINE = `enum SDL_INLINE = __inline__;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_INLINE); }))) {
            mixin(enumMixinStr_SDL_INLINE);
        }
    }






    static if(!is(typeof(DECLSPEC))) {
        private enum enumMixinStr_DECLSPEC = `enum DECLSPEC = __attribute__ ( ( visibility ( "default" ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr_DECLSPEC); }))) {
            mixin(enumMixinStr_DECLSPEC);
        }
    }




    static if(!is(typeof(SDL_UNUSED))) {
        private enum enumMixinStr_SDL_UNUSED = `enum SDL_UNUSED = __attribute__ ( ( unused ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_UNUSED); }))) {
            mixin(enumMixinStr_SDL_UNUSED);
        }
    }




    static if(!is(typeof(SDL_DEPRECATED))) {
        private enum enumMixinStr_SDL_DEPRECATED = `enum SDL_DEPRECATED = __attribute__ ( ( deprecated ) );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_DEPRECATED); }))) {
            mixin(enumMixinStr_SDL_DEPRECATED);
        }
    }






    static if(!is(typeof(SDL_MIX_MAXVOLUME))) {
        private enum enumMixinStr_SDL_MIX_MAXVOLUME = `enum SDL_MIX_MAXVOLUME = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_MIX_MAXVOLUME); }))) {
            mixin(enumMixinStr_SDL_MIX_MAXVOLUME);
        }
    }






    static if(!is(typeof(SDL_AUDIO_ALLOW_ANY_CHANGE))) {
        private enum enumMixinStr_SDL_AUDIO_ALLOW_ANY_CHANGE = `enum SDL_AUDIO_ALLOW_ANY_CHANGE = ( SDL_AUDIO_ALLOW_FREQUENCY_CHANGE | SDL_AUDIO_ALLOW_FORMAT_CHANGE | SDL_AUDIO_ALLOW_CHANNELS_CHANGE | SDL_AUDIO_ALLOW_SAMPLES_CHANGE );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_ALLOW_ANY_CHANGE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_ALLOW_ANY_CHANGE);
        }
    }




    static if(!is(typeof(SDL_AUDIO_ALLOW_SAMPLES_CHANGE))) {
        private enum enumMixinStr_SDL_AUDIO_ALLOW_SAMPLES_CHANGE = `enum SDL_AUDIO_ALLOW_SAMPLES_CHANGE = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_ALLOW_SAMPLES_CHANGE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_ALLOW_SAMPLES_CHANGE);
        }
    }




    static if(!is(typeof(SDL_AUDIO_ALLOW_CHANNELS_CHANGE))) {
        private enum enumMixinStr_SDL_AUDIO_ALLOW_CHANNELS_CHANGE = `enum SDL_AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_ALLOW_CHANNELS_CHANGE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_ALLOW_CHANNELS_CHANGE);
        }
    }




    static if(!is(typeof(SDL_AUDIO_ALLOW_FORMAT_CHANGE))) {
        private enum enumMixinStr_SDL_AUDIO_ALLOW_FORMAT_CHANGE = `enum SDL_AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_ALLOW_FORMAT_CHANGE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_ALLOW_FORMAT_CHANGE);
        }
    }




    static if(!is(typeof(SDL_AUDIO_ALLOW_FREQUENCY_CHANGE))) {
        private enum enumMixinStr_SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = `enum SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_ALLOW_FREQUENCY_CHANGE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_ALLOW_FREQUENCY_CHANGE);
        }
    }




    static if(!is(typeof(AUDIO_F32SYS))) {
        private enum enumMixinStr_AUDIO_F32SYS = `enum AUDIO_F32SYS = AUDIO_F32LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_F32SYS); }))) {
            mixin(enumMixinStr_AUDIO_F32SYS);
        }
    }




    static if(!is(typeof(AUDIO_S32SYS))) {
        private enum enumMixinStr_AUDIO_S32SYS = `enum AUDIO_S32SYS = AUDIO_S32LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S32SYS); }))) {
            mixin(enumMixinStr_AUDIO_S32SYS);
        }
    }




    static if(!is(typeof(AUDIO_S16SYS))) {
        private enum enumMixinStr_AUDIO_S16SYS = `enum AUDIO_S16SYS = AUDIO_S16LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S16SYS); }))) {
            mixin(enumMixinStr_AUDIO_S16SYS);
        }
    }




    static if(!is(typeof(AUDIO_F32))) {
        private enum enumMixinStr_AUDIO_F32 = `enum AUDIO_F32 = AUDIO_F32LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_F32); }))) {
            mixin(enumMixinStr_AUDIO_F32);
        }
    }




    static if(!is(typeof(AUDIO_F32MSB))) {
        private enum enumMixinStr_AUDIO_F32MSB = `enum AUDIO_F32MSB = 0x9120;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_F32MSB); }))) {
            mixin(enumMixinStr_AUDIO_F32MSB);
        }
    }




    static if(!is(typeof(AUDIO_F32LSB))) {
        private enum enumMixinStr_AUDIO_F32LSB = `enum AUDIO_F32LSB = 0x8120;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_F32LSB); }))) {
            mixin(enumMixinStr_AUDIO_F32LSB);
        }
    }




    static if(!is(typeof(AUDIO_S32))) {
        private enum enumMixinStr_AUDIO_S32 = `enum AUDIO_S32 = AUDIO_S32LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S32); }))) {
            mixin(enumMixinStr_AUDIO_S32);
        }
    }




    static if(!is(typeof(AUDIO_S32MSB))) {
        private enum enumMixinStr_AUDIO_S32MSB = `enum AUDIO_S32MSB = 0x9020;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S32MSB); }))) {
            mixin(enumMixinStr_AUDIO_S32MSB);
        }
    }




    static if(!is(typeof(AUDIO_S32LSB))) {
        private enum enumMixinStr_AUDIO_S32LSB = `enum AUDIO_S32LSB = 0x8020;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S32LSB); }))) {
            mixin(enumMixinStr_AUDIO_S32LSB);
        }
    }




    static if(!is(typeof(AUDIO_S16))) {
        private enum enumMixinStr_AUDIO_S16 = `enum AUDIO_S16 = AUDIO_S16LSB;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S16); }))) {
            mixin(enumMixinStr_AUDIO_S16);
        }
    }




    static if(!is(typeof(AUDIO_S16MSB))) {
        private enum enumMixinStr_AUDIO_S16MSB = `enum AUDIO_S16MSB = 0x9010;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S16MSB); }))) {
            mixin(enumMixinStr_AUDIO_S16MSB);
        }
    }




    static if(!is(typeof(AUDIO_S16LSB))) {
        private enum enumMixinStr_AUDIO_S16LSB = `enum AUDIO_S16LSB = 0x8010;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S16LSB); }))) {
            mixin(enumMixinStr_AUDIO_S16LSB);
        }
    }




    static if(!is(typeof(AUDIO_S8))) {
        private enum enumMixinStr_AUDIO_S8 = `enum AUDIO_S8 = 0x8008;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_S8); }))) {
            mixin(enumMixinStr_AUDIO_S8);
        }
    }




    static if(!is(typeof(AUDIO_U8))) {
        private enum enumMixinStr_AUDIO_U8 = `enum AUDIO_U8 = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_AUDIO_U8); }))) {
            mixin(enumMixinStr_AUDIO_U8);
        }
    }
    static if(!is(typeof(SDL_AUDIO_MASK_SIGNED))) {
        private enum enumMixinStr_SDL_AUDIO_MASK_SIGNED = `enum SDL_AUDIO_MASK_SIGNED = ( 1 << 15 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_MASK_SIGNED); }))) {
            mixin(enumMixinStr_SDL_AUDIO_MASK_SIGNED);
        }
    }




    static if(!is(typeof(SDL_AUDIO_MASK_ENDIAN))) {
        private enum enumMixinStr_SDL_AUDIO_MASK_ENDIAN = `enum SDL_AUDIO_MASK_ENDIAN = ( 1 << 12 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_MASK_ENDIAN); }))) {
            mixin(enumMixinStr_SDL_AUDIO_MASK_ENDIAN);
        }
    }




    static if(!is(typeof(SDL_AUDIO_MASK_DATATYPE))) {
        private enum enumMixinStr_SDL_AUDIO_MASK_DATATYPE = `enum SDL_AUDIO_MASK_DATATYPE = ( 1 << 8 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_MASK_DATATYPE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_MASK_DATATYPE);
        }
    }




    static if(!is(typeof(SDL_AUDIO_MASK_BITSIZE))) {
        private enum enumMixinStr_SDL_AUDIO_MASK_BITSIZE = `enum SDL_AUDIO_MASK_BITSIZE = ( 0xFF );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_AUDIO_MASK_BITSIZE); }))) {
            mixin(enumMixinStr_SDL_AUDIO_MASK_BITSIZE);
        }
    }
    static if(!is(typeof(SDL_NULL_WHILE_LOOP_CONDITION))) {
        private enum enumMixinStr_SDL_NULL_WHILE_LOOP_CONDITION = `enum SDL_NULL_WHILE_LOOP_CONDITION = ( 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_NULL_WHILE_LOOP_CONDITION); }))) {
            mixin(enumMixinStr_SDL_NULL_WHILE_LOOP_CONDITION);
        }
    }




    static if(!is(typeof(SDL_LINE))) {
        private enum enumMixinStr_SDL_LINE = `enum SDL_LINE = 9718;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_LINE); }))) {
            mixin(enumMixinStr_SDL_LINE);
        }
    }




    static if(!is(typeof(SDL_FILE))) {
        private enum enumMixinStr_SDL_FILE = `enum SDL_FILE = "bindings/sdl/sdl.d.tmp";`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FILE); }))) {
            mixin(enumMixinStr_SDL_FILE);
        }
    }




    static if(!is(typeof(SDL_FUNCTION))) {
        private enum enumMixinStr_SDL_FUNCTION = `enum SDL_FUNCTION = __FUNCTION__;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_FUNCTION); }))) {
            mixin(enumMixinStr_SDL_FUNCTION);
        }
    }






    static if(!is(typeof(SDL_ASSERT_LEVEL))) {
        private enum enumMixinStr_SDL_ASSERT_LEVEL = `enum SDL_ASSERT_LEVEL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SDL_ASSERT_LEVEL); }))) {
            mixin(enumMixinStr_SDL_ASSERT_LEVEL);
        }
    }
    static if(!is(typeof(_BITS_BYTESWAP_H))) {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); }))) {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }
    static if(!is(typeof(_BITS_ENDIAN_H))) {
        private enum enumMixinStr__BITS_ENDIAN_H = `enum _BITS_ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_ENDIAN_H); }))) {
            mixin(enumMixinStr__BITS_ENDIAN_H);
        }
    }




    static if(!is(typeof(__LITTLE_ENDIAN))) {
        private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr___LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(__BIG_ENDIAN))) {
        private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
        static if(is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); }))) {
            mixin(enumMixinStr___BIG_ENDIAN);
        }
    }




    static if(!is(typeof(__PDP_ENDIAN))) {
        private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
        static if(is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); }))) {
            mixin(enumMixinStr___PDP_ENDIAN);
        }
    }




    static if(!is(typeof(__FLOAT_WORD_ORDER))) {
        private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); }))) {
            mixin(enumMixinStr___FLOAT_WORD_ORDER);
        }
    }






    static if(!is(typeof(_BITS_ENDIANNESS_H))) {
        private enum enumMixinStr__BITS_ENDIANNESS_H = `enum _BITS_ENDIANNESS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_ENDIANNESS_H); }))) {
            mixin(enumMixinStr__BITS_ENDIANNESS_H);
        }
    }




    static if(!is(typeof(__BYTE_ORDER))) {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___BYTE_ORDER); }))) {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }






    static if(!is(typeof(__HAVE_FLOAT16))) {
        private enum enumMixinStr___HAVE_FLOAT16 = `enum __HAVE_FLOAT16 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT16); }))) {
            mixin(enumMixinStr___HAVE_FLOAT16);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT32))) {
        private enum enumMixinStr___HAVE_FLOAT32 = `enum __HAVE_FLOAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32); }))) {
            mixin(enumMixinStr___HAVE_FLOAT32);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64))) {
        private enum enumMixinStr___HAVE_FLOAT64 = `enum __HAVE_FLOAT64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT32X))) {
        private enum enumMixinStr___HAVE_FLOAT32X = `enum __HAVE_FLOAT32X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT32X);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT128X))) {
        private enum enumMixinStr___HAVE_FLOAT128X = `enum __HAVE_FLOAT128X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT16))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT16 = `enum __HAVE_DISTINCT_FLOAT16 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT32))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT32 = `enum __HAVE_DISTINCT_FLOAT32 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT64))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT64 = `enum __HAVE_DISTINCT_FLOAT64 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT32X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT32X = `enum __HAVE_DISTINCT_FLOAT32X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT64X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT64X = `enum __HAVE_DISTINCT_FLOAT64X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT128X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT128X = `enum __HAVE_DISTINCT_FLOAT128X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT128_UNLIKE_LDBL))) {
        private enum enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL = `enum __HAVE_FLOAT128_UNLIKE_LDBL = ( __HAVE_DISTINCT_FLOAT128 && 64 != 113 );`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL);
        }
    }




    static if(!is(typeof(__HAVE_FLOATN_NOT_TYPEDEF))) {
        private enum enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF = `enum __HAVE_FLOATN_NOT_TYPEDEF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF); }))) {
            mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF);
        }
    }
    static if(!is(typeof(__CFLOAT32))) {
        private enum enumMixinStr___CFLOAT32 = `enum __CFLOAT32 = _Complex float;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT32); }))) {
            mixin(enumMixinStr___CFLOAT32);
        }
    }




    static if(!is(typeof(__CFLOAT64))) {
        private enum enumMixinStr___CFLOAT64 = `enum __CFLOAT64 = _Complex double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT64); }))) {
            mixin(enumMixinStr___CFLOAT64);
        }
    }




    static if(!is(typeof(__CFLOAT32X))) {
        private enum enumMixinStr___CFLOAT32X = `enum __CFLOAT32X = _Complex double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT32X); }))) {
            mixin(enumMixinStr___CFLOAT32X);
        }
    }




    static if(!is(typeof(__CFLOAT64X))) {
        private enum enumMixinStr___CFLOAT64X = `enum __CFLOAT64X = _Complex long double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT64X); }))) {
            mixin(enumMixinStr___CFLOAT64X);
        }
    }
    static if(!is(typeof(__HAVE_FLOAT128))) {
        private enum enumMixinStr___HAVE_FLOAT128 = `enum __HAVE_FLOAT128 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT128))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT128 = `enum __HAVE_DISTINCT_FLOAT128 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64X))) {
        private enum enumMixinStr___HAVE_FLOAT64X = `enum __HAVE_FLOAT64X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64X);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64X_LONG_DOUBLE))) {
        private enum enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE = `enum __HAVE_FLOAT64X_LONG_DOUBLE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X = `enum __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(__LONG_DOUBLE_USES_FLOAT128))) {
        private enum enumMixinStr___LONG_DOUBLE_USES_FLOAT128 = `enum __LONG_DOUBLE_USES_FLOAT128 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128); }))) {
            mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128);
        }
    }




    static if(!is(typeof(_BITS_TIME64_H))) {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); }))) {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }




    static if(!is(typeof(__TIME64_T_TYPE))) {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = __TIME_T_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); }))) {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMESIZE))) {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = __WORDSIZE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMESIZE); }))) {
            mixin(enumMixinStr___TIMESIZE);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(__FILE_defined))) {
        private enum enumMixinStr___FILE_defined = `enum __FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___FILE_defined); }))) {
            mixin(enumMixinStr___FILE_defined);
        }
    }




    static if(!is(typeof(____FILE_defined))) {
        private enum enumMixinStr_____FILE_defined = `enum ____FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____FILE_defined); }))) {
            mixin(enumMixinStr_____FILE_defined);
        }
    }




    static if(!is(typeof(_BITS_TYPES___LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
        }
    }




    static if(!is(typeof(____mbstate_t_defined))) {
        private enum enumMixinStr_____mbstate_t_defined = `enum ____mbstate_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____mbstate_t_defined); }))) {
            mixin(enumMixinStr_____mbstate_t_defined);
        }
    }




    static if(!is(typeof(_BITS_TYPES_LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES_LOCALE_T_H = `enum _BITS_TYPES_LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H);
        }
    }




    static if(!is(typeof(__mbstate_t_defined))) {
        private enum enumMixinStr___mbstate_t_defined = `enum __mbstate_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___mbstate_t_defined); }))) {
            mixin(enumMixinStr___mbstate_t_defined);
        }
    }




    static if(!is(typeof(__wint_t_defined))) {
        private enum enumMixinStr___wint_t_defined = `enum __wint_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___wint_t_defined); }))) {
            mixin(enumMixinStr___wint_t_defined);
        }
    }




    static if(!is(typeof(_WINT_T))) {
        private enum enumMixinStr__WINT_T = `enum _WINT_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__WINT_T); }))) {
            mixin(enumMixinStr__WINT_T);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__STATFS_MATCHES_STATFS64))) {
        private enum enumMixinStr___STATFS_MATCHES_STATFS64 = `enum __STATFS_MATCHES_STATFS64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___STATFS_MATCHES_STATFS64); }))) {
            mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(_BITS_UINTN_IDENTITY_H))) {
        private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); }))) {
            mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
        }
    }




    static if(!is(typeof(_BITS_WCHAR_H))) {
        private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); }))) {
            mixin(enumMixinStr__BITS_WCHAR_H);
        }
    }




    static if(!is(typeof(__WCHAR_MAX))) {
        private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MAX); }))) {
            mixin(enumMixinStr___WCHAR_MAX);
        }
    }




    static if(!is(typeof(__WCHAR_MIN))) {
        private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - 0x7fffffff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MIN); }))) {
            mixin(enumMixinStr___WCHAR_MIN);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }
    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }
    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = throw ( );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = throw ( );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }




    static if(!is(typeof(__BEGIN_DECLS))) {
        private enum enumMixinStr___BEGIN_DECLS = `enum __BEGIN_DECLS = extern "C" {;`;
        static if(is(typeof({ mixin(enumMixinStr___BEGIN_DECLS); }))) {
            mixin(enumMixinStr___BEGIN_DECLS);
        }
    }




    static if(!is(typeof(__END_DECLS))) {
        private enum enumMixinStr___END_DECLS = `enum __END_DECLS = };`;
        static if(is(typeof({ mixin(enumMixinStr___END_DECLS); }))) {
            mixin(enumMixinStr___END_DECLS);
        }
    }
    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }






    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }
    static if(!is(typeof(_Noreturn))) {
        private enum enumMixinStr__Noreturn = `enum _Noreturn = __attribute__ ( ( __noreturn__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Noreturn); }))) {
            mixin(enumMixinStr__Noreturn);
        }
    }
    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }
    static if(!is(typeof(__GNUC_VA_LIST))) {
        private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); }))) {
            mixin(enumMixinStr___GNUC_VA_LIST);
        }
    }






    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = __null;`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }



}
