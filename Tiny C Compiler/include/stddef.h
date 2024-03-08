#ifndef _STDDEF_H
#define _STDDEF_H
typedef __SIZE_TYPE__ size_t;
typedef __PTRDIFF_TYPE__ ssize_t;
typedef __WCHAR_TYPE__ wchar_t;
typedef __PTRDIFF_TYPE__ ptrdiff_t;
typedef __PTRDIFF_TYPE__ intptr_t;
typedef __SIZE_TYPE__ uintptr_t;
#ifndef __int8_t_defined
#define __int8_t_defined
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
#ifdef __LP64__
typedef signed long int int64_t;
#else
typedef signed long long int int64_t;
#endif
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
#ifdef __LP64__
typedef unsigned long int uint64_t;
#else
typedef unsigned long long int uint64_t;
#endif
#endif
#ifndef NULL
#define NULL ((void*)0)
#endif
#define offsetof(type, field) ((size_t)&((type *)0)->field)
void *alloca(size_t size);
#endif
#if defined (__need_wint_t)
#ifndef _WINT_T
#define _WINT_T
typedef __WINT_TYPE__ wint_t;
#endif
#undef __need_wint_t
#endif
