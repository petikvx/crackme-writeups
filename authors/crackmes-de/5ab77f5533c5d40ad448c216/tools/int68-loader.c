/* int68-loader.c — lance original/Small.exe sous un mini-debugger Win32 (sans patcher le binaire) :
   le test anti-SoftICE « mov ah,43h ; int 68h » (0x401041) lève un #GP / access violation sur NT/wine
   (pas de handler SEH -> crash). Sur cette exception à 0x401043 on saute les 2 octets du int (EIP+=2),
   ax reste 0x4300 != 0xF386 => chemin « pas de debugger SoftICE », comme un Win9x sans SoftICE.
   i686-w64-mingw32-gcc -O2 -o int68-loader.exe int68-loader.c      usage : wine int68-loader.exe a.exe */
#include <windows.h>
#include <stdio.h>
int main(int argc, char **argv) {
    STARTUPINFOA si = { sizeof si }; PROCESS_INFORMATION pi; DEBUG_EVENT ev;
    if (!CreateProcessA(argv[1], NULL, NULL, NULL, FALSE, DEBUG_ONLY_THIS_PROCESS, NULL, NULL, &si, &pi)) return 1;
    for (;;) {
        DWORD st = DBG_CONTINUE;
        WaitForDebugEvent(&ev, INFINITE);
        if (ev.dwDebugEventCode == EXCEPTION_DEBUG_EVENT) {
            EXCEPTION_RECORD *er = &ev.u.Exception.ExceptionRecord;
            if ((DWORD)er->ExceptionAddress == 0x401043) {
                HANDLE th = OpenThread(THREAD_ALL_ACCESS, FALSE, ev.dwThreadId); CONTEXT c; c.ContextFlags = CONTEXT_FULL;
                GetThreadContext(th, &c); c.Eip += 2; SetThreadContext(th, &c); CloseHandle(th);
                fprintf(stderr, "[loader] int 68h @401043 saute (eax=%08lx)\n", c.Eax);
            } else if (er->ExceptionCode != EXCEPTION_BREAKPOINT) st = DBG_EXCEPTION_NOT_HANDLED;
        } else if (ev.dwDebugEventCode == EXIT_PROCESS_DEBUG_EVENT) break;
        ContinueDebugEvent(ev.dwProcessId, ev.dwThreadId, st);
    }
    return 0;
}
