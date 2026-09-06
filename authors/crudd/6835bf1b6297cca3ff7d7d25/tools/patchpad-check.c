/* GUI harness: open Register, fill name/serial, capture MessageBox text. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

static HWND g_main, g_dlg, g_msg;
static char g_msgtext[512];

static BOOL CALLBACK enum_main(HWND h, LPARAM lp) {
  char t[128];
  if (!GetWindowTextA(h, t, sizeof t)) return TRUE;
  if (lstrcmpA(t, "PatchPad") == 0 && GetWindow(h, GW_OWNER) == NULL) {
    g_main = h;
    return FALSE;
  }
  return TRUE;
}

static BOOL CALLBACK enum_dlg(HWND h, LPARAM lp) {
  char t[128];
  if (!IsWindowVisible(h)) return TRUE;
  if (!GetWindowTextA(h, t, sizeof t)) return TRUE;
  if (lstrcmpA(t, "Register") == 0) {
    g_dlg = h;
    return FALSE;
  }
  return TRUE;
}

static BOOL CALLBACK enum_msg(HWND h, LPARAM lp) {
  char cls[64], t[128];
  if (!GetClassNameA(h, cls, sizeof cls)) return TRUE;
  if (lstrcmpA(cls, "#32770") != 0) return TRUE;
  if (!GetWindowTextA(h, t, sizeof t)) return TRUE;
  if (lstrcmpA(t, "PatchPad") != 0) return TRUE;
  /* message body is child static */
  HWND st = GetDlgItem(h, 0xFFFF);
  if (!st) st = FindWindowExA(h, NULL, "Static", NULL);
  if (st) {
    GetWindowTextA(st, g_msgtext, sizeof g_msgtext);
    g_msg = h;
    return FALSE;
  }
  return TRUE;
}

static int wait_enum(WNDENUMPROC fn, HWND *out, DWORD ms) {
  DWORD t0 = GetTickCount();
  *out = NULL;
  while (GetTickCount() - t0 < ms) {
    EnumWindows(fn, 0);
    if (*out) return 1;
    Sleep(50);
  }
  return 0;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s PATCHPAD.exe [name] [serial]\n", argv[0]);
    return 2;
  }
  const char *name = argc > 2 ? argv[2] : "petik";
  const char *serial = argc > 3 ? argv[3] : "any!!";

  STARTUPINFOA si;
  PROCESS_INFORMATION pi;
  ZeroMemory(&si, sizeof si);
  si.cb = sizeof si;
  ZeroMemory(&pi, sizeof pi);
  char cmd[1024];
  wsprintfA(cmd, "\"%s\"", argv[1]);
  if (!CreateProcessA(NULL, cmd, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)) {
    fprintf(stderr, "CreateProcess failed %lu\n", GetLastError());
    return 1;
  }

  if (!wait_enum(enum_main, &g_main, 8000)) {
    fprintf(stderr, "main window not found\n");
    TerminateProcess(pi.hProcess, 1);
    return 1;
  }

  /* menu Register = 0x6f */
  PostMessageA(g_main, WM_COMMAND, 0x6f, 0);

  if (!wait_enum(enum_dlg, &g_dlg, 5000)) {
    fprintf(stderr, "Register dialog not found\n");
    TerminateProcess(pi.hProcess, 1);
    return 1;
  }

  SetDlgItemTextA(g_dlg, 0x78, name);
  SetDlgItemTextA(g_dlg, 0x79, serial);
  Sleep(100);
  PostMessageA(g_dlg, WM_COMMAND, MAKEWPARAM(0x7a, BN_CLICKED), (LPARAM)GetDlgItem(g_dlg, 0x7a));

  g_msgtext[0] = 0;
  if (!wait_enum(enum_msg, &g_msg, 5000)) {
    fprintf(stderr, "MessageBox not found\n");
    TerminateProcess(pi.hProcess, 1);
    return 1;
  }

  printf("msg=%s\n", g_msgtext);
  /* dismiss */
  PostMessageA(g_msg, WM_COMMAND, MAKEWPARAM(IDOK, BN_CLICKED), 0);
  Sleep(200);
  PostMessageA(g_main, WM_CLOSE, 0, 0);
  WaitForSingleObject(pi.hProcess, 2000);
  TerminateProcess(pi.hProcess, 0);
  CloseHandle(pi.hThread);
  CloseHandle(pi.hProcess);

  if (strstr(g_msgtext, "Good job")) return 0;
  if (strstr(g_msgtext, "corrupt")) return 10;
  if (strstr(g_msgtext, "Booo")) return 11;
  return 12;
}
