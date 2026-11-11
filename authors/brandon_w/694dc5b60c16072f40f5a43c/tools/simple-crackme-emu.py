#!/usr/bin/env python3
"""Preuve unicorn : exécute la boucle de transformation réelle (0x140001081..0x1400010d4)
du binaire, puis reproduit le strcmp. Usage: simple-crackme-emu.py EXE [mot_de_passe...]"""
import sys, struct
from unicorn import UC_HOOK_CODE, Uc, UC_ARCH_X86, UC_MODE_64
from unicorn.x86_const import *

DBG = False
exe = sys.argv[1]
raw = open(exe, 'rb').read()
e = struct.unpack_from('<I', raw, 0x3c)[0]
nsec, = struct.unpack_from('<H', raw, e + 6); osz, = struct.unpack_from('<H', raw, e + 20)
base, = struct.unpack_from('<Q', raw, e + 24 + 24)
soi, = struct.unpack_from('<I', raw, e + 24 + 56); shs, = struct.unpack_from('<I', raw, e + 24 + 60)
img = bytearray(soi); img[:shs] = raw[:shs]
for i in range(nsec):
    _, va, rs, ro = struct.unpack_from('<IIII', raw, e + 24 + osz + i * 40 + 8)
    img[va:va + rs] = raw[ro:ro + rs]
def run(pw: bytes) -> bool:
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, (len(img) + 0xfff) & ~0xfff); mu.mem_write(base, bytes(img))
    mu.mem_map(0x200000, 0x10000)           # stack
    mu.mem_map(0x300000, 0x1000)            # faux PEB (BeingDebugged=0)
    rsp = 0x200000 + 0x8000
    mu.mem_write(rsp + 0x20, pw + b"\0")
    mu.reg_write(UC_X86_REG_RSP, rsp); mu.reg_write(UC_X86_REG_RBX, 0x300000)
    mu.hook_add(UC_HOOK_CODE, lambda u,a,s,d: print(hex(a)) if DBG else None)
    try: mu.emu_start(0x140001081, 0x1400010d4)
    except Exception: print(hex(mu.reg_read(UC_X86_REG_RIP)), hex(base)); raise
    rcx, rdx = mu.reg_read(UC_X86_REG_RCX), mu.reg_read(UC_X86_REG_RDX)
    cstr = lambda a: bytes(mu.mem_read(a, 64)).split(b"\0")[0]
    return cstr(rcx) == cstr(rdx)
for p in sys.argv[2:] or ["RCQQUMPF", "password", "petik"]:
    print(f"{p!r}: {'Correct!' if run(p.encode()) else 'Incorrect'}")
