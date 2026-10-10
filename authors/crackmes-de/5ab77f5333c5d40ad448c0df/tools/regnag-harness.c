#include <windows.h>
#include <stdio.h>
static DWORD pid;
static BOOL CALLBACK ch(HWND h,LPARAM l){char c[64],t[512];GetClassNameA(h,c,64);GetWindowTextA(h,t,512);if(t[0])printf("  [%s] %s\n",c,t);return TRUE;}
static BOOL CALLBACK top(HWND h,LPARAM l){DWORD p;GetWindowThreadProcessId(h,&p);if(p==pid&&1){char t[256];GetWindowTextA(h,t,256);printf("MSGBOX title=%s\n",t);EnumChildWindows(h,ch,0);PostMessageA(h,WM_COMMAND,IDOK,0);PostMessageA(h,WM_CLOSE,0,0);*(int*)l=1;}return TRUE;}
int main(int c,char**v){setvbuf(stdout,0,_IONBF,0);
 CreateWindowA("STATIC","RegNag",0,0,0,10,10,0,0,0,0);
 STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 si.dwFlags=STARTF_USESTDHANDLES;si.hStdInput=GetStdHandle(STD_INPUT_HANDLE);si.hStdOutput=GetStdHandle(STD_OUTPUT_HANDLE);si.hStdError=si.hStdOutput;
 if(!CreateProcessA(v[1],0,0,0,TRUE,0,0,0,&si,&pi)){printf("CP fail\n");return 1;}
 pid=pi.dwProcessId;
 for(int i=0;i<200;i++){MSG m;while(PeekMessageA(&m,0,0,0,PM_REMOVE))DispatchMessageA(&m);int f=0;EnumWindows(top,(LPARAM)&f);if(WaitForSingleObject(pi.hProcess,100)==0)break;Sleep(f?300:0);}
 TerminateProcess(pi.hProcess,0);fflush(stdout);return 0;}
