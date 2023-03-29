module sdl;

import core.stdc.config;
import core.stdc.stddef;
import core.stdc.stdarg;

extern (C):

alias __u_char = ubyte;
alias __u_short = ushort;
alias __u_int = uint;
alias __u_long = c_ulong;

alias __int8_t = byte;
alias __uint8_t = ubyte;
alias __int16_t = short;
alias __uint16_t = ushort;
alias __int32_t = int;
alias __uint32_t = uint;

alias __int64_t = c_long;
alias __uint64_t = c_ulong;

alias __int_least8_t = byte;
alias __uint_least8_t = ubyte;
alias __int_least16_t = short;
alias __uint_least16_t = ushort;
alias __int_least32_t = int;
alias __uint_least32_t = uint;
alias __int_least64_t = c_long;
alias __uint_least64_t = c_ulong;

alias __quad_t = c_long;
alias __u_quad_t = c_ulong;

alias __intmax_t = c_long;
alias __uintmax_t = c_ulong;

alias __dev_t = c_ulong;
alias __uid_t = uint;
alias __gid_t = uint;
alias __ino_t = c_ulong;
alias __ino64_t = c_ulong;
alias __mode_t = uint;
alias __nlink_t = c_ulong;
alias __off_t = c_long;
alias __off64_t = c_long;
alias __pid_t = int;

struct __fsid_t
{
    int[2] __val;
}

alias __clock_t = c_long;
alias __rlim_t = c_ulong;
alias __rlim64_t = c_ulong;
alias __id_t = uint;
alias __time_t = c_long;
alias __useconds_t = uint;
alias __suseconds_t = c_long;
alias __suseconds64_t = c_long;

alias __daddr_t = int;
alias __key_t = int;

alias __clockid_t = int;

alias __timer_t = void*;

alias __blksize_t = c_long;

alias __blkcnt_t = c_long;
alias __blkcnt64_t = c_long;

alias __fsblkcnt_t = c_ulong;
alias __fsblkcnt64_t = c_ulong;

alias __fsfilcnt_t = c_ulong;
alias __fsfilcnt64_t = c_ulong;

alias __fsword_t = c_long;

alias __ssize_t = c_long;

alias __syscall_slong_t = c_long;

alias __syscall_ulong_t = c_ulong;

alias __loff_t = c_long;
alias __caddr_t = char*;

alias __intptr_t = c_long;

alias __socklen_t = uint;

alias __sig_atomic_t = int;

alias int_least8_t = byte;
alias int_least16_t = short;
alias int_least32_t = int;
alias int_least64_t = c_long;

alias uint_least8_t = ubyte;
alias uint_least16_t = ushort;
alias uint_least32_t = uint;
alias uint_least64_t = c_ulong;

alias int_fast8_t = byte;

alias int_fast16_t = c_long;
alias int_fast32_t = c_long;
alias int_fast64_t = c_long;

alias uint_fast8_t = ubyte;

alias uint_fast16_t = c_ulong;
alias uint_fast32_t = c_ulong;
alias uint_fast64_t = c_ulong;

alias intptr_t = c_long;

alias uintptr_t = c_ulong;

alias intmax_t = c_long;
alias uintmax_t = c_ulong;

alias __gwchar_t = int;

struct imaxdiv_t
{
    c_long quot;
    c_long rem;
}

intmax_t imaxabs (intmax_t __n);

imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom);

intmax_t strtoimax (const(char)* __nptr, char** __endptr, int __base);

uintmax_t strtoumax (const(char)* __nptr, char** __endptr, int __base);

intmax_t wcstoimax (
    const(__gwchar_t)* __nptr,
    __gwchar_t** __endptr,
    int __base);

uintmax_t wcstoumax (
    const(__gwchar_t)* __nptr,
    __gwchar_t** __endptr,
    int __base);

alias va_list = __va_list_tag[1];

alias __gnuc_va_list = __va_list_tag[1];

alias _Float32 = float;

alias _Float64 = double;

alias _Float32x = double;

alias _Float64x = real;

alias size_t = c_ulong;

alias wchar_t = int;

alias wint_t = uint;

struct __mbstate_t
{
    int __count;

    union _Anonymous_0
    {
        uint __wch;
        char[4] __wchb;
    }

    _Anonymous_0 __value;
}

alias mbstate_t = __mbstate_t;

struct _IO_FILE;
alias __FILE = _IO_FILE;

alias FILE = _IO_FILE;

struct __locale_struct
{
    struct __locale_data;
    __locale_data*[13] __locales;

    const(ushort)* __ctype_b;
    const(int)* __ctype_tolower;
    const(int)* __ctype_toupper;

    const(char)*[13] __names;
}

alias __locale_t = __locale_struct*;

alias locale_t = __locale_struct*;

struct tm;

wchar_t* wcscpy (wchar_t* __dest, const(wchar_t)* __src);

wchar_t* wcsncpy (wchar_t* __dest, const(wchar_t)* __src, size_t __n);

wchar_t* wcscat (wchar_t* __dest, const(wchar_t)* __src);

wchar_t* wcsncat (wchar_t* __dest, const(wchar_t)* __src, size_t __n);

int wcscmp (const(wchar_t)* __s1, const(wchar_t)* __s2);

int wcsncmp (const(wchar_t)* __s1, const(wchar_t)* __s2, size_t __n);

int wcscasecmp (const(wchar_t)* __s1, const(wchar_t)* __s2);

int wcsncasecmp (const(wchar_t)* __s1, const(wchar_t)* __s2, size_t __n);

int wcscasecmp_l (const(wchar_t)* __s1, const(wchar_t)* __s2, locale_t __loc);

int wcsncasecmp_l (
    const(wchar_t)* __s1,
    const(wchar_t)* __s2,
    size_t __n,
    locale_t __loc);

int wcscoll (const(wchar_t)* __s1, const(wchar_t)* __s2);

size_t wcsxfrm (wchar_t* __s1, const(wchar_t)* __s2, size_t __n);

int wcscoll_l (const(wchar_t)* __s1, const(wchar_t)* __s2, locale_t __loc);

size_t wcsxfrm_l (
    wchar_t* __s1,
    const(wchar_t)* __s2,
    size_t __n,
    locale_t __loc);

wchar_t* wcsdup (const(wchar_t)* __s);

int* wcschr (const(wchar_t)* __wcs, wchar_t __wc);

wchar_t* wcsrchr (const(wchar_t)* __wcs, wchar_t __wc);

size_t wcscspn (const(wchar_t)* __wcs, const(wchar_t)* __reject);

size_t wcsspn (const(wchar_t)* __wcs, const(wchar_t)* __accept);

wchar_t* wcspbrk (const(wchar_t)* __wcs, const(wchar_t)* __accept);

wchar_t* wcsstr (const(wchar_t)* __haystack, const(wchar_t)* __needle);

wchar_t* wcstok (wchar_t* __s, const(wchar_t)* __delim, wchar_t** __ptr);

c_ulong wcslen (const(wchar_t)* __s);

size_t wcsnlen (const(wchar_t)* __s, size_t __maxlen);

int* wmemchr (const(wchar_t)* __s, wchar_t __c, size_t __n);

int wmemcmp (const(wchar_t)* __s1, const(wchar_t)* __s2, size_t __n);

int* wmemcpy (wchar_t* __s1, const(wchar_t)* __s2, size_t __n);

int* wmemmove (wchar_t* __s1, const(wchar_t)* __s2, size_t __n);

wchar_t* wmemset (wchar_t* __s, wchar_t __c, size_t __n);

wint_t btowc (int __c);

int wctob (wint_t __c);

int mbsinit (const(mbstate_t)* __ps);

size_t mbrtowc (wchar_t* __pwc, const(char)* __s, size_t __n, mbstate_t* __p);

size_t wcrtomb (char* __s, wchar_t __wc, mbstate_t* __ps);

size_t __mbrlen (const(char)* __s, size_t __n, mbstate_t* __ps);
size_t mbrlen (const(char)* __s, size_t __n, mbstate_t* __ps);

size_t mbsrtowcs (
    wchar_t* __dst,
    const(char*)* __src,
    size_t __len,
    mbstate_t* __ps);

size_t wcsrtombs (
    char* __dst,
    const(wchar_t*)* __src,
    size_t __len,
    mbstate_t* __ps);

size_t mbsnrtowcs (
    wchar_t* __dst,
    const(char*)* __src,
    size_t __nmc,
    size_t __len,
    mbstate_t* __ps);

size_t wcsnrtombs (
    char* __dst,
    const(wchar_t*)* __src,
    size_t __nwc,
    size_t __len,
    mbstate_t* __ps);

double wcstod (const(wchar_t)* __nptr, wchar_t** __endptr);

float wcstof (const(wchar_t)* __nptr, wchar_t** __endptr);
real wcstold (const(wchar_t)* __nptr, wchar_t** __endptr);

c_long wcstol (const(wchar_t)* __nptr, wchar_t** __endptr, int __base);

c_ulong wcstoul (const(wchar_t)* __nptr, wchar_t** __endptr, int __base);

long wcstoll (const(wchar_t)* __nptr, wchar_t** __endptr, int __base);

ulong wcstoull (const(wchar_t)* __nptr, wchar_t** __endptr, int __base);

wchar_t* wcpcpy (wchar_t* __dest, const(wchar_t)* __src);

wchar_t* wcpncpy (wchar_t* __dest, const(wchar_t)* __src, size_t __n);

__FILE* open_wmemstream (wchar_t** __bufloc, size_t* __sizeloc);

int fwide (__FILE* __fp, int __mode);

int fwprintf (__FILE* __stream, const(wchar_t)* __format, ...);

int wprintf (const(wchar_t)* __format, ...);

int swprintf (wchar_t* __s, size_t __n, const(wchar_t)* __format, ...);

int vfwprintf (__FILE* __s, const(wchar_t)* __format, __gnuc_va_list __arg);

int vwprintf (const(wchar_t)* __format, __gnuc_va_list __arg);

int vswprintf (
    wchar_t* __s,
    size_t __n,
    const(wchar_t)* __format,
    __gnuc_va_list __arg);

int fwscanf (__FILE* __stream, const(wchar_t)* __format, ...);

int wscanf (const(wchar_t)* __format, ...);

int swscanf (const(wchar_t)* __s, const(wchar_t)* __format, ...);

int fwscanf (__FILE* __stream, const(wchar_t)* __format, ...);

int wscanf (const(wchar_t)* __format, ...);

int swscanf (const(wchar_t)* __s, const(wchar_t)* __format, ...);

int vfwscanf (__FILE* __s, const(wchar_t)* __format, __gnuc_va_list __arg);

int vwscanf (const(wchar_t)* __format, __gnuc_va_list __arg);

int vswscanf (
    const(wchar_t)* __s,
    const(wchar_t)* __format,
    __gnuc_va_list __arg);

int vfwscanf (__FILE* __s, const(wchar_t)* __format, __gnuc_va_list __arg);

int vwscanf (const(wchar_t)* __format, __gnuc_va_list __arg);

int vswscanf (const(wchar_t)* __s, const(wchar_t)* __format, __gnuc_va_list __arg);

wint_t fgetwc (__FILE* __stream);
wint_t getwc (__FILE* __stream);

wint_t getwchar ();

wint_t fputwc (wchar_t __wc, __FILE* __stream);
wint_t putwc (wchar_t __wc, __FILE* __stream);

wint_t putwchar (wchar_t __wc);

wchar_t* fgetws (wchar_t* __ws, int __n, __FILE* __stream);

int fputws (const(wchar_t)* __ws, __FILE* __stream);

wint_t ungetwc (wint_t __wc, __FILE* __stream);

size_t wcsftime (
    wchar_t* __s,
    size_t __maxsize,
    const(wchar_t)* __format,
    const(tm)* __tp);

enum SDL_bool
{
    SDL_FALSE = 0,
    SDL_TRUE = 1
}

alias Sint8 = byte;

alias Uint8 = ubyte;

alias Sint16 = short;

alias Uint16 = ushort;

alias Sint32 = int;

alias Uint32 = uint;

alias Sint64 = c_long;

alias Uint64 = c_ulong;

enum SDL_DUMMY_ENUM
{
    DUMMY_ENUM_VALUE = 0
}

void* SDL_malloc (size_t size);
void* SDL_calloc (size_t nmemb, size_t size);
void* SDL_realloc (void* mem, size_t size);
void SDL_free (void* mem);

alias SDL_malloc_func = void* function (size_t size);
alias SDL_calloc_func = void* function (size_t nmemb, size_t size);
alias SDL_realloc_func = void* function (void* mem, size_t size);
alias SDL_free_func = void function (void* mem);

void SDL_GetOriginalMemoryFunctions (
    SDL_malloc_func* malloc_func,
    SDL_calloc_func* calloc_func,
    SDL_realloc_func* realloc_func,
    SDL_free_func* free_func);

void SDL_GetMemoryFunctions (
    SDL_malloc_func* malloc_func,
    SDL_calloc_func* calloc_func,
    SDL_realloc_func* realloc_func,
    SDL_free_func* free_func);

int SDL_SetMemoryFunctions (
    SDL_malloc_func malloc_func,
    SDL_calloc_func calloc_func,
    SDL_realloc_func realloc_func,
    SDL_free_func free_func);

void* SDL_aligned_alloc (size_t alignment, size_t size);

void SDL_aligned_free (void* mem);

int SDL_GetNumAllocations ();

char* SDL_getenv (const(char)* name);
int SDL_setenv (const(char)* name, const(char)* value, int overwrite);

void SDL_qsort (void* base, size_t nmemb, size_t size, int function (const(void)*, const(void)*) compare);
void* SDL_bsearch (const(void)* key, const(void)* base, size_t nmemb, size_t size, int function (const(void)*, const(void)*) compare);

int SDL_abs (int x);

int SDL_isalpha (int x);
int SDL_isalnum (int x);
int SDL_isblank (int x);
int SDL_iscntrl (int x);
int SDL_isdigit (int x);
int SDL_isxdigit (int x);
int SDL_ispunct (int x);
int SDL_isspace (int x);
int SDL_isupper (int x);
int SDL_islower (int x);
int SDL_isprint (int x);
int SDL_isgraph (int x);
int SDL_toupper (int x);
int SDL_tolower (int x);

Uint16 SDL_crc16 (Uint16 crc, const(void)* data, size_t len);
Uint32 SDL_crc32 (Uint32 crc, const(void)* data, size_t len);

void* SDL_memset (void* dst, int c, size_t len);
void* SDL_memset4 (void* dst, Uint32 val, size_t dwords);

void* SDL_memcpy (void* dst, const(void)* src, size_t len);

void* SDL_memmove (void* dst, const(void)* src, size_t len);
int SDL_memcmp (const(void)* s1, const(void)* s2, size_t len);

size_t SDL_wcslen (const(wchar_t)* wstr);
size_t SDL_wcslcpy (wchar_t* dst, const(wchar_t)* src, size_t maxlen);
size_t SDL_wcslcat (wchar_t* dst, const(wchar_t)* src, size_t maxlen);
wchar_t* SDL_wcsdup (const(wchar_t)* wstr);
wchar_t* SDL_wcsstr (const(wchar_t)* haystack, const(wchar_t)* needle);

int SDL_wcscmp (const(wchar_t)* str1, const(wchar_t)* str2);
int SDL_wcsncmp (const(wchar_t)* str1, const(wchar_t)* str2, size_t maxlen);
int SDL_wcscasecmp (const(wchar_t)* str1, const(wchar_t)* str2);
int SDL_wcsncasecmp (const(wchar_t)* str1, const(wchar_t)* str2, size_t len);

size_t SDL_strlen (const(char)* str);
size_t SDL_strlcpy (char* dst, const(char)* src, size_t maxlen);
size_t SDL_utf8strlcpy (char* dst, const(char)* src, size_t dst_bytes);
size_t SDL_strlcat (char* dst, const(char)* src, size_t maxlen);
char* SDL_strdup (const(char)* str);
char* SDL_strrev (char* str);
char* SDL_strupr (char* str);
char* SDL_strlwr (char* str);
char* SDL_strchr (const(char)* str, int c);
char* SDL_strrchr (const(char)* str, int c);
char* SDL_strstr (const(char)* haystack, const(char)* needle);
char* SDL_strcasestr (const(char)* haystack, const(char)* needle);
char* SDL_strtokr (char* s1, const(char)* s2, char** saveptr);
size_t SDL_utf8strlen (const(char)* str);
size_t SDL_utf8strnlen (const(char)* str, size_t bytes);

char* SDL_itoa (int value, char* str, int radix);
char* SDL_uitoa (uint value, char* str, int radix);
char* SDL_ltoa (c_long value, char* str, int radix);
char* SDL_ultoa (c_ulong value, char* str, int radix);
char* SDL_lltoa (Sint64 value, char* str, int radix);
char* SDL_ulltoa (Uint64 value, char* str, int radix);

int SDL_atoi (const(char)* str);
double SDL_atof (const(char)* str);
c_long SDL_strtol (const(char)* str, char** endp, int base);
c_ulong SDL_strtoul (const(char)* str, char** endp, int base);
Sint64 SDL_strtoll (const(char)* str, char** endp, int base);
Uint64 SDL_strtoull (const(char)* str, char** endp, int base);
double SDL_strtod (const(char)* str, char** endp);

int SDL_strcmp (const(char)* str1, const(char)* str2);
int SDL_strncmp (const(char)* str1, const(char)* str2, size_t maxlen);
int SDL_strcasecmp (const(char)* str1, const(char)* str2);
int SDL_strncasecmp (const(char)* str1, const(char)* str2, size_t len);

int SDL_sscanf (const(char)* text, const(char)* fmt, ...);
int SDL_vsscanf (const(char)* text, const(char)* fmt, va_list ap);
int SDL_snprintf (char* text, size_t maxlen, const(char)* fmt, ...);
int SDL_vsnprintf (char* text, size_t maxlen, const(char)* fmt, va_list ap);
int SDL_asprintf (char** strp, const(char)* fmt, ...);
int SDL_vasprintf (char** strp, const(char)* fmt, va_list ap);

double SDL_acos (double x);
float SDL_acosf (float x);
double SDL_asin (double x);
float SDL_asinf (float x);
double SDL_atan (double x);
float SDL_atanf (float x);
double SDL_atan2 (double y, double x);
float SDL_atan2f (float y, float x);
double SDL_ceil (double x);
float SDL_ceilf (float x);
double SDL_copysign (double x, double y);
float SDL_copysignf (float x, float y);
double SDL_cos (double x);
float SDL_cosf (float x);
double SDL_exp (double x);
float SDL_expf (float x);
double SDL_fabs (double x);
float SDL_fabsf (float x);
double SDL_floor (double x);
float SDL_floorf (float x);
double SDL_trunc (double x);
float SDL_truncf (float x);
double SDL_fmod (double x, double y);
float SDL_fmodf (float x, float y);
double SDL_log (double x);
float SDL_logf (float x);
double SDL_log10 (double x);
float SDL_log10f (float x);
double SDL_modf (double x, double* y);
float SDL_modff (float x, float* y);
double SDL_pow (double x, double y);
float SDL_powf (float x, float y);
double SDL_round (double x);
float SDL_roundf (float x);
c_long SDL_lround (double x);
c_long SDL_lroundf (float x);
double SDL_scalbn (double x, int n);
float SDL_scalbnf (float x, int n);
double SDL_sin (double x);
float SDL_sinf (float x);
double SDL_sqrt (double x);
float SDL_sqrtf (float x);
double SDL_tan (double x);
float SDL_tanf (float x);

struct SDL_iconv_data_t;
alias SDL_iconv_t = SDL_iconv_data_t*;
SDL_iconv_t SDL_iconv_open (const(char)* tocode, const(char)* fromcode);
int SDL_iconv_close (SDL_iconv_t cd);
size_t SDL_iconv (
    SDL_iconv_t cd,
    const(char*)* inbuf,
    size_t* inbytesleft,
    char** outbuf,
    size_t* outbytesleft);

