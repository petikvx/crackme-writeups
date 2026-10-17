#include <windows.h>
#include <stdio.h>
/* Harnais : lance KeyGenMe.exe sous débogueur, int3 sur 0x46723E (jne après LStrCmp),
   tape le serial via WM_SETTEXT + BM_CLICK, lit ZF et la chaîne attendue (EDX à 0x467239). */
static HWND ed,btn; static char *ser;
BOOL CALLBACK ch(HWND h,LPARAM l){char c[64],t[64];GetClassNameA(h,c,64);GetWindowTextA(h,t,64);
 if(!strcmp(c,"TEdit"))ed=h; if(!strcmp(c,"TButton")&&!strcmp(t,"Enter"))btn=h;return TRUE;}
DWORD WINAPI drv(LPVOID p){HWND w=0;for(int i=0;i<200&&!w;i++){Sleep(100);w=FindWindowA("TKeyGenME",NULL);}
 if(!w){puts("no win");ExitProcess(2);} Sleep(300);EnumChildWindows(w,ch,0);
 SendMessageA(ed,WM_SETTEXT,0,(LPARAM)ser);PostMessageA(btn,BM_CLICK,0,0);return 0;}
int main(int argc,char**argv){ser=argv[2];STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 CreateProcessA(NULL,argv[1],NULL,NULL,0,DEBUG_ONLY_THIS_PROCESS,NULL,NULL,&si,&pi);
 DEBUG_EVENT e;BYTE orig[2],cc=0xCC;SIZE_T n;DWORD A=0x467239,B=0x46723E;int first=1;
 CreateThread(0,0,drv,0,0,0);
 for(;;){WaitForDebugEvent(&e,INFINITE);DWORD st=DBG_CONTINUE;
  if(e.dwDebugEventCode==CREATE_PROCESS_DEBUG_EVENT){ReadProcessMemory(pi.hProcess,(LPVOID)A,&orig[0],1,&n);ReadProcessMemory(pi.hProcess,(LPVOID)B,&orig[1],1,&n);
   WriteProcessMemory(pi.hProcess,(LPVOID)A,&cc,1,&n);WriteProcessMemory(pi.hProcess,(LPVOID)B,&cc,1,&n);}
  else if(e.dwDebugEventCode==EXCEPTION_DEBUG_EVENT){DWORD ad=(DWORD)e.u.Exception.ExceptionRecord.ExceptionAddress;
   if(e.u.Exception.ExceptionRecord.ExceptionCode==EXCEPTION_BREAKPOINT&&(ad==A||ad==B)){
    HANDLE th=OpenThread(THREAD_ALL_ACCESS,0,e.dwThreadId);CONTEXT c;c.ContextFlags=CONTEXT_FULL;GetThreadContext(th,&c);
    c.Eip=ad;WriteProcessMemory(pi.hProcess,(LPVOID)ad,ad==A?&orig[0]:&orig[1],1,&n);
    if(ad==A){char s1[128]={0},s2[128]={0};ReadProcessMemory(pi.hProcess,(LPVOID)c.Eax,s1,127,&n);ReadProcessMemory(pi.hProcess,(LPVOID)c.Edx,s2,127,&n);printf("entered=[%s] expected=[%s]\n",s1,s2);}
    else{printf("ZF=%d -> %s\n",(c.EFlags>>6)&1,((c.EFlags>>6)&1)?"You crack Me":"Try again");SetThreadContext(th,&c);TerminateProcess(pi.hProcess,0);return 0;}
    SetThreadContext(th,&c);CloseHandle(th);}
   else if(!e.u.Exception.dwFirstChance||e.u.Exception.ExceptionRecord.ExceptionCode!=EXCEPTION_BREAKPOINT) st=DBG_EXCEPTION_NOT_HANDLED;}
  else if(e.dwDebugEventCode==EXIT_PROCESS_DEBUG_EVENT){puts("exited");return 1;}
  ContinueDebugEvent(e.dwProcessId,e.dwThreadId,st);}}
