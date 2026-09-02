#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

int main(int argc, char **argv) {
  STARTUPINFOA si={sizeof si}; PROCESS_INFORMATION pi;
  char cmd[1024]; wsprintfA(cmd, "\"%s\"", argv[1]);
  CreateProcessA(NULL, cmd, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi);
  HWND mainw=NULL;
  for (int i=0;i<100 && !mainw;i++){ Sleep(100); mainw=FindWindowA("WinClass", "Znycuk's #1 KeyGenmE"); }

  char comp[32]={0}, user[32]={0}, seed[8]={0};
  DWORD csz=0, usz=0;
  ReadProcessMemory(pi.hProcess, (void*)0x4032e8, comp, 16, NULL);
  ReadProcessMemory(pi.hProcess, (void*)0x4033e9, user, 16, NULL);
  ReadProcessMemory(pi.hProcess, (void*)0x40341d, seed, 4, NULL);
  ReadProcessMemory(pi.hProcess, (void*)0x4030a6, &csz, 4, NULL);
  ReadProcessMemory(pi.hProcess, (void*)0x4030a2, &usz, 4, NULL);
  printf("comp='%s' csz=%lu user='%s' usz=%lu seed='%s'\n", comp, csz, user, usz, seed);

  unsigned int table[8];
  ReadProcessMemory(pi.hProcess, (void*)0x4033fd, table, sizeof table, NULL);
  printf("table:");
  for (int i=0;i<8;i++) printf(" %08x", table[i]);
  printf("\n");

  unsigned int d8=0, dc=0;
  ReadProcessMemory(pi.hProcess, (void*)0x4032d8, &d8, 4, NULL);
  ReadProcessMemory(pi.hProcess, (void*)0x4032dc, &dc, 4, NULL);
  printf("4032d8=%08x 4032dc=%08x\n", d8, dc);

  /* expected groups via reading by calling... dump after forcing check */
  HWND hSerial=0;
  ReadProcessMemory(pi.hProcess, (void*)0x4030cc, &hSerial, 4, NULL);
  SendMessageA(hSerial, WM_SETTEXT, 0, (LPARAM)argv[2]);
  SendMessageA(mainw, WM_COMMAND, 1, 0);
  Sleep(300);
  HWND status=FindWindowExA(mainw, NULL, "msctls_statusbar32", NULL);
  char st[256]={0};
  if (status) SendMessageA(status, WM_GETTEXT, sizeof st, (LPARAM)st);
  printf("status='%s'\n", st);

  TerminateProcess(pi.hProcess,0);
  return 0;
}