char* SDL_iconv_string (
    const(char)* tocode,
    const(char)* fromcode,
    const(char)* inbuf,
    size_t inbytesleft);

void* SDL_memcpy4 (void* dst, const(void)* src, size_t dwords);

int SDL_size_mul_overflow (size_t a, size_t b, size_t* ret);

// __attribute__((always_inline)) static inline int SDL_size_mul_overflow_builtin (size_t a,
//                                                      size_t b,
//                                                      size_t *ret)
// {
//     return __builtin_mul_overflow(a, b, ret) == 0 ? 0 : -1;
// }

// __attribute__((always_inline)) static inline int SDL_size_add_overflow (size_t a,
//                                             size_t b,
//                                             size_t *ret)
// {
//     if (b > (18446744073709551615UL) - a) {
//         return -1;
//     }
//     *ret = a + b;
//     return 0;
// }

// __attribute__((always_inline)) static inline int SDL_size_add_overflow_builtin (size_t a,
//                                                      size_t b,
//                                                      size_t *ret)
// {
//     return __builtin_add_overflow(a, b, ret) == 0 ? 0 : -1;
// }

alias SDL_FunctionPointer = void function ();

enum SDL_AssertState
{
    SDL_ASSERTION_RETRY = 0,
    SDL_ASSERTION_BREAK = 1,
    SDL_ASSERTION_ABORT = 2,
    SDL_ASSERTION_IGNORE = 3,
    SDL_ASSERTION_ALWAYS_IGNORE = 4
}

struct SDL_AssertData
{
    int always_ignore;
    uint trigger_count;
    const(char)* condition;
    const(char)* filename;
    int linenum;
    const(char)* function_;
    const(SDL_AssertData)* next;
}

SDL_AssertState SDL_ReportAssertion (
    SDL_AssertData* data,
    const(char)* func,
    const(char)* file,
    int line);

alias SDL_AssertionHandler = SDL_AssertState function (
    const(SDL_AssertData)* data,
    void* userdata);

void SDL_SetAssertionHandler (SDL_AssertionHandler handler, void* userdata);

SDL_AssertionHandler SDL_GetDefaultAssertionHandler ();

SDL_AssertionHandler SDL_GetAssertionHandler (void** puserdata);

const(SDL_AssertData)* SDL_GetAssertionReport ();

void SDL_ResetAssertionReport ();

alias SDL_SpinLock = int;

SDL_bool SDL_AtomicTryLock (SDL_SpinLock* lock);

void SDL_AtomicLock (SDL_SpinLock* lock);

void SDL_AtomicUnlock (SDL_SpinLock* lock);

void SDL_MemoryBarrierReleaseFunction ();

void SDL_MemoryBarrierAcquireFunction ();

struct SDL_AtomicInt
{
    int value;
}

SDL_bool SDL_AtomicCAS (SDL_AtomicInt* a, int oldval, int newval);

int SDL_AtomicSet (SDL_AtomicInt* a, int v);

int SDL_AtomicGet (SDL_AtomicInt* a);

int SDL_AtomicAdd (SDL_AtomicInt* a, int v);

SDL_bool SDL_AtomicCASPtr (void** a, void* oldval, void* newval);

void* SDL_AtomicSetPtr (void** a, void* v);

void* SDL_AtomicGetPtr (void** a);

int SDL_SetError (const(char)* fmt, ...);

const(char)* SDL_GetError ();

char* SDL_GetErrorMsg (char* errstr, int maxlen);

void SDL_ClearError ();

enum SDL_errorcode
{
    SDL_ENOMEM = 0,
    SDL_EFREAD = 1,
    SDL_EFWRITE = 2,
    SDL_EFSEEK = 3,
    SDL_UNSUPPORTED = 4,
    SDL_LASTERROR = 5
}

int SDL_Error (SDL_errorcode code);

__uint16_t __bswap_16 (__uint16_t __bsx);

__uint32_t __bswap_32 (__uint32_t __bsx);

__uint64_t __bswap_64 (__uint64_t __bsx);

__uint16_t __uint16_identity (__uint16_t __x);

__uint32_t __uint32_identity (__uint32_t __x);

__uint64_t __uint64_identity (__uint64_t __x);

float SDL_SwapFloat (float x);

struct SDL_mutex;

SDL_mutex* SDL_CreateMutex ();

int SDL_LockMutex (SDL_mutex* mutex);

int SDL_TryLockMutex (SDL_mutex* mutex);

int SDL_UnlockMutex (SDL_mutex* mutex);

void SDL_DestroyMutex (SDL_mutex* mutex);

struct SDL_semaphore;
alias SDL_sem = SDL_semaphore;

SDL_sem* SDL_CreateSemaphore (Uint32 initial_value);

void SDL_DestroySemaphore (SDL_sem* sem);

int SDL_SemWait (SDL_sem* sem);

int SDL_SemTryWait (SDL_sem* sem);

int SDL_SemWaitTimeout (SDL_sem* sem, Sint32 timeoutMS);

int SDL_SemPost (SDL_sem* sem);

Uint32 SDL_SemValue (SDL_sem* sem);

struct SDL_cond;

SDL_cond* SDL_CreateCond ();

void SDL_DestroyCond (SDL_cond* cond);

int SDL_CondSignal (SDL_cond* cond);

int SDL_CondBroadcast (SDL_cond* cond);

int SDL_CondWait (SDL_cond* cond, SDL_mutex* mutex);

int SDL_CondWaitTimeout (SDL_cond* cond, SDL_mutex* mutex, Sint32 timeoutMS);

struct SDL_Thread;

alias SDL_threadID = c_ulong;

alias SDL_TLSID = uint;

enum SDL_ThreadPriority
{
    SDL_THREAD_PRIORITY_LOW = 0,
    SDL_THREAD_PRIORITY_NORMAL = 1,
    SDL_THREAD_PRIORITY_HIGH = 2,
    SDL_THREAD_PRIORITY_TIME_CRITICAL = 3
}

alias SDL_ThreadFunction = int function (void* data);

SDL_Thread* SDL_CreateThread (
    SDL_ThreadFunction fn,
    const(char)* name,
    void* data);

SDL_Thread* SDL_CreateThreadWithStackSize (
    SDL_ThreadFunction fn,
    const(char)* name,
    const size_t stacksize,
    void* data);

const(char)* SDL_GetThreadName (SDL_Thread* thread);

SDL_threadID SDL_ThreadID ();

SDL_threadID SDL_GetThreadID (SDL_Thread* thread);

int SDL_SetThreadPriority (SDL_ThreadPriority priority);

void SDL_WaitThread (SDL_Thread* thread, int* status);

void SDL_DetachThread (SDL_Thread* thread);

SDL_TLSID SDL_TLSCreate ();

void* SDL_TLSGet (SDL_TLSID id);

int SDL_TLSSet (SDL_TLSID id, const(void)* value, void function (void*) destructor);

void SDL_TLSCleanup ();

struct SDL_RWops
{
    Sint64 function (SDL_RWops* context) size;

    Sint64 function (SDL_RWops* context, Sint64 offset, int whence) seek;

    Sint64 function (SDL_RWops* context, void* ptr, Sint64 size) read;

    Sint64 function (SDL_RWops* context, const(void)* ptr, Sint64 size) write;

    int function (SDL_RWops* context) close;

    Uint32 type;

    union _Anonymous_1
    {
        struct _Anonymous_2
        {
            SDL_bool autoclose;
            void* fp;
        }

        _Anonymous_2 stdio;

        struct _Anonymous_3
        {
            Uint8* base;
            Uint8* here;
            Uint8* stop;
        }

        _Anonymous_3 mem;

        struct _Anonymous_4
        {
            void* data1;
            void* data2;
        }

        _Anonymous_4 unknown;
    }

    _Anonymous_1 hidden;
}

SDL_RWops* SDL_RWFromFile (const(char)* file, const(char)* mode);

SDL_RWops* SDL_RWFromMem (void* mem, int size);

SDL_RWops* SDL_RWFromConstMem (const(void)* mem, int size);

SDL_RWops* SDL_CreateRW ();

void SDL_DestroyRW (SDL_RWops* area);

Sint64 SDL_RWsize (SDL_RWops* context);

Sint64 SDL_RWseek (SDL_RWops* context, Sint64 offset, int whence);

Sint64 SDL_RWtell (SDL_RWops* context);

Sint64 SDL_RWread (SDL_RWops* context, void* ptr, Sint64 size);

Sint64 SDL_RWwrite (SDL_RWops* context, const(void)* ptr, Sint64 size);

int SDL_RWclose (SDL_RWops* context);

void* SDL_LoadFile_RW (SDL_RWops* src, size_t* datasize, int freesrc);

void* SDL_LoadFile (const(char)* file, size_t* datasize);

Uint8 SDL_ReadU8 (SDL_RWops* src);

Uint16 SDL_ReadLE16 (SDL_RWops* src);

Uint16 SDL_ReadBE16 (SDL_RWops* src);

Uint32 SDL_ReadLE32 (SDL_RWops* src);

Uint32 SDL_ReadBE32 (SDL_RWops* src);

Uint64 SDL_ReadLE64 (SDL_RWops* src);

Uint64 SDL_ReadBE64 (SDL_RWops* src);

size_t SDL_WriteU8 (SDL_RWops* dst, Uint8 value);

size_t SDL_WriteLE16 (SDL_RWops* dst, Uint16 value);

size_t SDL_WriteBE16 (SDL_RWops* dst, Uint16 value);

size_t SDL_WriteLE32 (SDL_RWops* dst, Uint32 value);

size_t SDL_WriteBE32 (SDL_RWops* dst, Uint32 value);

size_t SDL_WriteLE64 (SDL_RWops* dst, Uint64 value);

size_t SDL_WriteBE64 (SDL_RWops* dst, Uint64 value);

alias SDL_AudioFormat = ushort;

alias SDL_AudioCallback = void function (
    void* userdata,
    Uint8* stream,
    int len);

struct SDL_AudioSpec
{
    int freq;
    SDL_AudioFormat format;
    Uint8 channels;
    Uint8 silence;
    Uint16 samples;
    Uint16 padding;
    Uint32 size;
    SDL_AudioCallback callback;
    void* userdata;
}

int SDL_GetNumAudioDrivers ();

const(char)* SDL_GetAudioDriver (int index);

const(char)* SDL_GetCurrentAudioDriver ();

alias SDL_AudioDeviceID = uint;

int SDL_GetNumAudioDevices (int iscapture);

const(char)* SDL_GetAudioDeviceName (int index, int iscapture);

int SDL_GetAudioDeviceSpec (int index, int iscapture, SDL_AudioSpec* spec);

int SDL_GetDefaultAudioInfo (char** name, SDL_AudioSpec* spec, int iscapture);

SDL_AudioDeviceID SDL_OpenAudioDevice (
    const(char)* device,
    int iscapture,
    const(SDL_AudioSpec)* desired,
    SDL_AudioSpec* obtained,
    int allowed_changes);

enum SDL_AudioStatus
{
    SDL_AUDIO_STOPPED = 0,
    SDL_AUDIO_PLAYING = 1,
    SDL_AUDIO_PAUSED = 2
}

SDL_AudioStatus SDL_GetAudioDeviceStatus (SDL_AudioDeviceID dev);

int SDL_PlayAudioDevice (SDL_AudioDeviceID dev);

int SDL_PauseAudioDevice (SDL_AudioDeviceID dev);

SDL_AudioSpec* SDL_LoadWAV_RW (
    SDL_RWops* src,
    int freesrc,
    SDL_AudioSpec* spec,
    Uint8** audio_buf,
    Uint32* audio_len);

struct SDL_AudioStream;

SDL_AudioStream* SDL_CreateAudioStream (
    SDL_AudioFormat src_format,
    Uint8 src_channels,
    int src_rate,
    SDL_AudioFormat dst_format,
    Uint8 dst_channels,
    int dst_rate);

int SDL_PutAudioStreamData (SDL_AudioStream* stream, const(void)* buf, int len);

int SDL_GetAudioStreamData (SDL_AudioStream* stream, void* buf, int len);

int SDL_GetAudioStreamAvailable (SDL_AudioStream* stream);

int SDL_FlushAudioStream (SDL_AudioStream* stream);

int SDL_ClearAudioStream (SDL_AudioStream* stream);

void SDL_DestroyAudioStream (SDL_AudioStream* stream);

int SDL_MixAudioFormat (
    Uint8* dst,
    const(Uint8)* src,
    SDL_AudioFormat format,
    Uint32 len,
    int volume);

int SDL_QueueAudio (SDL_AudioDeviceID dev, const(void)* data, Uint32 len);

Uint32 SDL_DequeueAudio (SDL_AudioDeviceID dev, void* data, Uint32 len);

Uint32 SDL_GetQueuedAudioSize (SDL_AudioDeviceID dev);

int SDL_ClearQueuedAudio (SDL_AudioDeviceID dev);

int SDL_LockAudioDevice (SDL_AudioDeviceID dev);

void SDL_UnlockAudioDevice (SDL_AudioDeviceID dev);

void SDL_CloseAudioDevice (SDL_AudioDeviceID dev);

int SDL_ConvertAudioSamples (
    SDL_AudioFormat src_format,
    Uint8 src_channels,
    int src_rate,
    const(Uint8)* src_data,
    int src_len,
    SDL_AudioFormat dst_format,
    Uint8 dst_channels,
    int dst_rate,
    Uint8** dst_data,
    int* dst_len);

// __attribute__((always_inline)) static inline int
// SDL_MostSignificantBitIndex32(Uint32 x)
// {

//     if (x == 0) {
//         return -1;
//     }
//     return 31 - __builtin_clz(x);
// # 107 "/home/alex/code/Dard/3rdparty/SDL/include/SDL3/SDL_bits.h"
// }

SDL_bool SDL_HasExactlyOneBitSet32 (Uint32 x);

enum SDL_BlendMode
{
    SDL_BLENDMODE_NONE = 0x00000000,

    SDL_BLENDMODE_BLEND = 0x00000001,

    SDL_BLENDMODE_ADD = 0x00000002,

    SDL_BLENDMODE_MOD = 0x00000004,

    SDL_BLENDMODE_MUL = 0x00000008,

    SDL_BLENDMODE_INVALID = 0x7FFFFFFF
}

enum SDL_BlendOperation
{
    SDL_BLENDOPERATION_ADD = 0x1,
    SDL_BLENDOPERATION_SUBTRACT = 0x2,
    SDL_BLENDOPERATION_REV_SUBTRACT = 0x3,
    SDL_BLENDOPERATION_MINIMUM = 0x4,
    SDL_BLENDOPERATION_MAXIMUM = 0x5
}

enum SDL_BlendFactor
{
    SDL_BLENDFACTOR_ZERO = 0x1,
    SDL_BLENDFACTOR_ONE = 0x2,
    SDL_BLENDFACTOR_SRC_COLOR = 0x3,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
    SDL_BLENDFACTOR_SRC_ALPHA = 0x5,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
    SDL_BLENDFACTOR_DST_COLOR = 0x7,
    SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
    SDL_BLENDFACTOR_DST_ALPHA = 0x9,
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA
}

SDL_BlendMode SDL_ComposeCustomBlendMode (
    SDL_BlendFactor srcColorFactor,
    SDL_BlendFactor dstColorFactor,
    SDL_BlendOperation colorOperation,
    SDL_BlendFactor srcAlphaFactor,
    SDL_BlendFactor dstAlphaFactor,
    SDL_BlendOperation alphaOperation);

int SDL_SetClipboardText (const(char)* text);

char* SDL_GetClipboardText ();

SDL_bool SDL_HasClipboardText ();

int SDL_SetPrimarySelectionText (const(char)* text);

char* SDL_GetPrimarySelectionText ();

SDL_bool SDL_HasPrimarySelectionText ();

int SDL_GetCPUCount ();

int SDL_GetCPUCacheLineSize ();

SDL_bool SDL_HasAltiVec ();

SDL_bool SDL_HasMMX ();

SDL_bool SDL_HasSSE ();

SDL_bool SDL_HasSSE2 ();

SDL_bool SDL_HasSSE3 ();

SDL_bool SDL_HasSSE41 ();

SDL_bool SDL_HasSSE42 ();

SDL_bool SDL_HasAVX ();

SDL_bool SDL_HasAVX2 ();

SDL_bool SDL_HasAVX512F ();

SDL_bool SDL_HasARMSIMD ();

SDL_bool SDL_HasNEON ();

SDL_bool SDL_HasLSX ();

SDL_bool SDL_HasLASX ();

int SDL_GetSystemRAM ();

size_t SDL_SIMDGetAlignment ();

struct SDL_Sensor;

alias SDL_SensorID = uint;

enum SDL_SensorType
{
    SDL_SENSOR_INVALID = -1,
    SDL_SENSOR_UNKNOWN = 0,
    SDL_SENSOR_ACCEL = 1,
    SDL_SENSOR_GYRO = 2,
    SDL_SENSOR_ACCEL_L = 3,
    SDL_SENSOR_GYRO_L = 4,
    SDL_SENSOR_ACCEL_R = 5,
    SDL_SENSOR_GYRO_R = 6
}

SDL_SensorID* SDL_GetSensors (int* count);

const(char)* SDL_GetSensorInstanceName (SDL_SensorID instance_id);

SDL_SensorType SDL_GetSensorInstanceType (SDL_SensorID instance_id);

int SDL_GetSensorInstanceNonPortableType (SDL_SensorID instance_id);

SDL_Sensor* SDL_OpenSensor (SDL_SensorID instance_id);

SDL_Sensor* SDL_GetSensorFromInstanceID (SDL_SensorID instance_id);

const(char)* SDL_GetSensorName (SDL_Sensor* sensor);

SDL_SensorType SDL_GetSensorType (SDL_Sensor* sensor);

int SDL_GetSensorNonPortableType (SDL_Sensor* sensor);

SDL_SensorID SDL_GetSensorInstanceID (SDL_Sensor* sensor);

int SDL_GetSensorData (SDL_Sensor* sensor, float* data, int num_values);

void SDL_CloseSensor (SDL_Sensor* sensor);

void SDL_UpdateSensors ();

struct SDL_GUID
{
    Uint8[16] data;
}

int SDL_GUIDToString (SDL_GUID guid, char* pszGUID, int cbGUID);

SDL_GUID SDL_GUIDFromString (const(char)* pchGUID);

struct SDL_Joystick;

alias SDL_JoystickGUID = SDL_GUID;

alias SDL_JoystickID = uint;

enum SDL_JoystickType
{
    SDL_JOYSTICK_TYPE_UNKNOWN = 0,
    SDL_JOYSTICK_TYPE_GAMEPAD = 1,
    SDL_JOYSTICK_TYPE_WHEEL = 2,
    SDL_JOYSTICK_TYPE_ARCADE_STICK = 3,
    SDL_JOYSTICK_TYPE_FLIGHT_STICK = 4,
    SDL_JOYSTICK_TYPE_DANCE_PAD = 5,
    SDL_JOYSTICK_TYPE_GUITAR = 6,
    SDL_JOYSTICK_TYPE_DRUM_KIT = 7,
    SDL_JOYSTICK_TYPE_ARCADE_PAD = 8,
    SDL_JOYSTICK_TYPE_THROTTLE = 9
}

enum SDL_JoystickPowerLevel
{
    SDL_JOYSTICK_POWER_UNKNOWN = -1,
    SDL_JOYSTICK_POWER_EMPTY = 0,
    SDL_JOYSTICK_POWER_LOW = 1,
    SDL_JOYSTICK_POWER_MEDIUM = 2,
    SDL_JOYSTICK_POWER_FULL = 3,
    SDL_JOYSTICK_POWER_WIRED = 4,
    SDL_JOYSTICK_POWER_MAX = 5
}

void SDL_LockJoysticks ();

void SDL_UnlockJoysticks ();

SDL_JoystickID* SDL_GetJoysticks (int* count);

const(char)* SDL_GetJoystickInstanceName (SDL_JoystickID instance_id);

const(char)* SDL_GetJoystickInstancePath (SDL_JoystickID instance_id);

