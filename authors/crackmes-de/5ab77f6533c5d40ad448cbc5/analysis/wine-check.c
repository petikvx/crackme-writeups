/* Live-ish check under Wine: reimplement predicate on PE .data */
#include <stdio.h>
#include <string.h>
#include <stdint.h>

static const char KEY[] = "Tv8(@*a;FHBADIvhadyfgpar12Af5t[a";

int main(void) {
    FILE *f = fopen("original/_u/the_xor_algorithm.exe", "rb");
    if (!f) { perror("fopen"); return 1; }
    unsigned char plain[0xF0], target[0xF0], msg[0x64];
    if (fseek(f, 0x800, SEEK_SET) || fread(plain, 1, 0xF0, f) != 0xF0) return 2;
    if (fseek(f, 0x800 + 0xF1, SEEK_SET) || fread(target, 1, 0xF0, f) != 0xF0) return 3;
    if (fseek(f, 0x800 + 0x1EC, SEEK_SET) || fread(msg, 1, 0x64, f) != 0x64) return 4;
    fclose(f);

    unsigned char buf[0xF0];
    memcpy(buf, plain, 0xF0);
    unsigned idx = 0;
    for (int i = 0; i < 0xF0; i++) {
        buf[i] ^= (unsigned char)KEY[idx];
        buf[i] = (unsigned char)(buf[i] + idx);
        idx = buf[i] % 32;
    }
    if (memcmp(buf, target, 0xF0) != 0) {
        puts("FAIL transform");
        return 5;
    }
    /* decrypt success msg (stop display at first NUL) */
    idx = 0;
    for (int i = 0; i < 0x64; i++) {
        unsigned char orig = msg[i];
        msg[i] = (unsigned char)(msg[i] - idx);
        msg[i] ^= (unsigned char)KEY[idx];
        idx = orig % 32;
    }
    /* body is exactly 0x64 bytes, no trailing NUL in PE */
    printf("OK key=%s\nmsg=%.*s\n", KEY, 0x64, msg);
    return 0;
}
