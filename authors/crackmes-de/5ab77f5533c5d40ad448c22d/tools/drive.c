/* drive.c — pilote Keygenme#1 (KKR 2015) sous wine : SetDlgItemText sur 0x3E9 (nom) / 0x3EA (serial),
   WM_COMMAND 0x3EB (bouton), puis liste les fenêtres visibles du processus (MessageBox : titre + texte).
   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
static HWND dlg; static DWORD pid;
static BOOL CALLBACK finddlg(HWND h, LPARAM l) { char c[64]; GetClassNameA(h, c, 64);
    if (!strcmp(c, "#32770") && GetDlgItem(h, 0x3E9)) { dlg = h; return FALSE; } return TRUE; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256]; GetWindowThreadProcessId(h, &p);
    if (p == pid && h != dlg && IsWindowVisible(h)) { GetWindowTextA(h, t, sizeof t); printf("  fenetre : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i;
    for (i = 0; i < 50 && !dlg; i++) { EnumWindows(finddlg, 0); if (!dlg) Sleep(200); }
    if (!dlg) { puts("dialogue introuvable"); return 1; }
    GetWindowThreadProcessId(dlg, &pid);
    SetDlgItemTextA(dlg, 0x3E9, argv[1]); SetDlgItemTextA(dlg, 0x3EA, argv[2]);
    PostMessageA(dlg, WM_COMMAND, MAKEWPARAM(0x3EB, BN_CLICKED), (LPARAM)GetDlgItem(dlg, 0x3EB));
    Sleep(2000); EnumWindows(top, 0);
    return 0;
}
