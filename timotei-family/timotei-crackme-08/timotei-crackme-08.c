/* timotei-crackme-08 — prédicat C du quiz (sans I/O Win32).
 * Hex-Rays : timotei-crackme-08-idapro.c (cast atoi en u8 — voir write-up §8).
 *
 * gcc -O0 -o /tmp/cm08 timotei-crackme-08.c && /tmp/cm08
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* réponses gagnantes : 2 2 1 3 1 2  puis 42 */
static const char *winning[] = {"2", "2", "1", "3", "1", "2", "42"};

int quiz_ok(const char *ans[7])
{
    unsigned ebx = 0;
    int i, n;

    for (i = 0; i < 6; i++)
        ebx = (ebx + (unsigned char)ans[i][0]) & 0xFF;

    n = atoi(ans[6]);
    ebx = (ebx - (unsigned)n) & 0xFFFFFFFFu;
    ebx = (ebx - 1) & 0xFF;
    return ebx == 0;
}

int main(int argc, char **argv)
{
    const char *ans[7];
    int i;

    if (argc == 8) {
        for (i = 0; i < 7; i++)
            ans[i] = argv[i + 1];
    } else {
        for (i = 0; i < 7; i++)
            ans[i] = winning[i];
        puts("usage: cm08 a1 a2 a3 a4 a5 a6 a7");
        puts("défaut: 2 2 1 3 1 2 42");
    }

    printf("réponses:");
    for (i = 0; i < 7; i++)
        printf(" %s", ans[i]);
    putchar('\n');

    if (quiz_ok(ans))
        puts("_.: Well Done :._");
    else
        puts("(fail)");
    return 0;
}
