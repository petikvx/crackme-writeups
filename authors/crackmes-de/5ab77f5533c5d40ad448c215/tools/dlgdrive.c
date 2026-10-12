/* dlgdrive.c — pilote Assassination sous wine (pas de souris) : Name (0xc8) / Serial (0xc9) par WM_SETTEXT,
   puis coche la case 0x12c (BM_SETCHECK) que le thread 0x4012d1 surveille ; relit le champ Serial (message).
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c        usage : wine dlgdrive.exe NOM SERIAL */
#include <windows.h>
#include <stdio.h>
static HWND found;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0xc8) && GetDlgItem(h, 0x12c)) { found = h; return FALSE; } return TRUE; }
int main(int argc, char **argv) {
    char t[256]; int i;
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    SendDlgItemMessageA(found, 0xc8, WM_GETTEXT, sizeof t, (LPARAM)t); printf("name initial (GetUserName) : %s\n", t);
    SendDlgItemMessageA(found, 0xc8, WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendDlgItemMessageA(found, 0xc9, WM_SETTEXT, 0, (LPARAM)argv[2]);
    SendDlgItemMessageA(found, 0x12c, BM_SETCHECK, BST_CHECKED, 0);
    Sleep(1500);
    SendDlgItemMessageA(found, 0xc8, WM_GETTEXT, sizeof t, (LPARAM)t); printf("champ name   : %s\n", t);
    SendDlgItemMessageA(found, 0xc9, WM_GETTEXT, sizeof t, (LPARAM)t); printf("champ serial : %s\n", t);
    return 0;
}