int SDL_GetJoystickInstancePlayerIndex (SDL_JoystickID instance_id);

SDL_JoystickGUID SDL_GetJoystickInstanceGUID (SDL_JoystickID instance_id);

Uint16 SDL_GetJoystickInstanceVendor (SDL_JoystickID instance_id);

Uint16 SDL_GetJoystickInstanceProduct (SDL_JoystickID instance_id);

Uint16 SDL_GetJoystickInstanceProductVersion (SDL_JoystickID instance_id);

SDL_JoystickType SDL_GetJoystickInstanceType (SDL_JoystickID instance_id);

SDL_Joystick* SDL_OpenJoystick (SDL_JoystickID instance_id);

SDL_Joystick* SDL_GetJoystickFromInstanceID (SDL_JoystickID instance_id);

SDL_Joystick* SDL_GetJoystickFromPlayerIndex (int player_index);

SDL_JoystickID SDL_AttachVirtualJoystick (
    SDL_JoystickType type,
    int naxes,
    int nbuttons,
    int nhats);

struct SDL_VirtualJoystickDesc
{
    Uint16 version_;
    Uint16 type;
    Uint16 naxes;
    Uint16 nbuttons;
    Uint16 nhats;
    Uint16 vendor_id;
    Uint16 product_id;
    Uint16 padding;
    Uint32 button_mask;

    Uint32 axis_mask;

    const(char)* name;

    void* userdata;
    void function (void* userdata) Update;
    void function (void* userdata, int player_index) SetPlayerIndex;
    int function (void* userdata, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble) Rumble;
    int function (void* userdata, Uint16 left_rumble, Uint16 right_rumble) RumbleTriggers;
    int function (void* userdata, Uint8 red, Uint8 green, Uint8 blue) SetLED;
    int function (void* userdata, const(void)* data, int size) SendEffect;
}

SDL_JoystickID SDL_AttachVirtualJoystickEx (const(SDL_VirtualJoystickDesc)* desc);

int SDL_DetachVirtualJoystick (SDL_JoystickID instance_id);

SDL_bool SDL_IsJoystickVirtual (SDL_JoystickID instance_id);

int SDL_SetJoystickVirtualAxis (SDL_Joystick* joystick, int axis, Sint16 value);

int SDL_SetJoystickVirtualButton (SDL_Joystick* joystick, int button, Uint8 value);

int SDL_SetJoystickVirtualHat (SDL_Joystick* joystick, int hat, Uint8 value);

const(char)* SDL_GetJoystickName (SDL_Joystick* joystick);

const(char)* SDL_GetJoystickPath (SDL_Joystick* joystick);

int SDL_GetJoystickPlayerIndex (SDL_Joystick* joystick);

int SDL_SetJoystickPlayerIndex (SDL_Joystick* joystick, int player_index);

SDL_JoystickGUID SDL_GetJoystickGUID (SDL_Joystick* joystick);

Uint16 SDL_GetJoystickVendor (SDL_Joystick* joystick);

Uint16 SDL_GetJoystickProduct (SDL_Joystick* joystick);

Uint16 SDL_GetJoystickProductVersion (SDL_Joystick* joystick);

Uint16 SDL_GetJoystickFirmwareVersion (SDL_Joystick* joystick);

const(char)* SDL_GetJoystickSerial (SDL_Joystick* joystick);

SDL_JoystickType SDL_GetJoystickType (SDL_Joystick* joystick);

int SDL_GetJoystickGUIDString (SDL_JoystickGUID guid, char* pszGUID, int cbGUID);

SDL_JoystickGUID SDL_GetJoystickGUIDFromString (const(char)* pchGUID);

void SDL_GetJoystickGUIDInfo (SDL_JoystickGUID guid, Uint16* vendor, Uint16* product, Uint16* version_, Uint16* crc16);

SDL_bool SDL_JoystickConnected (SDL_Joystick* joystick);

SDL_JoystickID SDL_GetJoystickInstanceID (SDL_Joystick* joystick);

int SDL_GetNumJoystickAxes (SDL_Joystick* joystick);

int SDL_GetNumJoystickHats (SDL_Joystick* joystick);

int SDL_GetNumJoystickButtons (SDL_Joystick* joystick);

void SDL_SetJoystickEventsEnabled (SDL_bool enabled);

SDL_bool SDL_JoystickEventsEnabled ();

void SDL_UpdateJoysticks ();

Sint16 SDL_GetJoystickAxis (SDL_Joystick* joystick, int axis);

SDL_bool SDL_GetJoystickAxisInitialState (
    SDL_Joystick* joystick,
    int axis,
    Sint16* state);

Uint8 SDL_GetJoystickHat (SDL_Joystick* joystick, int hat);

Uint8 SDL_GetJoystickButton (SDL_Joystick* joystick, int button);

int SDL_RumbleJoystick (SDL_Joystick* joystick, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms);

int SDL_RumbleJoystickTriggers (SDL_Joystick* joystick, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms);

SDL_bool SDL_JoystickHasLED (SDL_Joystick* joystick);

SDL_bool SDL_JoystickHasRumble (SDL_Joystick* joystick);

SDL_bool SDL_JoystickHasRumbleTriggers (SDL_Joystick* joystick);

int SDL_SetJoystickLED (SDL_Joystick* joystick, Uint8 red, Uint8 green, Uint8 blue);

int SDL_SendJoystickEffect (SDL_Joystick* joystick, const(void)* data, int size);

void SDL_CloseJoystick (SDL_Joystick* joystick);

SDL_JoystickPowerLevel SDL_GetJoystickPowerLevel (SDL_Joystick* joystick);

struct SDL_Gamepad;

enum SDL_GamepadType
{
    SDL_GAMEPAD_TYPE_UNKNOWN = 0,
    SDL_GAMEPAD_TYPE_VIRTUAL = 1,
    SDL_GAMEPAD_TYPE_XBOX360 = 2,
    SDL_GAMEPAD_TYPE_XBOXONE = 3,
    SDL_GAMEPAD_TYPE_PS3 = 4,
    SDL_GAMEPAD_TYPE_PS4 = 5,
    SDL_GAMEPAD_TYPE_PS5 = 6,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO = 7,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = 8,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = 9,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = 10,
    SDL_GAMEPAD_TYPE_AMAZON_LUNA = 11,
    SDL_GAMEPAD_TYPE_GOOGLE_STADIA = 12,
    SDL_GAMEPAD_TYPE_NVIDIA_SHIELD = 13
}

enum SDL_GamepadButton
{
    SDL_GAMEPAD_BUTTON_INVALID = -1,
    SDL_GAMEPAD_BUTTON_A = 0,
    SDL_GAMEPAD_BUTTON_B = 1,
    SDL_GAMEPAD_BUTTON_X = 2,
    SDL_GAMEPAD_BUTTON_Y = 3,
    SDL_GAMEPAD_BUTTON_BACK = 4,
    SDL_GAMEPAD_BUTTON_GUIDE = 5,
    SDL_GAMEPAD_BUTTON_START = 6,
    SDL_GAMEPAD_BUTTON_LEFT_STICK = 7,
    SDL_GAMEPAD_BUTTON_RIGHT_STICK = 8,
    SDL_GAMEPAD_BUTTON_LEFT_SHOULDER = 9,
    SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER = 10,
    SDL_GAMEPAD_BUTTON_DPAD_UP = 11,
    SDL_GAMEPAD_BUTTON_DPAD_DOWN = 12,
    SDL_GAMEPAD_BUTTON_DPAD_LEFT = 13,
    SDL_GAMEPAD_BUTTON_DPAD_RIGHT = 14,
    SDL_GAMEPAD_BUTTON_MISC1 = 15,
    SDL_GAMEPAD_BUTTON_PADDLE1 = 16,
    SDL_GAMEPAD_BUTTON_PADDLE2 = 17,
    SDL_GAMEPAD_BUTTON_PADDLE3 = 18,
    SDL_GAMEPAD_BUTTON_PADDLE4 = 19,
    SDL_GAMEPAD_BUTTON_TOUCHPAD = 20,
    SDL_GAMEPAD_BUTTON_MAX = 21
}

enum SDL_GamepadAxis
{
    SDL_GAMEPAD_AXIS_INVALID = -1,
    SDL_GAMEPAD_AXIS_LEFTX = 0,
    SDL_GAMEPAD_AXIS_LEFTY = 1,
    SDL_GAMEPAD_AXIS_RIGHTX = 2,
    SDL_GAMEPAD_AXIS_RIGHTY = 3,
    SDL_GAMEPAD_AXIS_LEFT_TRIGGER = 4,
    SDL_GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
    SDL_GAMEPAD_AXIS_MAX = 6
}

enum SDL_GamepadBindingType
{
    SDL_GAMEPAD_BINDTYPE_NONE = 0,
    SDL_GAMEPAD_BINDTYPE_BUTTON = 1,
    SDL_GAMEPAD_BINDTYPE_AXIS = 2,
    SDL_GAMEPAD_BINDTYPE_HAT = 3
}

struct SDL_GamepadBinding
{
    SDL_GamepadBindingType bindType;

    union _Anonymous_5
    {
        int button;
        int axis;

        struct _Anonymous_6
        {
            int hat;
            int hat_mask;
        }

        _Anonymous_6 hat;
    }

    _Anonymous_5 value;
}

int SDL_AddGamepadMapping (const(char)* mappingString);

int SDL_AddGamepadMappingsFromRW (SDL_RWops* rw, int freerw);

int SDL_GetNumGamepadMappings ();

char* SDL_GetGamepadMappingForIndex (int mapping_index);

char* SDL_GetGamepadMappingForGUID (SDL_JoystickGUID guid);

char* SDL_GetGamepadMapping (SDL_Gamepad* gamepad);

SDL_JoystickID* SDL_GetGamepads (int* count);

SDL_bool SDL_IsGamepad (SDL_JoystickID instance_id);

const(char)* SDL_GetGamepadInstanceName (SDL_JoystickID instance_id);

const(char)* SDL_GetGamepadInstancePath (SDL_JoystickID instance_id);

int SDL_GetGamepadInstancePlayerIndex (SDL_JoystickID instance_id);

SDL_JoystickGUID SDL_GetGamepadInstanceGUID (SDL_JoystickID instance_id);

Uint16 SDL_GetGamepadInstanceVendor (SDL_JoystickID instance_id);

Uint16 SDL_GetGamepadInstanceProduct (SDL_JoystickID instance_id);

Uint16 SDL_GetGamepadInstanceProductVersion (SDL_JoystickID instance_id);

SDL_GamepadType SDL_GetGamepadInstanceType (SDL_JoystickID instance_id);

char* SDL_GetGamepadInstanceMapping (SDL_JoystickID instance_id);

SDL_Gamepad* SDL_OpenGamepad (SDL_JoystickID instance_id);

SDL_Gamepad* SDL_GetGamepadFromInstanceID (SDL_JoystickID instance_id);

SDL_Gamepad* SDL_GetGamepadFromPlayerIndex (int player_index);

const(char)* SDL_GetGamepadName (SDL_Gamepad* gamepad);

const(char)* SDL_GetGamepadPath (SDL_Gamepad* gamepad);

SDL_GamepadType SDL_GetGamepadType (SDL_Gamepad* gamepad);

int SDL_GetGamepadPlayerIndex (SDL_Gamepad* gamepad);

int SDL_SetGamepadPlayerIndex (SDL_Gamepad* gamepad, int player_index);

Uint16 SDL_GetGamepadVendor (SDL_Gamepad* gamepad);

Uint16 SDL_GetGamepadProduct (SDL_Gamepad* gamepad);

Uint16 SDL_GetGamepadProductVersion (SDL_Gamepad* gamepad);

Uint16 SDL_GetGamepadFirmwareVersion (SDL_Gamepad* gamepad);

const(char)* SDL_GetGamepadSerial (SDL_Gamepad* gamepad);

SDL_bool SDL_GamepadConnected (SDL_Gamepad* gamepad);

SDL_Joystick* SDL_GetGamepadJoystick (SDL_Gamepad* gamepad);

void SDL_SetGamepadEventsEnabled (SDL_bool enabled);

SDL_bool SDL_GamepadEventsEnabled ();

void SDL_UpdateGamepads ();

SDL_GamepadAxis SDL_GetGamepadAxisFromString (const(char)* str);

const(char)* SDL_GetGamepadStringForAxis (SDL_GamepadAxis axis);

SDL_GamepadBinding SDL_GetGamepadBindForAxis (SDL_Gamepad* gamepad, SDL_GamepadAxis axis);

SDL_bool SDL_GamepadHasAxis (SDL_Gamepad* gamepad, SDL_GamepadAxis axis);

Sint16 SDL_GetGamepadAxis (SDL_Gamepad* gamepad, SDL_GamepadAxis axis);

SDL_GamepadButton SDL_GetGamepadButtonFromString (const(char)* str);

const(char)* SDL_GetGamepadStringForButton (SDL_GamepadButton button);

SDL_GamepadBinding SDL_GetGamepadBindForButton (SDL_Gamepad* gamepad, SDL_GamepadButton button);

SDL_bool SDL_GamepadHasButton (SDL_Gamepad* gamepad, SDL_GamepadButton button);

Uint8 SDL_GetGamepadButton (SDL_Gamepad* gamepad, SDL_GamepadButton button);

int SDL_GetNumGamepadTouchpads (SDL_Gamepad* gamepad);

int SDL_GetNumGamepadTouchpadFingers (SDL_Gamepad* gamepad, int touchpad);

int SDL_GetGamepadTouchpadFinger (SDL_Gamepad* gamepad, int touchpad, int finger, Uint8* state, float* x, float* y, float* pressure);

SDL_bool SDL_GamepadHasSensor (SDL_Gamepad* gamepad, SDL_SensorType type);

int SDL_SetGamepadSensorEnabled (SDL_Gamepad* gamepad, SDL_SensorType type, SDL_bool enabled);

SDL_bool SDL_GamepadSensorEnabled (SDL_Gamepad* gamepad, SDL_SensorType type);

float SDL_GetGamepadSensorDataRate (SDL_Gamepad* gamepad, SDL_SensorType type);

int SDL_GetGamepadSensorData (SDL_Gamepad* gamepad, SDL_SensorType type, float* data, int num_values);

int SDL_RumbleGamepad (SDL_Gamepad* gamepad, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms);

int SDL_RumbleGamepadTriggers (SDL_Gamepad* gamepad, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms);

SDL_bool SDL_GamepadHasLED (SDL_Gamepad* gamepad);

SDL_bool SDL_GamepadHasRumble (SDL_Gamepad* gamepad);

SDL_bool SDL_GamepadHasRumbleTriggers (SDL_Gamepad* gamepad);

int SDL_SetGamepadLED (SDL_Gamepad* gamepad, Uint8 red, Uint8 green, Uint8 blue);

int SDL_SendGamepadEffect (SDL_Gamepad* gamepad, const(void)* data, int size);

void SDL_CloseGamepad (SDL_Gamepad* gamepad);

const(char)* SDL_GetGamepadAppleSFSymbolsNameForButton (SDL_Gamepad* gamepad, SDL_GamepadButton button);

const(char)* SDL_GetGamepadAppleSFSymbolsNameForAxis (SDL_Gamepad* gamepad, SDL_GamepadAxis axis);

enum SDL_Scancode
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
    SDL_SCANCODE_BACKSLASH = 49,

    SDL_SCANCODE_NONUSHASH = 50,

    SDL_SCANCODE_SEMICOLON = 51,
    SDL_SCANCODE_APOSTROPHE = 52,
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

    SDL_SCANCODE_NONUSBACKSLASH = 100,

    SDL_SCANCODE_APPLICATION = 101,
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
    SDL_SCANCODE_HELP = 117,
    SDL_SCANCODE_MENU = 118,
    SDL_SCANCODE_SELECT = 119,
    SDL_SCANCODE_STOP = 120,
    SDL_SCANCODE_AGAIN = 121,
    SDL_SCANCODE_UNDO = 122,
    SDL_SCANCODE_CUT = 123,
    SDL_SCANCODE_COPY = 124,
    SDL_SCANCODE_PASTE = 125,
    SDL_SCANCODE_FIND = 126,
    SDL_SCANCODE_MUTE = 127,
    SDL_SCANCODE_VOLUMEUP = 128,
    SDL_SCANCODE_VOLUMEDOWN = 129,

    SDL_SCANCODE_KP_COMMA = 133,
    SDL_SCANCODE_KP_EQUALSAS400 = 134,

    SDL_SCANCODE_INTERNATIONAL1 = 135,

    SDL_SCANCODE_INTERNATIONAL2 = 136,
    SDL_SCANCODE_INTERNATIONAL3 = 137,
    SDL_SCANCODE_INTERNATIONAL4 = 138,
    SDL_SCANCODE_INTERNATIONAL5 = 139,
    SDL_SCANCODE_INTERNATIONAL6 = 140,
    SDL_SCANCODE_INTERNATIONAL7 = 141,
    SDL_SCANCODE_INTERNATIONAL8 = 142,
    SDL_SCANCODE_INTERNATIONAL9 = 143,
    SDL_SCANCODE_LANG1 = 144,
    SDL_SCANCODE_LANG2 = 145,
    SDL_SCANCODE_LANG3 = 146,
    SDL_SCANCODE_LANG4 = 147,
    SDL_SCANCODE_LANG5 = 148,
    SDL_SCANCODE_LANG6 = 149,
    SDL_SCANCODE_LANG7 = 150,
    SDL_SCANCODE_LANG8 = 151,
    SDL_SCANCODE_LANG9 = 152,

    SDL_SCANCODE_ALTERASE = 153,
    SDL_SCANCODE_SYSREQ = 154,
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
    SDL_SCANCODE_LALT = 226,
    SDL_SCANCODE_LGUI = 227,
    SDL_SCANCODE_RCTRL = 228,
    SDL_SCANCODE_RSHIFT = 229,
    SDL_SCANCODE_RALT = 230,
    SDL_SCANCODE_RGUI = 231,

    SDL_SCANCODE_MODE = 257,

    SDL_SCANCODE_AUDIONEXT = 258,
    SDL_SCANCODE_AUDIOPREV = 259,
    SDL_SCANCODE_AUDIOSTOP = 260,
    SDL_SCANCODE_AUDIOPLAY = 261,
    SDL_SCANCODE_AUDIOMUTE = 262,
    SDL_SCANCODE_MEDIASELECT = 263,
    SDL_SCANCODE_WWW = 264,
    SDL_SCANCODE_MAIL = 265,
    SDL_SCANCODE_CALCULATOR = 266,
    SDL_SCANCODE_COMPUTER = 267,
    SDL_SCANCODE_AC_SEARCH = 268,
    SDL_SCANCODE_AC_HOME = 269,
    SDL_SCANCODE_AC_BACK = 270,
    SDL_SCANCODE_AC_FORWARD = 271,
    SDL_SCANCODE_AC_STOP = 272,
    SDL_SCANCODE_AC_REFRESH = 273,
    SDL_SCANCODE_AC_BOOKMARKS = 274,

    SDL_SCANCODE_BRIGHTNESSDOWN = 275,
    SDL_SCANCODE_BRIGHTNESSUP = 276,
    SDL_SCANCODE_DISPLAYSWITCH = 277,

    SDL_SCANCODE_KBDILLUMTOGGLE = 278,
    SDL_SCANCODE_KBDILLUMDOWN = 279,
    SDL_SCANCODE_KBDILLUMUP = 280,
    SDL_SCANCODE_EJECT = 281,
    SDL_SCANCODE_SLEEP = 282,

    SDL_SCANCODE_APP1 = 283,
    SDL_SCANCODE_APP2 = 284,

    SDL_SCANCODE_AUDIOREWIND = 285,
    SDL_SCANCODE_AUDIOFASTFORWARD = 286,

    SDL_SCANCODE_SOFTLEFT = 287,

    SDL_SCANCODE_SOFTRIGHT = 288,

    SDL_SCANCODE_CALL = 289,
    SDL_SCANCODE_ENDCALL = 290,

    SDL_NUM_SCANCODES = 512
}

