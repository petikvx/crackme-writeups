#!/usr/bin/env python3
"""Keygen fireworx crackme_9 (crackmes.one 5ab77f5433c5d40ad448c186).

serial = ((((n / 1932) * 921) << 17) >>> 9) / 12   (arith. 32 bits, idiv signée)
n = nombre affiché dans la 2e case (Edit2), généré au lancement.
--verify <exe> : émule avec Unicorn le vrai code de Button1Click (0x4417ff-0x44181f).
"""
import sys

def s32(x):
    x &= 0xffffffff
    return x - (1 << 32) if x & 0x80000000 else x

def idiv(a, b):
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b >= 0) else -q

def keygen(n):
    a = s32(idiv(s32(n), 1932) * 921)
    a = ((a << 17) & 0xffffffff) >> 9
    return idiv(s32(a), 12)

def emulate(exe, n):
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESI
    pe = pefile.PE(exe)
    code = pe.get_memory_mapped_image()[0x417ff:0x41821]
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x441000, 0x1000)
    mu.mem_write(0x4417ff, code)
    mu.reg_write(UC_X86_REG_EAX, n & 0xffffffff)
    mu.emu_start(0x4417ff, 0x441821)  # jusqu'après "mov esi,eax"
    return s32(mu.reg_read(UC_X86_REG_ESI))

if __name__ == "__main__":
    args = sys.argv[1:]
    exe = None
    if args and args[0] == "--verify":
        exe = args[1]; args = args[2:]
    for a in (args or ["654321"]):
        n = int(a); s = keygen(n)
        line = f"n={n} -> serial={s}"
        if exe:
            e = emulate(exe, n); line += f"  [unicorn: {e}] {'OK' if e == s else 'MISMATCH'}"
        print(line)
