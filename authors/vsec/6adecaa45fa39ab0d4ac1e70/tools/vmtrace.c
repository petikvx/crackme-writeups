// Traceur Win32 (à lancer sous Wine) : CreateProcess(DEBUG_ONLY_THIS_PROCESS) + int3 logiques
// sur les fonctions utiles de Pafet_Challenge.exe ; le debuggee hérite de la console (saisie normale).
// Build : x86_64-w64-mingw32-gcc -O2 -o vmtrace.exe vmtrace.c
// Run   : wine vmtrace.exe Z:\...\Pafet_Challenge.exe > trace.txt   (taper username puis serial)
#include <windows.h>
#include <stdio.h>
#include <string.h>

typedef struct { ULONGLONG addr; const char *name; unsigned char orig; } bp_t;
static bp_t bps[] = {
    {0x140396990ULL, "VMOP", 0},       // sub_140396990(closure, op, args)
    {0x140380840ULL, "STR", 0},        // décodeur de chaînes
    {0x1402831C0ULL, "SHA256", 0},     // sha256 hex (out=rcx, in=rdx)
    {0x14039BD20ULL, "GETLINE?", 0},
};
#define NB (sizeof(bps) / sizeof(bps[0]))
static HANDLE hp;
static FILE *lg;

static int rd(ULONGLONG a, void *b, SIZE_T n) { SIZE_T r; return ReadProcessMemory(hp, (LPCVOID)a, b, n, &r) && r == n; }

static void dump_str(ULONGLONG p, char *out, size_t outsz) {
    unsigned char s[32];
    out[0] = 0;
    if (!rd(p, s, 32)) return;
    ULONGLONG size = *(ULONGLONG *)(s + 16), cap = *(ULONGLONG *)(s + 24);
    if (cap < 15 || cap > 0x100000 || size > cap || size == 0) return;
    ULONGLONG data = cap >= 16 ? *(ULONGLONG *)s : p;
    size_t n = size > outsz - 1 ? outsz - 1 : size;
    if (!rd(data, out, n)) { out[0] = 0; return; }
    out[n] = 0;
    int printable = 1;
    for (size_t i = 0; i < n; i++) if ((unsigned char)out[i] < 32 || (unsigned char)out[i] > 126) printable = 0;
    if (!printable) {   // binaire : hex, préfixé par '#'
        static char hx[600];
        size_t k = 0;
        hx[k++] = '#';
        for (size_t i = 0; i < n && k + 3 < sizeof hx; i++) k += sprintf(hx + k, "%02x", (unsigned char)out[i]);
        hx[k] = 0;
        strncpy(out, hx, outsz - 1); out[outsz - 1] = 0;
    }
}

static int force8;

static void on_hit(int idx, CONTEXT *c) {
    char tmp[1024];
    if (idx == 0) {
        fprintf(lg, "VM op=%u closure=%llx", (unsigned)c->Rdx, c->Rcx);
        for (int i = 0; i < 10; i++) {
            ULONGLONG p;
            if (!rd(c->Rcx + 8 * i, &p, 8)) continue;
            dump_str(p, tmp, sizeof tmp);
            if (tmp[0]) fprintf(lg, " [%d]=\"%s\"", i, tmp);
        }
        fprintf(lg, "\n");
        if (force8 && (unsigned)c->Rdx == 8) {   // option : force « username OK » (op8 renvoie 0)
            ULONGLONG ra;
            rd(c->Rsp, &ra, 8);
            c->Rax = 0; c->Rip = ra; c->Rsp += 8;
            fprintf(lg, "  (op8 forcé OK)\n");
        }
    } else if (idx == 1) {
        fprintf(lg, "STR idx=%u\n", (unsigned)c->Rcx);
    } else if (idx == 2) {
        dump_str(c->Rdx, tmp, sizeof tmp);
        fprintf(lg, "SHA256(\"%s\")\n", tmp);
    } else {
        fprintf(lg, "%s rcx=%llx rdx=%llx r8=%llx\n", bps[idx].name, c->Rcx, c->Rdx, c->R8);
    }
    fflush(lg);
}

int main(int argc, char **argv) {
    STARTUPINFOA si = {sizeof si};
    PROCESS_INFORMATION pi;
    force8 = getenv("FORCE8") != NULL;
    lg = fopen(argc > 2 ? argv[2] : "trace.txt", "w");
    if (!CreateProcessA(argv[1], NULL, NULL, NULL, TRUE, DEBUG_ONLY_THIS_PROCESS, NULL, NULL, &si, &pi)) {
        fprintf(stderr, "CreateProcess failed %lu\n", GetLastError());
        return 1;
    }
    hp = pi.hProcess;
    int stepping_bp = -1;
    DWORD stepping_tid = 0;
    for (;;) {
        DEBUG_EVENT ev;
        if (!WaitForDebugEvent(&ev, INFINITE)) break;
        DWORD cont = DBG_CONTINUE;
        if (ev.dwDebugEventCode == EXIT_PROCESS_DEBUG_EVENT) {
            fprintf(lg, "EXIT %lu\n", ev.u.ExitProcess.dwExitCode);
            fflush(lg);
            break;
        } else if (ev.dwDebugEventCode == CREATE_PROCESS_DEBUG_EVENT) {
            for (unsigned i = 0; i < NB; i++) {
                unsigned char cc = 0xCC;
                ReadProcessMemory(hp, (LPCVOID)bps[i].addr, &bps[i].orig, 1, NULL);
                WriteProcessMemory(hp, (LPVOID)bps[i].addr, &cc, 1, NULL);
            }
            FlushInstructionCache(hp, NULL, 0);
            CloseHandle(ev.u.CreateProcessInfo.hFile);
        } else if (ev.dwDebugEventCode == EXCEPTION_DEBUG_EVENT) {
            DWORD code = ev.u.Exception.ExceptionRecord.ExceptionCode;
            ULONGLONG a = (ULONGLONG)ev.u.Exception.ExceptionRecord.ExceptionAddress;
            HANDLE ht = OpenThread(THREAD_ALL_ACCESS, FALSE, ev.dwThreadId);
            CONTEXT c; c.ContextFlags = CONTEXT_FULL;
            if (code == EXCEPTION_BREAKPOINT) {
                int hit = -1;
                for (unsigned i = 0; i < NB; i++) if (bps[i].addr == a) hit = i;
                if (hit >= 0) {
                    GetThreadContext(ht, &c);
                    c.Rip = a;
                    on_hit(hit, &c);
                    WriteProcessMemory(hp, (LPVOID)a, &bps[hit].orig, 1, NULL);
                    if (c.Rip == a) { /* inchangé */ }
                    c.EFlags |= 0x100;
                    SetThreadContext(ht, &c);
                    stepping_bp = hit; stepping_tid = ev.dwThreadId;
                }
            } else if (code == EXCEPTION_SINGLE_STEP && stepping_bp >= 0 && ev.dwThreadId == stepping_tid) {
                unsigned char cc = 0xCC;
                WriteProcessMemory(hp, (LPVOID)bps[stepping_bp].addr, &cc, 1, NULL);
                GetThreadContext(ht, &c);
                c.EFlags &= ~0x100;
                SetThreadContext(ht, &c);
                stepping_bp = -1;
            } else {
                cont = DBG_EXCEPTION_NOT_HANDLED;
            }
            CloseHandle(ht);
        }
        ContinueDebugEvent(ev.dwProcessId, ev.dwThreadId, cont);
    }
    return 0;
}
