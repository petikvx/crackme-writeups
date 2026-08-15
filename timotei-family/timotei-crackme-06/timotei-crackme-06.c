/* timotei-crackme-06 — reconstruction C à la main (PE32, MASM32).
 *
 * Prédicat du keyfile. CreateFileA / UI omis.
 * gcc -O0 -c timotei-crackme-06.c
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

enum { NEED = 0x0D };
static const uint32_t THRESHOLD = 0x00BC614Eu; /* 12345678 */

int key_ok(const unsigned char *buf, unsigned n)
{
    uint32_t a, b, c, edx;
    int32_t s;

    if ((n & 0xFF) != NEED)
        return 0;
    memcpy(&a, buf + 0, 4);
    memcpy(&b, buf + 4, 4);
    memcpy(&c, buf + 8, 4);
    edx = a - b + c;
    s = (int32_t)edx;
    if (s < (int32_t)THRESHOLD)
        return 0;
    if ((unsigned char)edx != buf[12])
        return 0;
    if (buf[10] != 0x36)
        return 0;
    return 1;
}

int main(void)
{
    unsigned char buf[NEED];
    FILE *f = fopen("timotei.crackme#6.enjoy!", "rb");
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