alias SDL_Keycode = int;

enum SDL_KeyCode
{
    SDLK_UNKNOWN = 0,

    SDLK_RETURN = '\r',
    SDLK_ESCAPE = '\x1B',
    SDLK_BACKSPACE = '\b',
    SDLK_TAB = '\t',
    SDLK_SPACE = ' ',
    SDLK_EXCLAIM = '!',
    SDLK_QUOTEDBL = '"',
    SDLK_HASH = '#',
    SDLK_PERCENT = '%',
    SDLK_DOLLAR = '$',
    SDLK_AMPERSAND = '&',
    SDLK_QUOTE = '\'',
    SDLK_LEFTPAREN = '(',
    SDLK_RIGHTPAREN = ')',
    SDLK_ASTERISK = '*',
    SDLK_PLUS = '+',
    SDLK_COMMA = ',',
    SDLK_MINUS = '-',
    SDLK_PERIOD = '.',
    SDLK_SLASH = '/',
    SDLK_0 = '0',
    SDLK_1 = '1',
    SDLK_2 = '2',
    SDLK_3 = '3',
    SDLK_4 = '4',
    SDLK_5 = '5',
    SDLK_6 = '6',
    SDLK_7 = '7',
    SDLK_8 = '8',
    SDLK_9 = '9',
    SDLK_COLON = ':',
    SDLK_SEMICOLON = ';',
    SDLK_LESS = '<',
    SDLK_EQUALS = '=',
    SDLK_GREATER = '>',
    SDLK_QUESTION = '?',
    SDLK_AT = '@',

    SDLK_LEFTBRACKET = '[',
    SDLK_BACKSLASH = '\\',
    SDLK_RIGHTBRACKET = ']',
    SDLK_CARET = '^',
    SDLK_UNDERSCORE = '_',
    SDLK_BACKQUOTE = '`',
    SDLK_a = 'a',
    SDLK_b = 'b',
    SDLK_c = 'c',
    SDLK_d = 'd',
    SDLK_e = 'e',
    SDLK_f = 'f',
    SDLK_g = 'g',
    SDLK_h = 'h',
    SDLK_i = 'i',
    SDLK_j = 'j',
    SDLK_k = 'k',
    SDLK_l = 'l',
    SDLK_m = 'm',
    SDLK_n = 'n',
    SDLK_o = 'o',
    SDLK_p = 'p',
    SDLK_q = 'q',
    SDLK_r = 'r',
    SDLK_s = 's',
    SDLK_t = 't',
    SDLK_u = 'u',
    SDLK_v = 'v',
    SDLK_w = 'w',
    SDLK_x = 'x',
    SDLK_y = 'y',
    SDLK_z = 'z',

    SDLK_CAPSLOCK = SDL_Scancode.SDL_SCANCODE_CAPSLOCK | (1 << 30),

    SDLK_F1 = SDL_Scancode.SDL_SCANCODE_F1 | (1 << 30),
    SDLK_F2 = SDL_Scancode.SDL_SCANCODE_F2 | (1 << 30),
    SDLK_F3 = SDL_Scancode.SDL_SCANCODE_F3 | (1 << 30),
    SDLK_F4 = SDL_Scancode.SDL_SCANCODE_F4 | (1 << 30),
    SDLK_F5 = SDL_Scancode.SDL_SCANCODE_F5 | (1 << 30),
    SDLK_F6 = SDL_Scancode.SDL_SCANCODE_F6 | (1 << 30),
    SDLK_F7 = SDL_Scancode.SDL_SCANCODE_F7 | (1 << 30),
    SDLK_F8 = SDL_Scancode.SDL_SCANCODE_F8 | (1 << 30),
    SDLK_F9 = SDL_Scancode.SDL_SCANCODE_F9 | (1 << 30),
    SDLK_F10 = SDL_Scancode.SDL_SCANCODE_F10 | (1 << 30),
    SDLK_F11 = SDL_Scancode.SDL_SCANCODE_F11 | (1 << 30),
    SDLK_F12 = SDL_Scancode.SDL_SCANCODE_F12 | (1 << 30),

    SDLK_PRINTSCREEN = SDL_Scancode.SDL_SCANCODE_PRINTSCREEN | (1 << 30),
    SDLK_SCROLLLOCK = SDL_Scancode.SDL_SCANCODE_SCROLLLOCK | (1 << 30),
    SDLK_PAUSE = SDL_Scancode.SDL_SCANCODE_PAUSE | (1 << 30),
    SDLK_INSERT = SDL_Scancode.SDL_SCANCODE_INSERT | (1 << 30),
    SDLK_HOME = SDL_Scancode.SDL_SCANCODE_HOME | (1 << 30),
    SDLK_PAGEUP = SDL_Scancode.SDL_SCANCODE_PAGEUP | (1 << 30),
    SDLK_DELETE = '\x7F',
    SDLK_END = SDL_Scancode.SDL_SCANCODE_END | (1 << 30),
    SDLK_PAGEDOWN = SDL_Scancode.SDL_SCANCODE_PAGEDOWN | (1 << 30),
    SDLK_RIGHT = SDL_Scancode.SDL_SCANCODE_RIGHT | (1 << 30),
    SDLK_LEFT = SDL_Scancode.SDL_SCANCODE_LEFT | (1 << 30),
    SDLK_DOWN = SDL_Scancode.SDL_SCANCODE_DOWN | (1 << 30),
    SDLK_UP = SDL_Scancode.SDL_SCANCODE_UP | (1 << 30),

    SDLK_NUMLOCKCLEAR = SDL_Scancode.SDL_SCANCODE_NUMLOCKCLEAR | (1 << 30),
    SDLK_KP_DIVIDE = SDL_Scancode.SDL_SCANCODE_KP_DIVIDE | (1 << 30),
    SDLK_KP_MULTIPLY = SDL_Scancode.SDL_SCANCODE_KP_MULTIPLY | (1 << 30),
    SDLK_KP_MINUS = SDL_Scancode.SDL_SCANCODE_KP_MINUS | (1 << 30),
    SDLK_KP_PLUS = SDL_Scancode.SDL_SCANCODE_KP_PLUS | (1 << 30),
    SDLK_KP_ENTER = SDL_Scancode.SDL_SCANCODE_KP_ENTER | (1 << 30),
    SDLK_KP_1 = SDL_Scancode.SDL_SCANCODE_KP_1 | (1 << 30),
    SDLK_KP_2 = SDL_Scancode.SDL_SCANCODE_KP_2 | (1 << 30),
    SDLK_KP_3 = SDL_Scancode.SDL_SCANCODE_KP_3 | (1 << 30),
    SDLK_KP_4 = SDL_Scancode.SDL_SCANCODE_KP_4 | (1 << 30),
    SDLK_KP_5 = SDL_Scancode.SDL_SCANCODE_KP_5 | (1 << 30),
    SDLK_KP_6 = SDL_Scancode.SDL_SCANCODE_KP_6 | (1 << 30),
    SDLK_KP_7 = SDL_Scancode.SDL_SCANCODE_KP_7 | (1 << 30),
    SDLK_KP_8 = SDL_Scancode.SDL_SCANCODE_KP_8 | (1 << 30),
    SDLK_KP_9 = SDL_Scancode.SDL_SCANCODE_KP_9 | (1 << 30),
    SDLK_KP_0 = SDL_Scancode.SDL_SCANCODE_KP_0 | (1 << 30),
    SDLK_KP_PERIOD = SDL_Scancode.SDL_SCANCODE_KP_PERIOD | (1 << 30),

    SDLK_APPLICATION = SDL_Scancode.SDL_SCANCODE_APPLICATION | (1 << 30),
    SDLK_POWER = SDL_Scancode.SDL_SCANCODE_POWER | (1 << 30),
    SDLK_KP_EQUALS = SDL_Scancode.SDL_SCANCODE_KP_EQUALS | (1 << 30),
    SDLK_F13 = SDL_Scancode.SDL_SCANCODE_F13 | (1 << 30),
    SDLK_F14 = SDL_Scancode.SDL_SCANCODE_F14 | (1 << 30),
    SDLK_F15 = SDL_Scancode.SDL_SCANCODE_F15 | (1 << 30),
    SDLK_F16 = SDL_Scancode.SDL_SCANCODE_F16 | (1 << 30),
    SDLK_F17 = SDL_Scancode.SDL_SCANCODE_F17 | (1 << 30),
    SDLK_F18 = SDL_Scancode.SDL_SCANCODE_F18 | (1 << 30),
    SDLK_F19 = SDL_Scancode.SDL_SCANCODE_F19 | (1 << 30),
    SDLK_F20 = SDL_Scancode.SDL_SCANCODE_F20 | (1 << 30),
    SDLK_F21 = SDL_Scancode.SDL_SCANCODE_F21 | (1 << 30),
    SDLK_F22 = SDL_Scancode.SDL_SCANCODE_F22 | (1 << 30),
    SDLK_F23 = SDL_Scancode.SDL_SCANCODE_F23 | (1 << 30),
    SDLK_F24 = SDL_Scancode.SDL_SCANCODE_F24 | (1 << 30),
    SDLK_EXECUTE = SDL_Scancode.SDL_SCANCODE_EXECUTE | (1 << 30),
    SDLK_HELP = SDL_Scancode.SDL_SCANCODE_HELP | (1 << 30),
    SDLK_MENU = SDL_Scancode.SDL_SCANCODE_MENU | (1 << 30),
    SDLK_SELECT = SDL_Scancode.SDL_SCANCODE_SELECT | (1 << 30),
    SDLK_STOP = SDL_Scancode.SDL_SCANCODE_STOP | (1 << 30),
    SDLK_AGAIN = SDL_Scancode.SDL_SCANCODE_AGAIN | (1 << 30),
    SDLK_UNDO = SDL_Scancode.SDL_SCANCODE_UNDO | (1 << 30),
    SDLK_CUT = SDL_Scancode.SDL_SCANCODE_CUT | (1 << 30),
    SDLK_COPY = SDL_Scancode.SDL_SCANCODE_COPY | (1 << 30),
    SDLK_PASTE = SDL_Scancode.SDL_SCANCODE_PASTE | (1 << 30),
    SDLK_FIND = SDL_Scancode.SDL_SCANCODE_FIND | (1 << 30),
    SDLK_MUTE = SDL_Scancode.SDL_SCANCODE_MUTE | (1 << 30),
    SDLK_VOLUMEUP = SDL_Scancode.SDL_SCANCODE_VOLUMEUP | (1 << 30),
    SDLK_VOLUMEDOWN = SDL_Scancode.SDL_SCANCODE_VOLUMEDOWN | (1 << 30),
    SDLK_KP_COMMA = SDL_Scancode.SDL_SCANCODE_KP_COMMA | (1 << 30),
    SDLK_KP_EQUALSAS400 = SDL_Scancode.SDL_SCANCODE_KP_EQUALSAS400 | (1 << 30),

    SDLK_ALTERASE = SDL_Scancode.SDL_SCANCODE_ALTERASE | (1 << 30),
    SDLK_SYSREQ = SDL_Scancode.SDL_SCANCODE_SYSREQ | (1 << 30),
    SDLK_CANCEL = SDL_Scancode.SDL_SCANCODE_CANCEL | (1 << 30),
    SDLK_CLEAR = SDL_Scancode.SDL_SCANCODE_CLEAR | (1 << 30),
    SDLK_PRIOR = SDL_Scancode.SDL_SCANCODE_PRIOR | (1 << 30),
    SDLK_RETURN2 = SDL_Scancode.SDL_SCANCODE_RETURN2 | (1 << 30),
    SDLK_SEPARATOR = SDL_Scancode.SDL_SCANCODE_SEPARATOR | (1 << 30),
    SDLK_OUT = SDL_Scancode.SDL_SCANCODE_OUT | (1 << 30),
    SDLK_OPER = SDL_Scancode.SDL_SCANCODE_OPER | (1 << 30),
    SDLK_CLEARAGAIN = SDL_Scancode.SDL_SCANCODE_CLEARAGAIN | (1 << 30),
    SDLK_CRSEL = SDL_Scancode.SDL_SCANCODE_CRSEL | (1 << 30),
    SDLK_EXSEL = SDL_Scancode.SDL_SCANCODE_EXSEL | (1 << 30),

    SDLK_KP_00 = SDL_Scancode.SDL_SCANCODE_KP_00 | (1 << 30),
    SDLK_KP_000 = SDL_Scancode.SDL_SCANCODE_KP_000 | (1 << 30),
    SDLK_THOUSANDSSEPARATOR = SDL_Scancode.SDL_SCANCODE_THOUSANDSSEPARATOR | (1 << 30),
    SDLK_DECIMALSEPARATOR = SDL_Scancode.SDL_SCANCODE_DECIMALSEPARATOR | (1 << 30),
    SDLK_CURRENCYUNIT = SDL_Scancode.SDL_SCANCODE_CURRENCYUNIT | (1 << 30),
    SDLK_CURRENCYSUBUNIT = SDL_Scancode.SDL_SCANCODE_CURRENCYSUBUNIT | (1 << 30),
    SDLK_KP_LEFTPAREN = SDL_Scancode.SDL_SCANCODE_KP_LEFTPAREN | (1 << 30),
    SDLK_KP_RIGHTPAREN = SDL_Scancode.SDL_SCANCODE_KP_RIGHTPAREN | (1 << 30),
    SDLK_KP_LEFTBRACE = SDL_Scancode.SDL_SCANCODE_KP_LEFTBRACE | (1 << 30),
    SDLK_KP_RIGHTBRACE = SDL_Scancode.SDL_SCANCODE_KP_RIGHTBRACE | (1 << 30),
    SDLK_KP_TAB = SDL_Scancode.SDL_SCANCODE_KP_TAB | (1 << 30),
    SDLK_KP_BACKSPACE = SDL_Scancode.SDL_SCANCODE_KP_BACKSPACE | (1 << 30),
    SDLK_KP_A = SDL_Scancode.SDL_SCANCODE_KP_A | (1 << 30),
    SDLK_KP_B = SDL_Scancode.SDL_SCANCODE_KP_B | (1 << 30),
    SDLK_KP_C = SDL_Scancode.SDL_SCANCODE_KP_C | (1 << 30),
    SDLK_KP_D = SDL_Scancode.SDL_SCANCODE_KP_D | (1 << 30),
    SDLK_KP_E = SDL_Scancode.SDL_SCANCODE_KP_E | (1 << 30),
    SDLK_KP_F = SDL_Scancode.SDL_SCANCODE_KP_F | (1 << 30),
    SDLK_KP_XOR = SDL_Scancode.SDL_SCANCODE_KP_XOR | (1 << 30),
    SDLK_KP_POWER = SDL_Scancode.SDL_SCANCODE_KP_POWER | (1 << 30),
    SDLK_KP_PERCENT = SDL_Scancode.SDL_SCANCODE_KP_PERCENT | (1 << 30),
    SDLK_KP_LESS = SDL_Scancode.SDL_SCANCODE_KP_LESS | (1 << 30),
    SDLK_KP_GREATER = SDL_Scancode.SDL_SCANCODE_KP_GREATER | (1 << 30),
    SDLK_KP_AMPERSAND = SDL_Scancode.SDL_SCANCODE_KP_AMPERSAND | (1 << 30),
    SDLK_KP_DBLAMPERSAND = SDL_Scancode.SDL_SCANCODE_KP_DBLAMPERSAND | (1 << 30),
    SDLK_KP_VERTICALBAR = SDL_Scancode.SDL_SCANCODE_KP_VERTICALBAR | (1 << 30),
    SDLK_KP_DBLVERTICALBAR = SDL_Scancode.SDL_SCANCODE_KP_DBLVERTICALBAR | (1 << 30),
    SDLK_KP_COLON = SDL_Scancode.SDL_SCANCODE_KP_COLON | (1 << 30),
    SDLK_KP_HASH = SDL_Scancode.SDL_SCANCODE_KP_HASH | (1 << 30),
    SDLK_KP_SPACE = SDL_Scancode.SDL_SCANCODE_KP_SPACE | (1 << 30),
    SDLK_KP_AT = SDL_Scancode.SDL_SCANCODE_KP_AT | (1 << 30),
    SDLK_KP_EXCLAM = SDL_Scancode.SDL_SCANCODE_KP_EXCLAM | (1 << 30),
    SDLK_KP_MEMSTORE = SDL_Scancode.SDL_SCANCODE_KP_MEMSTORE | (1 << 30),
    SDLK_KP_MEMRECALL = SDL_Scancode.SDL_SCANCODE_KP_MEMRECALL | (1 << 30),
    SDLK_KP_MEMCLEAR = SDL_Scancode.SDL_SCANCODE_KP_MEMCLEAR | (1 << 30),
    SDLK_KP_MEMADD = SDL_Scancode.SDL_SCANCODE_KP_MEMADD | (1 << 30),
    SDLK_KP_MEMSUBTRACT = SDL_Scancode.SDL_SCANCODE_KP_MEMSUBTRACT | (1 << 30),
    SDLK_KP_MEMMULTIPLY = SDL_Scancode.SDL_SCANCODE_KP_MEMMULTIPLY | (1 << 30),
    SDLK_KP_MEMDIVIDE = SDL_Scancode.SDL_SCANCODE_KP_MEMDIVIDE | (1 << 30),
    SDLK_KP_PLUSMINUS = SDL_Scancode.SDL_SCANCODE_KP_PLUSMINUS | (1 << 30),
    SDLK_KP_CLEAR = SDL_Scancode.SDL_SCANCODE_KP_CLEAR | (1 << 30),
    SDLK_KP_CLEARENTRY = SDL_Scancode.SDL_SCANCODE_KP_CLEARENTRY | (1 << 30),
    SDLK_KP_BINARY = SDL_Scancode.SDL_SCANCODE_KP_BINARY | (1 << 30),
    SDLK_KP_OCTAL = SDL_Scancode.SDL_SCANCODE_KP_OCTAL | (1 << 30),
    SDLK_KP_DECIMAL = SDL_Scancode.SDL_SCANCODE_KP_DECIMAL | (1 << 30),
    SDLK_KP_HEXADECIMAL = SDL_Scancode.SDL_SCANCODE_KP_HEXADECIMAL | (1 << 30),

    SDLK_LCTRL = SDL_Scancode.SDL_SCANCODE_LCTRL | (1 << 30),
    SDLK_LSHIFT = SDL_Scancode.SDL_SCANCODE_LSHIFT | (1 << 30),
    SDLK_LALT = SDL_Scancode.SDL_SCANCODE_LALT | (1 << 30),
    SDLK_LGUI = SDL_Scancode.SDL_SCANCODE_LGUI | (1 << 30),
    SDLK_RCTRL = SDL_Scancode.SDL_SCANCODE_RCTRL | (1 << 30),
    SDLK_RSHIFT = SDL_Scancode.SDL_SCANCODE_RSHIFT | (1 << 30),
    SDLK_RALT = SDL_Scancode.SDL_SCANCODE_RALT | (1 << 30),
    SDLK_RGUI = SDL_Scancode.SDL_SCANCODE_RGUI | (1 << 30),

    SDLK_MODE = SDL_Scancode.SDL_SCANCODE_MODE | (1 << 30),

