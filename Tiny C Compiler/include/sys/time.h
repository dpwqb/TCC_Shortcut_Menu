#ifndef _SYS_TIME_H_
#define _SYS_TIME_H_
#include <time.h>
#ifdef  __cplusplus
extern "C" {
#endif
#ifndef __STRICT_ANSI__
#ifndef _TIMEVAL_DEFINED
#define _TIMEVAL_DEFINED
struct timeval {
  long tv_sec;
  long tv_usec;
};
#define timerisset(tvp)	 ((tvp)->tv_sec || (tvp)->tv_usec)
#define timercmp(tvp, uvp, cmp) \
  (((tvp)->tv_sec != (uvp)->tv_sec) ? \
  ((tvp)->tv_sec cmp (uvp)->tv_sec) : \
  ((tvp)->tv_usec cmp (uvp)->tv_usec))
#define timerclear(tvp)	 (tvp)->tv_sec = (tvp)->tv_usec = 0
#endif
#ifndef _TIMEZONE_DEFINED
#define _TIMEZONE_DEFINED
struct timezone
{
  int tz_minuteswest;
  int tz_dsttime;
};
  extern int __cdecl mingw_gettimeofday (struct timeval *p, struct timezone *z);
#endif
#ifndef _GETTIMEOFDAY_DEFINED
#define _GETTIMEOFDAY_DEFINED
int __cdecl gettimeofday(struct timeval *__restrict__,
                         void *__restrict__);
#endif
#endif
#ifdef  __cplusplus
}
#endif
#include <sys/timeb.h>
#endif
