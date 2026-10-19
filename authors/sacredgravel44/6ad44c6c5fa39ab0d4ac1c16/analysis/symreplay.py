#!/usr/bin/env python3
"""Symbolic replay of the single (input-independent) execution trace of the
"matryoshka9" shellcode, substituting the 76 serial bytes with z3 symbols
and re-deriving the final 64-bit hash compared against the embedded
constant, then solving for a serial that matches it.

Strategy: the control flow of the decrypted shellcode does NOT depend on
the password's VALUE (verified empirically: same instruction trace for
every first byte tried). So instead of full symbolic execution (angr,
which forks on every branch and chokes on ~7800 heavily MBA-obfuscated
instructions), we:
  1. run the REAL path once, concretely, with Unicorn, and record the exact
     sequence of executed addresses and the concrete effective address of
     every memory access (these don't depend on the password either);
  2. replay that exact same sequence of instructions with a tiny x86-64
     interpreter, but backed by z3 BitVecs: the password's 76 bytes are
     symbolic, everything else starts from a concrete snapshot taken at
     the start of the shellcode (so we never need to model the WinAPI/CRT
     glue, only the pure computation);
  3. read out the symbolic expression in RDX right before the final
     `cmp rdx, rax ; cmove ecx, r8d` and ask z3 for bytes (A-Za-z0-9) that
     make it equal the embedded target constant.
"""
import sys
import capstone
import z3

from emu import Emu, HEAP_BASE, HEAP_SIZE, FUNC_ENTRY, FAKE_RET
from unicorn import *
from unicorn.x86_const import *

TARGET_HASH = 0x23030D333EA5FEC6
CMP_INDEX_MNEMONIC = "cmp"  # we locate it dynamically, see main()

REG64 = ["rax", "rbx", "rcx", "rdx", "rsi", "rdi", "rbp", "rsp",
         "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"]

# capstone register name -> (parent reg64 name, bit offset, bit width)
SUBREGS = {}
for i, r in enumerate(REG64):
    SUBREGS[r] = (r, 0, 64)
NAME32 = {"rax": "eax", "rbx": "ebx", "rcx": "ecx", "rdx": "edx", "rsi": "esi",
          "rdi": "edi", "rbp": "ebp", "rsp": "esp"}
for p, n in NAME32.items():
    SUBREGS[n] = (p, 0, 32)
for i in range(8, 16):
    SUBREGS[f"r{i}d"] = (f"r{i}", 0, 32)
    SUBREGS[f"r{i}w"] = (f"r{i}", 0, 16)
    SUBREGS[f"r{i}b"] = (f"r{i}", 0, 8)
NAME16 = {"rax": "ax", "rbx": "bx", "rcx": "cx", "rdx": "dx", "rsi": "si", "rdi": "di", "rbp": "bp"}
for p, n in NAME16.items():
    SUBREGS[n] = (p, 0, 16)
NAME8L = {"rax": "al", "rbx": "bl", "rcx": "cl", "rdx": "dl", "rsi": "sil", "rdi": "dil", "rbp": "bpl"}
for p, n in NAME8L.items():
    SUBREGS[n] = (p, 0, 8)
NAME8H = {"rax": "ah", "rbx": "bh", "rcx": "ch", "rdx": "dh"}
for p, n in NAME8H.items():
    SUBREGS[n] = (p, 8, 8)

UC_NAME = {
    "rax": UC_X86_REG_RAX, "rbx": UC_X86_REG_RBX, "rcx": UC_X86_REG_RCX, "rdx": UC_X86_REG_RDX,
    "rsi": UC_X86_REG_RSI, "rdi": UC_X86_REG_RDI, "rbp": UC_X86_REG_RBP, "rsp": UC_X86_REG_RSP,
    "r8": UC_X86_REG_R8, "r9": UC_X86_REG_R9, "r10": UC_X86_REG_R10, "r11": UC_X86_REG_R11,
    "r12": UC_X86_REG_R12, "r13": UC_X86_REG_R13, "r14": UC_X86_REG_R14, "r15": UC_X86_REG_R15,
}


