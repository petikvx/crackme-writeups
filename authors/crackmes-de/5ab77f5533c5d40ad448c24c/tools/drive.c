/* Pilotage CrackME.exe (C++ Builder / TForm1) sous wine.
   usage: wine drive.exe SERIAL
   Prérequis: CrackME.exe déjà lancé. */
#include <windows.h>
#include <stdio.h>
#include <string.h>

static HWND g_form, g_edit, g_btn, g_mb;
static BOOL CALLBACK enum_child(HWND h, LPARAM lp) {
    char cls[64], txt[128];
    GetClassNameA(h, cls, 64);
    GetWindowTextA(h, txt, 128);
    printf("  child %p class=%s text='%s'\n", (void*)h, cls, txt);
    if (!g_edit && (!_stricmp(cls, "TEdit") || !_stricmp(cls, "Edit"))) g_edit = h;
    if (!_stricmp(cls, "TButton") || !_stricmp(cls, "Button")) {
        /* prefer non-empty caption if any; else first */
        if (!g_btn) g_btn = h;
    }
    return TRUE;
}
static BOOL CALLBACK find_form(HWND h, LPARAM lp) {
    char cls[64], title[128];
    if (!IsWindowVisible(h)) return TRUE;
    GetClassNameA(h, cls, 64);
    GetWindowTextA(h, title, 128);
    if (!_stricmp(cls, "#32770")) return TRUE; /* skip MB */
    /* C++ Builder forms often class "TForm1" */
    if (strstr(cls, "TForm") || strstr(title, "CrackMe") || strstr(title, "Fr1c")) {
        g_form = h;
        printf("form %p class=%s title='%s'\n", (void*)h, cls, title);
        return FALSE;
    }
    return TRUE;
}
static BOOL CALLBACK find_mb(HWND h, LPARAM lp) {
    char cls[64], title[128];
    GetClassNameA(h, cls, 64);
    GetWindowTextA(h, title, 128);
    if (!_stricmp(cls, "#32770") && h != g_form) {
        g_mb = h;
        printf("mb %p title='%s'\n", (void*)h, title);
        return FALSE;
    }
    return TRUE;
}
static BOOL CALLBACK print_static(HWND h, LPARAM lp) {
    char cls[64], txt[256];
    GetClassNameA(h, cls, 64);
    GetWindowTextA(h, txt, 256);
    if (!_stricmp(cls, "Static") && txt[0])
        printf("MessageBox : %s\n", txt);
    return TRUE;
}
int main(int argc, char **argv) {
    const char *serial = argc > 1 ? argv[1] : "F988f91";
    int i;
    /* dismiss any existing About MessageBox first */
    for (i = 0; i < 20; i++) {
        g_mb = NULL;
        EnumWindows(find_mb, 0);
        if (g_mb) {
            PostMessageA(g_mb, WM_COMMAND, IDOK, 0);
            Sleep(200);
            g_mb = NULL;
        } else break;
    }
    for (i = 0; i < 50 && !g_form; i++) {
        EnumWindows(find_form, 0);
        if (!g_form) Sleep(200);
    }
    if (!g_form) { puts("fenetre introuvable"); return 1; }
    EnumChildWindows(g_form, enum_child, 0);
    if (!g_edit || !g_btn) { puts("controls manquants"); return 2; }
    printf("edit=%p btn=%p serial=%s\n", (void*)g_edit, (void*)g_btn, serial);
    SendMessageA(g_edit, WM_SETTEXT, 0, (LPARAM)serial);
    Sleep(100);
    PostMessageA(g_btn, BM_CLICK, 0, 0);
    /* also try WM_COMMAND on parent */
    Sleep(100);
    PostMessageA(g_form, WM_COMMAND, MAKEWPARAM(GetDlgCtrlID(g_btn), BN_CLICKED), (LPARAM)g_btn);
    g_mb = NULL;
    for (i = 0; i < 25 && !g_mb; i++) { Sleep(200); EnumWindows(find_mb, 0); }
    if (!g_mb) { puts("pas de MessageBox"); return 3; }
    EnumChildWindows(g_mb, print_static, 0);
    PostMessageA(g_mb, WM_COMMAND, IDOK, 0);
    return 0;
}
