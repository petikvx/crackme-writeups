/* Harness Wine : lance CrackMe2.exe, injecte name/serial (octets bruts, WM_SETTEXT)
   puis clique sur le bouton 0x3eb et affiche le titre de la MessageBox.
   i686-w64-mingw32-gcc -o harness.exe harness.c -luser32
   usage: harness.exe CrackMe2.exe name serial_hex */
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
static char title[128];
static BOOL CALLBACK en(HWND h, LPARAM p){ DWORD pid; GetWindowThreadProcessId(h,&pid);
  if(pid==(DWORD)p){ char c[64]; GetClassNameA(h,c,64); if(!strcmp(c,"#32770")){GetWindowTextA(h,title,128);} } return TRUE; }
int main(int argc,char**argv){
  STARTUPINFOA si={sizeof si}; PROCESS_INFORMATION pi;
  CreateProcessA(argv[1],NULL,0,0,0,0,0,0,&si,&pi);
  HWND dlg=NULL; for(int i=0;i<100&&!dlg;i++){Sleep(100);
    HWND h=NULL; while((h=FindWindowExA(NULL,h,NULL,NULL))){DWORD pid;GetWindowThreadProcessId(h,&pid);
      if(pid==pi.dwProcessId&&GetDlgItem(h,0x3e8)){dlg=h;break;}}}
  if(!dlg){puts("NODLG");return 2;}
  char ser[256]={0}; int n=strlen(argv[3])/2; for(int i=0;i<n;i++){unsigned v;sscanf(argv[3]+2*i,"%2x",&v);ser[i]=v;}
  SendMessageA(GetDlgItem(dlg,0x3e8),WM_SETTEXT,0,(LPARAM)argv[2]);
  SendMessageA(GetDlgItem(dlg,0x3e9),WM_SETTEXT,0,(LPARAM)ser);
  {char rb[256]={0};int l=GetDlgItemTextA(dlg,0x3e9,rb,255);printf("readback len=%d:",l);for(int i=0;i<l;i++)printf("%02x",(unsigned char)rb[i]);puts("");}
  PostMessageA(dlg,WM_COMMAND,0x3eb,(LPARAM)GetDlgItem(dlg,0x3eb));
  for(int i=0;i<30;i++){Sleep(100);
    /* MessageBox : fenêtre de classe #32770 du même process, autre que dlg */
    HWND h=NULL; while((h=FindWindowExA(NULL,h,"#32770",NULL))){DWORD pid;GetWindowThreadProcessId(h,&pid);
      if(pid==pi.dwProcessId&&h!=dlg){GetWindowTextA(h,title,128);printf("MSGBOX title=%s\n",title);TerminateProcess(pi.hProcess,0);return 0;}}}
  puts("NOMSG"); TerminateProcess(pi.hProcess,0); return 1; }
