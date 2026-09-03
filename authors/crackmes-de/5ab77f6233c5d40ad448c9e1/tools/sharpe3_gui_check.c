#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    Sleep(1500);
    HWND w=GetTopWindow(NULL), dlg=NULL;
    while (w) { char t[256]; GetWindowTextA(w,t,sizeof t); if (strstr(t,"#3")){dlg=w;break;} w=GetWindow(w,GW_HWNDNEXT); }
    if(!dlg){printf("NO\n");return 1;}
    HWND e1=FindWindowExA(dlg,NULL,"Edit",NULL);
    HWND e2=FindWindowExA(dlg,e1,"Edit",NULL);
    HWND btn=NULL,c=FindWindowExA(dlg,NULL,"Button",NULL);
    while(c){char t[64];GetWindowTextA(c,t,sizeof t); if(strstr(t,"Check"))btn=c; c=FindWindowExA(dlg,c,"Button",NULL);}
    SetWindowTextA(e1, argv[1]); SetWindowTextA(e2, argv[2]);
    PostMessageA(btn, BM_CLICK, 0, 0);
    for(int i=0;i<50;i++){
      Sleep(100);
      w=GetTopWindow(NULL);
      while(w){
        char cls[64],title[128],m[256];
        GetClassNameA(w,cls,sizeof cls); GetWindowTextA(w,title,sizeof title);
        if(!strcmp(cls,"#32770")&&w!=dlg){
          if(strstr(title,"Congrat")||strstr(title,"Error")) {
            printf("TITLE=%s\n", title);
            HWND st=FindWindowExA(w,NULL,"Static",NULL);
            while(st){GetWindowTextA(st,m,sizeof m); if(m[0]) printf("TEXT=%s\n",m); st=FindWindowExA(w,st,"Static",NULL);}
            PostMessageA(w,WM_COMMAND,IDOK,0); PostMessageA(dlg,WM_CLOSE,0,0); return 0;
          }
        }
        w=GetWindow(w,GW_HWNDNEXT);
      }
    }
    printf("TIMEOUT\n"); return 1;
}
