#include <windows.h>
#include <stdio.h>
int main(int c,char**v){HMODULE h=LoadLibraryExA(v[1],NULL,LOAD_LIBRARY_AS_DATAFILE); HMENU m=LoadMenuA(h,MAKEINTRESOURCEA(104));
 HMENU f=GetSubMenu(m,0); char b[128]; GetMenuStringA(f,1006,b,128,MF_BYCOMMAND);
 printf("%s: Save=[%s] state=0x%x\n",v[1],b,GetMenuState(f,1006,MF_BYCOMMAND)); return 0;}
