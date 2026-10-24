/* Helper de preuve (hors original/) : active (EnableWindow TRUE) tous les contrôles
 * enfants de la fenêtre principale « Cracme07 » de Crackme07.exe.
 * Équivaut au « Enable the button and the check » du Readme sans patcher le binaire.
 * Build : i686-w64-mingw32-gcc -O2 -o enable-controls.exe enable-controls.c -luser32
 */
#include <windows.h>
#include <stdio.h>
static BOOL CALLBACK cb(HWND h, LPARAM l) { EnableWindow(h, TRUE); (*(int*)l)++; return TRUE; }
int main(void) {
    HWND w = NULL; int n = 0;
    for (int i = 0; i < 100 && !w; i++) { w = FindWindowA(NULL, "Cracme07"); if (!w) Sleep(100); }
    if (!w) { puts("fenetre introuvable"); return 1; }
    EnumChildWindows(w, cb, (LPARAM)&n);
    printf("%d controles actives\n", n);
    return 0;
}
