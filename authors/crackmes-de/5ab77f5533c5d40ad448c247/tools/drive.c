/* drive.c — pilote CrackMe 7 by Fr1c sous wine : ferme le nag (TMessageForm), réactive « &Register »
   (autorisé par l'auteur : « you can patch just to enable button and nag »), saisit le nom, calcule le serial
   avec le HWND au premier plan (GetForegroundWindow, comme le crackme), clique, puis cherche la boîte
   « Good work cracker! » (ShowMessage = TMessageForm).   usage : drive.exe NOM [faux]   (faux = serial volontairement faux)
   i686-w64-mingw32-gcc -O2 -o drive.exe drive.c */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND form, ename, eserial, btn; static DWORD pid;
static BOOL CALLBACK kids(HWND h, LPARAM l) { char c[64], t[128]; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 128); 
    /* EnumChildWindows rend l'ordre inverse de création (DFM : Edit1=nom, Edit2=serial) -> 1er TEdit vu = Edit2 */
    if (!strcmp(c, "TEdit")) { if (!eserial) eserial = h; else ename = h; }
    if (!strcmp(c, "TButton") && strstr(t, "Register")) btn = h; return TRUE; }
static int msgforms(int close) { HWND h = NULL; int n = 0; char t[128];
    while ((h = FindWindowExA(NULL, h, "TMessageForm", NULL))) { DWORD p; GetWindowThreadProcessId(h, &p);
        if (p == pid && IsWindowVisible(h)) { n++; GetWindowTextA(h, t, sizeof t); printf("  TMessageForm visible [%s]\n", t);
            if (close) PostMessageA(h, WM_CLOSE, 0, 0); } } return n; }
int main(int argc, char **argv) {
    int i, n; unsigned char s[256], ser[600]; HWND fg; size_t k = 0;
    if (argc < 2) return 2;
    for (i = 0; i < 50 && !form; i++) { form = FindWindowA("TForm1", NULL); if (!form) Sleep(200); }
    if (!form) { puts("TForm1 introuvable"); return 1; }
    GetWindowThreadProcessId(form, &pid); Sleep(500);
    printf("nag au démarrage : %d\n", msgforms(1)); Sleep(800);
    EnumChildWindows(form, kids, 0);
    if (!ename || !eserial || !btn) { puts("contrôles introuvables"); return 1; }
    printf("Register activé au départ : %d\n", IsWindowEnabled(btn)); EnableWindow(btn, TRUE);
    strncpy((char *)s, argv[1], 200); s[200] = 0; n = (int)strlen((char *)s);
    if (n < 4) { puts("nom >= 4"); return 1; }
    SetForegroundWindow(form); Sleep(300); fg = GetForegroundWindow();
    for (i = 0; i < n; i++) { ser[k++] = (unsigned char)(((s[i] * 0x63) ^ 6) + s[1] + s[3]);
                              ser[k++] = (unsigned char)(s[i] + 4 * n + s[1] + s[2] + s[3] - 4); }
    ser[k++] = (unsigned char)((s[2] ^ n) + 3 + (UINT_PTR)fg); if (argc > 2) ser[k - 1]++; ser[k] = 0;
    printf("form=%p foreground=%p serial(hex)=", (void *)form, (void *)fg); for (i = 0; i < (int)k; i++) printf("%02x", ser[i]); puts("");
    SendMessageA(ename, WM_SETTEXT, 0, (LPARAM)s); SendMessageA(eserial, WM_SETTEXT, 0, (LPARAM)ser);
    PostMessageA(btn, BM_CLICK, 0, 0); Sleep(2000);
    printf("après Register : %s\n", msgforms(0) ? "boîte affichée -> Good work cracker!" : "aucune boîte (serial refusé)");
    return 0;
}
