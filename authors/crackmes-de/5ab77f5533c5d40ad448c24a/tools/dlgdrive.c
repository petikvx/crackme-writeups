/* dlgdrive.c — pilote le dialogue de crackme_8 (fr1c) sous wine, sans souris :
   remplit Name (0x3e9) / Serial (0x3ea) par WM_SETTEXT, poste WM_COMMAND <id bouton> (défaut 0x3e8 = « Crack it! »),
   puis cherche la MessageBox « Alert! » et affiche son texte.
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c      usage : wine dlgdrive.exe NOM SERIAL [ID] */
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
static HWND found, box;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0x3e9) && GetDlgItem(h, 0x3ea)) { found = h; return FALSE; } return TRUE; }
static BOOL CALLBACK ch(HWND h, LPARAM l) { char c[64], t[128]; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 128);
    printf("  ctrl id=0x%x class=%s text=%s\n", GetDlgCtrlID(h), c, t); return TRUE; }
static BOOL CALLBACK mb(HWND h, LPARAM l) { char t[128]; GetWindowTextA(h, t, 128); if (h != found && !strcmp(t, "Alert!")) { box = h; return FALSE; } return TRUE; }
static BOOL CALLBACK st(HWND h, LPARAM l) { char c[64], t[256]; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 256);
    if (!_stricmp(c, "Static") && t[0]) printf("MessageBox : %s\n", t); return TRUE; }
int main(int argc, char **argv) {
    int i, id = argc > 3 ? strtol(argv[3], 0, 0) : 0x3e8; /* bouton « Crack it! » */
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    EnumChildWindows(found, ch, 0);
    SendDlgItemMessageA(found, 0x3e9, WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendDlgItemMessageA(found, 0x3ea, WM_SETTEXT, 0, (LPARAM)argv[2]);
    PostMessageA(found, WM_COMMAND, id, (LPARAM)GetDlgItem(found, id));
    for (i = 0; i < 15 && !box; i++) { Sleep(200); EnumWindows(mb, 0); }
    if (!box) { puts("pas de MessageBox Alert! (serial refusé)"); return 2; }
    EnumChildWindows(box, st, 0);
    return 0;
}
