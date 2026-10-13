/* drive.c — pilote « M|GHTY K|nG's CrackMe And EatMe #1 » (AutoIt v3) sous wine : WM_SETTEXT sur les deux
   Edit (triés par Y : Name puis Serial), BM_CLICK sur « Check ! », puis lit le label Status et les MsgBox.
   usage : drive.exe NOM SERIAL      i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND form, edits[4], btn, stat[8]; static int ne, ns; static DWORD pid;
static BOOL CALLBACK findform(HWND h, LPARAM l) { char t[128]; GetWindowTextA(h, t, sizeof t);
    if (strstr(t, "CrackMe And EatMe") && IsWindowVisible(h)) { form = h; return FALSE; } return TRUE; }
static BOOL CALLBACK kids(HWND h, LPARAM l) { char c[64], t[128]; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 128);
    if (!strcmp(c, "Edit") && ne < 4) edits[ne++] = h; else if (!strcmp(c, "Button") && !strcmp(t, "Check !")) btn = h;
    else if (!strcmp(c, "Static") && ns < 8) stat[ns++] = h; return TRUE; }
static int y(HWND h) { RECT r; GetWindowRect(h, &r); return r.top; }
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { DWORD p; char t[256], c[64]; GetWindowThreadProcessId(h, &p); GetClassNameA(h, c, 64);
    if (p == pid && h != form && IsWindowVisible(h) && !strcmp(c, "#32770")) { GetWindowTextA(h, t, sizeof t);
        printf("  MsgBox : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(int argc, char **argv) {
    int i; HWND a, b; char t[512];
    if (argc < 3) return 2;
    for (i = 0; i < 50 && !form; i++) { EnumWindows(findform, 0); if (!form) Sleep(200); }
    if (!form) { puts("fenetre introuvable"); return 1; }
    GetWindowThreadProcessId(form, &pid); EnumChildWindows(form, kids, 0);
    if (ne < 2 || !btn) { printf("controles introuvables (%d edits)\n", ne); return 1; }
    a = edits[0]; b = edits[1]; if (y(a) > y(b)) { HWND x = a; a = b; b = x; }
    SendMessageA(a, WM_SETTEXT, 0, (LPARAM)argv[1]); SendMessageA(b, WM_SETTEXT, 0, (LPARAM)argv[2]);
    PostMessageA(btn, BM_CLICK, 0, 0);
    Sleep(2500);
    for (i = 0; i < ns; i++) { GetWindowTextA(stat[i], t, sizeof t); if (strstr(t, "!") || strstr(t, "serial") || strstr(t, "nuts") || strstr(t, "char"))
        printf("  Status : %s\n", t); }
    EnumWindows(top, 0);
    return 0;
}
