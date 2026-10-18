"""Appelle F=0x1b27000(board, idx) dans Unicorn sur le snapshot du jeu (VM binsafe incluse)."""
import pickle, sys, struct
from unicorn import *
from unicorn.x86_const import *

F_OFF = 0xc6000
SENT = 0x7fff0000
STACK = 0x70000000


class Emu:
    def __init__(self, snap_path):
        S = pickle.load(open(snap_path, 'rb'))
        self.S = S
        main = [t for t, c in S['ctx'].items() if 0xb00000 < c['regs']['rsp'] < 0x1000000]
        self.teb = S['ctx'][main[0]]['teb'] if main else list(S['ctx'].values())[0]['teb']
        uc = self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        for base, data, prot, typ, ab in S['mem']:
            size = (len(data) + 0xfff) & ~0xfff
            uc.mem_map(base, size, UC_PROT_ALL)
            uc.mem_write(base, data)
        uc.mem_map(STACK, 0x100000, UC_PROT_ALL)
        uc.mem_map(SENT, 0x1000, UC_PROT_ALL)
        uc.mem_write(SENT, b'\xf4')  # hlt (arrêt)
        uc.msr_write(0xC0000101, self.teb)
        self.trace = None
        self.log = []
        uc.hook_add(UC_HOOK_MEM_UNMAPPED, self._unmapped)
        # sauvegarde mémoire pour reset rapide
        self.blob = [b for b, s, st, p, t, ab in S['regs'] if s == 0xc7000 and p == 0x20 and t == 0x20000][0]
        self.F = self.blob + F_OFF
        self.rt = [b for b, s, st, p, t, ab in S['regs'] if s == 0x7d000 and p == 0x40 and t == 0x20000][0]
        uc.mem_write(self.rt + 0x6fea5, b'\xff')  # cache "AVX non supporté" (Unicorn n'émule pas AVX)
        self.saved = None
        self.ncalls = 0

    def _unmapped(self, uc, access, addr, size, value, ud):
        self.log.append(('unmapped', access, hex(addr), size, hex(uc.reg_read(UC_X86_REG_RIP))))
        return False

    def call(self, board, idx, maxins=5_000_000):
        uc = self.uc
        F_ADDR = self.F
        rsp = STACK + 0x80000
        uc.mem_write(rsp - 8, struct.pack('<Q', SENT))
        uc.reg_write(UC_X86_REG_RSP, rsp - 8)
        uc.reg_write(UC_X86_REG_RCX, board)
        uc.reg_write(UC_X86_REG_RDX, idx)
        uc.reg_write(UC_X86_REG_RIP, F_ADDR)
        self.log = []
        try:
            uc.emu_start(F_ADDR, SENT, count=maxins)
        except UcError as e:
            return ('ERR', str(e), hex(uc.reg_read(UC_X86_REG_RIP)), self.log[-3:])
        return uc.reg_read(UC_X86_REG_RAX)


if __name__ == '__main__':
    e = Emu(sys.argv[1])
    r = e.call(0x946683638e186420, 0)
    print('F(init,A1) =', hex(r) if isinstance(r, int) else r, ' expected 0xd7f8aed832c7c2e0')

