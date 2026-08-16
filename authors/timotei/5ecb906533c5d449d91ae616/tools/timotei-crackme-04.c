/* timotei-crackme-04 — reconstruction C à la main (binaire strippé).
 * Hex-Rays (timotei-crackme-04-idapro.c) ne contient que sys_exit(0) :
 * il s'arrête au stub EP. Le check est ici.
 *
 * L'EP original (nop / push exit / ret) n'est pas reproduit : ce fichier
 * est le prédicat à 0x401007. argv[1], 4 octets, FNV-1 → 0x6FCD79A2.
 *
 * gcc -O0 -c timotei-crackme-04.c
 */

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>

static const char good[0x0E] = "_.:solved:._\n";

int main(int argc, char **argv)
{
    const unsigned char *p;
    uint32_t h;
    int i;

    if (argc != 2)
        return 0;
    if (strlen(argv[1]) != 4)
        return 0;

    p = (const unsigned char *)argv[1];
    h = 0x811C9DC5u;
    for (i = 0; i < 4; i++) {
        h *= 0x01000193u;
        h ^= p[i];
    }
    if (h == 0x6FCD79A2u)
        syscall(SYS_write, 1, good, 0x0E);
    return 0;
}
