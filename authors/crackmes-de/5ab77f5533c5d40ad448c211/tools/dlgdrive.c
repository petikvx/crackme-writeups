/* dlgdrive.c — pilote le dialogue de Keygenme 0.51 sous wine (pas de souris) :
   remplit Name (0x2d) / Key (0x2e) avec WM_SETTEXT, envoie WM_COMMAND 0x65 (bouton Check), relit le statut (0x37).
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c          usage : wine dlgdrive.exe NOM CLE */
#include <windows.h>
#include <stdio.h>
static HWND found;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0x2d) && GetDlgItem(h, 0x2e)) { found = h; return FALSE; } return TRUE; }
int main(int argc, char **argv) {
    char t[256]; int i;
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    SendDlgItemMessageA(found, 0x37, WM_GETTEXT, sizeof t, (LPARAM)t); printf("avant : %s\n", t);
    SendDlgItemMessageA(found, 0x2d, WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendDlgItemMessageA(found, 0x2e, WM_SETTEXT, 0, (LPARAM)argv[2]);
    SendMessageA(found, WM_COMMAND, 0x65, (LPARAM)GetDlgItem(found, 0x65));
    Sleep(500);
    SendDlgItemMessageA(found, 0x37, WM_GETTEXT, sizeof t, (LPARAM)t); printf("apres : %s\n", t);
    return 0;
}
