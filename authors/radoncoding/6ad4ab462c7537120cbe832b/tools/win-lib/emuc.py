"""Émulation de F (VM binsafe) sur un snapshot : fresh_run(snap, board, idx, tsc_hook=...)"""
import sys, struct
sys.path.insert(0, '.')
from emu import *


def fresh_run(snap, board=None, idx_=0, spy=False, rdtsc_fix=None):
    e = Emu(snap); uc = e.uc; S = e.S
    mt = [t for t, c in S['ctx'].items() if c['regs']['r13'] != 0][0]; R = S['ctx'][mt]['regs']; teb = S['ctx'][mt]['teb']
    q = lambda a: int.from_bytes(bytes(uc.mem_read(a, 8)), 'little')
    tidx = q(e.blob + (0x1ba3f66 - 0x1a61000) + 0x3a7c1) & 0xffffffff; ctx = q(teb + 0x1480 + 8 * tidx)
    sv = {n: q(ctx + o) for n, o in (('rax', 0x70), ('r8', 0xd8), ('r9', 0x38), ('r10', 0xf8), ('r11', 0xc0), ('flags', 0x30))}
    A = S['board']; ret = e.blob + (0x1b23c11 - 0x1a61000); kill = e.rt + (0x1d9d25c - 0x1d83000); D = e.rt + (0x1d9ae39 - 0x1d83000)
    uc.reg_write(UC_X86_REG_RSP, A - 8); uc.mem_write(A - 8, ret.to_bytes(8, 'little'))
    for n, reg in (('rbx', UC_X86_REG_RBX), ('rbp', UC_X86_REG_RBP), ('rsi', UC_X86_REG_RSI), ('rdi', UC_X86_REG_RDI), ('r14', UC_X86_REG_R14), ('r15', UC_X86_REG_R15)): uc.reg_write(reg, R[n])
    for n, reg in (('rax', UC_X86_REG_RAX), ('r8', UC_X86_REG_R8), ('r9', UC_X86_REG_R9), ('r10', UC_X86_REG_R10), ('r11', UC_X86_REG_R11)): uc.reg_write(reg, sv[n])
    uc.reg_write(UC_X86_REG_EFLAGS, sv['flags'] & 0xfff | 2)
    b = R['r13'] if board is None else board
    uc.reg_write(UC_X86_REG_R12, R['r12']); uc.reg_write(UC_X86_REG_R13, b); uc.reg_write(UC_X86_REG_RCX, b); uc.reg_write(UC_X86_REG_RDX, idx_)
    st = {'n': 0, 'ops': 0, 'kill': False, 'ret': False, 'sp': {}}

    def ch(uc, addr, size, ud):
        st['n'] += 1
        if addr == D: st['ops'] += 1
        if addr == kill: st['kill'] = True
        if addr == ret: st['ret'] = True; uc.emu_stop()
        if spy:
            bb = bytes(uc.mem_read(addr, 2))
            nm = {b'\x0f\x31': 'rdtsc', b'\x0f\xa2': 'cpuid', b'\x0f\x05': 'syscall'}.get(bb)
            if nm: st['sp'].setdefault(nm, []).append(hex(addr))
    uc.hook_add(UC_HOOK_CODE, ch)
    # garde temporelle de la VM : l'opcode RDTSC doit voir un TSC proche de celui du snapshot
    tsc = S.get('tsc')
    rtmem = bytes(uc.mem_read(e.rt, 0x7d000)); hits = []; p = rtmem.find(b'\x0f\x31')
    while p >= 0: hits.append(e.rt + p); p = rtmem.find(b'\x0f\x31', p + 1)
    st['rdtsc_sites'] = [hex(x) for x in hits]
    if tsc is not None:
        def tscfix(uc, addr, size, ud):
            if addr in hits:
                t = tsc + 1000
                uc.reg_write(UC_X86_REG_RAX, t & 0xffffffff); uc.reg_write(UC_X86_REG_RDX, t >> 32)
                uc.reg_write(UC_X86_REG_RIP, addr + 2)
        uc.hook_add(UC_HOOK_CODE, tscfix)
    try: uc.emu_start(e.F, 0, count=3_000_000)
    except UcError as ex: st['err'] = str(ex)
    return uc.reg_read(UC_X86_REG_RAX), st


if __name__ == '__main__':
    r, st = fresh_run(sys.argv[1], spy=True)
    print('rax=%x' % r, st['n'], st['ops'], st['kill'], {k: (len(v), v[:4]) for k, v in st['sp'].items()})
