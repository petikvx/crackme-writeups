/* dlgdrive.c — pilote « A small Crackme » sous wine (pas de souris) : affiche GetUserNameA (même nom que
   celui lu par le crackme), écrit le code dans l'edit 100 (WM_SETTEXT), poste WM_COMMAND id 1 (bouton),
   puis relit le static 10 et cherche la MessageBox d'échec « Oeps ».
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c -ladvapi32     usage : wine dlgdrive.exe SERIAL */
#include <windows.h>
#include <stdio.h>
static HWND found;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 100) && GetDlgItem(h, 10)) { found = h; return FALSE; } return TRUE; }
int main(int argc, char **argv) {
    char t[256]; DWORD n = sizeof t; int i;
    GetUserNameA(t, &n); printf("GetUserNameA : %s\n", t);
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    SendDlgItemMessageA(found, 100, WM_SETTEXT, 0, (LPARAM)argv[1]);
    PostMessageA(found, WM_COMMAND, 1, (LPARAM)GetDlgItem(found, 1));
    Sleep(2500);
    SendDlgItemMessageA(found, 10, WM_GETTEXT, sizeof t, (LPARAM)t); printf("static 10    : %s\n", t);
    printf("MessageBox 'Oeps' : %s\n", FindWindowA(NULL, "Oeps") ? "OUI (Wrong code, go on)" : "non");
    return 0;
}
