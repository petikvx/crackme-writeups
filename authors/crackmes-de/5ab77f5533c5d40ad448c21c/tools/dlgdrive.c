/* dlgdrive.c — pilote le dialogue de fatmike Crackme #2 sous wine (pas de souris) :
   WM_SETTEXT Name (0x3ec) / Serial (0x3ef), WM_COMMAND 0x3e8 (Check), puis lit l'état des boutons
   (0x3ea = fonction désactivée), clique 0x3ea et liste les fenêtres ouvertes (texte).
   i686-w64-mingw32-gcc -O2 -o dlgdrive.exe dlgdrive.c          usage : wine dlgdrive.exe NOM SERIAL */
#include <windows.h>
#include <stdio.h>
static HWND found; static DWORD pid;
static BOOL CALLBACK cb(HWND h, LPARAM l) { if (GetDlgItem(h, 0x3ec) && GetDlgItem(h, 0x3ef)) { found = h; return FALSE; } return TRUE; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256]; GetWindowThreadProcessId(h, &p);
    if (p == pid && h != found && IsWindowVisible(h)) { GetWindowTextA(h, t, sizeof t); printf("  fenetre : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
static void st(const char *w) { printf("%s : Check(0x3e8)=%d Name=%d Serial=%d Fonction(0x3ea)=%d\n", w,
    IsWindowEnabled(GetDlgItem(found, 0x3e8)), IsWindowEnabled(GetDlgItem(found, 0x3ec)),
    IsWindowEnabled(GetDlgItem(found, 0x3ef)), IsWindowEnabled(GetDlgItem(found, 0x3ea))); }
int main(int argc, char **argv) {
    int i;
    for (i = 0; i < 50 && !found; i++) { EnumWindows(cb, 0); if (!found) Sleep(200); }
    if (!found) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(found, &pid);
    st("avant");
    SendDlgItemMessageA(found, 0x3ec, WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendDlgItemMessageA(found, 0x3ef, WM_SETTEXT, 0, (LPARAM)argv[2]);
    SendMessageA(found, WM_COMMAND, 0x3e8, (LPARAM)GetDlgItem(found, 0x3e8));
    Sleep(300); st("apres");
    if (IsWindowEnabled(GetDlgItem(found, 0x3ea))) {
        PostMessageA(found, WM_COMMAND, 0x3ea, (LPARAM)GetDlgItem(found, 0x3ea));
        Sleep(2000); EnumWindows(top, 0);
    }
    return 0;
}
