/* inject_here.dll for dll_disaster (issogoo)
 * Loaded+freed on Check. Reads DWORD tick at 0x403282,
 * shows MessageBox with serial = "%08X" % (tick + 0xCAFFEE).
 */
#include <windows.h>

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved) {
    char msg[80];
    DWORD tick, ser;
    char *p;
    int i;
    (void)hinst; (void)reserved;
    if (reason != DLL_PROCESS_ATTACH)
        return TRUE;
    tick = *(volatile DWORD *)0x403282;
    ser = tick + 0xCAFFEE;
    msg[0]='O'; msg[1]='K'; msg[2]=':'; msg[3]=' ';
    p = msg + 4;
    for (i = 7; i >= 0; --i) {
        unsigned nib = (ser >> (i * 4)) & 0xF;
        p[7 - i] = (char)(nib < 10 ? '0' + nib : 'A' + nib - 10);
    }
    p[8] = 0;
    MessageBoxA(NULL, msg, "inject_here", MB_OK);
    return TRUE;
}
