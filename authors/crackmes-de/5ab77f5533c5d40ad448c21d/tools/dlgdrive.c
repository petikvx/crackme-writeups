/* dlgdrive.c — pilote le dialogue de fatmike Crackme #1 sous wine (pas de souris) :
   WM_SETTEXT Serial (0x3eb), PostMessage WM_COMMAND 0x3e8 (Check ; la MessageBox est modale), puis liste
   les fenêtres du processus (titre + texte des contrôles).
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c          usage : wine dlgdrive.exe SERIAL */
#include <windows.h>
#include <stdio.h>
static HWND found; static DWORD pid;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0x3eb) && GetDlgItem(h, 0x3e8)) { found = h; return FALSE; } return TRUE; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256]; GetWindowThreadProcessId(h, &p);
    if (p == pid && h != found && IsWindowVisible(h)) { GetWindowTextA(h, t, sizeof t); printf("  fenetre : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i;
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(found, &pid);
    SendDlgItemMessageA(found, 0x3eb, WM_SETTEXT, 0, (LPARAM)argv[1]);
    PostMessageA(found, WM_COMMAND, 0x3e8, (LPARAM)GetDlgItem(found, 0x3e8));
    Sleep(2000); EnumWindows(top, 0);
    return 0;
}
