/* timotei-crackme-11 — reconstruction C (logique = Hex-Rays / IDA start).
 *
 * Original (Hex-Rays) :
 *   GetCommandLineA → 14 derniers octets : key[4] + digits[10]
 *   esi = *(dword*)(end-14)
 *   n   = parse décimal des 10 chiffres
 *   Text[0..3] ^= esi ; Text[5..8] ^= n
 *   MessageBoxA((HWND)(esi+n+1), Text, title, 0)   // hWnd souvent INVALIDE
 *   ExitProcess(0)
 *
 * Le hWnd calculé (esi+n+1) n'est pas une fenêtre valide : sous Wine et sur
 * beaucoup de Windows modernes, MessageBoxA échoue silencieusement.
 * Par défaut ce recon utilise hWnd = NULL pour que la boîte s'affiche.
 * Compile avec -DUSE_ORIGINAL_HWND pour coller strictement au binaire.
 *
 * Compiler (cross MinGW 32-bit, depuis Linux) :
 *   sudo apt install mingw-w64
 *   i686-w64-mingw32-gcc -mwindows -O0 -o timotei-crackme-11-recon.exe \
 *       timotei-crackme-11-recon.c
 *
 * Ou sous Windows (MSVC / MinGW-w64) :
 *   gcc -mwindows -O0 -o timotei-crackme-11-recon.exe timotei-crackme-11-recon.c
 *
 * Lancer :
 *   timotei-crackme-11-recon.exe t62O3668101526
 *   → MessageBox "Good Work" / "timotei crackme #11 1K-Edition"
 *
 * Alternative FASM (sans MinGW) : timotei-crackme-11-recon-fasm.asm
 */

#include <windows.h>

/* Layout mémoire comme @ 0x401070 (cipher) + titre @ 0x40107B */
static char Text[12] = {
    0x33, 0x59, 0x5D, 0x2B, /* dword ^= esi */
    0x20,                   /* espace, non chiffré */
    (char)0xC1, (char)0xA6, (char)0xD0, (char)0xB1, /* dword ^= n */
    0x00, 0x00, 0x00
};

static const char Title[] = "timotei crackme #11 1K-Edition";

/* Point d'entrée style crackme (pas de main CRT si -nostdlib ; avec MinGW
 * on garde WinMain / main pour lier facilement). */
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow)
{
    char *cmd;
    char *v1;
    unsigned int v2; /* esi */
    char *v3;
    int v4;
    unsigned int v5; /* n */
    unsigned int v6;
    HWND hwnd;

    (void)hInst;
    (void)hPrev;
    (void)lpCmd;
    (void)nShow;

    /* --- GetCommandLineA + scan NUL (comme start IDA) --- */
    cmd = GetCommandLineA();
    do
        ++cmd;
    while (*cmd != 0);

    v1 = cmd - 10;                      /* 10 derniers caractères */
    v2 = *(unsigned int *)(v1 - 4);     /* 4 octets avant = clé */
    v3 = v1;
    v4 = 0;
    v5 = 0;
    for (;;) {
        v6 = (unsigned char)v3[v4];
        if ((unsigned char)v6 == 0)
            break;
        v6 = (unsigned char)(v6 - 48);  /* - '0' */
        v5 = v6 + 10 * v5;
        ++v4;
    }

    /* --- XOR message --- */
    *(unsigned int *)Text ^= v2;
    *(unsigned int *)(Text + 5) ^= v5;

#ifdef USE_ORIGINAL_HWND
    /* Strict original : souvent invalide → pas de boîte */
    hwnd = (HWND)(v5 + v2 + 1);
#else
    /* Recon utilisable : NULL = desktop, la boîte s'affiche */
    hwnd = NULL;
#endif

    MessageBoxA(hwnd, Text, Title, 0);
    ExitProcess(0);
    return 0;
}
