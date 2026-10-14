/* inject.c — pilote le dialogue de CKGM1a.exe sous wine (pas de focus clavier sous Xvfb sans WM).
 * i686-w64-mingw32-gcc -O2 -o inject.exe inject.c -luser32
 * usage : wine inject.exe SERIAL  → SetDlgItemTextA(0x3ED) puis WM_COMMAND IDOK (= « Check serial ») */
#include <windows.h>
int main(int argc, char **argv) {
    HWND h = NULL;
    for (int i = 0; i < 50 && !h; i++) { h = FindWindowA(NULL, "Keygenme #1 by CHAAK"); if (!h) Sleep(200); }
    if (!h || argc < 2) return 1;
    SetDlgItemTextA(h, 0x3ED, argv[1]);
    PostMessageA(h, WM_COMMAND, MAKEWPARAM(IDOK, BN_CLICKED), 0);
    return 0;
}
