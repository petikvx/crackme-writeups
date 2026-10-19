#!/usr/bin/env python3
import angr
import angr.claripy as claripy  # angr 10.x bundles its own (Rust) claripy; the pip "claripy"
                                 # package is a different, incompatible implementation.
import logging
logging.getLogger('angr').setLevel(logging.ERROR)

EXE = "/home/petik/Documents/crackme-writeups/authors/sacredgravel44/6ad44c6c5fa39ab0d4ac1c16/original/matryoshka9_cmo.exe"

ADDR_FUNC = 0x140001030
ADDR_GETLINE = 0x140001085   # call sub_140004FD0 (getline-ish) -- we replace it
RET_GETLINE = 0x14000108a
ADDR_VALLOC1 = 0x140001161   # call cs:VirtualAlloc in sub_140001030
RET_VALLOC1 = 0x140001167
ADDR_FNPTR_ALLOC = 0x140001010  # sub_140001010 entry, used as a function ptr inside the shellcode
ADDR_PRINTF1 = 0x140001057
RET_PRINTF1 = 0x14000105c
ADDR_FLUSH = 0x140001069
RET_FLUSH = 0x14000106e
ADDR_PRINTF2 = 0x1400012d5
RET_PRINTF2 = 0x1400012da
ADDR_PRINTF3 = 0x1400012ed
RET_PRINTF3 = 0x1400012f2
ADDR_COOKIE = 0x140001302
RET_COOKIE = 0x140001307

ADDR_FLAG_CHECK = 0x1400012bd  # cmp [var_E0],0 -- right after the big call returns
VAR78_RSP_OFF = 0x108 - 0x78   # var_78 relative to rsp AFTER push rbx; sub rsp,0x100 (i.e. "rsp+0x108" baseline)
VAR_E0_RSP_OFF = 0x108 - 0xE0

heap_next = [0x0000050000000000]


def bv(v, bits=64):
    return claripy.BVV(v, bits)


def simple_hook(ret_addr):
    def _hook(state):
        state.regs.rip = bv(ret_addr)
    return _hook


def do_alloc(state, size_c):
    size_c = (size_c + 0xFFF) & ~0xFFF
    addr = heap_next[0]
    heap_next[0] += max(size_c, 0x1000)
    state.memory.store(bv(addr), claripy.BVV(0, size_c * 8))
    return addr


def main():
    proj = angr.Project(EXE, main_opts={"base_addr": 0x140000000}, auto_load_libs=False)

    state = proj.factory.blank_state(addr=ADDR_FUNC)

    # fresh stack
    stack_top = 0x00007FF000000000
    state.regs.rsp = bv(stack_top - 0x1000)
    state.memory.store(state.regs.rsp, bv(0x4141414141414141), endness='Iend_LE')

    serial_bytes = [claripy.BVS(f'c{i}', 8) for i in range(76)]

    def hook_getline(state):
        rcx = state.regs.rcx
        for i, b in enumerate(serial_bytes):
            state.memory.store(rcx + i, b)
        state.regs.rax = bv(1)
        state.regs.rip = bv(RET_GETLINE)

    def hook_valloc1(state):
        size_c = state.solver.eval(state.regs.rdx)
        addr = do_alloc(state, size_c)
        state.regs.rax = bv(addr)
        state.regs.rip = bv(RET_VALLOC1)

    def hook_fnptr_alloc(state):
        size_c = state.solver.eval(state.regs.rcx)
        addr = do_alloc(state, size_c)
        state.regs.rax = bv(addr)
        ret = state.memory.load(state.regs.rsp, 8, endness='Iend_LE')
        state.regs.rsp = state.regs.rsp + 8
        state.regs.rip = ret

    proj.hook(ADDR_GETLINE, hook_getline, length=5)
    proj.hook(ADDR_VALLOC1, hook_valloc1, length=6)
    proj.hook(ADDR_FNPTR_ALLOC, hook_fnptr_alloc, length=0)
    proj.hook(ADDR_PRINTF1, simple_hook(RET_PRINTF1), length=5)
    proj.hook(ADDR_FLUSH, simple_hook(RET_FLUSH), length=5)
    proj.hook(ADDR_PRINTF2, simple_hook(RET_PRINTF2), length=5)
    proj.hook(ADDR_PRINTF3, simple_hook(RET_PRINTF3), length=5)
    proj.hook(ADDR_COOKIE, simple_hook(RET_COOKIE), length=5)

    simgr = proj.factory.simgr(state)
    print("stepping...")
    import time
    t0 = time.time()
    simgr.explore(find=ADDR_FLAG_CHECK, num_find=1)
    print("elapsed", time.time() - t0)
    print(simgr)

    if not simgr.found:
        print("NOT FOUND")
        return

    found = simgr.found[0]
    flag_addr = found.regs.rsp + VAR_E0_RSP_OFF
    flag_val = found.memory.load(flag_addr, 8, endness='Iend_LE')
    print("flag expr len:", flag_val.size())
    found.solver.add(flag_val != 0)
    for b in serial_bytes:
        found.solver.add(claripy.Or(
            claripy.And(b >= ord('A'), b <= ord('Z')),
            claripy.And(b >= ord('a'), b <= ord('z')),
            claripy.And(b >= ord('0'), b <= ord('9')),
        ))
    if found.solver.satisfiable():
        sol = bytes(found.solver.eval(b) for b in serial_bytes)
        print("SOLVED SERIAL:", sol)
    else:
        print("UNSAT")


if __name__ == "__main__":
    main()
