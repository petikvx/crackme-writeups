/* timotei-crackme-05 — reconstruction C à la main (PE32, MASM32).
 * Hex-Rays : timotei-crackme-05-idapro.c
 *
 * Prédicat seulement. CreateFileA / ReadFile / l'UI « Press any key »
 * sont omis. Le write « i » à buf[6] est un dead store (jamais relu).
 *
 * gcc -O0 -c timotei-crackme-05.c
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

enum { NEED = 0x16, SUM_LEN = 0x15 };

int key_ok(const unsigned char *buf, unsigned n)
{
    unsigned i;
    unsigned char sum = 0;

    /* objdump : sub BYTE PTR NumberOfBytesRead, 16h / jnz fail */
    if ((n & 0xFF) != NEED)
        return 0;
    for (i = 0; i < SUM_LEN; i++)
        sum = (unsigned char)(sum + buf[i]);
    return sum == buf[SUM_LEN];
}

int main(void)
{
    unsigned char buf[NEED];
    FILE *f = fopen("timotei.crackme#5.enjoy!", "rb");
    if (!f)
        return 1;
    if (fread(buf, 1, NEED, f) != NEED || fgetc(f) != EOF) {
        fclose(f);
        return 1;
    }
    fclose(f);
    if (key_ok(buf, NEED))
        puts(".:keyfile:.accepted:.");
    return 0;
}
