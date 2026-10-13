/* Driver Wine : keygenme_1 by cobrasniper555 — remplit nom (100) / serial (101),
   WM_COMMAND 102 (« Activate »), lit la MessageBox (Congrats! / Failure!). */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static char found[256];
static BOOL CALLBACK ec(HWND h, LPARAM l){char c[64],t[256];GetClassNameA(h,c,64);GetWindowTextA(h,t,256);
  if(!strcmp(c,"Static")&&t[0])strcpy(found,t);return TRUE;}
int main(int argc,char**argv){
  if(argc<4){puts("usage: verify-live Keygenme.exe name serial");return 3;}
  STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
  if(!CreateProcessA(argv[1],0,0,0,0,0,0,0,&si,&pi)){puts("CreateProcess failed");return 2;}
  HWND w=0;for(int i=0;i<50&&!w;i++){Sleep(100);w=FindWindowA("WindowsApp","Keygenme");}
  if(!w){puts("no main window");TerminateProcess(pi.hProcess,0);return 2;}
  SetDlgItemTextA(w,100,argv[2]);SetDlgItemTextA(w,101,argv[3]);
  char n[64];GetDlgItemTextA(w,100,n,64);
  PostMessageA(w,WM_COMMAND,MAKEWPARAM(102,0),(LPARAM)GetDlgItem(w,102));
  HWND r=0;for(int i=0;i<50&&!r;i++){Sleep(100);HWND x=0;while((x=FindWindowExA(0,x,"#32770",0))){DWORD p;
    GetWindowThreadProcessId(x,&p);if(p==pi.dwProcessId&&IsWindowVisible(x)){r=x;break;}}}
  int ok=0;
  if(r){char t[64];GetWindowTextA(r,t,64);EnumChildWindows(r,ec,0);
    printf("name='%s' (edit='%s') serial='%s' -> msgbox '%s': '%s'\n",argv[2],n,argv[3],t,found);ok=!strcmp(t,"Congrats!");}
  else printf("name='%s' serial='%s' -> no msgbox\n",argv[2],argv[3]);
  TerminateProcess(pi.hProcess,0);return ok?0:1;}
