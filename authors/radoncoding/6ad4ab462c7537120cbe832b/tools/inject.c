// Lance le crackme dans la console courante et y injecte des clics souris (WriteConsoleInput).
// usage: inject.exe <exe> <delay_ms> col,row col,row ...   (coordonnées 0-based, cellule console)
#include <windows.h>
#include <tlhelp32.h>
#include <stdio.h>
#include <stdlib.h>
static void dump(const char *path, const char *tag) {
    HANDLE o = CreateFileA("CONOUT$", GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    CONSOLE_SCREEN_BUFFER_INFO ci; GetConsoleScreenBufferInfo(o, &ci);
    FILE *f = fopen(path, "ab"); fprintf(f, "== %s (win top=%d bot=%d buf=%dx%d)\n", tag, ci.srWindow.Top, ci.srWindow.Bottom, ci.dwSize.X, ci.dwSize.Y);
    for (int y = 0; y < 18; y++) {
        WCHAR b[120]; DWORD n; COORD c = {0, ci.srWindow.Top + y};
        ReadConsoleOutputCharacterW(o, b, 40, c, &n);
        char u[400]; int l = WideCharToMultiByte(CP_UTF8, 0, b, n, u, sizeof u, NULL, NULL);
        fwrite(u, 1, l, f); fputc('\n', f);
    }
    fclose(f); CloseHandle(o);
}
int main(int argc, char **argv) {
    STARTUPINFOA si = {sizeof si}; PROCESS_INFORMATION pi;
    if (argv[1][0] == '@') { // @nom.exe : s'attache à la console d'un process déjà lancé
        Sleep(atoi(argv[2]));
        DWORD target = 0; PROCESSENTRY32 pe = {sizeof pe};
        HANDLE sn = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
        for (BOOL ok = Process32First(sn, &pe); ok; ok = Process32Next(sn, &pe))
            if (!lstrcmpiA(pe.szExeFile, argv[1] + 1)) target = pe.th32ProcessID;
        FreeConsole();
        if (!target || !AttachConsole(target)) { FILE *lf = fopen("Z:\\tmp\\inject.log", "a"); fprintf(lf, "attach failed target=%lu err=%lu\n", target, GetLastError()); fclose(lf); return 2; }
        pi.hProcess = NULL;
    } else {
    if (!CreateProcessA(argv[1], NULL, NULL, NULL, TRUE, 0, NULL, NULL, &si, &pi)) return 1;
    Sleep(atoi(argv[2])); }
    HANDLE in = CreateFileA("CONIN$", GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    DWORD m; GetConsoleMode(in, &m);
    SetConsoleMode(in, m | ENABLE_MOUSE_INPUT | ENABLE_EXTENDED_FLAGS);
    for (int i = 3; i < argc; i++) {
        int x, y; DWORD n;
        if (argv[i][0] == 'K') { // K<vk hex> : touche virtuelle
            INPUT_RECORD r[2] = {0}; int vk = strtol(argv[i]+1, NULL, 16);
            for (int d = 0; d < 2; d++) { r[d].EventType = KEY_EVENT; r[d].Event.KeyEvent.bKeyDown = !d; r[d].Event.KeyEvent.wRepeatCount = 1; r[d].Event.KeyEvent.wVirtualKeyCode = vk; r[d].Event.KeyEvent.wVirtualScanCode = MapVirtualKeyA(vk, 0); }
            WriteConsoleInputA(in, r, 2, &n);
        } else if (argv[i][0] == 'k') { // k<char> : touche
            INPUT_RECORD r[2] = {0};
            for (int d = 0; d < 2; d++) { r[d].EventType = KEY_EVENT; r[d].Event.KeyEvent.bKeyDown = !d; r[d].Event.KeyEvent.wRepeatCount = 1;
                r[d].Event.KeyEvent.uChar.AsciiChar = argv[i][1]; r[d].Event.KeyEvent.wVirtualKeyCode = argv[i][1] & 0x5f; }
            WriteConsoleInputA(in, r, 2, &n);
        } else {
            sscanf(argv[i], "%d,%d", &x, &y);
            INPUT_RECORD r[3] = {0};
            for (int d = 0; d < 3; d++) { r[d].EventType = MOUSE_EVENT;
                r[d].Event.MouseEvent.dwMousePosition.X = x; r[d].Event.MouseEvent.dwMousePosition.Y = y;
                r[d].Event.MouseEvent.dwButtonState = d == 1 ? (getenv("BTN") ? atoi(getenv("BTN")) : FROM_LEFT_1ST_BUTTON_PRESSED) : 0;
                r[d].Event.MouseEvent.dwEventFlags = d == 0 ? MOUSE_MOVED : 0; }
            WriteConsoleInputA(in, r, 3, &n);
        }
        { DWORD q = 0; GetNumberOfConsoleInputEvents(in, &q); FILE *lf = fopen("Z:\\tmp\\inject.log", "a"); fprintf(lf, "%s queue=%lu mode=%lx\n", argv[i], q, m); fclose(lf); }
        Sleep(getenv("STEP") ? atoi(getenv("STEP")) : 1500);
    }
    Sleep(3000);
    if (pi.hProcess) TerminateProcess(pi.hProcess, 0);
    return 0;
}
