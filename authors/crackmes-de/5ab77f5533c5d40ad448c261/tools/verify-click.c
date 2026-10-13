#include <windows.h>
#include <stdio.h>
int main(void){
  HWND h=NULL; for(int i=0;i<50&&!h;i++){h=FindWindowA(NULL," Baby Crackme #2"); Sleep(200);}
  FILE*f=fopen("result.txt","w"); if(!h){fprintf(f,"no hwnd\n");fclose(f);return 1;}
  PostMessageA(h,WM_COMMAND,0x3e8,0);
  for(int i=0;i<40;i++){Sleep(200);
    HWND w=FindWindowA(NULL,"Winneur !"); if(w){char b[128];GetDlgItemTextA(w,0xffff,b,128);fprintf(f,"Winneur ! | %s\n",b);fclose(f);PostMessageA(w,WM_CLOSE,0,0);return 0;}
    w=FindWindowA(NULL,"Loser !"); if(w){char b[128];GetDlgItemTextA(w,0xffff,b,128);fprintf(f,"Loser ! | %s\n",b);fclose(f);PostMessageA(w,WM_CLOSE,0,0);return 0;}}
  fprintf(f,"timeout\n");fclose(f);return 2;}
