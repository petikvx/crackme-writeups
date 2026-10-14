#include <windows.h>
#include <stdio.h>
int main(void){
  HWND h=NULL; char buf[256];
  for(int i=0;i<100 && !h;i++){ h=FindWindowA(NULL,getenv("CAP")); if(!h) Sleep(100);}
  HWND nag=FindWindowA(NULL,"Trial");
  printf("main=%p nag_trial=%p\n",h,nag); if(!h) return 1;
  GetWindowTextA(h,buf,sizeof buf); printf("caption=[%s]\n",buf);
  HMENU m=GetMenu(h); HMENU f=GetSubMenu(m,0); printf("menu=%p file=%p\n",m,f);
  GetMenuStringA(f,1006,buf,sizeof buf,MF_BYCOMMAND);
  printf("save_text=[%s] state=0x%x (MF_GRAYED|MF_DISABLED=0x3)\n",buf,GetMenuState(f,1006,MF_BYCOMMAND));
  HWND lb=NULL; for(HWND c=GetWindow(h,GW_CHILD);c;c=GetWindow(c,GW_HWNDNEXT)){GetClassNameA(c,buf,sizeof buf); if(!lstrcmpiA(buf,"ListBox")) lb=c;}
  PostMessageA(h,WM_COMMAND,MAKEWPARAM(1001,BN_CLICKED),0); Sleep(500);
  nag=FindWindowA(NULL,"Trial"); int n=SendMessageA(lb,LB_GETCOUNT,0,0);
  printf("after AddListItem: nag=%p listbox_count=%d\n",nag,n);
  if(n>0){WCHAR w[256]; SendMessageW(lb,LB_GETTEXT,0,(LPARAM)w); printf("item0=[%ls]\n",w);}
  PostMessageA(h,WM_COMMAND,MAKEWPARAM(1006,0),0); Sleep(500);
  HWND mb=GetForegroundWindow(); GetWindowTextA(mb,buf,sizeof buf); printf("after Save: fg=[%s]\n",buf);
  HWND st=FindWindowExA(mb,NULL,"Static",NULL); while(st){char t[256];GetWindowTextA(st,t,256); if(*t) printf("  static=[%s]\n",t); st=FindWindowExA(mb,st,"Static",NULL);}
  PostMessageA(mb,WM_CLOSE,0,0); Sleep(300);
  PostMessageA(h,WM_COMMAND,MAKEWPARAM(1003,0),0); Sleep(500);  /* About */
  HWND ab=FindWindowA(NULL,"About");
  for(HWND c=GetWindow(ab,GW_CHILD);c;c=GetWindow(c,GW_HWNDNEXT)){GetWindowTextA(c,buf,sizeof buf); if(*buf) printf("about_child=[%s]\n",buf);}
  PostMessageA(ab,WM_COMMAND,1005,0); PostMessageA(ab,WM_CLOSE,0,0); Sleep(500); printf("about_alive=%d\n",IsWindow(ab));
  PostMessageA(h,WM_CLOSE,0,0); Sleep(700);
  printf("after close: nag=%p main_alive=%d\n",FindWindowA(NULL,"Trial"),IsWindow(h));
  return 0;}