class SymCPU:
    def __init__(self, uc_snapshot_regs, mem_concrete_reader, serial_range):
        self.regs = {r: z3.BitVecVal(uc_snapshot_regs[r], 64) for r in REG64}
        self.mem = {}
        self.mem_reader = mem_concrete_reader
        self.serial_lo, self.serial_hi = serial_range
        self.serial_syms = [z3.BitVec(f"s{i}", 8) for i in range(self.serial_hi - self.serial_lo)]

    def mem_byte(self, addr):
        if self.serial_lo <= addr < self.serial_hi:
            return self.serial_syms[addr - self.serial_lo]
        if addr not in self.mem:
            self.mem[addr] = z3.BitVecVal(self.mem_reader(addr, 1)[0], 8)
        return self.mem[addr]

    def mem_read(self, addr, size):
        parts = [self.mem_byte(addr + i) for i in range(size)]
        v = parts[-1]
        for p in reversed(parts[:-1]):
            v = z3.Concat(v, p)
        return z3.simplify(v) if size <= 8 else v

    def mem_write(self, addr, value, size):
        for i in range(size):
            lo = i * 8
            self.mem[addr + i] = z3.simplify(z3.Extract(lo + 7, lo, value))

    def getreg(self, name):
        name = name.lower()
        parent, off, width = SUBREGS[name]
        v = self.regs[parent]
        if width == 64:
            return v
        return z3.Extract(off + width - 1, off, v)

    def setreg(self, name, value, width_hint=None):
        name = name.lower()
        parent, off, width = SUBREGS[name]
        value = z3.simplify(z3.Extract(width - 1, 0, value)) if value.size() != width else value
        if width == 64:
            self.regs[parent] = value
        elif width == 32:
            # writing a 32-bit sub-register zero-extends to 64 bits
            self.regs[parent] = z3.ZeroExt(32, value)
        else:
            old = self.regs[parent]
            if off == 0:
                self.regs[parent] = z3.simplify(z3.Concat(z3.Extract(63, width, old), value))
            else:
                self.regs[parent] = z3.simplify(
                    z3.Concat(z3.Extract(63, off + width, old), value, z3.Extract(off - 1, 0, old))
                )


def op_value(cpu: SymCPU, op, size_override=None):
    if op.type == capstone.x86.X86_OP_REG:
        import capstone.x86 as cx86
        name = op.reg
        return cpu.getreg(_regname(op))
    elif op.type == capstone.x86.X86_OP_IMM:
        sz = size_override or op.size or 8
        return z3.BitVecVal(op.imm & ((1 << (sz * 8)) - 1), sz * 8)
    raise NotImplementedError(op.type)


_MD = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
_MD.detail = True


def _regname(op):
    return _MD.reg_name(op.reg)


def eff_addr_concrete(mem_addr_log, idx):
    return mem_addr_log[idx]


