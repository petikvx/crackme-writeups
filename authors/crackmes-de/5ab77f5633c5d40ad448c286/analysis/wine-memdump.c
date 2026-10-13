#include <windows.h>
#include <stdio.h>
BOOL CALLBACK ec(HWND h,LPARAM l){char c[64],t[256];GetClassNameA(h,c,64);GetWindowTextA(h,t,256);printf("  child %p id=%d class=%s text='%s'\n",h,GetDlgCtrlID(h),c,t);return TRUE;}
BOOL CALLBACK et(HWND h,LPARAM l){DWORD pid;GetWindowThreadProcessId(h,&pid);if(pid==(DWORD)l){char c[64],t[256];GetClassNameA(h,c,64);GetWindowTextA(h,t,256);printf("top %p class=%s text='%s' vis=%d\n",h,c,t,IsWindowVisible(h));EnumChildWindows(h,ec,0);}return TRUE;}
int main(int argc,char**argv){STARTUPINFOA si={sizeof si};PROCESS_INFORMATION pi;
 CreateProcessA(argv[1],0,0,0,0,0,0,0,&si,&pi);WaitForInputIdle(pi.hProcess,5000);Sleep(1500);
 static unsigned char img[0x15000];SIZE_T rd;
 for(DWORD o=0;o<0x15000;o+=0x1000){ReadProcessMemory(pi.hProcess,(LPCVOID)(0x400000+o),img+o,0x1000,&rd);}
 FILE*f=fopen("mem.bin","wb");fwrite(img,1,0x15000,f);fclose(f);
 EnumWindows(et,pi.dwProcessId);TerminateProcess(pi.hProcess,0);return 0;}
