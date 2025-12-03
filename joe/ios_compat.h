/*
 * iOS Compatibility Header for Joe's Own Editor
 * Part of ios_system framework integration
 *
 * This header provides iOS-specific adaptations for joe to run
 * within the ios_system framework's thread-safe environment.
 */

#ifndef JOE_IOS_COMPAT_H
#define JOE_IOS_COMPAT_H

#ifdef __APPLE__
#include <TargetConditionals.h>
#if TARGET_OS_IPHONE || TARGET_OS_SIMULATOR || TARGET_OS_MACCATALYST || TARGET_OS_VISION

#define JOE_IOS_SYSTEM 1

/* Include ios_system's error/compatibility header */
#include "ios_error.h"

/* Thread-local storage for ios_system integration */
extern __thread FILE* thread_stdin;
extern __thread FILE* thread_stdout;
extern __thread FILE* thread_stderr;
extern __thread void* thread_context;

/* Replace isatty with ios_isatty for proper iOS terminal detection */
#define isatty(fd) ios_isatty(fd)

/* Shell commands are not available on iOS - joe_popen returns NULL */
#define JOE_IOS_NO_SHELL 1

/* Initialize joe's thread-local state - must be called at start of joe_main */
void joe_ios_init(void);

/* Cleanup joe's thread-local state - called at exit */
void joe_ios_cleanup(void);

#endif /* TARGET_OS_IPHONE || ... */
#endif /* __APPLE__ */

#endif /* JOE_IOS_COMPAT_H */
