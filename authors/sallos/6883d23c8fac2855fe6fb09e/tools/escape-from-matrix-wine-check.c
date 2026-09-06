/* Live UI check for escapematrix.exe under Wine.
 * Usage: wine escape-from-matrix-wine-check.exe <escapematrix.exe> <password>
 *
 * Vrai succès = MessageBox « Welcome to the real world. » (check return 0).
 * Decoy = statics « easy / truth » (check return 1) → FAIL.
 */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>

#define ID_TITLE 1001
#define ID_RED 1003
#define ID_EDIT 1004
#define ID_BANNER 1005

static volatile HWND g_dlg = NULL;
static char g_msg_caption[512];
static char g_msg_text[1024];
static volatile int g_got_msg = 0;

static BOOL CALLBACK find_dlg(HWND h, LPARAM lp)
{
    char title[256];
    GetWindowTextA(h, title, sizeof title);
    if (strstr(title, "Escape from Matrix") != NULL) {
        *(HWND *)lp = h;
        return FALSE;
    }
    return TRUE;
}

static BOOL CALLBACK find_msgbox(HWND h, LPARAM lp)
{
    char cls[64];
    char cap[512];
    GetClassNameA(h, cls, sizeof cls);
    if (strcmp(cls, "#32770") != 0)
        return TRUE;
    GetWindowTextA(h, cap, sizeof cap);
    if (strstr(cap, "Escape from Matrix") != NULL)
        return TRUE;
    {
        HWND hStatic = FindWindowExA(h, NULL, "Static", NULL);
        strncpy(g_msg_caption, cap, sizeof g_msg_caption - 1);
        if (hStatic)
            GetWindowTextA(hStatic, g_msg_text, sizeof g_msg_text);
        g_got_msg = 1;
        PostMessageA(h, WM_COMMAND, IDOK, 0);
        *(HWND *)lp = h;
        return FALSE;
    }
}

static DWORD WINAPI msg_watcher(LPVOID arg)
{
    int i;
    HWND box;
    (void)arg;
    for (i = 0; i < 200; i++) {
        box = NULL;
        EnumWindows(find_msgbox, (LPARAM)&box);
        if (g_got_msg)
            return 0;
        Sleep(25);
    }
    return 0;
}

int main(int argc, char **argv)
{
    STARTUPINFOA si;
    PROCESS_INFORMATION pi;
    HWND hDlg = NULL;
    char title[256], banner[256];
    char cmd[1024];
    int i;
    HANDLE thr;
    int ok = 0;

    if (argc < 3) {
        fprintf(stderr, "usage: %s <escapematrix.exe> <password>\n", argv[0]);
        return 2;
    }

    memset(&si, 0, sizeof si);
    si.cb = sizeof si;
    snprintf(cmd, sizeof cmd, "\"%s\"", argv[1]);
    g_msg_caption[0] = g_msg_text[0] = 0;

    if (!CreateProcessA(argv[1], cmd, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)) {
        fprintf(stderr, "CreateProcess failed %lu\n", GetLastError());
        return 1;
    }

    for (i = 0; i < 100 && hDlg == NULL; i++) {
        Sleep(50);
        EnumWindows(find_dlg, (LPARAM)&hDlg);
    }
    if (!hDlg) {
        fprintf(stderr, "dialog not found\n");
        TerminateProcess(pi.hProcess, 1);
        return 1;
    }
    g_dlg = hDlg;
    thr = CreateThread(NULL, 0, msg_watcher, NULL, 0, NULL);

    SetDlgItemTextA(hDlg, ID_EDIT, argv[2]);
    Sleep(50);
    SendMessageA(GetDlgItem(hDlg, ID_RED), BM_CLICK, 0, 0);
    Sleep(300);

    if (thr) {
        WaitForSingleObject(thr, 3000);
        CloseHandle(thr);
    }

    if (g_got_msg) {
        printf("MSGBOX caption=%s\n", g_msg_caption);
        printf("MSGBOX text=%s\n", g_msg_text);
        if (strstr(g_msg_caption, "real world") != NULL
            || strstr(g_msg_caption, "Welcome") != NULL) {
            ok = 1;
        }
        printf("%s\n", ok ? "OK" : "FAIL");
        WaitForSingleObject(pi.hProcess, 3000);
        CloseHandle(pi.hThread);
        CloseHandle(pi.hProcess);
        return ok ? 0 : 1;
    }

    if (IsWindow(hDlg)) {
        GetDlgItemTextA(hDlg, ID_TITLE, title, sizeof title);
        GetDlgItemTextA(hDlg, ID_BANNER, banner, sizeof banner);
        printf("DIALOG title=%s\n", title);
        printf("DIALOG banner=%s\n", banner);
        printf("DECOY (check returned != 0)\n");
        PostMessageA(hDlg, WM_CLOSE, 0, 0);
    } else {
        printf("DIALOG_GONE\n");
    }
    printf("FAIL\n");
    WaitForSingleObject(pi.hProcess, 3000);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
    return 1;
}
