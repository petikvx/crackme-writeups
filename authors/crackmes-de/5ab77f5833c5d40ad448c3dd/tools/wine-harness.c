/* Harness Wine : lance keygenmy.exe, remplit name (0x3E8) et serial (0x3E9), simule le clic
   sur le bouton Check (WM_COMMAND 0x3EA) puis dumpe les fenêtres du process (MessageBox).
   Build : i686-w64-mingw32-gcc -o /tmp/harness.exe tools/wine-harness.c -luser32
   Usage : xvfb-run -a wine /tmp/harness.exe <keygenmy.exe> <name> <serial> */
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
    /* entry : "and eax,0xff0000" suppose eax = entry point (XP) pour obtenir hInstance=0x400000 */
    CONTEXT cx; cx.ContextFlags=CONTEXT_FULL; GetThreadContext(pi.hThread,&cx);
    cx.Eax=0x4010a3; cx.Eip=0x4010a3; SetThreadContext(pi.hThread,&cx);
    ResumeThread(pi.hThread); Sleep(3000);
    HWND dlg=NULL,w=NULL;
    while((w=FindWindowExA(NULL,w,NULL,NULL))){DWORD p;GetWindowThreadProcessId(w,&p);
        if(p==pid && GetDlgItem(w,0x3E8)){dlg=w;break;}}
    if(!dlg){puts("no dialog");TerminateProcess(pi.hProcess,0);return 2;}
    DWORD_PTR r;
    SendMessageTimeoutA(GetDlgItem(dlg,0x3E8),WM_SETTEXT,0,(LPARAM)argv[2],SMTO_ABORTIFHUNG,3000,&r);
    SendMessageTimeoutA(GetDlgItem(dlg,0x3E9),WM_SETTEXT,0,(LPARAM)argv[3],SMTO_ABORTIFHUNG,3000,&r);
    {char b[100]; GetDlgItemTextA(dlg,0x3E8,b,100); printf("name readback=[%s] r=%d\n",b,(int)r); GetDlgItemTextA(dlg,0x3E9,b,100); printf("serial readback=[%s]\n",b);}
    PostMessageA(dlg,WM_COMMAND,0x3EA,(LPARAM)GetDlgItem(dlg,0x3EA));
    Sleep(1500);
    puts("--- apres clic Check ---"); EnumWindows(en,0);
    TerminateProcess(pi.hProcess,0); return 0;
}