    SDLK_AUDIONEXT = SDL_Scancode.SDL_SCANCODE_AUDIONEXT | (1 << 30),
    SDLK_AUDIOPREV = SDL_Scancode.SDL_SCANCODE_AUDIOPREV | (1 << 30),
    SDLK_AUDIOSTOP = SDL_Scancode.SDL_SCANCODE_AUDIOSTOP | (1 << 30),
    SDLK_AUDIOPLAY = SDL_Scancode.SDL_SCANCODE_AUDIOPLAY | (1 << 30),
    SDLK_AUDIOMUTE = SDL_Scancode.SDL_SCANCODE_AUDIOMUTE | (1 << 30),
    SDLK_MEDIASELECT = SDL_Scancode.SDL_SCANCODE_MEDIASELECT | (1 << 30),
    SDLK_WWW = SDL_Scancode.SDL_SCANCODE_WWW | (1 << 30),
    SDLK_MAIL = SDL_Scancode.SDL_SCANCODE_MAIL | (1 << 30),
    SDLK_CALCULATOR = SDL_Scancode.SDL_SCANCODE_CALCULATOR | (1 << 30),
    SDLK_COMPUTER = SDL_Scancode.SDL_SCANCODE_COMPUTER | (1 << 30),
    SDLK_AC_SEARCH = SDL_Scancode.SDL_SCANCODE_AC_SEARCH | (1 << 30),
    SDLK_AC_HOME = SDL_Scancode.SDL_SCANCODE_AC_HOME | (1 << 30),
    SDLK_AC_BACK = SDL_Scancode.SDL_SCANCODE_AC_BACK | (1 << 30),
    SDLK_AC_FORWARD = SDL_Scancode.SDL_SCANCODE_AC_FORWARD | (1 << 30),
    SDLK_AC_STOP = SDL_Scancode.SDL_SCANCODE_AC_STOP | (1 << 30),
    SDLK_AC_REFRESH = SDL_Scancode.SDL_SCANCODE_AC_REFRESH | (1 << 30),
    SDLK_AC_BOOKMARKS = SDL_Scancode.SDL_SCANCODE_AC_BOOKMARKS | (1 << 30),

    SDLK_BRIGHTNESSDOWN = SDL_Scancode.SDL_SCANCODE_BRIGHTNESSDOWN | (1 << 30),
    SDLK_BRIGHTNESSUP = SDL_Scancode.SDL_SCANCODE_BRIGHTNESSUP | (1 << 30),
    SDLK_DISPLAYSWITCH = SDL_Scancode.SDL_SCANCODE_DISPLAYSWITCH | (1 << 30),
    SDLK_KBDILLUMTOGGLE = SDL_Scancode.SDL_SCANCODE_KBDILLUMTOGGLE | (1 << 30),
    SDLK_KBDILLUMDOWN = SDL_Scancode.SDL_SCANCODE_KBDILLUMDOWN | (1 << 30),
    SDLK_KBDILLUMUP = SDL_Scancode.SDL_SCANCODE_KBDILLUMUP | (1 << 30),
    SDLK_EJECT = SDL_Scancode.SDL_SCANCODE_EJECT | (1 << 30),
    SDLK_SLEEP = SDL_Scancode.SDL_SCANCODE_SLEEP | (1 << 30),
    SDLK_APP1 = SDL_Scancode.SDL_SCANCODE_APP1 | (1 << 30),
    SDLK_APP2 = SDL_Scancode.SDL_SCANCODE_APP2 | (1 << 30),

    SDLK_AUDIOREWIND = SDL_Scancode.SDL_SCANCODE_AUDIOREWIND | (1 << 30),
    SDLK_AUDIOFASTFORWARD = SDL_Scancode.SDL_SCANCODE_AUDIOFASTFORWARD | (1 << 30),

    SDLK_SOFTLEFT = SDL_Scancode.SDL_SCANCODE_SOFTLEFT | (1 << 30),
    SDLK_SOFTRIGHT = SDL_Scancode.SDL_SCANCODE_SOFTRIGHT | (1 << 30),
    SDLK_CALL = SDL_Scancode.SDL_SCANCODE_CALL | (1 << 30),
    SDLK_ENDCALL = SDL_Scancode.SDL_SCANCODE_ENDCALL | (1 << 30)
}

enum SDL_Keymod
{
    SDL_KMOD_NONE = 0x0000,
    SDL_KMOD_LSHIFT = 0x0001,
    SDL_KMOD_RSHIFT = 0x0002,
    SDL_KMOD_LCTRL = 0x0040,
    SDL_KMOD_RCTRL = 0x0080,
    SDL_KMOD_LALT = 0x0100,
    SDL_KMOD_RALT = 0x0200,
    SDL_KMOD_LGUI = 0x0400,
    SDL_KMOD_RGUI = 0x0800,
    SDL_KMOD_NUM = 0x1000,
    SDL_KMOD_CAPS = 0x2000,
    SDL_KMOD_MODE = 0x4000,
    SDL_KMOD_SCROLL = 0x8000,

    SDL_KMOD_CTRL = SDL_KMOD_LCTRL | SDL_KMOD_RCTRL,
    SDL_KMOD_SHIFT = SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT,
    SDL_KMOD_ALT = SDL_KMOD_LALT | SDL_KMOD_RALT,
    SDL_KMOD_GUI = SDL_KMOD_LGUI | SDL_KMOD_RGUI,

    SDL_KMOD_RESERVED = SDL_KMOD_SCROLL
}

enum SDL_PixelType
{
    SDL_PIXELTYPE_UNKNOWN = 0,
    SDL_PIXELTYPE_INDEX1 = 1,
    SDL_PIXELTYPE_INDEX4 = 2,
    SDL_PIXELTYPE_INDEX8 = 3,
    SDL_PIXELTYPE_PACKED8 = 4,
    SDL_PIXELTYPE_PACKED16 = 5,
    SDL_PIXELTYPE_PACKED32 = 6,
    SDL_PIXELTYPE_ARRAYU8 = 7,
    SDL_PIXELTYPE_ARRAYU16 = 8,
    SDL_PIXELTYPE_ARRAYU32 = 9,
    SDL_PIXELTYPE_ARRAYF16 = 10,
    SDL_PIXELTYPE_ARRAYF32 = 11
}

enum SDL_BitmapOrder
{
    SDL_BITMAPORDER_NONE = 0,
    SDL_BITMAPORDER_4321 = 1,
    SDL_BITMAPORDER_1234 = 2
}

enum SDL_PackedOrder
{
    SDL_PACKEDORDER_NONE = 0,
    SDL_PACKEDORDER_XRGB = 1,
    SDL_PACKEDORDER_RGBX = 2,
    SDL_PACKEDORDER_ARGB = 3,
    SDL_PACKEDORDER_RGBA = 4,
    SDL_PACKEDORDER_XBGR = 5,
    SDL_PACKEDORDER_BGRX = 6,
    SDL_PACKEDORDER_ABGR = 7,
    SDL_PACKEDORDER_BGRA = 8
}

enum SDL_ArrayOrder
{
    SDL_ARRAYORDER_NONE = 0,
    SDL_ARRAYORDER_RGB = 1,
    SDL_ARRAYORDER_BGR = 2
}

enum SDL_PackedLayout
{
    SDL_PACKEDLAYOUT_NONE = 0,
    SDL_PACKEDLAYOUT_332 = 1,
    SDL_PACKEDLAYOUT_4444 = 2,
    SDL_PACKEDLAYOUT_1555 = 3,
    SDL_PACKEDLAYOUT_5551 = 4,
    SDL_PACKEDLAYOUT_565 = 5,
    SDL_PACKEDLAYOUT_8888 = 6,
    SDL_PACKEDLAYOUT_2101010 = 7,
    SDL_PACKEDLAYOUT_1010102 = 8
}

