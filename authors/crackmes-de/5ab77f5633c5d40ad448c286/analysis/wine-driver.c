#include <windows.h>
#include <stdio.h>
#include <string.h>
static char found[256];
BOOL CALLBACK ec(HWND h,LPARAM l){char c[64],t[256];GetClassNameA(h,c,64);GetWindowTextA(h,t,256);if(!strcmp(c,"Static")&&t[0])strcpy(found,t);return TRUE;}
int main(int argc,char**argv){STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 CreateProcessA(argv[1],0,0,0,0,0,0,0,&si,&pi);WaitForInputIdle(pi.hProcess,5000);
 HWND w=0;for(int i=0;i<50&&!w;i++){Sleep(100);w=FindWindowA("#32770","Register HyperCrackMe3!!!!!");}
 if(!w){puts("no window");return 2;}
 SetDlgItemTextA(w,101,argv[2]);SetDlgItemTextA(w,102,argv[3]);
 PostMessageA(w,WM_COMMAND,MAKEWPARAM(1,BN_CLICKED),(LPARAM)GetDlgItem(w,1));
 HWND mb=0;for(int i=0;i<30&&!mb;i++){Sleep(100);HWND x=0;while((x=FindWindowExA(0,x,"#32770",0))){DWORD p;GetWindowThreadProcessId(x,&p);if(x!=w&&p==pi.dwProcessId){mb=x;break;}}}
 if(mb){char t[128];GetWindowTextA(mb,t,128);EnumChildWindows(mb,ec,0);printf("name='%s' serial='%s' -> msgbox '%s': '%s'\n",argv[2],argv[3],t,found);}
 else printf("name='%s' serial='%s' -> no msgbox\n",argv[2],argv[3]);
 TerminateProcess(pi.hProcess,0);return strstr(found,"Congrats")?0:1;}
