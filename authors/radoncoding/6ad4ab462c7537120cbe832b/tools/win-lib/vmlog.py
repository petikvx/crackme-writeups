"""Journal des opcodes VM de F (émulation) : python vmlog.py <scratch> <board_hex> <idx> -> vmlog.json"""
import sys, json, struct
sys.path.insert(0, sys.argv[1])
from emu import *


def vmlog(snap, board, idx_):
    e = Emu(snap); uc = e.uc; S = e.S
    mt = [t for t, c in S['ctx'].items() if c['regs']['r13'] != 0][0]; R = S['ctx'][mt]['regs']; teb = S['ctx'][mt]['teb']
    q = lambda a: int.from_bytes(bytes(uc.mem_read(a, 8)), 'little')
    tidx = q(e.blob + (0x1ba3f66 - 0x1a61000) + 0x3a7c1) & 0xffffffff; ctx = q(teb + 0x1480 + 8 * tidx)
    sv = {n: q(ctx + o) for n, o in (('rax', 0x70), ('r8', 0xd8), ('r9', 0x38), ('r10', 0xf8), ('r11', 0xc0), ('flags', 0x30))}
    A = S['board']; ret = e.blob + (0x1b23c11 - 0x1a61000); D = e.rt + (0x1d9ae39 - 0x1d83000); Rr = D + 3
    uc.reg_write(UC_X86_REG_RSP, A - 8); uc.mem_write(A - 8, ret.to_bytes(8, 'little'))
    for n, reg in (('rbx', UC_X86_REG_RBX), ('rbp', UC_X86_REG_RBP), ('rsi', UC_X86_REG_RSI), ('rdi', UC_X86_REG_RDI), ('r14', UC_X86_REG_R14), ('r15', UC_X86_REG_R15)): uc.reg_write(reg, R[n])
    for n, reg in (('rax', UC_X86_REG_RAX), ('r8', UC_X86_REG_R8), ('r9', UC_X86_REG_R9), ('r10', UC_X86_REG_R10), ('r11', UC_X86_REG_R11)): uc.reg_write(reg, sv[n])
    uc.reg_write(UC_X86_REG_EFLAGS, sv['flags'] & 0xfff | 2)
    uc.reg_write(UC_X86_REG_R12, R['r12']); uc.reg_write(UC_X86_REG_R13, board); uc.reg_write(UC_X86_REG_RCX, board); uc.reg_write(UC_X86_REG_RDX, idx_)
    tsc = S.get('tsc'); rtmem = bytes(uc.mem_read(e.rt, 0x7d000)); hits = []; p = rtmem.find(b'\x0f\x31')
    while p >= 0: hits.append(e.rt + p); p = rtmem.find(b'\x0f\x31', p + 1)
    ops = []; cur = {}

    def snapctx(r12): return [q(r12 + 8 * i) for i in range(38)]

    def ch(uc, addr, size, ud):
        if addr in hits and tsc is not None:
            t = tsc + 1000; uc.reg_write(UC_X86_REG_RAX, t & 0xffffffff); uc.reg_write(UC_X86_REG_RDX, t >> 32); uc.reg_write(UC_X86_REG_RIP, addr + 2); return
        if addr == D:
            r12 = uc.reg_read(UC_X86_REG_R12); rcx = uc.reg_read(UC_X86_REG_RCX); sp = q(r12 + 0x118)
            cur.clear(); cur.update(op=uc.reg_read(UC_X86_REG_R8), opnds=bytes(uc.mem_read(rcx, 20)).hex(), r12=r12, ctx=snapctx(r12), sp=sp, stk=[q(sp - 8 * (i + 1)) for i in range(6)])
        elif addr == Rr and cur:
            r12 = cur['r12']; c2 = snapctx(r12); sp2 = q(r12 + 0x118)
            ops.append(dict(op=cur['op'], opnds=cur['opnds'], chg=[(i, cur['ctx'][i], c2[i]) for i in range(38) if cur['ctx'][i] != c2[i]],
                            dsp=(sp2 - cur['sp']) // 8, stk0=cur['stk'], stk1=[q(sp2 - 8 * (i + 1)) for i in range(6)], nxt=uc.reg_read(UC_X86_REG_RAX)))
            cur.clear()
        if addr == ret: uc.emu_stop()
    uc.hook_add(UC_HOOK_CODE, ch)
    uc.emu_start(e.F, 0, count=3_000_000)
    return uc.reg_read(UC_X86_REG_RAX), ops


if __name__ == '__main__':
    r, ops = vmlog(sys.argv[1] + '/snapH.pkl', int(sys.argv[2], 16), int(sys.argv[3]))
    json.dump(ops, open(sys.argv[1] + '/vmlog.json', 'w')); print('rax=%x' % r, len(ops), 'ops')
