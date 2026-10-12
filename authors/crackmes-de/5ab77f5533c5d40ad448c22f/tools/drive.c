/* drive.c — pilote Flatline's CrackMe #1 sous wine : WM_SETTEXT sur les deux TEdit (triés par Y :
   Username puis Serial), BM_CLICK sur le TButton « Check », puis affiche la fenêtre ShowMessage
   (TMessageForm : titre + texte des contrôles).   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
static HWND form, edits[4], btn; static int ne; static DWORD pid;
static BOOL CALLBACK findform(HWND h, LPARAM l) { char t[128]; GetWindowTextA(h, t, sizeof t);
    if (!strcmp(t, "Flatline's CrackMe #1") && IsWindowVisible(h)) { form = h; return FALSE; } return TRUE; }
static BOOL CALLBACK kids(HWND h, LPARAM l) { char c[64]; GetClassNameA(h, c, 64);
    if (!strcmp(c, "TEdit") && ne < 4) edits[ne++] = h; else if (!strcmp(c, "TButton")) btn = h; return TRUE; }
static int y(HWND h) { RECT r; GetWindowRect(h, &r); return r.top; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256], c[64]; GetWindowThreadProcessId(h, &p); GetClassNameA(h, c, 64);
    if (p == pid && h != form && IsWindowVisible(h) && strcmp(c, "TApplication")) { GetWindowTextA(h, t, sizeof t);
        printf("  fenetre (%s) : %s\n", c, t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i; HWND a, b;
    for (i = 0; i < 50 && !form; i++) { EnumWindows(findform, 0); if (!form) Sleep(200); }
    if (!form) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(form, &pid); EnumChildWindows(form, kids, 0);
    if (ne < 2 || !btn) { printf("controles introuvables (%d edits)\n", ne); return 1; }
    a = edits[0]; b = edits[1]; if (y(a) > y(b)) { HWND t = a; a = b; b = t; }
    SendMessageA(a, WM_SETTEXT, 0, (LPARAM)argv[1]); SendMessageA(b, WM_SETTEXT, 0, (LPARAM)argv[2]);
    PostMessageA(btn, BM_CLICK, 0, 0);
    Sleep(2500); EnumWindows(top, 0);
    return 0;
}
