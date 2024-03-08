#include <_mingw.h>
#ifndef	__STRICT_ANSI__
#ifndef _DIRENT_H_
#define _DIRENT_H_
#pragma pack(push,_CRT_PACKING)
#include <io.h>
#ifndef RC_INVOKED
#ifdef __cplusplus
extern "C" {
#endif
  struct dirent
  {
    long		d_ino;
    unsigned short	d_reclen;
    unsigned short	d_namlen;
    char*		d_name;
  };
  typedef struct
  {
    struct _finddata_t	dd_dta;
    struct dirent		dd_dir;
    long			dd_handle;
    int			dd_stat;
    char			dd_name[1];
  } DIR;
  DIR* __cdecl opendir (const char*);
  struct dirent* __cdecl readdir (DIR*);
  int __cdecl closedir (DIR*);
  void __cdecl rewinddir (DIR*);
  long __cdecl telldir (DIR*);
  void __cdecl seekdir (DIR*, long);
  struct _wdirent
  {
    long		d_ino;
    unsigned short	d_reclen;
    unsigned short	d_namlen;
    wchar_t*	d_name;
  };
  typedef struct
  {
    struct _wfinddata_t	dd_dta;
    struct _wdirent		dd_dir;
    long			dd_handle;
    int			dd_stat;
    wchar_t			dd_name[1];
  } _WDIR;
  _WDIR* __cdecl _wopendir (const wchar_t*);
  struct _wdirent*  __cdecl _wreaddir (_WDIR*);
  int __cdecl _wclosedir (_WDIR*);
  void __cdecl _wrewinddir (_WDIR*);
  long __cdecl _wtelldir (_WDIR*);
  void __cdecl _wseekdir (_WDIR*, long);
#ifdef	__cplusplus
}
#endif
#endif
#pragma pack(pop)
#endif
#endif