enum SDL_PixelFormatEnum
{
    SDL_PIXELFORMAT_UNKNOWN = 0,
    SDL_PIXELFORMAT_INDEX1LSB = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_INDEX1 << 24) | (SDL_BitmapOrder.SDL_BITMAPORDER_4321 << 20) | ((0) << 16) | ((1) << 8) | ((0) << 0),

    SDL_PIXELFORMAT_INDEX1MSB = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_INDEX1 << 24) | (SDL_BitmapOrder.SDL_BITMAPORDER_1234 << 20) | ((0) << 16) | ((1) << 8) | ((0) << 0),

    SDL_PIXELFORMAT_INDEX4LSB = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_INDEX4 << 24) | (SDL_BitmapOrder.SDL_BITMAPORDER_4321 << 20) | ((0) << 16) | ((4) << 8) | ((0) << 0),

    SDL_PIXELFORMAT_INDEX4MSB = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_INDEX4 << 24) | (SDL_BitmapOrder.SDL_BITMAPORDER_1234 << 20) | ((0) << 16) | ((4) << 8) | ((0) << 0),

    SDL_PIXELFORMAT_INDEX8 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_INDEX8 << 24) | ((0) << 20) | ((0) << 16) | ((8) << 8) | ((1) << 0),
    SDL_PIXELFORMAT_RGB332 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED8 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XRGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_332 << 16) | ((8) << 8) | ((1) << 0),

    SDL_PIXELFORMAT_XRGB4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XRGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((12) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGB444 = SDL_PIXELFORMAT_XRGB4444,
    SDL_PIXELFORMAT_XBGR4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XBGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((12) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_BGR444 = SDL_PIXELFORMAT_XBGR4444,
    SDL_PIXELFORMAT_XRGB1555 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XRGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_1555 << 16) | ((15) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGB555 = SDL_PIXELFORMAT_XRGB1555,
    SDL_PIXELFORMAT_XBGR1555 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XBGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_1555 << 16) | ((15) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_BGR555 = SDL_PIXELFORMAT_XBGR1555,
    SDL_PIXELFORMAT_ARGB4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ARGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGBA4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_RGBA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_ABGR4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ABGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_BGRA4444 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_BGRA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_4444 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_ARGB1555 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ARGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_1555 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGBA5551 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_RGBA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_5551 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_ABGR1555 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ABGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_1555 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_BGRA5551 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_BGRA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_5551 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGB565 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XRGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_565 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_BGR565 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED16 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XBGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_565 << 16) | ((16) << 8) | ((2) << 0),

    SDL_PIXELFORMAT_RGB24 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_ARRAYU8 << 24) | (SDL_ArrayOrder.SDL_ARRAYORDER_RGB << 20) | ((0) << 16) | ((24) << 8) | ((3) << 0),

    SDL_PIXELFORMAT_BGR24 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_ARRAYU8 << 24) | (SDL_ArrayOrder.SDL_ARRAYORDER_BGR << 20) | ((0) << 16) | ((24) << 8) | ((3) << 0),

    SDL_PIXELFORMAT_XRGB8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XRGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((24) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_RGB888 = SDL_PIXELFORMAT_XRGB8888,
    SDL_PIXELFORMAT_RGBX8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_RGBX << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((24) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_XBGR8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_XBGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((24) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_BGR888 = SDL_PIXELFORMAT_XBGR8888,
    SDL_PIXELFORMAT_BGRX8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_BGRX << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((24) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_ARGB8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ARGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((32) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_RGBA8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_RGBA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((32) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_ABGR8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ABGR << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((32) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_BGRA8888 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_BGRA << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_8888 << 16) | ((32) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_ARGB2101010 = (1 << 28) | (SDL_PixelType.SDL_PIXELTYPE_PACKED32 << 24) | (SDL_PackedOrder.SDL_PACKEDORDER_ARGB << 20) | (SDL_PackedLayout.SDL_PACKEDLAYOUT_2101010 << 16) | ((32) << 8) | ((4) << 0),

    SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_ABGR8888,
    SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_BGRA8888,
    SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_ARGB8888,
    SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_RGBA8888,

    SDL_PIXELFORMAT_YV12 = ((cast(Uint32) (cast(Uint8) ('Y'))) << 0) | ((cast(Uint32) (cast(Uint8) ('V'))) << 8) | ((cast(Uint32) (cast(Uint8) ('1'))) << 16) | ((cast(Uint32) (cast(Uint8) ('2'))) << 24),
    SDL_PIXELFORMAT_IYUV = ((cast(Uint32) (cast(Uint8) ('I'))) << 0) | ((cast(Uint32) (cast(Uint8) ('Y'))) << 8) | ((cast(Uint32) (cast(Uint8) ('U'))) << 16) | ((cast(Uint32) (cast(Uint8) ('V'))) << 24),
    SDL_PIXELFORMAT_YUY2 = ((cast(Uint32) (cast(Uint8) ('Y'))) << 0) | ((cast(Uint32) (cast(Uint8) ('U'))) << 8) | ((cast(Uint32) (cast(Uint8) ('Y'))) << 16) | ((cast(Uint32) (cast(Uint8) ('2'))) << 24),
    SDL_PIXELFORMAT_UYVY = ((cast(Uint32) (cast(Uint8) ('U'))) << 0) | ((cast(Uint32) (cast(Uint8) ('Y'))) << 8) | ((cast(Uint32) (cast(Uint8) ('V'))) << 16) | ((cast(Uint32) (cast(Uint8) ('Y'))) << 24),
    SDL_PIXELFORMAT_YVYU = ((cast(Uint32) (cast(Uint8) ('Y'))) << 0) | ((cast(Uint32) (cast(Uint8) ('V'))) << 8) | ((cast(Uint32) (cast(Uint8) ('Y'))) << 16) | ((cast(Uint32) (cast(Uint8) ('U'))) << 24),
    SDL_PIXELFORMAT_NV12 = ((cast(Uint32) (cast(Uint8) ('N'))) << 0) | ((cast(Uint32) (cast(Uint8) ('V'))) << 8) | ((cast(Uint32) (cast(Uint8) ('1'))) << 16) | ((cast(Uint32) (cast(Uint8) ('2'))) << 24),
    SDL_PIXELFORMAT_NV21 = ((cast(Uint32) (cast(Uint8) ('N'))) << 0) | ((cast(Uint32) (cast(Uint8) ('V'))) << 8) | ((cast(Uint32) (cast(Uint8) ('2'))) << 16) | ((cast(Uint32) (cast(Uint8) ('1'))) << 24),
    SDL_PIXELFORMAT_EXTERNAL_OES = ((cast(Uint32) (cast(Uint8) ('O'))) << 0) | ((cast(Uint32) (cast(Uint8) ('E'))) << 8) | ((cast(Uint32) (cast(Uint8) ('S'))) << 16) | ((cast(Uint32) (cast(Uint8) (' '))) << 24)
}

struct SDL_Color
{
    Uint8 r;
    Uint8 g;
    Uint8 b;
    Uint8 a;
}

struct SDL_Palette
{
    int ncolors;
    SDL_Color* colors;
    Uint32 version_;
    int refcount;
}

struct SDL_PixelFormat
{
    Uint32 format;
    SDL_Palette* palette;
    Uint8 BitsPerPixel;
    Uint8 BytesPerPixel;
    Uint8[2] padding;
    Uint32 Rmask;
    Uint32 Gmask;
    Uint32 Bmask;
    Uint32 Amask;
    Uint8 Rloss;
    Uint8 Gloss;
    Uint8 Bloss;
    Uint8 Aloss;
    Uint8 Rshift;
    Uint8 Gshift;
    Uint8 Bshift;
    Uint8 Ashift;
    int refcount;
    SDL_PixelFormat* next;
}

const(char)* SDL_GetPixelFormatName (Uint32 format);

SDL_bool SDL_GetMasksForPixelFormatEnum (
    Uint32 format,
    int* bpp,
    Uint32* Rmask,
    Uint32* Gmask,
    Uint32* Bmask,
    Uint32* Amask);

Uint32 SDL_GetPixelFormatEnumForMasks (
    int bpp,
    Uint32 Rmask,
    Uint32 Gmask,
    Uint32 Bmask,
    Uint32 Amask);

SDL_PixelFormat* SDL_CreatePixelFormat (Uint32 pixel_format);

void SDL_DestroyPixelFormat (SDL_PixelFormat* format);

SDL_Palette* SDL_CreatePalette (int ncolors);

int SDL_SetPixelFormatPalette (SDL_PixelFormat* format, SDL_Palette* palette);

int SDL_SetPaletteColors (
    SDL_Palette* palette,
    const(SDL_Color)* colors,
    int firstcolor,
    int ncolors);

void SDL_DestroyPalette (SDL_Palette* palette);

Uint32 SDL_MapRGB (const(SDL_PixelFormat)* format, Uint8 r, Uint8 g, Uint8 b);

Uint32 SDL_MapRGBA (
    const(SDL_PixelFormat)* format,
    Uint8 r,
    Uint8 g,
    Uint8 b,
    Uint8 a);

void SDL_GetRGB (
    Uint32 pixel,
    const(SDL_PixelFormat)* format,
    Uint8* r,
    Uint8* g,
    Uint8* b);

void SDL_GetRGBA (
    Uint32 pixel,
    const(SDL_PixelFormat)* format,
    Uint8* r,
    Uint8* g,
    Uint8* b,
    Uint8* a);

struct SDL_Point
{
    int x;
    int y;
}

struct SDL_FPoint
{
    float x;
    float y;
}

struct SDL_Rect
{
    int x;
    int y;
    int w;
    int h;
}

struct SDL_FRect
{
    float x;
    float y;
    float w;
    float h;
}

SDL_bool SDL_PointInRect (const(SDL_Point)* p, const(SDL_Rect)* r);

SDL_bool SDL_RectEmpty (const(SDL_Rect)* r);

SDL_bool SDL_RectsEqual (const(SDL_Rect)* a, const(SDL_Rect)* b);

SDL_bool SDL_HasRectIntersection (const(SDL_Rect)* A, const(SDL_Rect)* B);

SDL_bool SDL_GetRectIntersection (
    const(SDL_Rect)* A,
    const(SDL_Rect)* B,
    SDL_Rect* result);

int SDL_GetRectUnion (const(SDL_Rect)* A, const(SDL_Rect)* B, SDL_Rect* result);

SDL_bool SDL_GetRectEnclosingPoints (
    const(SDL_Point)* points,
    int count,
    const(SDL_Rect)* clip,
    SDL_Rect* result);

SDL_bool SDL_GetRectAndLineIntersection (
    const(SDL_Rect)* rect,
    int* X1,
    int* Y1,
    int* X2,
    int* Y2);

SDL_bool SDL_PointInRectFloat (const(SDL_FPoint)* p, const(SDL_FRect)* r);

SDL_bool SDL_RectEmptyFloat (const(SDL_FRect)* r);

SDL_bool SDL_RectsEqualEpsilon (
    const(SDL_FRect)* a,
    const(SDL_FRect)* b,
    const float epsilon);

SDL_bool SDL_RectsEqualFloat (const(SDL_FRect)* a, const(SDL_FRect)* b);

SDL_bool SDL_HasRectIntersectionFloat (
    const(SDL_FRect)* A,
    const(SDL_FRect)* B);

SDL_bool SDL_GetRectIntersectionFloat (
    const(SDL_FRect)* A,
    const(SDL_FRect)* B,
    SDL_FRect* result);

int SDL_GetRectUnionFloat (
    const(SDL_FRect)* A,
    const(SDL_FRect)* B,
    SDL_FRect* result);

SDL_bool SDL_GetRectEnclosingPointsFloat (
    const(SDL_FPoint)* points,
    int count,
    const(SDL_FRect)* clip,
    SDL_FRect* result);

SDL_bool SDL_GetRectAndLineIntersectionFloat (
    const(SDL_FRect)* rect,
    float* X1,
    float* Y1,
    float* X2,
    float* Y2);

struct SDL_BlitMap;

struct SDL_Surface
{
    Uint32 flags;
    SDL_PixelFormat* format;
    int w;
    int h;
    int pitch;
    void* pixels;

    void* userdata;

    int locked;

    void* list_blitmap;

    SDL_Rect clip_rect;

    SDL_BlitMap* map;

    int refcount;
}

alias SDL_blit = int function (
    SDL_Surface* src,
    SDL_Rect* srcrect,
    SDL_Surface* dst,
    SDL_Rect* dstrect);

enum SDL_YUV_CONVERSION_MODE
{
    SDL_YUV_CONVERSION_JPEG = 0,
    SDL_YUV_CONVERSION_BT601 = 1,
    SDL_YUV_CONVERSION_BT709 = 2,
    SDL_YUV_CONVERSION_AUTOMATIC = 3
}

SDL_Surface* SDL_CreateSurface (int width, int height, Uint32 format);

SDL_Surface* SDL_CreateSurfaceFrom (
    void* pixels,
    int width,
    int height,
    int pitch,
    Uint32 format);

void SDL_DestroySurface (SDL_Surface* surface);

int SDL_SetSurfacePalette (SDL_Surface* surface, SDL_Palette* palette);

int SDL_LockSurface (SDL_Surface* surface);

void SDL_UnlockSurface (SDL_Surface* surface);

SDL_Surface* SDL_LoadBMP_RW (SDL_RWops* src, int freesrc);

int SDL_SaveBMP_RW (SDL_Surface* surface, SDL_RWops* dst, int freedst);

int SDL_SetSurfaceRLE (SDL_Surface* surface, int flag);

SDL_bool SDL_SurfaceHasRLE (SDL_Surface* surface);

int SDL_SetSurfaceColorKey (SDL_Surface* surface, int flag, Uint32 key);

SDL_bool SDL_SurfaceHasColorKey (SDL_Surface* surface);

int SDL_GetSurfaceColorKey (SDL_Surface* surface, Uint32* key);

int SDL_SetSurfaceColorMod (SDL_Surface* surface, Uint8 r, Uint8 g, Uint8 b);

int SDL_GetSurfaceColorMod (SDL_Surface* surface, Uint8* r, Uint8* g, Uint8* b);

int SDL_SetSurfaceAlphaMod (SDL_Surface* surface, Uint8 alpha);

int SDL_GetSurfaceAlphaMod (SDL_Surface* surface, Uint8* alpha);

int SDL_SetSurfaceBlendMode (SDL_Surface* surface, SDL_BlendMode blendMode);

int SDL_GetSurfaceBlendMode (SDL_Surface* surface, SDL_BlendMode* blendMode);

SDL_bool SDL_SetSurfaceClipRect (SDL_Surface* surface, const(SDL_Rect)* rect);

int SDL_GetSurfaceClipRect (SDL_Surface* surface, SDL_Rect* rect);

SDL_Surface* SDL_DuplicateSurface (SDL_Surface* surface);

SDL_Surface* SDL_ConvertSurface (
    SDL_Surface* surface,
    const(SDL_PixelFormat)* format);

SDL_Surface* SDL_ConvertSurfaceFormat (
    SDL_Surface* surface,
    Uint32 pixel_format);

int SDL_ConvertPixels (
    int width,
    int height,
    Uint32 src_format,
    const(void)* src,
    int src_pitch,
    Uint32 dst_format,
    void* dst,
    int dst_pitch);

int SDL_PremultiplyAlpha (
    int width,
    int height,
    Uint32 src_format,
    const(void)* src,
    int src_pitch,
    Uint32 dst_format,
    void* dst,
    int dst_pitch);

int SDL_FillSurfaceRect (SDL_Surface* dst, const(SDL_Rect)* rect, Uint32 color);

int SDL_FillSurfaceRects (
    SDL_Surface* dst,
    const(SDL_Rect)* rects,
    int count,
    Uint32 color);

int SDL_BlitSurface (
    SDL_Surface* src,
    const(SDL_Rect)* srcrect,
    SDL_Surface* dst,
    SDL_Rect* dstrect);

int SDL_BlitSurfaceUnchecked (
    SDL_Surface* src,
    SDL_Rect* srcrect,
    SDL_Surface* dst,
    SDL_Rect* dstrect);

int SDL_SoftStretch (
    SDL_Surface* src,
    const(SDL_Rect)* srcrect,
    SDL_Surface* dst,
    const(SDL_Rect)* dstrect);

int SDL_SoftStretchLinear (
    SDL_Surface* src,
    const(SDL_Rect)* srcrect,
    SDL_Surface* dst,
    const(SDL_Rect)* dstrect);

int SDL_BlitSurfaceScaled (
    SDL_Surface* src,
    const(SDL_Rect)* srcrect,
    SDL_Surface* dst,
    SDL_Rect* dstrect);

int SDL_BlitSurfaceUncheckedScaled (
    SDL_Surface* src,
    SDL_Rect* srcrect,
    SDL_Surface* dst,
    SDL_Rect* dstrect);

void SDL_SetYUVConversionMode (SDL_YUV_CONVERSION_MODE mode);

SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionMode ();

SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionModeForResolution (int width, int height);

alias SDL_DisplayID = uint;
alias SDL_WindowID = uint;

enum SDL_SystemTheme
{
    SDL_SYSTEM_THEME_UNKNOWN = 0,
    SDL_SYSTEM_THEME_LIGHT = 1,
    SDL_SYSTEM_THEME_DARK = 2
}

struct SDL_DisplayMode
{
    SDL_DisplayID displayID;
    Uint32 format;
    int pixel_w;
    int pixel_h;
    int screen_w;
    int screen_h;
    float display_scale;
    float refresh_rate;
    void* driverdata;
}

enum SDL_DisplayOrientation
{
    SDL_ORIENTATION_UNKNOWN = 0,
    SDL_ORIENTATION_LANDSCAPE = 1,
    SDL_ORIENTATION_LANDSCAPE_FLIPPED = 2,
    SDL_ORIENTATION_PORTRAIT = 3,
    SDL_ORIENTATION_PORTRAIT_FLIPPED = 4
}

struct SDL_Window;

enum SDL_WindowFlags
{
    SDL_WINDOW_FULLSCREEN = 0x00000001,
    SDL_WINDOW_OPENGL = 0x00000002,

    SDL_WINDOW_HIDDEN = 0x00000008,
    SDL_WINDOW_BORDERLESS = 0x00000010,
    SDL_WINDOW_RESIZABLE = 0x00000020,
    SDL_WINDOW_MINIMIZED = 0x00000040,
    SDL_WINDOW_MAXIMIZED = 0x00000080,
    SDL_WINDOW_MOUSE_GRABBED = 0x00000100,
    SDL_WINDOW_INPUT_FOCUS = 0x00000200,
    SDL_WINDOW_MOUSE_FOCUS = 0x00000400,

    SDL_WINDOW_FOREIGN = 0x00000800,

    SDL_WINDOW_MOUSE_CAPTURE = 0x00004000,
    SDL_WINDOW_ALWAYS_ON_TOP = 0x00008000,
    SDL_WINDOW_SKIP_TASKBAR = 0x00010000,
    SDL_WINDOW_UTILITY = 0x00020000,
    SDL_WINDOW_TOOLTIP = 0x00040000,
    SDL_WINDOW_POPUP_MENU = 0x00080000,
    SDL_WINDOW_KEYBOARD_GRABBED = 0x00100000,
    SDL_WINDOW_VULKAN = 0x10000000,
    SDL_WINDOW_METAL = 0x20000000,
    SDL_WINDOW_TRANSPARENT = 0x40000000
}

enum SDL_FlashOperation
{
    SDL_FLASH_CANCEL = 0,
    SDL_FLASH_BRIEFLY = 1,
    SDL_FLASH_UNTIL_FOCUSED = 2
}

alias SDL_GLContext = void*;

alias SDL_EGLDisplay = void*;
alias SDL_EGLConfig = void*;
alias SDL_EGLSurface = void*;
alias SDL_EGLAttrib = c_long;
alias SDL_EGLint = int;

alias SDL_EGLAttribArrayCallback = c_long* function ();
alias SDL_EGLIntArrayCallback = int* function ();

enum SDL_GLattr
{
    SDL_GL_RED_SIZE = 0,
    SDL_GL_GREEN_SIZE = 1,
    SDL_GL_BLUE_SIZE = 2,
    SDL_GL_ALPHA_SIZE = 3,
    SDL_GL_BUFFER_SIZE = 4,
    SDL_GL_DOUBLEBUFFER = 5,
    SDL_GL_DEPTH_SIZE = 6,
    SDL_GL_STENCIL_SIZE = 7,
    SDL_GL_ACCUM_RED_SIZE = 8,
    SDL_GL_ACCUM_GREEN_SIZE = 9,
    SDL_GL_ACCUM_BLUE_SIZE = 10,
    SDL_GL_ACCUM_ALPHA_SIZE = 11,
    SDL_GL_STEREO = 12,
    SDL_GL_MULTISAMPLEBUFFERS = 13,
    SDL_GL_MULTISAMPLESAMPLES = 14,
    SDL_GL_ACCELERATED_VISUAL = 15,
    SDL_GL_RETAINED_BACKING = 16,
    SDL_GL_CONTEXT_MAJOR_VERSION = 17,
    SDL_GL_CONTEXT_MINOR_VERSION = 18,
    SDL_GL_CONTEXT_FLAGS = 19,
    SDL_GL_CONTEXT_PROFILE_MASK = 20,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT = 21,
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE = 22,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR = 23,
    SDL_GL_CONTEXT_RESET_NOTIFICATION = 24,
    SDL_GL_CONTEXT_NO_ERROR = 25,
    SDL_GL_FLOATBUFFERS = 26,
    SDL_GL_EGL_PLATFORM = 27
}

enum SDL_GLprofile
{
    SDL_GL_CONTEXT_PROFILE_CORE = 0x0001,
    SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002,
    SDL_GL_CONTEXT_PROFILE_ES = 0x0004
}

enum SDL_GLcontextFlag
{
    SDL_GL_CONTEXT_DEBUG_FLAG = 0x0001,
    SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
    SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004,
    SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 0x0008
}

enum SDL_GLcontextReleaseFlag
{
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001
}

enum SDL_GLContextResetNotification
{
    SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000,
    SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 0x0001
}

int SDL_GetNumVideoDrivers ();

const(char)* SDL_GetVideoDriver (int index);

const(char)* SDL_GetCurrentVideoDriver ();

SDL_SystemTheme SDL_GetSystemTheme ();

SDL_DisplayID* SDL_GetDisplays (int* count);

SDL_DisplayID SDL_GetPrimaryDisplay ();

const(char)* SDL_GetDisplayName (SDL_DisplayID displayID);

int SDL_GetDisplayBounds (SDL_DisplayID displayID, SDL_Rect* rect);

int SDL_GetDisplayUsableBounds (SDL_DisplayID displayID, SDL_Rect* rect);

SDL_DisplayOrientation SDL_GetDisplayOrientation (SDL_DisplayID displayID);

const(SDL_DisplayMode*)* SDL_GetFullscreenDisplayModes (SDL_DisplayID displayID, int* count);

const(SDL_DisplayMode)* SDL_GetClosestFullscreenDisplayMode (SDL_DisplayID displayID, int w, int h, float refresh_rate);

const(SDL_DisplayMode)* SDL_GetDesktopDisplayMode (SDL_DisplayID displayID);

const(SDL_DisplayMode)* SDL_GetCurrentDisplayMode (SDL_DisplayID displayID);

SDL_DisplayID SDL_GetDisplayForPoint (const(SDL_Point)* point);

SDL_DisplayID SDL_GetDisplayForRect (const(SDL_Rect)* rect);

SDL_DisplayID SDL_GetDisplayForWindow (SDL_Window* window);

int SDL_SetWindowFullscreenMode (SDL_Window* window, const(SDL_DisplayMode)* mode);

const(SDL_DisplayMode)* SDL_GetWindowFullscreenMode (SDL_Window* window);

void* SDL_GetWindowICCProfile (SDL_Window* window, size_t* size);

Uint32 SDL_GetWindowPixelFormat (SDL_Window* window);

SDL_Window* SDL_CreateWindow (const(char)* title, int w, int h, Uint32 flags);

SDL_Window* SDL_CreatePopupWindow (SDL_Window* parent, int offset_x, int offset_y, int w, int h, Uint32 flags);

SDL_Window* SDL_CreateWindowFrom (const(void)* data);

SDL_WindowID SDL_GetWindowID (SDL_Window* window);

SDL_Window* SDL_GetWindowFromID (SDL_WindowID id);

SDL_Window* SDL_GetWindowParent (SDL_Window* window);

Uint32 SDL_GetWindowFlags (SDL_Window* window);

int SDL_SetWindowTitle (SDL_Window* window, const(char)* title);

const(char)* SDL_GetWindowTitle (SDL_Window* window);

int SDL_SetWindowIcon (SDL_Window* window, SDL_Surface* icon);

void* SDL_SetWindowData (SDL_Window* window, const(char)* name, void* userdata);

void* SDL_GetWindowData (SDL_Window* window, const(char)* name);

int SDL_SetWindowPosition (SDL_Window* window, int x, int y);

int SDL_GetWindowPosition (SDL_Window* window, int* x, int* y);

int SDL_SetWindowSize (SDL_Window* window, int w, int h);

int SDL_GetWindowSize (SDL_Window* window, int* w, int* h);

int SDL_GetWindowBordersSize (SDL_Window* window, int* top, int* left, int* bottom, int* right);

int SDL_GetWindowSizeInPixels (SDL_Window* window, int* w, int* h);

int SDL_SetWindowMinimumSize (SDL_Window* window, int min_w, int min_h);

int SDL_GetWindowMinimumSize (SDL_Window* window, int* w, int* h);

int SDL_SetWindowMaximumSize (SDL_Window* window, int max_w, int max_h);

int SDL_GetWindowMaximumSize (SDL_Window* window, int* w, int* h);

int SDL_SetWindowBordered (SDL_Window* window, SDL_bool bordered);

int SDL_SetWindowResizable (SDL_Window* window, SDL_bool resizable);

int SDL_SetWindowAlwaysOnTop (SDL_Window* window, SDL_bool on_top);

int SDL_ShowWindow (SDL_Window* window);

int SDL_HideWindow (SDL_Window* window);

int SDL_RaiseWindow (SDL_Window* window);

int SDL_MaximizeWindow (SDL_Window* window);

int SDL_MinimizeWindow (SDL_Window* window);

int SDL_RestoreWindow (SDL_Window* window);

int SDL_SetWindowFullscreen (SDL_Window* window, SDL_bool fullscreen);

SDL_Surface* SDL_GetWindowSurface (SDL_Window* window);

int SDL_UpdateWindowSurface (SDL_Window* window);

int SDL_UpdateWindowSurfaceRects (SDL_Window* window, const(SDL_Rect)* rects, int numrects);

int SDL_SetWindowGrab (SDL_Window* window, SDL_bool grabbed);

int SDL_SetWindowKeyboardGrab (SDL_Window* window, SDL_bool grabbed);

int SDL_SetWindowMouseGrab (SDL_Window* window, SDL_bool grabbed);

SDL_bool SDL_GetWindowGrab (SDL_Window* window);

SDL_bool SDL_GetWindowKeyboardGrab (SDL_Window* window);

SDL_bool SDL_GetWindowMouseGrab (SDL_Window* window);

SDL_Window* SDL_GetGrabbedWindow ();

int SDL_SetWindowMouseRect (SDL_Window* window, const(SDL_Rect)* rect);

const(SDL_Rect)* SDL_GetWindowMouseRect (SDL_Window* window);

int SDL_SetWindowOpacity (SDL_Window* window, float opacity);

int SDL_GetWindowOpacity (SDL_Window* window, float* out_opacity);

int SDL_SetWindowModalFor (SDL_Window* modal_window, SDL_Window* parent_window);

int SDL_SetWindowInputFocus (SDL_Window* window);

enum SDL_HitTestResult
{
    SDL_HITTEST_NORMAL = 0,
    SDL_HITTEST_DRAGGABLE = 1,
    SDL_HITTEST_RESIZE_TOPLEFT = 2,
    SDL_HITTEST_RESIZE_TOP = 3,
    SDL_HITTEST_RESIZE_TOPRIGHT = 4,
    SDL_HITTEST_RESIZE_RIGHT = 5,
    SDL_HITTEST_RESIZE_BOTTOMRIGHT = 6,
    SDL_HITTEST_RESIZE_BOTTOM = 7,
    SDL_HITTEST_RESIZE_BOTTOMLEFT = 8,
    SDL_HITTEST_RESIZE_LEFT = 9
}

alias SDL_HitTest = SDL_HitTestResult function (
    SDL_Window* win,
    const(SDL_Point)* area,
    void* data);

int SDL_SetWindowHitTest (SDL_Window* window, SDL_HitTest callback, void* callback_data);

int SDL_FlashWindow (SDL_Window* window, SDL_FlashOperation operation);

void SDL_DestroyWindow (SDL_Window* window);

SDL_bool SDL_ScreenSaverEnabled ();

int SDL_EnableScreenSaver ();

int SDL_DisableScreenSaver ();

int SDL_GL_LoadLibrary (const(char)* path);

SDL_FunctionPointer SDL_GL_GetProcAddress (const(char)* proc);

SDL_FunctionPointer SDL_EGL_GetProcAddress (const(char)* proc);

void SDL_GL_UnloadLibrary ();

SDL_bool SDL_GL_ExtensionSupported (const(char)* extension);

void SDL_GL_ResetAttributes ();

int SDL_GL_SetAttribute (SDL_GLattr attr, int value);

int SDL_GL_GetAttribute (SDL_GLattr attr, int* value);

SDL_GLContext SDL_GL_CreateContext (SDL_Window* window);

int SDL_GL_MakeCurrent (SDL_Window* window, SDL_GLContext context);

SDL_Window* SDL_GL_GetCurrentWindow ();

SDL_GLContext SDL_GL_GetCurrentContext ();

SDL_EGLDisplay SDL_EGL_GetCurrentEGLDisplay ();

SDL_EGLConfig SDL_EGL_GetCurrentEGLConfig ();

SDL_EGLSurface SDL_EGL_GetWindowEGLSurface (SDL_Window* window);

void SDL_EGL_SetEGLAttributeCallbacks (
    SDL_EGLAttribArrayCallback platformAttribCallback,
    SDL_EGLIntArrayCallback surfaceAttribCallback,
    SDL_EGLIntArrayCallback contextAttribCallback);

int SDL_GL_SetSwapInterval (int interval);

int SDL_GL_GetSwapInterval (int* interval);

int SDL_GL_SwapWindow (SDL_Window* window);

int SDL_GL_DeleteContext (SDL_GLContext context);

struct SDL_Keysym
{
    SDL_Scancode scancode;
    SDL_Keycode sym;
    Uint16 mod;
    Uint32 unused;
}

SDL_Window* SDL_GetKeyboardFocus ();

const(Uint8)* SDL_GetKeyboardState (int* numkeys);

void SDL_ResetKeyboard ();

SDL_Keymod SDL_GetModState ();

void SDL_SetModState (SDL_Keymod modstate);

SDL_Keycode SDL_GetKeyFromScancode (SDL_Scancode scancode);

SDL_Scancode SDL_GetScancodeFromKey (SDL_Keycode key);

const(char)* SDL_GetScancodeName (SDL_Scancode scancode);

SDL_Scancode SDL_GetScancodeFromName (const(char)* name);

const(char)* SDL_GetKeyName (SDL_Keycode key);

SDL_Keycode SDL_GetKeyFromName (const(char)* name);

void SDL_StartTextInput ();

SDL_bool SDL_TextInputActive ();

void SDL_StopTextInput ();

void SDL_ClearComposition ();

SDL_bool SDL_TextInputShown ();

int SDL_SetTextInputRect (const(SDL_Rect)* rect);

SDL_bool SDL_HasScreenKeyboardSupport ();

SDL_bool SDL_ScreenKeyboardShown (SDL_Window* window);

alias SDL_MouseID = uint;

struct SDL_Cursor;

enum SDL_SystemCursor
{
    SDL_SYSTEM_CURSOR_ARROW = 0,
    SDL_SYSTEM_CURSOR_IBEAM = 1,
    SDL_SYSTEM_CURSOR_WAIT = 2,
    SDL_SYSTEM_CURSOR_CROSSHAIR = 3,
    SDL_SYSTEM_CURSOR_WAITARROW = 4,
    SDL_SYSTEM_CURSOR_SIZENWSE = 5,
    SDL_SYSTEM_CURSOR_SIZENESW = 6,
    SDL_SYSTEM_CURSOR_SIZEWE = 7,
    SDL_SYSTEM_CURSOR_SIZENS = 8,
    SDL_SYSTEM_CURSOR_SIZEALL = 9,
    SDL_SYSTEM_CURSOR_NO = 10,
    SDL_SYSTEM_CURSOR_HAND = 11,
    SDL_NUM_SYSTEM_CURSORS = 12
}

enum SDL_MouseWheelDirection
{
    SDL_MOUSEWHEEL_NORMAL = 0,
    SDL_MOUSEWHEEL_FLIPPED = 1
}

SDL_Window* SDL_GetMouseFocus ();

Uint32 SDL_GetMouseState (float* x, float* y);

Uint32 SDL_GetGlobalMouseState (float* x, float* y);

Uint32 SDL_GetRelativeMouseState (float* x, float* y);

void SDL_WarpMouseInWindow (SDL_Window* window, float x, float y);

int SDL_WarpMouseGlobal (float x, float y);

int SDL_SetRelativeMouseMode (SDL_bool enabled);

int SDL_CaptureMouse (SDL_bool enabled);

SDL_bool SDL_GetRelativeMouseMode ();

SDL_Cursor* SDL_CreateCursor (
    const(Uint8)* data,
    const(Uint8)* mask,
    int w,
    int h,
    int hot_x,
    int hot_y);

SDL_Cursor* SDL_CreateColorCursor (SDL_Surface* surface, int hot_x, int hot_y);

SDL_Cursor* SDL_CreateSystemCursor (SDL_SystemCursor id);

int SDL_SetCursor (SDL_Cursor* cursor);

SDL_Cursor* SDL_GetCursor ();

SDL_Cursor* SDL_GetDefaultCursor ();

void SDL_DestroyCursor (SDL_Cursor* cursor);

int SDL_ShowCursor ();

int SDL_HideCursor ();

SDL_bool SDL_CursorVisible ();

alias SDL_TouchID = c_long;
alias SDL_FingerID = c_long;

enum SDL_TouchDeviceType
{
    SDL_TOUCH_DEVICE_INVALID = -1,
    SDL_TOUCH_DEVICE_DIRECT = 0,
    SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE = 1,
    SDL_TOUCH_DEVICE_INDIRECT_RELATIVE = 2
}

struct SDL_Finger
{
    SDL_FingerID id;
    float x;
    float y;
    float pressure;
}

int SDL_GetNumTouchDevices ();

SDL_TouchID SDL_GetTouchDevice (int index);

const(char)* SDL_GetTouchName (int index);

SDL_TouchDeviceType SDL_GetTouchDeviceType (SDL_TouchID touchID);

int SDL_GetNumTouchFingers (SDL_TouchID touchID);

SDL_Finger* SDL_GetTouchFinger (SDL_TouchID touchID, int index);

enum SDL_EventType
{
    SDL_EVENT_FIRST = 0,

    SDL_EVENT_QUIT = 0x100,

    SDL_EVENT_TERMINATING = 257,

    SDL_EVENT_LOW_MEMORY = 258,

    SDL_EVENT_WILL_ENTER_BACKGROUND = 259,

    SDL_EVENT_DID_ENTER_BACKGROUND = 260,

    SDL_EVENT_WILL_ENTER_FOREGROUND = 261,

    SDL_EVENT_DID_ENTER_FOREGROUND = 262,

    SDL_EVENT_LOCALE_CHANGED = 263,

    SDL_EVENT_SYSTEM_THEME_CHANGED = 264,

    SDL_EVENT_DISPLAY_ORIENTATION = 0x151,
    SDL_EVENT_DISPLAY_CONNECTED = 338,
    SDL_EVENT_DISPLAY_DISCONNECTED = 339,
    SDL_EVENT_DISPLAY_MOVED = 340,
    SDL_EVENT_DISPLAY_SCALE_CHANGED = 341,
    SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION,
    SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_SCALE_CHANGED,

    SDL_EVENT_SYSWM = 0x201,
    SDL_EVENT_WINDOW_SHOWN = 514,
    SDL_EVENT_WINDOW_HIDDEN = 515,
    SDL_EVENT_WINDOW_EXPOSED = 516,
    SDL_EVENT_WINDOW_MOVED = 517,
    SDL_EVENT_WINDOW_RESIZED = 518,
    SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = 519,
    SDL_EVENT_WINDOW_MINIMIZED = 520,
    SDL_EVENT_WINDOW_MAXIMIZED = 521,
    SDL_EVENT_WINDOW_RESTORED = 522,
    SDL_EVENT_WINDOW_MOUSE_ENTER = 523,
    SDL_EVENT_WINDOW_MOUSE_LEAVE = 524,
    SDL_EVENT_WINDOW_FOCUS_GAINED = 525,
    SDL_EVENT_WINDOW_FOCUS_LOST = 526,
    SDL_EVENT_WINDOW_CLOSE_REQUESTED = 527,
    SDL_EVENT_WINDOW_TAKE_FOCUS = 528,
    SDL_EVENT_WINDOW_HIT_TEST = 529,
    SDL_EVENT_WINDOW_ICCPROF_CHANGED = 530,
    SDL_EVENT_WINDOW_DISPLAY_CHANGED = 531,
    SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
    SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_DISPLAY_CHANGED,

    SDL_EVENT_KEY_DOWN = 0x300,
    SDL_EVENT_KEY_UP = 769,
    SDL_EVENT_TEXT_EDITING = 770,
    SDL_EVENT_TEXT_INPUT = 771,
    SDL_EVENT_KEYMAP_CHANGED = 772,

    SDL_EVENT_TEXT_EDITING_EXT = 773,

    SDL_EVENT_MOUSE_MOTION = 0x400,
    SDL_EVENT_MOUSE_BUTTON_DOWN = 1025,
    SDL_EVENT_MOUSE_BUTTON_UP = 1026,
    SDL_EVENT_MOUSE_WHEEL = 1027,

    SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x600,
    SDL_EVENT_JOYSTICK_HAT_MOTION = 0x602,
    SDL_EVENT_JOYSTICK_BUTTON_DOWN = 1539,
    SDL_EVENT_JOYSTICK_BUTTON_UP = 1540,
    SDL_EVENT_JOYSTICK_ADDED = 1541,
    SDL_EVENT_JOYSTICK_REMOVED = 1542,
    SDL_EVENT_JOYSTICK_BATTERY_UPDATED = 1543,

    SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x650,
    SDL_EVENT_GAMEPAD_BUTTON_DOWN = 1617,
    SDL_EVENT_GAMEPAD_BUTTON_UP = 1618,
    SDL_EVENT_GAMEPAD_ADDED = 1619,
    SDL_EVENT_GAMEPAD_REMOVED = 1620,
    SDL_EVENT_GAMEPAD_REMAPPED = 1621,
    SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = 1622,
    SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = 1623,
    SDL_EVENT_GAMEPAD_TOUCHPAD_UP = 1624,
    SDL_EVENT_GAMEPAD_SENSOR_UPDATE = 1625,

    SDL_EVENT_FINGER_DOWN = 0x700,
    SDL_EVENT_FINGER_UP = 1793,
    SDL_EVENT_FINGER_MOTION = 1794,

    SDL_EVENT_CLIPBOARD_UPDATE = 0x900,

    SDL_EVENT_DROP_FILE = 0x1000,
    SDL_EVENT_DROP_TEXT = 4097,
    SDL_EVENT_DROP_BEGIN = 4098,
    SDL_EVENT_DROP_COMPLETE = 4099,
    SDL_EVENT_DROP_POSITION = 4100,

    SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100,
    SDL_EVENT_AUDIO_DEVICE_REMOVED = 4353,

    SDL_EVENT_SENSOR_UPDATE = 0x1200,

    SDL_EVENT_RENDER_TARGETS_RESET = 0x2000,
    SDL_EVENT_RENDER_DEVICE_RESET = 8193,

    SDL_EVENT_POLL_SENTINEL = 0x7F00,

    SDL_EVENT_USER = 0x8000,

    SDL_EVENT_LAST = 0xFFFF
}

struct SDL_CommonEvent
{
    Uint32 type;
    Uint64 timestamp;
}

struct SDL_DisplayEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_DisplayID displayID;
    Sint32 data1;
}

struct SDL_WindowEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    Sint32 data1;
    Sint32 data2;
}

struct SDL_KeyboardEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    Uint8 state;
    Uint8 repeat;
    Uint8 padding2;
    Uint8 padding3;
    SDL_Keysym keysym;
}

struct SDL_TextEditingEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    char[32] text;
    Sint32 start;
    Sint32 length;
}

struct SDL_TextEditingExtEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    char* text;
    Sint32 start;
    Sint32 length;
}

struct SDL_TextInputEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    char[32] text;
}

