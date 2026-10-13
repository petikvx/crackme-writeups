#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND g_form, g_btn, g_edit;
static BOOL CALLBACK ch(HWND h, LPARAM l) {
    char c[64], t[256];
    GetClassNameA(h, c, 64);
    t[0]=0; SendMessageA(h, WM_GETTEXT, 255, (LPARAM)t);
    printf("  child %p class=%s WM_GETTEXT='%s' GetWindowText=", (void*)h, c, t);
    GetWindowTextA(h, t, 256); printf("'%s'\n", t);
    if (strstr(c, "TextBox") || strstr(c, "Edit")) g_edit = h;
    if (strstr(c, "Command") && strstr(t, "Check")) g_btn = h;
    /* also try caption from GetWindowText if empty above */
    if (strstr(c, "Command")) {
        GetWindowTextA(h, t, 256);
        if (strstr(t, "Check")) g_btn = h;
    }
    return TRUE;
}
static BOOL CALLBACK find(HWND h, LPARAM l) {
    char c[64], t[128];
    if (!IsWindowVisible(h)) return TRUE;
    GetClassNameA(h, c, 64); GetWindowTextA(h, t, 128);
    if (strstr(c, "ThunderRT5Form") || strstr(t, "Crackme")) {
        g_form = h; printf("form %p '%s'\n", (void*)h, t); return FALSE;
    }
    return TRUE;
}
int main(int argc, char **argv) {
    int i; const char *mode = argc>1?argv[1]:"dump";
    for (i=0;i<40&&!g_form;i++){EnumWindows(find,0); if(!g_form)Sleep(200);}
    if(!g_form){puts("no form");return 1;}
    EnumChildWindows(g_form, ch, 0);
    if (g_edit) {
        char t[256]={0};
        SendMessageA(g_edit, WM_GETTEXT, 255, (LPARAM)t);
        printf("EDIT_TEXT='%s'\n", t);
    }
    if (!strcmp(mode,"click") && g_btn) {
        PostMessageA(g_btn, BM_CLICK, 0, 0);
        Sleep(800);
        EnumChildWindows(g_form, ch, 0);
        if (g_edit) {
            char t[256]={0};
            SendMessageA(g_edit, WM_GETTEXT, 255, (LPARAM)t);
            printf("EDIT_TEXT_AFTER='%s'\n", t);
        }
    }
    return 0;
}
