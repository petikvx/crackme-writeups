"""Oracle F(board, cell) sur la vraie VM : SetThreadContext (r12/r13) sur le thread principal bloqué + clic."""
import sys, struct
from oracle import *
from dbg_ctx import Ctx
k.OpenThread.restype = W.HANDLE
k.SuspendThread.argtypes = [W.HANDLE]; k.ResumeThread.argtypes = [W.HANDLE]
H0 = 0xcbf29ce484222325


class TE(ctypes.Structure): _fields_ = [('sz', W.DWORD), ('u', W.DWORD), ('tid', W.DWORD), ('owner', W.DWORD), ('bp', ctypes.c_long), ('dp', ctypes.c_long), ('fl', W.DWORD)]


class Oracle:
    def __init__(self, exe):
        self.g = Game(exe); self.A = self.g.addrs[0]
        self.mt = self._main_thread()
        self.h = k.OpenThread(0x1FFFFF, False, self.mt)

    def _threads(self):
        snap = k.CreateToolhelp32Snapshot(4, 0); te = TE(); te.sz = ctypes.sizeof(te); r = []
        ok = k.Thread32First(snap, ctypes.byref(te))
        while ok:
            if te.owner == self.g.p.pid: r.append(te.tid)
            ok = k.Thread32Next(snap, ctypes.byref(te))
        return r

    def _main_thread(self):
        for t in self._threads():
            h = k.OpenThread(0x1FFFFF, False, t); k.SuspendThread(h); c = Ctx(); c.get(h)
            r13 = c.q(0xE0); k.ResumeThread(h)
            if r13 == self.g.rd(self.A): return t

    def regs(self):
        k.SuspendThread(self.h); c = Ctx(); c.get(self.h); r = (c.q(0xD8), c.q(0xE0)); k.ResumeThread(self.h); return r

    def setregs(self, r12, r13):
        k.SuspendThread(self.h); c = Ctx(); c.get(self.h); c.w(0xD8, r12); c.w(0xE0, r13); c.set(self.h); k.ResumeThread(self.h)

    def F(self, x, cell, wait=0.12):
        self.setregs(H0, x)
        self.g.press(cell, wait)
        v = self.g.rd(self.A)
        return v

    def close(self): self.g.close()
