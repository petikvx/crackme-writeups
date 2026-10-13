#include <windows.h>
#include <stdio.h>
int main(int argc, char **argv){
  const char *serial = argc>1 ? argv[1] : "_!Q$";
  HWND h=NULL;
  for(int i=0;i<50&&!h;i++){ h=FindWindowA(NULL," M&M's Crackme"); Sleep(200); }
  FILE*f=fopen("result.txt","w");
  if(!h){fprintf(f,"no hwnd\n");fclose(f);return 1;}
  SetDlgItemTextA(h, 0x7d0, serial);
  PostMessageA(h, WM_COMMAND, 0x3e8, 0);
  Sleep(500);
  char b[128]={0};
  GetDlgItemTextA(h, 0x7d0, b, 128);
  fprintf(f, "%s -> %s\n", serial, b);
  fclose(f);
  PostMessageA(h, WM_CLOSE, 0, 0);
  return 0;
}
