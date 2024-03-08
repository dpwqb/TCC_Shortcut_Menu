#ifndef _TCC_LIBM_H_
#define _TCC_LIBM_H_
#include "../math.h"
__CRT_INLINE int __cdecl __fpclassify (double x) {
  union {double f; uint64_t i;} u = {x};
  int e = u.i>>52 & 0x7ff;
  if (!e) return u.i<<1 ? FP_SUBNORMAL : FP_ZERO;
  if (e==0x7ff) return u.i<<12 ? FP_NAN : FP_INFINITE;
  return FP_NORMAL;
}
__CRT_INLINE int __cdecl __fpclassifyf (float x) {
  union {float f; uint32_t i;} u = {x};
  int e = u.i>>23 & 0xff;
  if (!e) return u.i<<1 ? FP_SUBNORMAL : FP_ZERO;
  if (e==0xff) return u.i<<9 ? FP_NAN : FP_INFINITE;
  return FP_NORMAL;
}
__CRT_INLINE int __cdecl __fpclassifyl (long double x) {
  return __fpclassify(x);
}
__CRT_INLINE int __cdecl __signbit (double x) {
  union {double d; uint64_t i;} y = { x };
  return y.i>>63;
}
__CRT_INLINE int __cdecl __signbitf (float x) {
  union {float f; uint32_t i; } y = { x };
  return y.i>>31;
}
__CRT_INLINE int __cdecl __signbitl (long double x) {
  return __signbit(x);
}
#define TCCFP_FMIN_EVAL (isnan(x) ? y :                                      \
                         isnan(y) ? x :                                      \
                         (signbit(x) != signbit(y)) ? (signbit(x) ? x : y) : \
                         x < y ? x : y)
__CRT_INLINE double __cdecl fmin (double x, double y) {
  return TCCFP_FMIN_EVAL;
}
__CRT_INLINE float __cdecl fminf (float x, float y) {
  return TCCFP_FMIN_EVAL;
}
__CRT_INLINE long double __cdecl fminl (long double x, long double y) {
  return TCCFP_FMIN_EVAL;
}
#define TCCFP_FMAX_EVAL (isnan(x) ? y :                                      \
                         isnan(y) ? x :                                      \
                         (signbit(x) != signbit(y)) ? (signbit(x) ? y : x) : \
                         x < y ? y : x)
__CRT_INLINE double __cdecl fmax (double x, double y) {
  return TCCFP_FMAX_EVAL;
}
__CRT_INLINE float __cdecl fmaxf (float x, float y) {
  return TCCFP_FMAX_EVAL;
}
__CRT_INLINE long double __cdecl fmaxl (long double x, long double y) {
  return TCCFP_FMAX_EVAL;
}
#define TCCFP_FORCE_EVAL(x) do {            \
if (sizeof(x) == sizeof(float)) {           \
  volatile float __x;                       \
  __x = (x);                                \
} else if (sizeof(x) == sizeof(double)) {   \
  volatile double __x;                      \
  __x = (x);                                \
} else {                                    \
  volatile long double __x;                 \
  __x = (x);                                \
}                                           \
} while(0)
__CRT_INLINE double __cdecl round (double x) {
  union {double f; uint64_t i;} u = {x};
  int e = u.i >> 52 & 0x7ff;
  double y;
  if (e >= 0x3ff+52)
    return x;
  if (u.i >> 63)
    x = -x;
  if (e < 0x3ff-1) {
    TCCFP_FORCE_EVAL(x + 0x1p52);
    return 0*u.f;
  }
  y = (double)(x + 0x1p52) - 0x1p52 - x;
  if (y > 0.5)
    y = y + x - 1;
  else if (y <= -0.5)
    y = y + x + 1;
  else
    y = y + x;
  if (u.i >> 63)
    y = -y;
  return y;
}
__CRT_INLINE long __cdecl lround (double x) {
  return round(x);
}
__CRT_INLINE long long __cdecl llround (double x) {
  return round(x);
}
__CRT_INLINE float __cdecl roundf (float x) {
  return round(x);
}
__CRT_INLINE long __cdecl lroundf (float x) {
  return round(x);
}
__CRT_INLINE long long __cdecl llroundf (float x) {
  return round(x);
}
__CRT_INLINE long double __cdecl roundl (long double x) {
  return round(x);
}
__CRT_INLINE long __cdecl lroundl (long double x) {
  return round(x);
}
__CRT_INLINE long long __cdecl llroundl (long double x) {
  return round(x);
}
#endif