struct SDL_MouseMotionEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    SDL_MouseID which;
    Uint32 state;
    float x;
    float y;
    float xrel;
    float yrel;
}

struct SDL_MouseButtonEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    SDL_MouseID which;
    Uint8 button;
    Uint8 state;
    Uint8 clicks;
    Uint8 padding;
    float x;
    float y;
}

struct SDL_MouseWheelEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    SDL_MouseID which;
    float x;
    float y;
    Uint32 direction;
    float mouseX;
    float mouseY;
}

struct SDL_JoyAxisEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Uint8 axis;
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
    Sint16 value;
    Uint16 padding4;
}

struct SDL_JoyHatEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Uint8 hat;
    Uint8 value;

    Uint8 padding1;
    Uint8 padding2;
}

struct SDL_JoyButtonEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Uint8 button;
    Uint8 state;
    Uint8 padding1;
    Uint8 padding2;
}

struct SDL_JoyDeviceEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
}

struct SDL_JoyBatteryEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    SDL_JoystickPowerLevel level;
}

struct SDL_GamepadAxisEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Uint8 axis;
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
    Sint16 value;
    Uint16 padding4;
}

struct SDL_GamepadButtonEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Uint8 button;
    Uint8 state;
    Uint8 padding1;
    Uint8 padding2;
}

struct SDL_GamepadDeviceEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
}

struct SDL_GamepadTouchpadEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Sint32 touchpad;
    Sint32 finger;
    float x;
    float y;
    float pressure;
}

struct SDL_GamepadSensorEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_JoystickID which;
    Sint32 sensor;
    float[3] data;
    Uint64 sensor_timestamp;
}

struct SDL_AudioDeviceEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_AudioDeviceID which;
    Uint8 iscapture;
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
}

struct SDL_TouchFingerEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_TouchID touchId;
    SDL_FingerID fingerId;
    float x;
    float y;
    float dx;
    float dy;
    float pressure;
    SDL_WindowID windowID;
}

struct SDL_DropEvent
{
    Uint32 type;
    Uint64 timestamp;
    char* file;
    SDL_WindowID windowID;
    float x;
    float y;
}

struct SDL_SensorEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_SensorID which;
    float[6] data;
    Uint64 sensor_timestamp;
}

struct SDL_QuitEvent
{
    Uint32 type;
    Uint64 timestamp;
}

struct SDL_OSEvent
{
    Uint32 type;
    Uint64 timestamp;
}

struct SDL_UserEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_WindowID windowID;
    Sint32 code;
    void* data1;
    void* data2;
}

struct SDL_SysWMmsg;

struct SDL_SysWMEvent
{
    Uint32 type;
    Uint64 timestamp;
    SDL_SysWMmsg* msg;
}

union SDL_Event
{
    Uint32 type;
    SDL_CommonEvent common;
    SDL_DisplayEvent display;
    SDL_WindowEvent window;
    SDL_KeyboardEvent key;
    SDL_TextEditingEvent edit;
    SDL_TextEditingExtEvent editExt;
    SDL_TextInputEvent text;
    SDL_MouseMotionEvent motion;
    SDL_MouseButtonEvent button;
    SDL_MouseWheelEvent wheel;
    SDL_JoyAxisEvent jaxis;
    SDL_JoyHatEvent jhat;
    SDL_JoyButtonEvent jbutton;
    SDL_JoyDeviceEvent jdevice;
    SDL_JoyBatteryEvent jbattery;
    SDL_GamepadAxisEvent gaxis;
    SDL_GamepadButtonEvent gbutton;
    SDL_GamepadDeviceEvent gdevice;
    SDL_GamepadTouchpadEvent gtouchpad;
    SDL_GamepadSensorEvent gsensor;
    SDL_AudioDeviceEvent adevice;
    SDL_SensorEvent sensor;
    SDL_QuitEvent quit;
    SDL_UserEvent user;
    SDL_SysWMEvent syswm;
    SDL_TouchFingerEvent tfinger;
    SDL_DropEvent drop;

    Uint8[128] padding;
}

void SDL_PumpEvents ();

enum SDL_eventaction
{
    SDL_ADDEVENT = 0,
    SDL_PEEKEVENT = 1,
    SDL_GETEVENT = 2
}

int SDL_PeepEvents (
    SDL_Event* events,
    int numevents,
    SDL_eventaction action,
    Uint32 minType,
    Uint32 maxType);

SDL_bool SDL_HasEvent (Uint32 type);

SDL_bool SDL_HasEvents (Uint32 minType, Uint32 maxType);

void SDL_FlushEvent (Uint32 type);

void SDL_FlushEvents (Uint32 minType, Uint32 maxType);

int SDL_PollEvent (SDL_Event* event);

int SDL_WaitEvent (SDL_Event* event);

int SDL_WaitEventTimeout (SDL_Event* event, Sint32 timeoutMS);

int SDL_PushEvent (SDL_Event* event);

alias SDL_EventFilter = int function (void* userdata, SDL_Event* event);

void SDL_SetEventFilter (SDL_EventFilter filter, void* userdata);

SDL_bool SDL_GetEventFilter (SDL_EventFilter* filter, void** userdata);

void SDL_AddEventWatch (SDL_EventFilter filter, void* userdata);

void SDL_DelEventWatch (SDL_EventFilter filter, void* userdata);

void SDL_FilterEvents (SDL_EventFilter filter, void* userdata);

void SDL_SetEventEnabled (Uint32 type, SDL_bool enabled);

SDL_bool SDL_EventEnabled (Uint32 type);

Uint32 SDL_RegisterEvents (int numevents);

char* SDL_GetBasePath ();

char* SDL_GetPrefPath (const(char)* org, const(char)* app);

struct SDL_Haptic;

struct SDL_HapticDirection
{
    Uint8 type;
    Sint32[3] dir;
}

struct SDL_HapticConstant
{
    Uint16 type;
    SDL_HapticDirection direction;

    Uint32 length;
    Uint16 delay;

    Uint16 button;
    Uint16 interval;

    Sint16 level;

    Uint16 attack_length;
    Uint16 attack_level;
    Uint16 fade_length;
    Uint16 fade_level;
}

struct SDL_HapticPeriodic
{
    Uint16 type;

    SDL_HapticDirection direction;

    Uint32 length;
    Uint16 delay;

    Uint16 button;
    Uint16 interval;

    Uint16 period;
    Sint16 magnitude;
    Sint16 offset;
    Uint16 phase;

    Uint16 attack_length;
    Uint16 attack_level;
    Uint16 fade_length;
    Uint16 fade_level;
}

struct SDL_HapticCondition
{
    Uint16 type;

    SDL_HapticDirection direction;

    Uint32 length;
    Uint16 delay;

    Uint16 button;
    Uint16 interval;

    Uint16[3] right_sat;
    Uint16[3] left_sat;
    Sint16[3] right_coeff;
    Sint16[3] left_coeff;
    Uint16[3] deadband;
    Sint16[3] center;
}

struct SDL_HapticRamp
{
    Uint16 type;
    SDL_HapticDirection direction;

    Uint32 length;
    Uint16 delay;

    Uint16 button;
    Uint16 interval;

    Sint16 start;
    Sint16 end;

    Uint16 attack_length;
    Uint16 attack_level;
    Uint16 fade_length;
    Uint16 fade_level;
}

struct SDL_HapticLeftRight
{
    Uint16 type;

    Uint32 length;

    Uint16 large_magnitude;
    Uint16 small_magnitude;
}

struct SDL_HapticCustom
{
    Uint16 type;
    SDL_HapticDirection direction;

    Uint32 length;
    Uint16 delay;

    Uint16 button;
    Uint16 interval;

    Uint8 channels;
    Uint16 period;
    Uint16 samples;
    Uint16* data;

    Uint16 attack_length;
    Uint16 attack_level;
    Uint16 fade_length;
    Uint16 fade_level;
}

union SDL_HapticEffect
{
    Uint16 type;
    SDL_HapticConstant constant;
    SDL_HapticPeriodic periodic;
    SDL_HapticCondition condition;
    SDL_HapticRamp ramp;
    SDL_HapticLeftRight leftright;
    SDL_HapticCustom custom;
}

int SDL_NumHaptics ();

const(char)* SDL_HapticName (int device_index);

SDL_Haptic* SDL_HapticOpen (int device_index);

int SDL_HapticOpened (int device_index);

int SDL_HapticIndex (SDL_Haptic* haptic);

int SDL_MouseIsHaptic ();

SDL_Haptic* SDL_HapticOpenFromMouse ();

int SDL_JoystickIsHaptic (SDL_Joystick* joystick);

SDL_Haptic* SDL_HapticOpenFromJoystick (SDL_Joystick* joystick);

void SDL_HapticClose (SDL_Haptic* haptic);

int SDL_HapticNumEffects (SDL_Haptic* haptic);

int SDL_HapticNumEffectsPlaying (SDL_Haptic* haptic);

uint SDL_HapticQuery (SDL_Haptic* haptic);

int SDL_HapticNumAxes (SDL_Haptic* haptic);

int SDL_HapticEffectSupported (SDL_Haptic* haptic, SDL_HapticEffect* effect);

int SDL_HapticNewEffect (SDL_Haptic* haptic, SDL_HapticEffect* effect);

int SDL_HapticUpdateEffect (
    SDL_Haptic* haptic,
    int effect,
    SDL_HapticEffect* data);

int SDL_HapticRunEffect (SDL_Haptic* haptic, int effect, Uint32 iterations);

int SDL_HapticStopEffect (SDL_Haptic* haptic, int effect);

void SDL_HapticDestroyEffect (SDL_Haptic* haptic, int effect);

int SDL_HapticGetEffectStatus (SDL_Haptic* haptic, int effect);

int SDL_HapticSetGain (SDL_Haptic* haptic, int gain);

int SDL_HapticSetAutocenter (SDL_Haptic* haptic, int autocenter);

int SDL_HapticPause (SDL_Haptic* haptic);

int SDL_HapticUnpause (SDL_Haptic* haptic);

int SDL_HapticStopAll (SDL_Haptic* haptic);

int SDL_HapticRumbleSupported (SDL_Haptic* haptic);

int SDL_HapticRumbleInit (SDL_Haptic* haptic);

int SDL_HapticRumblePlay (SDL_Haptic* haptic, float strength, Uint32 length);

int SDL_HapticRumbleStop (SDL_Haptic* haptic);

struct SDL_hid_device_;
alias SDL_hid_device = SDL_hid_device_;

struct SDL_hid_device_info
{
    char* path;

    ushort vendor_id;

    ushort product_id;

    wchar_t* serial_number;

    ushort release_number;

    wchar_t* manufacturer_string;

    wchar_t* product_string;

    ushort usage_page;

    ushort usage;

    int interface_number;

    int interface_class;
    int interface_subclass;
    int interface_protocol;

    SDL_hid_device_info* next;
}

int SDL_hid_init ();

int SDL_hid_exit ();

Uint32 SDL_hid_device_change_count ();

SDL_hid_device_info* SDL_hid_enumerate (ushort vendor_id, ushort product_id);

void SDL_hid_free_enumeration (SDL_hid_device_info* devs);

SDL_hid_device* SDL_hid_open (ushort vendor_id, ushort product_id, const(wchar_t)* serial_number);

SDL_hid_device* SDL_hid_open_path (const(char)* path, int bExclusive);

int SDL_hid_write (SDL_hid_device* dev, const(ubyte)* data, size_t length);

int SDL_hid_read_timeout (SDL_hid_device* dev, ubyte* data, size_t length, int milliseconds);

int SDL_hid_read (SDL_hid_device* dev, ubyte* data, size_t length);

int SDL_hid_set_nonblocking (SDL_hid_device* dev, int nonblock);

int SDL_hid_send_feature_report (SDL_hid_device* dev, const(ubyte)* data, size_t length);

int SDL_hid_get_feature_report (SDL_hid_device* dev, ubyte* data, size_t length);

int SDL_hid_close (SDL_hid_device* dev);

int SDL_hid_get_manufacturer_string (SDL_hid_device* dev, wchar_t* string, size_t maxlen);

