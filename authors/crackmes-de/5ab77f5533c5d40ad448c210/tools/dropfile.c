/* dropfile.c — envoie un WM_DROPFILES au dialogue de Super Funky 0.82 (preuve sous wine sans drag&drop souris).
   Le bloc DROPFILES est écrit dans la mémoire du processus cible (VirtualAllocEx), car un HDROP est local au processus.
   i686-w64-mingw32-gcc -O2 -o dropfile.exe dropfile.c
   usage : wine dropfile.exe C:\\chemin\\Bswap.2003  → affiche les textes des contrôles 11/20/21/22 */
#include <windows.h>
#include <shlobj.h>
#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    HWND h = NULL; char t[256]; int i;
    for (i = 0; i < 50 && !h; i++) { h = FindWindowA("#32770", NULL); if (!h) Sleep(200); }
    if (!h) { puts("fenetre introuvable"); return 1; }
    DWORD pid; GetWindowThreadProcessId(h, &pid);
    HANDLE p = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);
    size_t n = strlen(argv[1]); size_t sz = sizeof(DROPFILES) + n + 2;
    char *buf = calloc(1, sz); DROPFILES *df = (DROPFILES *)buf;
    df->pFiles = sizeof(DROPFILES); df->fWide = FALSE; memcpy(buf + sizeof(DROPFILES), argv[1], n);
    void *r = VirtualAllocEx(p, NULL, sz, MEM_COMMIT, PAGE_READWRITE);
    WriteProcessMemory(p, r, buf, sz, NULL);
    PostMessageA(h, WM_DROPFILES, (WPARAM)r, 0);
    Sleep(3000);
    int ids[] = {11, 20, 21, 22};
    for (i = 0; i < 4; i++) { GetDlgItemTextA(h, ids[i], t, sizeof t); printf("ctrl %d: %s\n", ids[i], t); }
    return 0;
}
