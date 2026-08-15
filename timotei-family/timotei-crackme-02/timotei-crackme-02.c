/* timotei-crackme-02 — reconstruction C à la main (binaire strippé,
 * 0x73 octets de .text, pas de Hex-Rays sous la main).
 *
 * Équivalent du listing à 0x401000. Les crédits / greetz du .data ne
 * sont jamais référencés. Le secret est argv[1], pas stdin.
 *
 * gcc -O0 -o /dev/null -c timotei-crackme-02.c   # juste pour typecheck
 */

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>

/* 0x2F octets comme le write original : texte + padding zéro. */
static const char good[0x2F] = "_.:pass accepted:._\n";

int main(int argc, char **argv)
{
    const unsigned char *p;
    size_t n, i;
    uint64_t rbx;
    uint16_t di;

    if (argc != 2)
        return 0;

    n = strlen(argv[1]);
    if (n <= 3)
        return 0;

    rbx = 0;
    p = (const unsigned char *)argv[1];
    for (i = 0; i < n; i++) {
        rbx = (rbx & ~0xFFull) | p[i];
        rbx = (rbx << 8) | (rbx >> 56);
    }

    di = (uint16_t)(rbx + 0xAFDC);
    /* jmp 0x40103f + di  — on atterrit sur le write ssi di == 0x0F */
    if (di == 0x0F)
        syscall(SYS_write, 1, good, 0x2F);

    return 0;
}
