"""Pas-à-pas RÉEL des opcodes VM de F : détourne le thread principal vers F, alterne des spins (EB FE) sur D (dispatch) et R (retour handler).
usage: hij.py <exe> <scratch> <board_hex> <idx> [maxops]"""
import sys, struct, json, time
sys.path.insert(0, sys.argv[2])
from forc import *
from dbg_ctx import REGS
k.VirtualProtectEx.argtypes = [W.HANDLE, ctypes.c_void_p, ctypes.c_size_t, W.DWORD, ctypes.c_void_p]
k.SuspendThread.argtypes = [W.HANDLE]; k.ResumeThread.argtypes = [W.HANDLE]
SPIN = b'\xeb\xfe'


class Hij:
    def __init__(self, exe):
        self.o = Oracle(exe); self.g = self.o.g; self.hp = self.g.hp; self.th = self.o.h
        self.A = self.o.A
        # régions : blob (0xc7000 R-X privé) et runtime (0x7d000 RWX privé)
        a = 0; mbi = MBI(); blob = rt = None
        while a < 0x7FFFFFFF0000:
            if not k.VirtualQueryEx(self.hp, a, ctypes.byref(mbi), ctypes.sizeof(mbi)): break
            base = mbi.Base or 0
            if mbi.State == 0x1000 and mbi.Type == 0x20000:
                if mbi.Size == 0xc7000 and mbi.Prot == 0x20: blob = base
                if mbi.Size == 0x7d000 and mbi.Prot == 0x40: rt = base
            a = base + mbi.Size
        self.blob, self.rt = blob, rt
        self.F = blob + 0xc6000; self.RET = blob + 0xc2c11
        self.D = rt + 0x17e39; self.R = self.D + 3
        print('blob', hex(blob), 'rt', hex(rt), 'F', hex(self.F), 'D', hex(self.D), 'R', hex(self.R), 'RET', hex(self.RET))
        self.orig = {}
        for ad in (self.D, self.R, self.RET): self.orig[ad] = self.rdb(ad, 2)
        # sanity : D doit être "41 ff e2" (jmp r10) et R "4c 89 e8"
        print('D bytes', self.rdb(self.D, 3).hex(), 'R bytes', self.rdb(self.R, 3).hex(), 'RET bytes', self.rdb(self.RET, 3).hex())
        k.VirtualProtectEx(self.hp, blob + 0xc2000, 0x1000, 0x40, ctypes.byref(W.DWORD()))

    def rdb(self, a, n):
        b = ctypes.create_string_buffer(n); c = ctypes.c_size_t(); k.ReadProcessMemory(self.hp, a, b, n, ctypes.byref(c)); return b.raw

    def wrb(self, a, data):
        c = ctypes.c_size_t(); return k.WriteProcessMemory(self.hp, a, data, len(data), ctypes.byref(c))

    def ctx(self):
        c = Ctx(); k.SuspendThread(self.th); c.get(self.th); return c

    def rd64(self, a): return struct.unpack('<Q', self.rdb(a, 8))[0]

    def saved(self):
        """registres natifs du dernier appel VM, lus dans le contexte VM du thread principal"""
        tbi = (ctypes.c_ulonglong * 6)(); rl = W.ULONG()
        ctypes.WinDLL('ntdll').NtQueryInformationThread(self.th, 0, tbi, 48, ctypes.byref(rl)); teb = tbi[1]
        idx = struct.unpack('<I', self.rdb(self.blob + (0x1ba3f66 - 0x1a61000) + 0x3a7c1, 4))[0]
        cx = self.rd64(teb + 0x1480 + 8 * idx)
        offs = {'rax': 0x70, 'rbx': 0xb8, 'rbp': 0x90, 'rsi': 0x100, 'rdi': 0x108, 'r8': 0xd8, 'r9': 0x38, 'r10': 0xf8, 'r11': 0xc0, 'r14': 0x0, 'r15': 0x50}
        return {n: self.rd64(cx + o) for n, o in offs.items()}

    def run(self, board, idx, maxops=400, hash_=H0):
        o = self.o
        # prépare le détournement
        k.SuspendThread(self.th); c = Ctx(); c.get(self.th)
        self.wrb(self.A - 8, struct.pack('<Q', self.RET))
        c.w(0xF8, self.F); c.w(0x98, self.A - 8); c.w(0x80, board); c.w(0x88, idx); c.w(0xD8, hash_); c.w(0xE0, board)
        sv = self.saved(); print('saved', {n: hex(v) for n, v in sv.items()})
        for n, v in sv.items(): c.w(REGS[n], v)
        struct.pack_into('<I', c.raw, c.off + 0x44, 0x246)
        c.set(self.th)
        self.wrb(self.D, SPIN); self.wrb(self.RET, SPIN)
        k.ResumeThread(self.th)
        # réveil : mouvement de souris inoffensif
        r = REC(); r.type = 2; r.e.m.pos = COORD(0, 0); r.e.m.btn = 0; r.e.m.flags = 1; self.g.send([r])
        log = []; state = 'D'; t0 = time.time(); ops = 0
        while time.time() - t0 < 30 and ops < maxops:
            k.SuspendThread(self.th); c = Ctx(); c.get(self.th); rip = c.q(0xF8)
            if rip == self.RET:
                k.ResumeThread(self.th); log.append(('RET', c.q(0x78), c.q(0xD0))); break
            want = self.D if state == 'D' else self.R
            if rip != want:
                k.ResumeThread(self.th); time.sleep(0.0005); continue
            regs = {n: c.q(o_) for n, o_ in REGS.items()}
            r12 = regs['r12']
            ctxm = self.rdb(r12, 0x130)
            log.append((state, regs, ctxm.hex()))
            # bascule
            if state == 'D':
                self.wrb(self.D, self.orig[self.D]); self.wrb(self.R, SPIN); state = 'R'; ops += 1
            else:
                self.wrb(self.R, self.orig[self.R]); self.wrb(self.D, SPIN); state = 'D'
            k.ResumeThread(self.th)
        # nettoyage
        for ad in (self.D, self.R, self.RET): self.wrb(ad, self.orig[ad])
        return log

    def close(self): self.o.close()


if __name__ == '__main__':
    h = Hij(sys.argv[1]); h.g.press(0, 0.6); h.g.press(0, 0.6)
    board = int(sys.argv[3], 16); idx = int(sys.argv[4]); mx = int(sys.argv[5]) if len(sys.argv) > 5 else 400
    log = h.run(board, idx, mx)
    print('events', len(log), 'last', log[-1][0], [hex(x) if isinstance(x, int) else x for x in log[-1][1:3]] if log[-1][0] == 'RET' else '')
    json.dump(log, open(sys.argv[2] + '/realtrace.json', 'w'), default=str)
    time.sleep(0.5); print('board mem now', hex(h.g.rd(h.A)))
    h.close()