int SDL_hid_get_product_string (SDL_hid_device* dev, wchar_t* string, size_t maxlen);

int SDL_hid_get_serial_number_string (SDL_hid_device* dev, wchar_t* string, size_t maxlen);

int SDL_hid_get_indexed_string (SDL_hid_device* dev, int string_index, wchar_t* string, size_t maxlen);

void SDL_hid_ble_scan (SDL_bool active);

enum SDL_HintPriority
{
    SDL_HINT_DEFAULT = 0,
    SDL_HINT_NORMAL = 1,
    SDL_HINT_OVERRIDE = 2
}

SDL_bool SDL_SetHintWithPriority (
    const(char)* name,
    const(char)* value,
    SDL_HintPriority priority);

SDL_bool SDL_SetHint (const(char)* name, const(char)* value);

SDL_bool SDL_ResetHint (const(char)* name);

void SDL_ResetHints ();

const(char)* SDL_GetHint (const(char)* name);

SDL_bool SDL_GetHintBoolean (const(char)* name, SDL_bool default_value);

alias SDL_HintCallback = void function (void* userdata, const(char)* name, const(char)* oldValue, const(char)* newValue);

int SDL_AddHintCallback (
    const(char)* name,
    SDL_HintCallback callback,
    void* userdata);

void SDL_DelHintCallback (
    const(char)* name,
    SDL_HintCallback callback,
    void* userdata);

void SDL_ClearHints ();

enum SDL_InitFlags
{
    SDL_INIT_TIMER = 0x00000001,
    SDL_INIT_AUDIO = 0x00000010,
    SDL_INIT_VIDEO = 0x00000020,
    SDL_INIT_JOYSTICK = 0x00000200,
    SDL_INIT_HAPTIC = 0x00001000,
    SDL_INIT_GAMEPAD = 0x00002000,
    SDL_INIT_EVENTS = 0x00004000,
    SDL_INIT_SENSOR = 0x00008000
}

int SDL_Init (Uint32 flags);

int SDL_InitSubSystem (Uint32 flags);

void SDL_QuitSubSystem (Uint32 flags);

Uint32 SDL_WasInit (Uint32 flags);

void SDL_Quit ();

void* SDL_LoadObject (const(char)* sofile);

SDL_FunctionPointer SDL_LoadFunction (void* handle, const(char)* name);

void SDL_UnloadObject (void* handle);

struct SDL_Locale
{
    const(char)* language;
    const(char)* country;
}

SDL_Locale* SDL_GetPreferredLocales ();

enum SDL_LogCategory
{
    SDL_LOG_CATEGORY_APPLICATION = 0,
    SDL_LOG_CATEGORY_ERROR = 1,
    SDL_LOG_CATEGORY_ASSERT = 2,
    SDL_LOG_CATEGORY_SYSTEM = 3,
    SDL_LOG_CATEGORY_AUDIO = 4,
    SDL_LOG_CATEGORY_VIDEO = 5,
    SDL_LOG_CATEGORY_RENDER = 6,
    SDL_LOG_CATEGORY_INPUT = 7,
    SDL_LOG_CATEGORY_TEST = 8,

    SDL_LOG_CATEGORY_RESERVED1 = 9,
    SDL_LOG_CATEGORY_RESERVED2 = 10,
    SDL_LOG_CATEGORY_RESERVED3 = 11,
    SDL_LOG_CATEGORY_RESERVED4 = 12,
    SDL_LOG_CATEGORY_RESERVED5 = 13,
    SDL_LOG_CATEGORY_RESERVED6 = 14,
    SDL_LOG_CATEGORY_RESERVED7 = 15,
    SDL_LOG_CATEGORY_RESERVED8 = 16,
    SDL_LOG_CATEGORY_RESERVED9 = 17,
    SDL_LOG_CATEGORY_RESERVED10 = 18,

    SDL_LOG_CATEGORY_CUSTOM = 19
}

enum SDL_LogPriority
{
    SDL_LOG_PRIORITY_VERBOSE = 1,
    SDL_LOG_PRIORITY_DEBUG = 2,
    SDL_LOG_PRIORITY_INFO = 3,
    SDL_LOG_PRIORITY_WARN = 4,
    SDL_LOG_PRIORITY_ERROR = 5,
    SDL_LOG_PRIORITY_CRITICAL = 6,
    SDL_NUM_LOG_PRIORITIES = 7
}

void SDL_LogSetAllPriority (SDL_LogPriority priority);

void SDL_LogSetPriority (int category, SDL_LogPriority priority);

SDL_LogPriority SDL_LogGetPriority (int category);

void SDL_LogResetPriorities ();

void SDL_Log (const(char)* fmt, ...);

void SDL_LogVerbose (int category, const(char)* fmt, ...);

void SDL_LogDebug (int category, const(char)* fmt, ...);

void SDL_LogInfo (int category, const(char)* fmt, ...);

void SDL_LogWarn (int category, const(char)* fmt, ...);

void SDL_LogError (int category, const(char)* fmt, ...);

void SDL_LogCritical (int category, const(char)* fmt, ...);

void SDL_LogMessage (
    int category,
    SDL_LogPriority priority,
    const(char)* fmt,
    ...);

void SDL_LogMessageV (
    int category,
    SDL_LogPriority priority,
    const(char)* fmt,
    va_list ap);

alias SDL_LogOutputFunction = void function (void* userdata, int category, SDL_LogPriority priority, const(char)* message);

void SDL_LogGetOutputFunction (SDL_LogOutputFunction* callback, void** userdata);

void SDL_LogSetOutputFunction (SDL_LogOutputFunction callback, void* userdata);

enum SDL_MessageBoxFlags
{
    SDL_MESSAGEBOX_ERROR = 0x00000010,
    SDL_MESSAGEBOX_WARNING = 0x00000020,
    SDL_MESSAGEBOX_INFORMATION = 0x00000040,
    SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080,
    SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100
}

enum SDL_MessageBoxButtonFlags
{
    SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001,
    SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002
}

struct SDL_MessageBoxButtonData
{
    Uint32 flags;
    int buttonid;
    const(char)* text;
}

struct SDL_MessageBoxColor
{
    Uint8 r;
    Uint8 g;
    Uint8 b;
}

enum SDL_MessageBoxColorType
{
    SDL_MESSAGEBOX_COLOR_BACKGROUND = 0,
    SDL_MESSAGEBOX_COLOR_TEXT = 1,
    SDL_MESSAGEBOX_COLOR_BUTTON_BORDER = 2,
    SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3,
    SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED = 4,
    SDL_MESSAGEBOX_COLOR_MAX = 5
}

struct SDL_MessageBoxColorScheme
{
    SDL_MessageBoxColor[SDL_MessageBoxColorType.SDL_MESSAGEBOX_COLOR_MAX] colors;
}

struct SDL_MessageBoxData
{
    Uint32 flags;
    SDL_Window* window;
    const(char)* title;
    const(char)* message;

    int numbuttons;
    const(SDL_MessageBoxButtonData)* buttons;

    const(SDL_MessageBoxColorScheme)* colorScheme;
}

int SDL_ShowMessageBox (const(SDL_MessageBoxData)* messageboxdata, int* buttonid);

int SDL_ShowSimpleMessageBox (Uint32 flags, const(char)* title, const(char)* message, SDL_Window* window);

alias SDL_MetalView = void*;

SDL_MetalView SDL_Metal_CreateView (SDL_Window* window);

void SDL_Metal_DestroyView (SDL_MetalView view);

void* SDL_Metal_GetLayer (SDL_MetalView view);

int SDL_OpenURL (const(char)* url);

const(char)* SDL_GetPlatform ();

enum SDL_PowerState
{
    SDL_POWERSTATE_UNKNOWN = 0,
    SDL_POWERSTATE_ON_BATTERY = 1,
    SDL_POWERSTATE_NO_BATTERY = 2,
    SDL_POWERSTATE_CHARGING = 3,
    SDL_POWERSTATE_CHARGED = 4
}

SDL_PowerState SDL_GetPowerInfo (int* seconds, int* percent);

enum SDL_RendererFlags
{
    SDL_RENDERER_SOFTWARE = 0x00000001,
    SDL_RENDERER_ACCELERATED = 0x00000002,

    SDL_RENDERER_PRESENTVSYNC = 0x00000004
}

struct SDL_RendererInfo
{
    const(char)* name;
    Uint32 flags;
    Uint32 num_texture_formats;
    Uint32[16] texture_formats;
    int max_texture_width;
    int max_texture_height;
}

struct SDL_Vertex
{
    SDL_FPoint position;
    SDL_Color color;
    SDL_FPoint tex_coord;
}

enum SDL_ScaleMode
{
    SDL_SCALEMODE_NEAREST = 0,
    SDL_SCALEMODE_LINEAR = 1,
    SDL_SCALEMODE_BEST = 2
}

enum SDL_TextureAccess
{
    SDL_TEXTUREACCESS_STATIC = 0,
    SDL_TEXTUREACCESS_STREAMING = 1,
    SDL_TEXTUREACCESS_TARGET = 2
}

enum SDL_TextureModulate
{
    SDL_TEXTUREMODULATE_NONE = 0x00000000,
    SDL_TEXTUREMODULATE_COLOR = 0x00000001,
    SDL_TEXTUREMODULATE_ALPHA = 0x00000002
}

enum SDL_RendererFlip
{
    SDL_FLIP_NONE = 0x00000000,
    SDL_FLIP_HORIZONTAL = 0x00000001,
    SDL_FLIP_VERTICAL = 0x00000002
}

enum SDL_RendererLogicalPresentation
{
    SDL_LOGICAL_PRESENTATION_DISABLED = 0,
    SDL_LOGICAL_PRESENTATION_MATCH = 1,
    SDL_LOGICAL_PRESENTATION_STRETCH = 2,
    SDL_LOGICAL_PRESENTATION_LETTERBOX = 3,
    SDL_LOGICAL_PRESENTATION_OVERSCAN = 4,
    SDL_LOGICAL_PRESENTATION_INTEGER_SCALE = 5
}

struct SDL_Renderer;

struct SDL_Texture;

int SDL_GetNumRenderDrivers ();

const(char)* SDL_GetRenderDriver (int index);

int SDL_CreateWindowAndRenderer (int width, int height, Uint32 window_flags, SDL_Window** window, SDL_Renderer** renderer);

SDL_Renderer* SDL_CreateRenderer (SDL_Window* window, const(char)* name, Uint32 flags);

SDL_Renderer* SDL_CreateSoftwareRenderer (SDL_Surface* surface);

SDL_Renderer* SDL_GetRenderer (SDL_Window* window);

SDL_Window* SDL_GetRenderWindow (SDL_Renderer* renderer);

int SDL_GetRendererInfo (SDL_Renderer* renderer, SDL_RendererInfo* info);

int SDL_GetRenderWindowSize (SDL_Renderer* renderer, int* w, int* h);

int SDL_GetRenderOutputSize (SDL_Renderer* renderer, int* w, int* h);

int SDL_GetCurrentRenderOutputSize (SDL_Renderer* renderer, int* w, int* h);

SDL_Texture* SDL_CreateTexture (SDL_Renderer* renderer, Uint32 format, int access, int w, int h);

SDL_Texture* SDL_CreateTextureFromSurface (SDL_Renderer* renderer, SDL_Surface* surface);

int SDL_QueryTexture (SDL_Texture* texture, Uint32* format, int* access, int* w, int* h);

int SDL_SetTextureColorMod (SDL_Texture* texture, Uint8 r, Uint8 g, Uint8 b);

int SDL_GetTextureColorMod (SDL_Texture* texture, Uint8* r, Uint8* g, Uint8* b);

int SDL_SetTextureAlphaMod (SDL_Texture* texture, Uint8 alpha);

int SDL_GetTextureAlphaMod (SDL_Texture* texture, Uint8* alpha);

int SDL_SetTextureBlendMode (SDL_Texture* texture, SDL_BlendMode blendMode);

int SDL_GetTextureBlendMode (SDL_Texture* texture, SDL_BlendMode* blendMode);

int SDL_SetTextureScaleMode (SDL_Texture* texture, SDL_ScaleMode scaleMode);

int SDL_GetTextureScaleMode (SDL_Texture* texture, SDL_ScaleMode* scaleMode);

int SDL_SetTextureUserData (SDL_Texture* texture, void* userdata);

void* SDL_GetTextureUserData (SDL_Texture* texture);

int SDL_UpdateTexture (SDL_Texture* texture, const(SDL_Rect)* rect, const(void)* pixels, int pitch);

int SDL_UpdateYUVTexture (
    SDL_Texture* texture,
    const(SDL_Rect)* rect,
    const(Uint8)* Yplane,
    int Ypitch,
    const(Uint8)* Uplane,
    int Upitch,
    const(Uint8)* Vplane,
    int Vpitch);

int SDL_UpdateNVTexture (
    SDL_Texture* texture,
    const(SDL_Rect)* rect,
    const(Uint8)* Yplane,
    int Ypitch,
    const(Uint8)* UVplane,
    int UVpitch);

int SDL_LockTexture (
    SDL_Texture* texture,
    const(SDL_Rect)* rect,
    void** pixels,
    int* pitch);

int SDL_LockTextureToSurface (
    SDL_Texture* texture,
    const(SDL_Rect)* rect,
    SDL_Surface** surface);

void SDL_UnlockTexture (SDL_Texture* texture);

int SDL_SetRenderTarget (SDL_Renderer* renderer, SDL_Texture* texture);

SDL_Texture* SDL_GetRenderTarget (SDL_Renderer* renderer);

int SDL_SetRenderLogicalPresentation (SDL_Renderer* renderer, int w, int h, SDL_RendererLogicalPresentation mode, SDL_ScaleMode scale_mode);

int SDL_GetRenderLogicalPresentation (SDL_Renderer* renderer, int* w, int* h, SDL_RendererLogicalPresentation* mode, SDL_ScaleMode* scale_mode);

int SDL_RenderCoordinatesFromWindow (SDL_Renderer* renderer, float window_x, float window_y, float* x, float* y);

int SDL_RenderCoordinatesToWindow (SDL_Renderer* renderer, float x, float y, float* window_x, float* window_y);

int SDL_ConvertEventToRenderCoordinates (SDL_Renderer* renderer, SDL_Event* event);

int SDL_SetRenderViewport (SDL_Renderer* renderer, const(SDL_Rect)* rect);

int SDL_GetRenderViewport (SDL_Renderer* renderer, SDL_Rect* rect);

int SDL_SetRenderClipRect (SDL_Renderer* renderer, const(SDL_Rect)* rect);

int SDL_GetRenderClipRect (SDL_Renderer* renderer, SDL_Rect* rect);

SDL_bool SDL_RenderClipEnabled (SDL_Renderer* renderer);

int SDL_SetRenderScale (SDL_Renderer* renderer, float scaleX, float scaleY);

int SDL_GetRenderScale (SDL_Renderer* renderer, float* scaleX, float* scaleY);

int SDL_SetRenderDrawColor (SDL_Renderer* renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a);

int SDL_GetRenderDrawColor (SDL_Renderer* renderer, Uint8* r, Uint8* g, Uint8* b, Uint8* a);

int SDL_SetRenderDrawBlendMode (SDL_Renderer* renderer, SDL_BlendMode blendMode);

int SDL_GetRenderDrawBlendMode (SDL_Renderer* renderer, SDL_BlendMode* blendMode);

int SDL_RenderClear (SDL_Renderer* renderer);

int SDL_RenderPoint (SDL_Renderer* renderer, float x, float y);

int SDL_RenderPoints (SDL_Renderer* renderer, const(SDL_FPoint)* points, int count);

int SDL_RenderLine (SDL_Renderer* renderer, float x1, float y1, float x2, float y2);

int SDL_RenderLines (SDL_Renderer* renderer, const(SDL_FPoint)* points, int count);

int SDL_RenderRect (SDL_Renderer* renderer, const(SDL_FRect)* rect);

int SDL_RenderRects (SDL_Renderer* renderer, const(SDL_FRect)* rects, int count);

int SDL_RenderFillRect (SDL_Renderer* renderer, const(SDL_FRect)* rect);

int SDL_RenderFillRects (SDL_Renderer* renderer, const(SDL_FRect)* rects, int count);

int SDL_RenderTexture (SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_FRect)* srcrect, const(SDL_FRect)* dstrect);

int SDL_RenderTextureRotated (
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const(SDL_FRect)* srcrect,
    const(SDL_FRect)* dstrect,
    const double angle,
    const(SDL_FPoint)* center,
    const SDL_RendererFlip flip);

int SDL_RenderGeometry (
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const(SDL_Vertex)* vertices,
    int num_vertices,
    const(int)* indices,
    int num_indices);

int SDL_RenderGeometryRaw (
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const(float)* xy,
    int xy_stride,
    const(SDL_Color)* color,
    int color_stride,
    const(float)* uv,
    int uv_stride,
    int num_vertices,
    const(void)* indices,
    int num_indices,
    int size_indices);

int SDL_RenderReadPixels (
    SDL_Renderer* renderer,
    const(SDL_Rect)* rect,
    Uint32 format,
    void* pixels,
    int pitch);

int SDL_RenderPresent (SDL_Renderer* renderer);

void SDL_DestroyTexture (SDL_Texture* texture);

void SDL_DestroyRenderer (SDL_Renderer* renderer);

int SDL_RenderFlush (SDL_Renderer* renderer);

int SDL_GL_BindTexture (SDL_Texture* texture, float* texw, float* texh);

int SDL_GL_UnbindTexture (SDL_Texture* texture);

void* SDL_GetRenderMetalLayer (SDL_Renderer* renderer);

void* SDL_GetRenderMetalCommandEncoder (SDL_Renderer* renderer);

int SDL_SetRenderVSync (SDL_Renderer* renderer, int vsync);

int SDL_GetRenderVSync (SDL_Renderer* renderer, int* vsync);

SDL_Window* SDL_CreateShapedWindow (const(char)* title, int w, int h, Uint32 flags);

SDL_bool SDL_IsShapedWindow (const(SDL_Window)* window);

enum WindowShapeMode
{
    ShapeModeDefault = 0,

    ShapeModeBinarizeAlpha = 1,

    ShapeModeReverseBinarizeAlpha = 2,

    ShapeModeColorKey = 3
}

union SDL_WindowShapeParams
{
    Uint8 binarizationCutoff;
    SDL_Color colorKey;
}

struct SDL_WindowShapeMode
{
    WindowShapeMode mode;

    SDL_WindowShapeParams parameters;
}

int SDL_SetWindowShape (SDL_Window* window, SDL_Surface* shape, SDL_WindowShapeMode* shape_mode);

int SDL_GetShapedWindowMode (SDL_Window* window, SDL_WindowShapeMode* shape_mode);

int SDL_LinuxSetThreadPriority (Sint64 threadID, int priority);

int SDL_LinuxSetThreadPriorityAndPolicy (Sint64 threadID, int sdlPriority, int schedPolicy);

SDL_bool SDL_IsTablet ();

void SDL_OnApplicationWillTerminate ();

void SDL_OnApplicationDidReceiveMemoryWarning ();

void SDL_OnApplicationWillResignActive ();

void SDL_OnApplicationDidEnterBackground ();

void SDL_OnApplicationWillEnterForeground ();

void SDL_OnApplicationDidBecomeActive ();

Uint64 SDL_GetTicks ();

Uint64 SDL_GetTicksNS ();

Uint64 SDL_GetPerformanceCounter ();

Uint64 SDL_GetPerformanceFrequency ();

void SDL_Delay (Uint32 ms);

void SDL_DelayNS (Uint64 ns);

alias SDL_TimerCallback = uint function (Uint32 interval, void* param);

alias SDL_TimerID = int;

SDL_TimerID SDL_AddTimer (
    Uint32 interval,
    SDL_TimerCallback callback,
    void* param);

SDL_bool SDL_RemoveTimer (SDL_TimerID id);

struct SDL_version
{
    Uint8 major;
    Uint8 minor;
    Uint8 patch;
}

int SDL_GetVersion (SDL_version* ver);

const(char)* SDL_GetRevision ();

