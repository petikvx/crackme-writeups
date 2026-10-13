/* Driver Wine : crackme_2 by cobrasniper555 — ferme l'avertissement « trial »,
   ouvre Register (menu 0x69), remplit nom (0x6a) / serial (0x6b), clique 0x6e,
   lit la MessageBox « Alert ». Nettoie HKCU\Software\Cobra avant/après. */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static char found[256];
static BOOL CALLBACK ec(HWND h, LPARAM l){char c[64],t[256];GetClassNameA(h,c,64);GetWindowTextA(h,t,256);
  if(!strcmp(c,"Static")&&t[0])strcpy(found,t);return TRUE;}
static HWND procdlg(DWORD pid, HWND skip){HWND x=0;while((x=FindWindowExA(0,x,"#32770",0))){DWORD p;
  GetWindowThreadProcessId(x,&p);if(p==pid&&x!=skip&&IsWindowVisible(x))return x;}return 0;}
int main(int argc,char**argv){
  if(argc<4){puts("usage: verify-live Test.exe name serial");return 3;}
  RegDeleteKeyA(HKEY_CURRENT_USER,"Software\\Cobra");
  STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
  if(!CreateProcessA(argv[1],0,0,0,0,0,0,0,&si,&pi)){puts("CreateProcess failed");return 2;}
  HWND mb=0;for(int i=0;i<50&&!mb;i++){Sleep(100);mb=procdlg(pi.dwProcessId,0);}
  if(mb){char t[64];GetWindowTextA(mb,t,64);printf("[*] popup initiale '%s' -> OK\n",t);
    PostMessageA(mb,WM_COMMAND,MAKEWPARAM(IDOK,BN_CLICKED),(LPARAM)GetDlgItem(mb,IDOK));}
  HWND w=0;for(int i=0;i<50&&!w;i++){Sleep(100);w=FindWindowA("WindowsApp",0);}
  if(!w){puts("no main window");TerminateProcess(pi.hProcess,0);return 2;}
  PostMessageA(w,WM_COMMAND,MAKEWPARAM(0x69,0),0);
  HWND d=0;for(int i=0;i<50&&!d;i++){Sleep(100);d=procdlg(pi.dwProcessId,0);}
  if(!d){puts("no register dialog");TerminateProcess(pi.hProcess,0);return 2;}
  SetDlgItemTextA(d,0x6a,argv[2]);SetDlgItemTextA(d,0x6b,argv[3]);
  PostMessageA(d,WM_COMMAND,MAKEWPARAM(0x6e,BN_CLICKED),(LPARAM)GetDlgItem(d,0x6e));
  HWND r=0;for(int i=0;i<50&&!r;i++){Sleep(100);r=procdlg(pi.dwProcessId,d);}
  int ok=0;
  if(r){char t[64];GetWindowTextA(r,t,64);EnumChildWindows(r,ec,0);
    printf("name='%s' serial='%s' -> msgbox '%s': '%s'\n",argv[2],argv[3],t,found);ok=strstr(found,"registered")!=0;}
  else printf("name='%s' serial='%s' -> no msgbox\n",argv[2],argv[3]);
  TerminateProcess(pi.hProcess,0);
  RegDeleteKeyA(HKEY_CURRENT_USER,"Software\\Cobra");
  return ok?0:1;}
