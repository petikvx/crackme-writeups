#include <windows.h>
#include <stdio.h>
int main(int c,char**v){
 HWND w=0; for(int i=0;i<100&&!w;i++){w=FindWindowA(NULL,"BrainKiller KeyGenMe By Mouradpr/AT4RE");Sleep(100);}
 if(!w){puts("nowin");return 1;}
 for(int k=1;k<c;k++){
  SendDlgItemMessageA(w,0x3e9,WM_SETTEXT,0,(LPARAM)v[k]);
  SendMessageA(w,WM_COMMAND,0x3ea,0);
  // MessageBox may block (Bad Boy) -> use timer-less approach: post
  char b[256]={0}; GetDlgItemTextA(w,0x3e8,b,256);
  printf("%s -> [%s]\n",v[k],b);
 }
 return 0;}
