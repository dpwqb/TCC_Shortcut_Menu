#ifndef _FENV_H_
#define _FENV_H_
#include <_mingw.h>
#define FE_INVALID	0x01
#define FE_DENORMAL	0x02
#define FE_DIVBYZERO	0x04
#define FE_OVERFLOW	0x08
#define FE_UNDERFLOW	0x10
#define FE_INEXACT	0x20
#define FE_ALL_EXCEPT (FE_INVALID | FE_DENORMAL | FE_DIVBYZERO \
		       | FE_OVERFLOW | FE_UNDERFLOW | FE_INEXACT)
#define FE_TONEAREST	0x0000
#define FE_DOWNWARD	0x0400
#define FE_UPWARD	0x0800
#define FE_TOWARDZERO	0x0c00
#define __MXCSR_EXCEPT_FLAG_SHIFT 0
#define __MXCSR_ROUND_FLAG_SHIFT 3
#ifndef RC_INVOKED
typedef unsigned short fexcept_t;
typedef struct
{
  unsigned short __control_word;
  unsigned short __unused0;
  unsigned short __status_word;
  unsigned short __unused1;
  unsigned short __tag_word;
  unsigned short __unused2;  
  unsigned int	 __ip_offset;
  unsigned short __ip_selector;  
  unsigned short __opcode;
  unsigned int	 __data_offset;
  unsigned short __data_selector;  
  unsigned short __unused3;
  unsigned int   __mxcsr;
} fenv_t;
#define FE_PC64_ENV ((const fenv_t *)-1)
#define FE_PC53_ENV ((const fenv_t *)-2)
#define FE_DFL_ENV ((const fenv_t *) 0)
#ifdef __cplusplus
extern "C" {
#endif
extern int __cdecl feclearexcept (int);
extern int __cdecl fegetexceptflag (fexcept_t * flagp, int excepts);
extern int __cdecl feraiseexcept (int excepts );
extern int __cdecl fesetexceptflag (const fexcept_t *, int);
extern int __cdecl fetestexcept (int excepts);
extern int __cdecl fegetround (void);
extern int __cdecl fesetround (int mode);
extern int __cdecl fegetenv(fenv_t * envp);
extern int __cdecl fesetenv(const fenv_t * );
extern int __cdecl feupdateenv(const fenv_t *);
extern int __cdecl feholdexcept(fenv_t *);
#ifdef __cplusplus
}
#endif
#endif
#endif
