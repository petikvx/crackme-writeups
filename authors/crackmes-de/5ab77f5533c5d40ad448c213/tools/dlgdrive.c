/* dlgdrive.c — pilote Little Man 1.45 sous wine (pas de souris) : met la clé dans le champ 0xc9 (WM_SETTEXT),
   envoie WM_COMMAND 0x12e (bouton Register), attend les ticks du timer et relit le titre + le contrôle 0xca.
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c        usage : wine dlgdrive.exe CLE */
#include <windows.h>
#include <stdio.h>
static HWND found;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0xc9)) { found = h; return FALSE; } return TRUE; }
int main(int argc, char **argv) {
    char t[256], u[256]; int i;
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    GetWindowTextA(found, t, sizeof t); printf("avant : %s\n", t);
    SendDlgItemMessageA(found, 0xc9, WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendMessageA(found, WM_COMMAND, 0x12e, (LPARAM)GetDlgItem(found, 0x12e));
    Sleep(3000);
    GetWindowTextA(found, t, sizeof t); SendDlgItemMessageA(found, 0xca, WM_GETTEXT, sizeof u, (LPARAM)u);
    printf("apres : %s | ctrl 0xca : %s\n", t, u);
    return 0;
}
