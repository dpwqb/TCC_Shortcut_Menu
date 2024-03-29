#ifndef _INC_SIGNAL
#define _INC_SIGNAL
#include <_mingw.h>
#ifdef __cplusplus
extern "C" {
#endif
#ifndef _SIG_ATOMIC_T_DEFINED
#define _SIG_ATOMIC_T_DEFINED
  typedef int sig_atomic_t;
#endif
#define NSIG 23
#define	SIGHUP	1
#define SIGINT 2
#define	SIGQUIT	3
#define SIGILL 4
#define	SIGTRAP	5
#define	SIGIOT	6
#define	SIGABRT 6
#define	SIGEMT	7
#define SIGFPE 8
#define	SIGKILL	9
#define	SIGBUS	10
#define SIGSEGV 11
#define	SIGSYS	12
#define	SIGPIPE	13
#ifdef __USE_MINGW_ALARM
#define	SIGALRM	14
#endif
#define SIGTERM 15
#define SIGBREAK 21
#define SIGABRT2 22
#define SIGABRT_COMPAT 6
  typedef	void (*__p_sig_fn_t)(int);
#define SIG_DFL (__p_sig_fn_t)0
#define SIG_IGN (__p_sig_fn_t)1
#define SIG_GET (__p_sig_fn_t)2
#define SIG_SGE (__p_sig_fn_t)3
#define SIG_ACK (__p_sig_fn_t)4
#define SIG_ERR (__p_sig_fn_t)-1
  extern void **__cdecl __pxcptinfoptrs(void);
#define _pxcptinfoptrs (*__pxcptinfoptrs())
  __p_sig_fn_t __cdecl signal(int _SigNum,__p_sig_fn_t _Func);
  int __cdecl raise(int _SigNum);
#ifdef __cplusplus
}
#endif
#endif