def run():
    e = Emu(verbose=False)
    trace = []
    mem_accesses = []  # (instr_index, addr, size, is_write)

    # Stage 1: run the native wrapper (prompt, sanitize, the Speck-like
    # decrypt loop -- tens of millions of instructions) with NO extra hooks,
    # stopping exactly at the shellcode's entry point (our own bump
    # allocator always hands out HEAP_BASE for this very first allocation,
    # and the call target is alloc+0x33). This keeps the expensive decrypt
    # loop at full native-hook speed.
    HEAP_ENTRY = HEAP_BASE + 0x33
    placeholder = b"A" * 76
    e.serial = placeholder
    e.uc.reg_write(UC_X86_REG_RSP, e.rsp0)
    e.uc.mem_write(e.rsp0, (FAKE_RET).to_bytes(8, "little"))
    import time
    t0 = time.time()
    e.uc.emu_start(FUNC_ENTRY, HEAP_ENTRY, timeout=10 * UC_SECOND_SCALE)
    print("stage1 took", time.time() - t0, "rip=", hex(e.uc.reg_read(UC_X86_REG_RIP)), "target=", hex(HEAP_ENTRY))

    entry_snapshot = {r: e.uc.reg_read(UC_NAME[r]) for r in REG64}
    serial_lo = entry_snapshot["r9"]
    serial_hi = serial_lo + 76
    print("serial buffer:", hex(serial_lo), "-", hex(serial_hi))

    # Stage 2: now add the (expensive) per-instruction / per-memory-access
    # hooks and run just the shellcode (~7-8k instructions -- fast even with
    # a Python callback per instruction).
    def code_cb(u, a, s, d):
        trace.append(a)

    def mem_cb(u, access, address, size, value, d):
        mem_accesses.append((len(trace) - 1, address, size, access in (UC_HOOK_MEM_WRITE,)))

    e.uc.hook_add(UC_HOOK_CODE, code_cb, begin=HEAP_BASE, end=HEAP_BASE + HEAP_SIZE)
    e.uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, mem_cb)
    e.uc.emu_start(HEAP_ENTRY, FAKE_RET)

    flag = int.from_bytes(e.uc.mem_read(e.rsp0 - 0xE0, 8), "little")
    print("concrete run: flag=", flag, "n_instr=", len(trace))

    def mem_reader(addr, size):
        return bytes(e.uc.mem_read(addr, size))

    cpu = SymCPU(entry_snapshot, mem_reader, (serial_lo, serial_hi))

    lo, hi = min(trace), max(trace) + 16
    code = bytes(e.uc.mem_read(lo, hi - lo))

    # group mem accesses by instruction index, in order
    mem_by_idx = {}
    for idx, addr, size, is_w in mem_accesses:
        mem_by_idx.setdefault(idx, []).append((addr, size, is_w))

    cmp_target_idx = None
    rdx_at_cmp = None

    for i, a in enumerate(trace):
        off = a - lo
        ins = next(_MD.disasm(code[off:off + 16], a), None)
        if ins is None:
            raise RuntimeError(f"disasm failed at {hex(a)}")
        execute(cpu, ins, mem_by_idx.get(i, []))
        if ins.mnemonic == "cmp" and ins.operands[0].type == capstone.x86.X86_OP_REG and _MD.reg_name(ins.operands[0].reg) == "rdx":
            cmp_target_idx = i
            rdx_at_cmp = cpu.getreg("rdx")
            print(f"[+] found cmp rdx,... at trace idx {i} ({hex(a)})")
            break

    if rdx_at_cmp is None:
        print("never found the cmp rdx,rax instruction in this trace")
        return

    solver = z3.Solver()
    solver.add(rdx_at_cmp == z3.BitVecVal(TARGET_HASH, 64))
    for s in cpu.serial_syms:
        solver.add(z3.Or(
            z3.And(s >= ord('A'), s <= ord('Z')),
            z3.And(s >= ord('a'), s <= ord('z')),
            z3.And(s >= ord('0'), s <= ord('9')),
        ))

    print("solving...")
    r = solver.check()
    print(r)
    if r == z3.sat:
        m = solver.model()
        sol = bytes(m.eval(s).as_long() for s in cpu.serial_syms)
        print("SERIAL:", sol)
        with open("solved_serial.txt", "wb") as f:
            f.write(sol)
    else:
        print("unsat / unknown")


