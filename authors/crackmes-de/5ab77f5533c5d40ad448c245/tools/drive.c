/* drive.c — pilote Knight's crackme #1 sous wine : WM_SETTEXT sur les edits 0x3F2 (nom) / 0x3F3 (serial),
   BM_CLICK sur le bouton 0x3EB, puis lit la MessageBox (#32770).  usage : drive.exe NOM SERIAL
   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND dlg; static DWORD pid;
static BOOL CALLBACK finddlg(HWND h, LPARAM l) { if (GetDlgItem(h, 0x3F2) && GetDlgItem(h, 0x3EB) && IsWindowVisible(h)) { dlg = h; return FALSE; } return TRUE; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf(" [%s]", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256], c[64]; GetWindowThreadProcessId(h, &p); GetClassNameA(h, c, 64);
    if (p == pid && h != dlg && IsWindowVisible(h) && !strcmp(c, "#32770")) { GetWindowTextA(h, t, sizeof t);
        printf("MsgBox <%s> :", t); EnumChildWindows(h, child, 0); puts(""); } return TRUE; }
int main(int argc, char **argv) {
    int i;
    if (argc < 3) return 2;
    for (i = 0; i < 50 && !dlg; i++) { EnumWindows(finddlg, 0); if (!dlg) Sleep(200); }
    if (!dlg) { puts("dialogue introuvable"); return 1; }
    GetWindowThreadProcessId(dlg, &pid);
    SetDlgItemTextA(dlg, 0x3F2, argv[1]); SetDlgItemTextA(dlg, 0x3F3, argv[2]);
    PostMessageA(GetDlgItem(dlg, 0x3EB), BM_CLICK, 0, 0);
    Sleep(1500); EnumWindows(top, 0);
    return 0;
}
