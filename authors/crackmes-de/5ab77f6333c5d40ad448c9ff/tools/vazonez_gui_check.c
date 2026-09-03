#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    if (argc<2) return 1;
    Sleep(1500);
    HWND dlg=NULL,w=GetTopWindow(NULL);
    while (w) {
        char t[256]; GetWindowTextA(w,t,sizeof t);
        if (strstr(t,"VaZoNeZ")||strstr(t,"CrackMe")||strstr(t,"crackme")) { dlg=w; break; }
        w=GetWindow(w,GW_HWNDNEXT);
    }
    if (!dlg) { printf("NO_DLG\n"); return 2; }
    char t[128]; GetWindowTextA(dlg,t,sizeof t); printf("DLG='%s'\n",t);
    HWND edit=FindWindowExA(dlg,NULL,"Edit",NULL);
    HWND btn=FindWindowExA(dlg,NULL,"Button",NULL);
    /* find Check button - ID 0x3e8 from disasm */
    SetWindowTextA(edit, argv[1]);
    PostMessageA(dlg, WM_COMMAND, MAKEWPARAM(0x3E8, BN_CLICKED), (LPARAM)btn);
    HWND mb=NULL;
    for (int i=0;i<50&&!mb;i++) {
        Sleep(100);
        w=GetTopWindow(NULL);
        while (w) {
            char cls[64],m[256];
            GetClassNameA(w,cls,sizeof cls);
            if (!strcmp(cls,"#32770") && w!=dlg) {
                HWND st=FindWindowExA(w,NULL,"Static",NULL);
                while (st) {
                    GetWindowTextA(st,m,sizeof m);
                    if (strstr(m,"Rigth")||strstr(m,"Wrong")||strstr(m,"3RR0R")||strstr(m,"number")||strstr(m,"C0d3")) {
                        printf("MSG=%s\n",m); mb=w; break;
                    }
                    st=FindWindowExA(w,st,"Static",NULL);
                }
            }
            if (mb) break;
            w=GetWindow(w,GW_HWNDNEXT);
        }
    }
    if (!mb) printf("NO_MSGBOX\n");
    else PostMessageA(mb,WM_COMMAND,IDOK,0);
    PostMessageA(dlg,WM_CLOSE,0,0);
    return 0;
}
