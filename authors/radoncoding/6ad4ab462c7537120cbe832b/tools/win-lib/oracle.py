"""Oracle F(x, cell) : lance le crackme, localise le plateau (u64) en mémoire, l'écrase, clique, relit."""
import ctypes, ctypes.wintypes as W, subprocess, sys, time, struct
sys.stdout.reconfigure(encoding='utf-8')
k = ctypes.WinDLL('kernel32', use_last_error=True)
k.OpenProcess.restype = W.HANDLE
k.CreateFileW.restype = W.HANDLE
k.VirtualQueryEx.argtypes = [W.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t]
k.ReadProcessMemory.argtypes = [W.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p]
k.WriteProcessMemory.argtypes = [W.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p]
INIT = 0x946683638e186420


class COORD(ctypes.Structure): _fields_ = [('X', ctypes.c_short), ('Y', ctypes.c_short)]
class MOUSE(ctypes.Structure): _fields_ = [('pos', COORD), ('btn', W.DWORD), ('ctl', W.DWORD), ('flags', W.DWORD)]
class KEY(ctypes.Structure): _fields_ = [('down', W.BOOL), ('rep', W.WORD), ('vk', W.WORD), ('sc', W.WORD), ('ch', ctypes.c_wchar), ('ctl', W.DWORD)]
class EV(ctypes.Union): _fields_ = [('m', MOUSE), ('k', KEY)]
class REC(ctypes.Structure): _fields_ = [('type', W.WORD), ('e', EV)]
class MBI(ctypes.Structure):
    _fields_ = [('Base', ctypes.c_void_p), ('AllocBase', ctypes.c_void_p), ('AllocProt', W.DWORD), ('pad', W.DWORD),
                ('Size', ctypes.c_size_t), ('State', W.DWORD), ('Prot', W.DWORD), ('Type', W.DWORD), ('pad2', W.DWORD)]


class Game:
    def __init__(self, exe, wait=4):
        self.p = subprocess.Popen([exe], creationflags=0x10)
        time.sleep(wait)
        k.FreeConsole()
        assert k.AttachConsole(self.p.pid)
        self.hin = k.CreateFileW('CONIN$', 0xC0000000, 3, None, 3, 0, None)
        self.hout = k.CreateFileW('CONOUT$', 0xC0000000, 3, None, 3, 0, None)
        self.hp = k.OpenProcess(0x1F0FFF, False, self.p.pid)
        self.addrs = self.find(INIT)
        print('board candidates', [hex(a) for a in self.addrs])

    def find(self, val):
        pat = struct.pack('<Q', val); res = []; a = 0; mbi = MBI()
        while a < 0x7FFFFFFF0000:
            if not k.VirtualQueryEx(self.hp, a, ctypes.byref(mbi), ctypes.sizeof(mbi)): break
            base = mbi.Base or 0
            if mbi.State == 0x1000 and not (mbi.Prot & 0x101) and mbi.Size < (1 << 28):
                buf = ctypes.create_string_buffer(mbi.Size); n = ctypes.c_size_t()
                if k.ReadProcessMemory(self.hp, base, buf, mbi.Size, ctypes.byref(n)):
                    data = buf.raw[:n.value]; i = data.find(pat)
                    while i >= 0:
                        res.append(base + i); i = data.find(pat, i + 1)
            a = base + mbi.Size
        return res

    def rd(self, addr):
        b = ctypes.create_string_buffer(8); n = ctypes.c_size_t()
        k.ReadProcessMemory(self.hp, addr, b, 8, ctypes.byref(n)); return struct.unpack('<Q', b.raw)[0]

    def wr(self, addr, v):
        b = ctypes.create_string_buffer(struct.pack('<Q', v), 8); n = ctypes.c_size_t()
        return k.WriteProcessMemory(self.hp, addr, b, 8, ctypes.byref(n))

    def send(self, recs):
        arr = (REC * len(recs))(*recs); n = W.DWORD()
        k.WriteConsoleInputW(self.hin, arr, len(recs), ctypes.byref(n))

    def press(self, cell, wait=0.15):
        r, c = divmod(cell, 8); rs = []
        for btn in (1, 0):
            e = REC(); e.type = 2; e.e.m.pos = COORD(9 + 2 * c, 32 + r); e.e.m.btn = btn; rs.append(e)
        self.send(rs); time.sleep(wait)

    def key(self, vk, ch):
        rs = []
        for d in (1, 0):
            e = REC(); e.type = 1; e.e.k.down = d; e.e.k.rep = 1; e.e.k.vk = vk; e.e.k.ch = ch; rs.append(e)
        self.send(rs); time.sleep(0.2)

    def screen_board(self):
        v = 0
        for r in range(8):
            buf = ctypes.create_unicode_buffer(40); g = W.DWORD()
            k.ReadConsoleOutputCharacterW(self.hout, buf, 40, COORD(0, 32 + r), ctypes.byref(g))
            for c in range(8):
                if buf.value[9 + 2 * c] == '●': v |= 1 << (r * 8 + c)
        return v

    def close(self): self.p.kill()


if __name__ == '__main__':
    g = Game(sys.argv[1])
    print('screen', hex(g.screen_board()))
    for a in g.addrs:
        print(hex(a), hex(g.rd(a)))
    g.press(0)
    print('after A1 screen', hex(g.screen_board()))
    for a in g.addrs:
        print(hex(a), hex(g.rd(a)))
    g.close()

