#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    if (argc<3) return 1;
    const char *name = argv[1], *serial = argv[2];
    Sleep(1500);
    HWND dlg=NULL, w=GetTopWindow(NULL);
    while (w) {
        char t[256]; GetWindowTextA(w,t,sizeof t);
        if (strstr(t, "keygen") || strstr(t, "Keygen") || strstr(t, "databus") || t[0]) {
            /* prefer dialog with 2 edits */
            int edits=0; HWND c=FindWindowExA(w,NULL,"Edit",NULL);
            while (c) { edits++; c=FindWindowExA(w,c,"Edit",NULL); }
            if (edits>=2) { dlg=w; break; }
        }
        w=GetWindow(w, GW_HWNDNEXT);
    }
    if (!dlg) { printf("NO_DLG\n"); return 2; }
    char t[128]; GetWindowTextA(dlg,t,sizeof t); printf("DLG='%s'\n", t);
    HWND e1=FindWindowExA(dlg,NULL,"Edit",NULL);
    HWND e2=FindWindowExA(dlg,e1,"Edit",NULL);
    HWND btn=FindWindowExA(dlg,NULL,"Button",NULL);
    printf("e1=%p e2=%p btn=%p\n", e1,e2,btn);
    SetWindowTextA(e1, name);
    SetWindowTextA(e2, serial);
    /* try first button as Check - may need ID 0x3eb */
    PostMessageA(dlg, WM_COMMAND, MAKEWPARAM(0x3EB, BN_CLICKED), (LPARAM)btn);
    HWND mb=NULL;
    for (int i=0;i<50 && !mb;i++) {
        Sleep(100);
        w=GetTopWindow(NULL);
        while (w) {
            char cls[64], m[256];
            GetClassNameA(w,cls,sizeof cls);
            if (!strcmp(cls,"#32770") && w!=dlg) {
                HWND st=FindWindowExA(w,NULL,"Static",NULL);
                while (st) {
                    GetWindowTextA(st,m,sizeof m);
                    if (m[0] && (strstr(m,"Good")||strstr(m,"Wrong")||strstr(m,"job")||strstr(m,"serial"))) {
                        printf("MSG=%s\n", m); mb=w; break;
                    }
                    st=FindWindowExA(w,st,"Static",NULL);
                }
            }
            if (mb) break;
            w=GetWindow(w, GW_HWNDNEXT);
        }
    }
    if (!mb) printf("NO_MSGBOX\n");
    else PostMessageA(mb, WM_COMMAND, IDOK, 0);
    PostMessageA(dlg, WM_CLOSE, 0, 0);
    return mb && strstr("x","x") ? 0 : 4;
}
