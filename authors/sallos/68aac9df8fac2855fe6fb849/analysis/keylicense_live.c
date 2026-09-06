#include <windows.h>
#include <stdio.h>
#include <string.h>

static char g_found[512];

static BOOL CALLBACK enum_child_txt(HWND h, LPARAM lp) {
  char t[512]={0};
  GetWindowTextA(h, t, sizeof(t));
  if (t[0]) {
    printf("  child text: %s\n", t);
    if (strstr(t, "Congratulations") || strstr(t, "Invalid") || strstr(t, "Oh, No") || strstr(t, "activated")) {
      strncpy(g_found, t, sizeof(g_found)-1);
    }
  }
  return TRUE;
}

static BOOL CALLBACK enum_top(HWND h, LPARAM lp) {
  DWORD pid=0; GetWindowThreadProcessId(h, &pid);
  if (pid != (DWORD)lp) return TRUE;
  char title[256]={0}, cls[64]={0};
  GetWindowTextA(h, title, sizeof(title));
  GetClassNameA(h, cls, sizeof(cls));
  printf("top: cls=%s title=%s\n", cls, title);
  if (strstr(title, "Success") || strstr(title, "Error") || strstr(title, "Oh, No")) {
    strncpy(g_found, title, sizeof(g_found)-1);
    EnumChildWindows(h, enum_child_txt, 0);
  }
  if (strcmp(cls, "#32770")==0) {
    EnumChildWindows(h, enum_child_txt, 0);
  }
  return TRUE;
}

int main(int argc, char **argv) {
  if (argc < 4) {
    printf("usage: %s <exe> <workdir> <username>\n", argv[0]);
    return 1;
  }
  char *exe = argv[1];
  char *cwd = argv[2];
  char *user = argv[3];

  STARTUPINFOA si; PROCESS_INFORMATION pi;
  ZeroMemory(&si, sizeof(si)); si.cb=sizeof(si);
  ZeroMemory(&pi, sizeof(pi));
  char cmd[MAX_PATH*2];
  snprintf(cmd, sizeof(cmd), "\"%s\"", exe);
  if (!CreateProcessA(exe, NULL, NULL, NULL, FALSE, 0, NULL, cwd, &si, &pi)) {
    printf("CreateProcess failed %lu\n", GetLastError());
    return 1;
  }
  printf("pid=%lu\n", pi.dwProcessId);

  HWND dlg=NULL;
  for (int i=0;i<100 && !dlg;i++) {
    Sleep(50);
    HWND h=FindWindowA("#32770", "DialogApp");
    if (!h) h=FindWindowA(NULL, "DialogApp");
    if (h) {
      DWORD pid=0; GetWindowThreadProcessId(h,&pid);
      if (pid==pi.dwProcessId) dlg=h;
    }
  }
  if (!dlg) { printf("no dialog\n"); TerminateProcess(pi.hProcess,1); return 1; }
  printf("dlg=%p\n", (void*)dlg);

  HWND edit=GetDlgItem(dlg, 1003);
  HWND btn=GetDlgItem(dlg, 1001);
  printf("edit=%p btn=%p set user=%s\n", (void*)edit,(void*)btn,user);
  if (!edit || !btn) { printf("missing controls\n"); TerminateProcess(pi.hProcess,1); return 1; }
  SetWindowTextA(edit, user);
  Sleep(50);
  /* BM_CLICK = 0x00F5 */
  PostMessageA(btn, 0x00F5, 0, 0); PostMessageA(dlg, 0x0111, 1001, 0);

  /* wait for messagebox */
  for (int i=0;i<40;i++) {
    Sleep(100);
    g_found[0]=0;
    EnumWindows(enum_top, (LPARAM)pi.dwProcessId);
    if (g_found[0]) break;
    HWND mb=FindWindowA("#32770", "Success");
    if (mb) { strcpy(g_found, "Success"); EnumChildWindows(mb, enum_child_txt, 0); break; }
    mb=FindWindowA("#32770", "Error");
    if (mb) { strcpy(g_found, "Error"); EnumChildWindows(mb, enum_child_txt, 0); break; }
  }
  printf("RESULT_TITLE=%s\n", g_found);
  TerminateProcess(pi.hProcess, 0);
  CloseHandle(pi.hProcess); CloseHandle(pi.hThread);
  if (strstr(g_found, "Success") || strstr(g_found, "Congratulations") || strstr(g_found, "activated")) {
    puts("LIVE OK"); return 0;
  }
  puts("LIVE FAIL"); return 1;
}
