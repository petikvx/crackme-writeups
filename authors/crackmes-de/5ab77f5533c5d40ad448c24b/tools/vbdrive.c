/* vbdrive.c — pilote CrackMe6 (fr1c, VB5) sous wine sans souris ni patch :
   - ferme le nag éventuel (MessageBox « Try to kill… »)
   - liste les contrôles de la Form, remplit Name / Key (WM_SETTEXT),
   - réactive le bouton « Check key » (EnableWindow : action sur la fenêtre, le binaire n'est pas modifié)
   - clique (BM_CLICK posté) et affiche le texte de la MessageBox + le label d'état.
   i686-w64-mingw32-gcc -O2 -o vbdrive.exe vbdrive.c      usage : wine vbdrive.exe NOM CLE */
#include <windows.h>
#include <stdio.h>
#include <string.h>
static HWND form, edits[8], btn, box; static int ne; static RECT er[8];
static BOOL CALLBACK fw(HWND h, LPARAM l) { char t[128]; GetWindowTextA(h, t, 128);
    if (!strcmp(t, "CrackMe 6 by Fr1c") && IsWindowVisible(h)) { char c[64]; GetClassNameA(h, c, 64); if (strstr(c, "Form")) { form = h; return FALSE; } } return TRUE; }
static BOOL CALLBACK ch(HWND h, LPARAM l) { char c[64], t[256]; RECT r; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 256); GetWindowRect(h, &r);
    if (l) printf("  %-24s vis=%d en=%d (%ld,%ld) '%s'\n", c, IsWindowVisible(h), IsWindowEnabled(h), r.left, r.top, t);
    if (strstr(c, "TextBox") && ne < 8) { er[ne] = r; edits[ne++] = h; }
    if (strstr(c, "CommandButton") && !strcmp(t, "Check key")) btn = h;
    return TRUE; }
static BOOL CALLBACK mb(HWND h, LPARAM l) { char c[64]; GetClassNameA(h, c, 64); if (!strcmp(c, "#32770") && IsWindowVisible(h)) { box = h; return FALSE; } return TRUE; }
static BOOL CALLBACK st(HWND h, LPARAM l) { char c[64], t[512]; GetClassNameA(h, c, 64); GetWindowTextA(h, t, 512);
    if (!_stricmp(c, "Static") && t[0]) printf("%s : %s\n", (char*)l, t); return TRUE; }
static int msgbox(const char *tag, int wait) { int i; box = 0;
    for (i = 0; i < wait && !box; i++) { EnumWindows(mb, 0); if (!box) Sleep(200); }
    if (!box) return 0; EnumChildWindows(box, st, (LPARAM)tag); PostMessageA(box, WM_COMMAND, IDOK, 0); Sleep(500); return 1; }
int main(int argc, char **argv) {
    int i, j; char t[128];
    for (i = 0; i < 50 && !form; i++) { msgbox("nag", 1); EnumWindows(fw, 0); if (!form) Sleep(200); }
    if (!form) { puts("form introuvable"); return 1; }
    msgbox("nag", 3);
    EnumChildWindows(form, ch, 1);
    /* tri des TextBox par ordonnée : Name (haut) puis Key */
    for (i = 0; i < ne; i++) for (j = i + 1; j < ne; j++) if (er[j].top < er[i].top) { HWND h = edits[i]; RECT r = er[i]; edits[i] = edits[j]; er[i] = er[j]; edits[j] = h; er[j] = r; }
    if (ne < 2 || !btn) { puts("controles introuvables"); return 1; }
    SendMessageA(edits[0], WM_SETTEXT, 0, (LPARAM)argv[1]);
    SendMessageA(edits[1], WM_SETTEXT, 0, (LPARAM)argv[2]);
    printf("Check key active au depart : %d\n", IsWindowEnabled(btn));
    EnableWindow(btn, TRUE);
    PostMessageA(btn, BM_CLICK, 0, 0);
    if (!msgbox("MessageBox", 15)) puts("pas de MessageBox");
    return 0;
}
