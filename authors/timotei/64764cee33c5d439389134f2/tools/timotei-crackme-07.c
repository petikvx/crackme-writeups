/* timotei-crackme-07 — prédicat C (SMC, 4 octets).
 *
 * gcc -O0 -o /tmp/cm07 timotei-crackme-07.c && /tmp/cm07 tIme
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* octets sur disque à VA 0x40106B */
static const uint8_t DISK[4] = {0x9F, 0x46, 0x90, 0x90};

int password_ok(const char *pw)
{
    uint8_t dec[4];
    int i;
    for (i = 0; i < 4; i++) {
        uint8_t p = (uint8_t)(pw[i] ? pw[i] : 0);
        /* si pw plus court, le reste du buffer console est souvent 0 */
        dec[i] = (uint8_t)(DISK[i] ^ p);
    }
    /* jmp short vers 0x40107C : EB 0F */
    return dec[0] == 0xEB && dec[1] == 0x0F;
}

int main(int argc, char **argv)
{
    const char *pw = argc > 1 ? argv[1] : "tIme";
    uint8_t dec[4];
    int i;
    for (i = 0; i < 4; i++)
        dec[i] = (uint8_t)(DISK[i] ^ (uint8_t)(pw[i] ? pw[i] : 0));

    printf("pw  = %s\n", pw);
    printf("dec = %02X %02X %02X %02X\n", dec[0], dec[1], dec[2], dec[3]);
    if (password_ok(pw))
        puts("_.: l0gIn aCcEpTeD ");
    else
        puts("(no jump → ExitProcess / crash)");
    return 0;
}
