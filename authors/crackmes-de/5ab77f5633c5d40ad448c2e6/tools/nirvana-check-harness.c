#include <windows.h>
#include <stdio.h>
/* Harnais (sans débogueur) : lance Nirvana_Crackme1.exe, remplit nom (id 3) et serial (id 4)
   avec SetDlgItemText, envoie WM_COMMAND IDOK (id 1), puis lit le texte du MessageBox affiché. */
static DWORD pid; static HWND found, skip;
BOOL CALLBACK top(HWND h, LPARAM l){DWORD p;char c[64];GetWindowThreadProcessId(h,&p);GetClassNameA(h,c,64);
 if(p==pid&&!strcmp(c,"#32770")&&h!=skip&&IsWindowVisible(h)){found=h;return FALSE;}return TRUE;}
static HWND waitwin(void){for(int i=0;i<100;i++){found=0;EnumWindows(top,0);if(found)return found;Sleep(100);}return 0;}
BOOL CALLBACK st(HWND h, LPARAM l){char c[64],t[256];GetClassNameA(h,c,64);
 if(!strcmp(c,"Static")){GetWindowTextA(h,t,256);if(*t)strcpy((char*)l,t);}return TRUE;}
int main(int argc,char**argv){
 STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 if(argc<4){puts("usage: harness exe name serial");return 2;}
 CreateProcessA(NULL,argv[1],NULL,NULL,0,0,NULL,NULL,&si,&pi);pid=pi.dwProcessId;
 HWND dlg=waitwin(); if(!dlg){puts("no dialog");return 2;} Sleep(300);
 SetDlgItemTextA(dlg,3,argv[2]);SetDlgItemTextA(dlg,4,argv[3]);
 PostMessageA(dlg,WM_COMMAND,MAKEWPARAM(1,0),0);
 skip=dlg;HWND mb=waitwin(); char txt[256]="";
 if(mb)EnumChildWindows(mb,st,(LPARAM)txt);
 printf("name=[%s] serial=[%s] -> [%s]\n",argv[2],argv[3],mb?txt:"(pas de MessageBox)");
 TerminateProcess(pi.hProcess,0);return 0;}
