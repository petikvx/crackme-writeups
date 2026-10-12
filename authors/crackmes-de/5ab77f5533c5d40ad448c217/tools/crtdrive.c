/* crtdrive.c — tape au clavier dans la fenêtre WinCrt (classe « TPWinCrt ») de SacredCrackme 5.0 (Win16)
   par WM_CHAR : NOM <Entrée> SERIAL <Entrée>. Le résultat (texte peint) se lit sur la capture Xvfb.
   i686-w64-mingw32-gcc -O2 -o crtdrive.exe crtdrive.c        usage : wine crtdrive.exe NOM SERIAL */
#include <windows.h>
#include <stdio.h>
static void type(HWND h, const char *s) { for (; *s; s++) { PostMessageA(h, WM_CHAR, (unsigned char)*s, 0); Sleep(30); } PostMessageA(h, WM_CHAR, '\r', 0); Sleep(500); }
int main(int argc, char **argv) {
    HWND h = NULL; int i;
    for (i = 0; i < 50 && !h; i++) { h = FindWindowA("TPWinCrt", NULL); if (!h) Sleep(200); }
    if (!h) { puts("fenetre TPWinCrt introuvable"); return 1; }
    printf("fenetre TPWinCrt %p\n", (void *)h);
    SetForegroundWindow(h);
    type(h, argv[1]); type(h, argv[2]); Sleep(1000);
    return 0;
}
