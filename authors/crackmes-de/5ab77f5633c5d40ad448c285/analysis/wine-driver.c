#include <windows.h>
#include <stdio.h>
#include <string.h>
static char found[512];
BOOL CALLBACK ec(HWND h, LPARAM l){char c[64],t[512];GetClassNameA(h,c,64);GetWindowTextA(h,t,512);if(!strcmp(c,"Static")&&strstr(t,"Good"))strcpy(found,t);return TRUE;}
int main(int argc,char**argv){
 STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 if(!CreateProcessA(argv[1],0,0,0,0,0,0,0,&si,&pi)){puts("spawn fail");return 2;}
 WaitForInputIdle(pi.hProcess,5000);
 HWND w=0;for(int i=0;i<50&&!w;i++){Sleep(100);w=FindWindowA("DLGCLASS",0);}
 if(!w){puts("no window");return 2;}
 HMENU m=GetMenu(w);int before=m?GetMenuItemCount(m):-1;
 const char*s=argv[2];
 for(const char*p=s;*p;p++) SendMessageA(w,WM_COMMAND,0x65+(*p-'0'),(LPARAM)w);
 SendMessageA(w,WM_COMMAND,0x6f,(LPARAM)w);
 Sleep(500);DWORD cnt=0;SIZE_T rd;ReadProcessMemory(pi.hProcess,(LPCVOID)0x40315d,&cnt,4,&rd);DWORD hm=0;ReadProcessMemory(pi.hProcess,(LPCVOID)0x403159,&hm,4,&rd);char buf[32]={0};ReadProcessMemory(pi.hProcess,(LPCVOID)0x4031a8,buf,31,&rd);DWORD nn=0;ReadProcessMemory(pi.hProcess,(LPCVOID)0x403163,&nn,4,&rd);unsigned char cb[0x98];ReadProcessMemory(pi.hProcess,(LPCVOID)0x401287,cb,0x97,&rd);FILE*f=fopen("code.bin","wb");fwrite(cb,1,0x97,f);fclose(f);unsigned char db[0x50];ReadProcessMemory(pi.hProcess,(LPCVOID)0x403150,db,0x50,&rd);for(int k=0;k<0x50;k++)printf("%02x",db[k]);puts("");printf("buf=%s N=%lu\n",buf,nn);printf("armstrong_divisors=%lu hmenu_internal=%lx hwnd=%p GetMenu=%p\n",cnt,hm,w,GetMenu(w));m=GetMenu(w);int after=GetMenuItemCount(m);
 char txt[64]="";GetMenuStringA(m,0x32,txt,64,MF_BYCOMMAND);
 printf("menu items before=%d after=%d id50='%s'\n",before,after,txt);
 PostMessageA(w,WM_COMMAND,0x32,0);
 HWND mb=0;for(int i=0;i<30&&!mb;i++){Sleep(100);mb=FindWindowA("#32770",0);if(mb==w)mb=0;}
 if(mb){char t[128];GetWindowTextA(mb,t,128);EnumChildWindows(mb,ec,0);printf("msgbox title='%s' text='%s'\n",t,found);}
 else puts("no msgbox");
 TerminateProcess(pi.hProcess,0);
 return (found[0]&&cnt==3)?0:1;}