def execute(cpu: SymCPU, ins, mem_ops):
    import capstone.x86 as cx86
    mnem = ins.mnemonic
    ops = ins.operands
    mem_iter = iter(mem_ops)

    def read_mem_operand(op, size):
        addr, sz, is_w = next(mem_iter)
        return cpu.mem_read(addr, size)

    def write_mem_operand(op, value, size):
        addr, sz, is_w = next(mem_iter)
        cpu.mem_write(addr, value, size)

    def get(op, size=None):
        if op.type == capstone.x86.X86_OP_REG:
            return cpu.getreg(_regname(op))
        elif op.type == capstone.x86.X86_OP_IMM:
            sz = size or op.size or 8
            v = op.imm & ((1 << (sz * 8)) - 1)
            return z3.BitVecVal(v, sz * 8)
        elif op.type == capstone.x86.X86_OP_MEM:
            sz = op.size or 8
            return read_mem_operand(op, sz)
        raise NotImplementedError

    def put(op, value):
        if op.type == capstone.x86.X86_OP_REG:
            name = _regname(op)
            width = SUBREGS[name.lower()][2]
            value = z3.simplify(z3.Extract(width - 1, 0, value)) if value.size() != width else value
            cpu.setreg(name, value)
        elif op.type == capstone.x86.X86_OP_MEM:
            sz = op.size or 8
            write_mem_operand(op, value, sz)
        else:
            raise NotImplementedError

    def width_of(op):
        if op.type == capstone.x86.X86_OP_REG:
            return SUBREGS[_regname(op).lower()][2]
        return (op.size or 8) * 8

    def z3same(a, b):
        wa, wb = a.size(), b.size()
        if wa < wb:
            a = z3.ZeroExt(wb - wa, a)
        elif wb < wa:
            b = z3.ZeroExt(wa - wb, b)
        return a, b

    if mnem == "mov" or mnem == "movzx":
        v = get(ops[1], size=(width_of(ops[0]) // 8) if mnem == "mov" else None)
        if mnem == "movzx" and v.size() < width_of(ops[0]):
            v = z3.ZeroExt(width_of(ops[0]) - v.size(), v)
        put(ops[0], z3.simplify(v))
    elif mnem == "movabs":
        put(ops[0], z3.BitVecVal(ops[1].imm & 0xFFFFFFFFFFFFFFFF, 64))
    elif mnem == "lea":
        # operand is memory, but we want the ADDRESS, not the dereferenced value.
        # We computed addresses concretely during the real run; just reuse it.
        addr, sz, is_w = next(mem_iter) if mem_ops else (None, None, None)
        if addr is None:
            # lea with no backing memory access logged (pure arithmetic lea) --
            # fall back to recomputing from base/index/disp registers symbolically.
            m = ops[1].mem
            val = z3.BitVecVal(m.disp & 0xFFFFFFFFFFFFFFFF, 64)
            if m.base:
                val = val + cpu.getreg(_MD.reg_name(m.base))
            if m.index:
                idx = cpu.getreg(_MD.reg_name(m.index))
                if m.scale != 1:
                    idx = idx * m.scale
                val = val + idx
            put(ops[0], z3.simplify(val))
        else:
            put(ops[0], z3.BitVecVal(addr, 64))
    elif mnem in ("add",):
        a, b = get(ops[0]), get(ops[1])
        a, b = z3same(a, b)
        put(ops[0], z3.simplify(a + b))
    elif mnem == "sub":
        a, b = get(ops[0]), get(ops[1])
        a, b = z3same(a, b)
        put(ops[0], z3.simplify(a - b))
    elif mnem == "xor":
        a, b = get(ops[0]), get(ops[1])
        a, b = z3same(a, b)
        put(ops[0], z3.simplify(a ^ b))
    elif mnem == "and":
        a, b = get(ops[0]), get(ops[1])
        a, b = z3same(a, b)
        put(ops[0], z3.simplify(a & b))
    elif mnem == "or":
        a, b = get(ops[0]), get(ops[1])
        a, b = z3same(a, b)
        put(ops[0], z3.simplify(a | b))
    elif mnem == "not":
        put(ops[0], z3.simplify(~get(ops[0])))
    elif mnem == "neg":
        put(ops[0], z3.simplify(-get(ops[0])))
    elif mnem == "inc":
        put(ops[0], z3.simplify(get(ops[0]) + 1))
    elif mnem == "dec":
        put(ops[0], z3.simplify(get(ops[0]) - 1))
    elif mnem == "shl":
        a = get(ops[0])
        b = ops[1].imm if ops[1].type == capstone.x86.X86_OP_IMM else get(ops[1])
        if not isinstance(b, int):
            b = z3.simplify(z3.Extract(a.size() - 1, 0, b if b.size() >= a.size() else z3.ZeroExt(a.size() - b.size(), b)))
        put(ops[0], z3.simplify(a << b))
    elif mnem == "shr":
        a = get(ops[0])
        amt = ops[1].imm
        put(ops[0], z3.simplify(z3.LShR(a, amt)))
    elif mnem == "rol":
        a = get(ops[0])
        amt = ops[1].imm % a.size()
        if amt:
            put(ops[0], z3.simplify(z3.RotateLeft(a, amt)))
    elif mnem == "imul":
        if len(ops) == 2:
            a, b = get(ops[0]), get(ops[1])
            a, b = z3same(a, b)
            put(ops[0], z3.simplify(a * b))
        else:
            raise NotImplementedError("imul form")
    elif mnem == "push":
        v = get(ops[0])
        if v.size() != 64:
            v = z3.ZeroExt(64 - v.size(), v)
        addr, sz, is_w = next(mem_iter)  # stay in sync with the real memory-access log
        cpu.mem_write(addr, v, 8)
        cpu.regs["rsp"] = z3.simplify(cpu.regs["rsp"] - 8)
    elif mnem == "pop":
        addr, sz, is_w = next(mem_iter)
        v = cpu.mem_read(addr, 8)
        cpu.regs["rsp"] = z3.simplify(cpu.regs["rsp"] + 8)
        put(ops[0], v)
    elif mnem in ("cmp", "cmove", "jmp", "je", "jnb", "jnz", "ja", "ret", "test", "nop"):
        pass  # control-flow / comparison instrs: handled by the driving loop, or irrelevant to the data computation
    else:
        raise NotImplementedError(f"unhandled mnemonic {mnem} at {hex(ins.address)}: {ins.op_str}")


if __name__ == "__main__":
    run()
