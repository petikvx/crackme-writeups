/* timotei-crackme-03 — reconstruction C à la main (binaire strippé).
 * Hex-Rays : timotei-crackme-03-idapro.c (hint / secret absents du C).
 *
 * Mix int 0x80 / syscall ignoré ici : on garde le prédicat.
 * L'UI ANSI (clear, blink, cadre d'étoiles) n'entre pas dans le check.
 *
 * gcc -O0 -c timotei-crackme-03.c
 */

#include <stdint.h>
#include <unistd.h>
#include <sys/syscall.h>

static const unsigned char secret[14] = {
    0x35, 0x56, 0x57, 0x56, 0x52, 0x65, 0x11,
    0x34, 0x40, 0x47, 0x3A, 0x35, 0x12, 0x00
};
static const char good[] = "*.Code accepted.Take care!*\n";

int main(void)
{
    unsigned char buf[100];
    unsigned char key;
    int i, n, ecx;

    n = (int)syscall(SYS_read, 0, buf, 100);
    if (n < 0)
        return 0;
    if (n < 100)
        __builtin_memset(buf + n, 0, 100 - n);

    key = (unsigned char)(buf[12] - 0x30);
    for (i = 0; i < 100; i++) {
        if (buf[i] == '\n')
            break;
        buf[i] = (unsigned char)(buf[i] + key);
    }

    /* repz cmpsb ecx=14 ; test ecx,ecx ; jne fail
     * Un mismatch sur le DERNIER octet laisse ecx==0 → succès. */
    ecx = 14;
    for (i = 0; i < 14; i++) {
        ecx--;
        if (buf[i] != secret[i])
            break;
    }
    if (ecx == 0)
        syscall(SYS_write, 1, good, 0x1C);
    return 0;
}
