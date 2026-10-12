/* listmsg.c — liste les fenêtres visibles (MessageBox : titre + texte) sous wine.
   i686-w64-mingw32-gcc -O2 -o listmsg.exe listmsg.c */
#include <windows.h>
#include <stdio.h>
static BOOL CALLBACK child(HWND h, LPARAM l) { char t[512]; GetWindowTextA(h, t, sizeof t); if (*t) printf("    [%s]\n", t); return TRUE; }
static BOOL CALLBACK top(HWND h, LPARAM l) { char t[256], c[64]; GetClassNameA(h, c, 64);
    if (IsWindowVisible(h) && !strcmp(c, "#32770")) { GetWindowTextA(h, t, sizeof t); printf("  fenetre : %s\n", t); EnumChildWindows(h, child, 0); } return TRUE; }
int main(void) { EnumWindows(top, 0); return 0; }
