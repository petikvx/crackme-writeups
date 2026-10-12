/* drive.c — pilote « KeyGen Me - 1 » sous wine : trouve le dialogue (#32770) du processus,
   remplit nom (0x3E9) + 4 champs serial (0x3EA, 0x3EF, 0x3F0, 0x3F1), envoie WM_COMMAND 0x3EB
   (bouton Check), puis affiche le titre/texte de la MessageBox.
   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c      usage : drive.exe NOM A B C D */
#include <windows.h>
#include <stdio.h>
static HWND dlg;
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { char c[64], t[256]; GetClassNameA(h, c, 64);
    if (!strcmp(c, "#32770") && h != dlg && IsWindowVisible(h)) { GetWindowTextA(h, t, sizeof t); printf("  boite : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
static BOOL CALLBACK find(HWND h, LPARAM l) { char c[64]; GetClassNameA(h, c, 64);
    if (!strcmp(c, "#32770") && GetDlgItem(h, 0x3E9)) { dlg = h; return FALSE; } return TRUE; }
int main(int argc, char **argv) {
    static const int ids[4] = {0x3EA, 0x3EF, 0x3F0, 0x3F1}; int i;
    if (argc < 6) return 2;
    for (i = 0; i < 50 && !dlg; i++) { EnumWindows(find, 0); if (!dlg) Sleep(200); }
    if (!dlg) { puts("dialogue introuvable"); return 1; }
    SetDlgItemTextA(dlg, 0x3E9, argv[1]);
    for (i = 0; i < 4; i++) SetDlgItemTextA(dlg, ids[i], argv[2 + i]);
    PostMessageA(dlg, WM_COMMAND, MAKEWPARAM(0x3EB, BN_CLICKED), 0);
    Sleep(2000); EnumWindows(top, 0);
    return 0;
}
