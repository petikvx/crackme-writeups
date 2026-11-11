#!/usr/bin/env python3
"""Preuve sans Wine : émule main() du PE32 avec unicorn (imports CRT hookés).
usage: beginnerfriendly-emu.py <beginnerfriendly.exe> <password>"""
import struct, sys
from unicorn import *
from unicorn.x86_const import *

exe, pw = sys.argv[1], sys.argv[2].encode()
d = open(exe, "rb").read()
pe = struct.unpack_from("<I", d, 0x3C)[0]
nsec = struct.unpack_from("<H", d, pe + 6)[0]
optsz = struct.unpack_from("<H", d, pe + 20)[0]
base = struct.unpack_from("<I", d, pe + 0x34)[0]
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(base, 0x20000)
mu.mem_write(base, d[:0x400])
for i in range(nsec):
    o = pe + 24 + optsz + 40 * i
    va, rs, ro = struct.unpack_from("<III", d, o + 12)
    rs = min(rs, 0x1000 * 0)  or rs
    raw = struct.unpack_from("<I", d, o + 16)[0]
    mu.mem_write(base + va, d[ro:ro + raw])
STACK = 0x200000
mu.mem_map(STACK - 0x10000, 0x20000)
mu.mem_map(0x300000, 0x1000)
out = []
def rd(a):
    s = b""
    while (c := mu.mem_read(a, 1)) != b"\0":
        s += bytes(c); a += 1
    return s
def ret(eax=0):
    esp = mu.reg_read(UC_X86_REG_ESP)
    mu.reg_write(UC_X86_REG_EAX, eax)
    mu.reg_write(UC_X86_REG_EIP, struct.unpack("<I", mu.mem_read(esp, 4))[0])
    mu.reg_write(UC_X86_REG_ESP, esp + 4)
def arg(n):
    return struct.unpack("<I", mu.mem_read(mu.reg_read(UC_X86_REG_ESP) + 4 + 4 * n, 4))[0]
def hook(mu, addr, sz, ud):
    if addr == 0x401A90 or addr == 0x403BE8: ret(0)                  # __main / IsDebuggerPresent
    elif addr == 0x403B38: out.append(rd(arg(0)).decode()); ret(1)  # puts
    elif addr == 0x403B28: mu.mem_write(arg(1), pw[:63] + b"\0"); ret(1)  # scanf
    elif addr == 0x403B08: ret(len(rd(arg(0))))                      # strlen
    elif addr == 0x401551 + 0: pass
for a in (0x401A90, 0x403BE8, 0x403B38, 0x403B28, 0x403B08):
    mu.hook_add(UC_HOOK_CODE, hook, begin=a, end=a)
mu.mem_write(STACK, struct.pack("<I", 0x300000))  # adresse de retour -> stop
mu.reg_write(UC_X86_REG_ESP, STACK)
mu.emu_start(0x40146D, 0x300000)
print("\n".join(out))
