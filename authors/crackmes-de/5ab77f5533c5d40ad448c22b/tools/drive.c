/* drive.c — pilote KKR RED KGM #1 sous wine : nom/serial dans les deux TEdit (tri par ordonnée), clic simulé
   sur le TSpeedButton SpeedButton1 (Left 312, Top 239, 81x22, contrôle non fenêtré : WM_LBUTTONDOWN/UP sur la fiche),
   puis liste les fenêtres visibles du processus.   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
static HWND form, ed[2]; static int ne; static DWORD pid;
static BOOL CALLBACK fe(HWND h, LPARAM l) { char c[64]; GetClassNameA(h, c, 64);
    if (!strcmp(c, "TEdit") && ne < 2) ed[ne++] = h; return TRUE; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256]; GetWindowThreadProcessId(h, &p);
    if (p == pid && h != form && IsWindowVisible(h)) { GetWindowTextA(h, t, sizeof t); printf("  fenetre : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i; RECT r0, r1;
    for (i = 0; i < 50 && !form; i++) { form = FindWindowA("TForm1", NULL); if (!form) Sleep(200); }
    if (!form) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(form, &pid); EnumChildWindows(form, fe, 0);
    if (ne < 2) { puts("edits introuvables"); return 1; }
    GetWindowRect(ed[0], &r0); GetWindowRect(ed[1], &r1);
    if (r1.top < r0.top) { HWND t = ed[0]; ed[0] = ed[1]; ed[1] = t; }
    SendMessageA(ed[0], WM_SETTEXT, 0, (LPARAM)argv[1]); SendMessageA(ed[1], WM_SETTEXT, 0, (LPARAM)argv[2]);
    PostMessageA(form, WM_LBUTTONDOWN, MK_LBUTTON, MAKELPARAM(350, 250));
    PostMessageA(form, WM_LBUTTONUP, 0, MAKELPARAM(350, 250));
    Sleep(2500); EnumWindows(top, 0);
    return 0;
}
