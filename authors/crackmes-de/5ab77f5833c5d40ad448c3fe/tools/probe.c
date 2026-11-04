#include <windows.h>
#include <stdio.h>
BOOL CALLBACK cb(HWND h, LPARAM l){ char b[128]={0}; GetDlgItemTextA(h,0x3e9,b,127); if(b[0]) printf("text[0x3e9]=%s\n",b); return TRUE;}
int main(){ Sleep(3000); EnumWindows(cb,0); puts("probe done"); return 0;}
