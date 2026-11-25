#!/usr/bin/env python3
"""Emulateur Python de la VM de crackus.exe (obscurio). Usage: obscurio-vm.py program.bin [--trace]"""
import struct, sys
M = 0xFFFFFFFF
T4 = [1, 3, 0, 2]
T16 = [3, 8, 1, 0xE, 6, 0xC, 9, 0, 0xB, 4, 0xF, 7, 0xD, 2, 0xA, 5]

def xs_r(x, s):
    k = s
    while k <= 31:
        x ^= x >> k; k <<= 1
    return x & M

def xs_l(x, s):
    k = s
    while k <= 31:
        x ^= (x << k) & M; k <<= 1
    return x & M

def dec_const(a, pc):
    x = xs_r(a, 8)
    x = (x * 0x65587AC3) & M
    x = (x - 0x71B5) & M
    x = xs_l(x, 5)
    x = (x * 0x62677787) & M
    x = xs_r(x, 7)
    x = (x - 0xA3D7) & M
    return (x - pc) & M

def dec16(a):          # cibles de saut
    return (a & ~0xF & M) + T16[a & 0xF]

def dec_idx(a, pc):    # index local/arg
    if a <= 0xF:
        v = (a & ~3 & M) + T4[a & 3]
    else:
        v = (a & ~0xF & M) + T16[a & 0xF]
    return v ^ (pc % 9)

def dec_n(a, pc):      # taille frame (ENTER/LEAVE)
    return ((a & ~3 & M) + T4[a & 3]) ^ (pc & 3)

def run(prog, inp=b"", trace=False, hook=None, maxsteps=10**9):
    n = len(prog) // 8
    code = struct.unpack("<%dI" % (2 * n), prog[:n * 8])
    ops = []; cs = [0] * 0x100000; hp = [0] * 0x100000
    sp = 0; csp = 0; bp = 0; pc = 0; ip = 0
    outb = bytearray(); steps = 0
    while pc < n:
        steps += 1
        if steps > maxsteps: raise RuntimeError("maxsteps")
        op = code[2 * pc]; a = code[2 * pc + 1]
        if hook: hook(pc, op, ops, hp, cs, bp, csp)
        if trace and (op in (0x14,0x28,0x29,0x2a,0x1f4,0x1f5,0x1f6,0x1f7,0x1f8,0x5) or trace == 2): print(pc, hex(op), hex(a), ops[-4:], file=sys.stderr)
        if op == 0x28:
            cs[csp] = pc + 1; csp += 1; pc = dec16(a); continue
        elif op == 0x2A:
            k = dec_n(a, pc); cs[csp] = bp; csp += 1; bp = csp - 1; csp += k
        elif op == 0x29:
            k = dec_n(a, pc); csp = bp; bp = cs[csp]; csp -= 1; ret = cs[csp]; csp -= k; pc = ret; continue
        elif op == 0: ops.append(cs[bp + dec_idx(a, pc) + 1])
        elif op == 1: cs[bp + dec_idx(a, pc) + 1] = ops.pop()
        elif op == 2: ops.append(cs[bp - dec_idx(a, pc) - 2])
        elif op == 3: cs[bp - dec_idx(a, pc) - 2] = ops.pop()
        elif op == 5: cs[csp] = ops.pop(); csp += 1
        elif op == 4: ops.append(dec_const(a, pc))
        elif op == 0x14:
            t = dec16(a)
            if ops.pop() == 0: pc = t; continue
        elif op == 0x64: b = ops.pop(); x = ops.pop(); ops.append(x & b)
        elif op == 0x65: b = ops.pop(); x = ops.pop(); ops.append(x | b)
        elif op == 0x68: s = ops.pop(); x = ops.pop(); ops.append((x << s) & M if s <= 31 else 0)
        elif op == 0x69: s = ops.pop(); x = ops.pop(); ops.append(x >> s if s <= 31 else 0)
        elif op == 0x96: ops[-1] = ~ops[-1] & M
        elif op == 0xC8: ops.append(ops[-2])
        elif op == 0xCA: ops.append(ops[-1])
        elif op == 0xC9: c = ops.pop(); b = ops.pop(); x = ops.pop(); ops += [c, x, b]
        elif op == 0xCB: d = ops.pop(); c = ops.pop(); b = ops.pop(); x = ops.pop(); ops += [b, c, d, x]
        elif op == 0x1F4: outb += b"%d" % ops.pop()
        elif op == 0x1F7:
            addr = ops.pop(); ln = hp[addr - 1]
            for i in range(ln):
                c = hp[addr + i]
                if c <= 0x7F: outb.append(c)
        elif op == 0x1F8:
            mx = ops.pop(); addr = ops.pop(); i = 0
            while True:
                if ip >= len(inp): c = -1
                else: c = inp[ip]; ip += 1
                if c == -1 or c == 10: break
                if i < mx: hp[addr + i] = c; i += 1
            hp[addr - 1] = i
        elif op == 0x1F6: v = ops.pop(); addr = ops.pop(); hp[addr] = v
        elif op == 0x1F5: ops[-1] = hp[ops[-1]]
        else: raise RuntimeError("opcode %#x pc=%d" % (op, pc))
        pc += 1
    return bytes(outb), (ops[-1] if ops else None), steps

if __name__ == "__main__":
    p = open(sys.argv[1], "rb").read()
    o, r, s = run(p, sys.stdin.buffer.read(), 1 if "--trace" in sys.argv else 0)
    sys.stdout.buffer.write(o); print("\n[ret=%s steps=%d]" % (r, s))
