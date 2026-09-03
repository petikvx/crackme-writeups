#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    if (argc<3) return 1;
    const char *needle = argv[1];
    const char *code = argv[2];
    Sleep(1500);
    HWND dlg = NULL, w = GetTopWindow(NULL);
    while (w) {
        char t[256]; GetWindowTextA(w, t, sizeof t);
        if (t[0] && strstr(t, needle)) { dlg = w; break; }
        w = GetWindow(w, GW_HWNDNEXT);
    }
    if (!dlg) { printf("NO_DLG\n"); return 2; }
    char t[128]; GetWindowTextA(dlg,t,sizeof t); printf("DLG='%s'\n", t);
    HWND edit = FindWindowExA(dlg, NULL, "Edit", NULL);
    HWND btn = FindWindowExA(dlg, NULL, "Button", NULL);
    if (!edit || !btn) { printf("no controls\n"); return 3; }
    SetWindowTextA(edit, code);
    PostMessageA(btn, BM_CLICK, 0, 0);
    /* wait for messagebox */
    HWND mb = NULL;
    for (int i=0;i<50 && !mb;i++) {
        Sleep(100);
        w = GetTopWindow(NULL);
        while (w) {
            char cls[64], m[256];
            GetClassNameA(w, cls, sizeof cls);
            if (!strcmp(cls, "#32770") && w != dlg) {
                HWND st = FindWindowExA(w, NULL, "Static", NULL);
                while (st) {
                    GetWindowTextA(st, m, sizeof m);
                    if (strstr(m, "Success") || strstr(m, "Sorry") || strstr(m, "Thank") || strstr(m, "wrong")) {
                        printf("MSG=%s\n", m);
                        mb = w; break;
                    }
                    st = FindWindowExA(w, st, "Static", NULL);
                }
            }
            if (mb) break;
            w = GetWindow(w, GW_HWNDNEXT);
        }
    }
    if (!mb) printf("NO_MSGBOX\n");
    else PostMessageA(mb, WM_COMMAND, IDOK, 0);
    Sleep(200);
    PostMessageA(dlg, WM_CLOSE, 0, 0);
    return mb ? 0 : 4;
}
