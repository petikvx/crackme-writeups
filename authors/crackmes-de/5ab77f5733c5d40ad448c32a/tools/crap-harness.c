/* Charge la DLL d'origine et appelle ?crap@@YA_NQAD0@Z(name, serial). Affiche 1/0. */
#include <windows.h>
#include <stdio.h>
typedef unsigned char (__cdecl *crap_t)(char *, char *);
int main(int argc, char **argv) {
    HMODULE h = LoadLibraryA(argv[1]);
    if (!h) { printf("loadlib fail\n"); return 2; }
    crap_t f = (crap_t)GetProcAddress(h, "?crap@@YA_NQAD0@Z");
    if (!f) { printf("noproc\n"); return 2; }
    printf("crap = %d\n", f(argv[2], argv[3]) & 0xff);
    return 0;
}
