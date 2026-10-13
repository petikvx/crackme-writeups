/* drive.c — pilote CrackMe Renascense v1.0 (VB6) sous wine : liste les contrôles, WM_SETTEXT sur les
   ThunderRT6TextBox (ordre par Y, ou mode "swap"), BM_CLICK sur le bouton, puis lit la MsgBox.
   usage : drive.exe [NOM SERIAL [swap]]    i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND form, edits[4], btn; static int ne; static DWORD pid;
static BOOL CALLBACK findform(HWND h, LPARAM l) { char t[128]; GetWindowTextA(h, t, sizeof t);
    if (strstr(t, "Renascense") && IsWindowVisible(h)) { form = h; return FALSE; } return TRUE; }
static BOOL CALLBACK kids(HWND h, LPARAM l) { char c[64], t[128]; RECT r; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 128);
    GetWindowRect(h, &r); printf("  ctl %s [%s] y=%ld x=%ld\n", c, t, r.top, r.left);
    if (strstr(c, "TextBox") && ne < 4) edits[ne++] = h; else if (strstr(c, "CommandButton")) btn = h; return TRUE; }
static int y(HWND h) { RECT r; GetWindowRect(h, &r); return r.top; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256], c[64]; GetWindowThreadProcessId(h, &p); GetClassNameA(h, c, 64);
    if (p == pid && h != form && IsWindowVisible(h) && !strstr(c, "Main")) { GetWindowTextA(h, t, sizeof t);
        printf("  fenetre (%s) : %s\n", c, t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i; HWND a, b;
    for (i = 0; i < 50 && !form; i++) { EnumWindows(findform, 0); if (!form) Sleep(200); }
    if (!form) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(form, &pid); EnumChildWindows(form, kids, 0);
    if (argc < 3) return 0;
    if (ne < 2 || !btn) { printf("controles introuvables (%d edits)\n", ne); return 1; }
    a = edits[0]; b = edits[1]; if (y(a) > y(b)) { HWND t = a; a = b; b = t; }
    if (argc > 3) { HWND t = a; a = b; b = t; }
    SendMessageA(a, WM_SETTEXT, 0, (LPARAM)argv[1]); SendMessageA(b, WM_SETTEXT, 0, (LPARAM)argv[2]);
    PostMessageA(btn, BM_CLICK, 0, 0);
    Sleep(2500); EnumWindows(top, 0);
    return 0;
}
