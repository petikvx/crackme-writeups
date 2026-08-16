/* timotei-crackme-09 — prédicat C de sub_40112F (sans I/O Win32).
 * Hex-Rays : timotei-crackme-09-idapro.c
 *
 * gcc -O0 -o /tmp/cm09 timotei-crackme-09.c && /tmp/cm09
 * /tmp/cm09 2191CMCM
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define CONST_ADD 123456 /* 0x1E240 */
#define MIN_N     2023   /* 0x7E7 */
#define CM_WORD   0x4D43 /* "CM" LE */

static int has_cm_word(const unsigned char *s, int len)
{
    int left = len;
    int i = 0;
    unsigned char buf[64];
    int ncopy = len < 62 ? len : 62;

    memset(buf, 0, sizeof buf);
    memcpy(buf, s, ncopy);
    while (left > 0) {
        unsigned w = buf[i] | ((unsigned)buf[i + 1] << 8);
        if (w == CM_WORD)
            return 1;
        i += 2;
        left--;
    }
    return 0;
}

/* prédicat sub_40112F (lstrlen / atoi / boucle / scasw / div) */
int serial_ok(const char *s)
{
    int len, n, i;
    unsigned sum;
    const unsigned char *p = (const unsigned char *)s;

    if (!s)
        return 0;
    len = (int)strlen(s);
    if (len == 0)
        return 0;

    n = atoi(s);
    sum = (unsigned)n;
    for (i = 0; i < len; i++) {
        int sb = (signed char)p[i]; /* comme movsx */
        sum += (unsigned)(sb + CONST_ADD);
    }

    if (!has_cm_word(p, len))
        return 0;
    if (n < MIN_N)
        return 0;
    if (n == 0)
        return 0;
    return (sum % (unsigned)n) == 0;
}

int main(int argc, char **argv)
{
    const char *s;
    int i;

    if (argc >= 2) {
        for (i = 1; i < argc; i++) {
            s = argv[i];
            printf("%s → %s\n", s, serial_ok(s) ? "Registered" : "Unregistered");
        }
        return serial_ok(argv[1]) ? 0 : 1;
    }

    s = "2191CMCM";
    puts("usage: cm09 <serial> [serial...]");
    puts("défaut: 2191CMCM");
    printf("%s → %s\n", s, serial_ok(s) ? "Registered" : "Unregistered");
    printf("2023CM → %s\n", serial_ok("2023CM") ? "Registered" : "Unregistered");
    return serial_ok(s) ? 0 : 1;
}
