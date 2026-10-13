/* Vérif live sous wine : remplit nom/serial, frappe Shift+3 dans le champ serial, clique. */
#include <windows.h>
#include <stdio.h>
int main(int argc, char **argv){
  const char *name = argc>1 ? argv[1] : "petik";
  const char *serial = argc>2 ? argv[2] : "aaak";
  int sharp = argc>3 ? atoi(argv[3]) : 1;
  HWND h=NULL;
  for(int i=0;i<50&&!h;i++){ h=FindWindowA(NULL,"zaas KeygenMe2014"); Sleep(200); }
  FILE*f=fopen("result.txt","w");
  if(!h){fprintf(f,"no hwnd\n");fclose(f);return 1;}
  HWND es=GetDlgItem(h,2);
  SetDlgItemTextA(h,1,name);
  SetDlgItemTextA(h,2,serial);
  SetForegroundWindow(h); Sleep(300);
  DWORD tid=GetWindowThreadProcessId(h,NULL);
  AttachThreadInput(GetCurrentThreadId(),tid,TRUE);
  SetFocus(es); SendMessageA(es,EM_SETSEL,100,100);
  AttachThreadInput(GetCurrentThreadId(),tid,FALSE);
  Sleep(300);
  if(sharp){
    keybd_event(VK_SHIFT,0,0,0); Sleep(50);
    keybd_event('3',0,0,0); Sleep(50);
    keybd_event('3',0,KEYEVENTF_KEYUP,0); Sleep(50);
    keybd_event(VK_SHIFT,0,KEYEVENTF_KEYUP,0); Sleep(300);
  }
  char b[128]={0};
  GetDlgItemTextA(h,2,b,128);
  fprintf(f,"avant clic : name=%s serial=[%s]\n",name,b);
  SendMessageA(GetDlgItem(h,3),BM_CLICK,0,0);
  Sleep(500);
  GetDlgItemTextA(h,2,b,128);
  fprintf(f,"apres clic : [%s]\n",b);
  fclose(f);
  PostMessageA(h,WM_CLOSE,0,0);
  return 0;
}
