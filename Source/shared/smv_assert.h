
/* ------------------ ASSERT ------------------------ */
#ifndef ASSERT_H_DEFINED
#define ASSERT_H_DEFINED

#ifdef _DEBUG
#define ASSERT_DEBUG
#endif
#ifdef pp_MEMDEBUG
#undef ASSERT_DEBUG
#define ASSERT_DEBUG
#endif

#ifdef ASSERT_DEBUG

#ifdef CPP
#define ASSERT_EXTERN extern "C"
#else
#define ASSERT_EXTERN
#endif

ASSERT_EXTERN void _Assert(const char *file, unsigned linenumber);
#define ASSERT(f) if((f)){}else{_Assert(__FILE__,__LINE__);}
#else
  #define ASSERT(f)
#endif
#endif

