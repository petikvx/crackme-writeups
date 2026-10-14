/* LD_PRELOAD de test : getpid() -> 1337, strftime() -> "13:37", remove() -> no-op (le crackme s'auto-supprime). */
#define _GNU_SOURCE
#include <stddef.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
pid_t getpid(void) { return 1337; }
size_t strftime(char *s, size_t max, const char *fmt, const struct tm *tm) { strcpy(s, "13:37"); return 5; }
int remove(const char *p) { return 0; }
