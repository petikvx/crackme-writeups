/* Harness Wine : lance serialme.exe, injecte le serial dans l'edit 0x3E8 (WM_SETTEXT -> EN_CHANGE),
   puis dumpe le texte de l'edit 0x3EB et les fenêtres top-level du process (MessageBox).
   Build : i686-w64-mingw32-gcc -o /tmp/harness.exe tools/wine-harness.c -luser32
   Usage : xvfb-run -a wine /tmp/harness.exe <serialme.exe> <serial> */
#include <windows.h>
#include <stdio.h>
static DWORD pid;
static BOOL CALLBACK en(HWND h, LPARAM l){
    DWORD p; GetWindowThreadProcessId(h,&p);
    if(p!=pid) return TRUE;
    char t[512]="",c[64]=""; GetWindowTextA(h,t,sizeof t); GetClassNameA(h,c,sizeof c);
    printf("WIN class=%s title=[%s]\n",c,t);
    char ct[512]; HWND ch=GetWindow(h,GW_CHILD);
    for(;ch;ch=GetWindow(ch,GW_HWNDNEXT)){ ct[0]=0; GetWindowTextA(ch,ct,sizeof ct);
        printf("   child id=%d text=[%s]\n",GetDlgCtrlID(ch),ct);}
    return TRUE;
}
int main(int argc,char**argv){
    STARTUPINFOA si={sizeof si}; PROCESS_INFORMATION pi;
    if(!CreateProcessA(argv[1],NULL,0,0,0,CREATE_SUSPENDED,0,0,&si,&pi)) return 1;
    pid=pi.dwProcessId;
    /* Le binaire fait "and eax,0xff0000" à l'entry en supposant eax = entry point (comportement XP)
       pour obtenir hInstance=0x400000 : on rétablit ce contexte. */
    CONTEXT cx; cx.ContextFlags=CONTEXT_FULL; GetThreadContext(pi.hThread,&cx);
    printf("ctx eax=%08lx eip=%08lx\n",cx.Eax,cx.Eip);
    cx.Eax=0x4010a3; cx.Eip=0x4010a3; SetThreadContext(pi.hThread,&cx);
    ResumeThread(pi.hThread); Sleep(3000);
    HWND dlg=0; 
    struct{HWND h;} d={0};
    EnumWindows(en,0);
    /* trouve la fenêtre principale (celle qui a l'enfant 0x3E8) */
    HWND w=NULL; while((w=FindWindowExA(NULL,w,NULL,NULL))){DWORD p;GetWindowThreadProcessId(w,&p);
        if(p==pid && GetDlgItem(w,0x3E8)){dlg=w;break;}}
    if(!dlg){puts("no dialog");TerminateProcess(pi.hProcess,0);return 2;}
    DWORD_PTR r;
    SendMessageTimeoutA(GetDlgItem(dlg,0x3E8),WM_SETTEXT,0,(LPARAM)argv[2],SMTO_ABORTIFHUNG,3000,&r);
    Sleep(1500);
    puts("--- apres injection ---"); EnumWindows(en,0);
    TerminateProcess(pi.hProcess,0); return 0;
}
