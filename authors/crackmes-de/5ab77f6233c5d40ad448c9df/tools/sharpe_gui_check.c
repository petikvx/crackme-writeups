#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    if (argc<3) return 1;
    Sleep(1500);
    HWND dlg=NULL,w=GetTopWindow(NULL);
    while (w) {
        char t[256]; GetWindowTextA(w,t,sizeof t);
        if (strstr(t,"Crackme")||strstr(t,"sharpe")||strstr(t,"#2")) { dlg=w; break; }
        w=GetWindow(w,GW_HWNDNEXT);
    }
    if (!dlg) {
      /* any dialog with 2 edits */
      w=GetTopWindow(NULL);
      while (w) {
        int edits=0; HWND c=FindWindowExA(w,NULL,"Edit",NULL);
        while (c){edits++; c=FindWindowExA(w,c,"Edit",NULL);}
        if (edits>=2){dlg=w; break;}
        w=GetWindow(w,GW_HWNDNEXT);
      }
    }
    if (!dlg){printf("NO_DLG\n"); return 2;}
    char t[128]; GetWindowTextA(dlg,t,sizeof t); printf("DLG='%s'\n",t);
    HWND e1=FindWindowExA(dlg,NULL,"Edit",NULL);
    HWND e2=FindWindowExA(dlg,e1,"Edit",NULL);
    SetWindowTextA(e1, argv[1]);
    SetWindowTextA(e2, argv[2]);
    PostMessageA(dlg, WM_COMMAND, MAKEWPARAM(0x3EC, BN_CLICKED), 0);
    HWND mb=NULL;
    for (int i=0;i<50&&!mb;i++) {
        Sleep(100);
        w=GetTopWindow(NULL);
        while (w) {
            char cls[64],m[256];
            GetClassNameA(w,cls,sizeof cls);
            if (!strcmp(cls,"#32770")&&w!=dlg) {
                HWND st=FindWindowExA(w,NULL,"Static",NULL);
                while (st) {
                    GetWindowTextA(st,m,sizeof m);
                    if (strstr(m,"Congratulations")||strstr(m,"Sorry")||strstr(m,"incorrect")||strstr(m,"valid")) {
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
