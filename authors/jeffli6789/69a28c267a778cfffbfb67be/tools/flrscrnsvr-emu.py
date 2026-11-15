#!/usr/bin/env python3
"""Preuve sur le binaire d'origine : émule la vraie fonction 0x140001300 (transformation)
avec unicorn (IAT stubée) et compare le résultat au tableau attendu 0x1400064d0.

usage: flrscrnsvr-emu.py [texte]   (défaut : flag du solveur)
"""
import struct, sys, os
from unicorn import *
from unicorn.x86_const import *

HERE = os.path.dirname(os.path.abspath(__file__))
PE = os.path.join(HERE, "..", "analysis", "x", "FLRSCRNSVR.SCR")
BASE = 0x140000000
d = open(PE, "rb").read()
pe = struct.unpack_from("<I", d, 0x3c)[0]
nsec = struct.unpack_from("<H", d, pe + 6)[0]
so = struct.unpack_from("<H", d, pe + 20)[0]
size_img = struct.unpack_from("<I", d, pe + 24 + 56)[0]

mu = Uc(UC_ARCH_X86, UC_MODE_64)
mu.mem_map(BASE, size_img)
mu.mem_write(BASE, d[:0x400])
for i in range(nsec):
    o = pe + 24 + so + i * 40
    vs, va, rs, ro = struct.unpack_from("<IIII", d, o + 8)
    mu.mem_write(BASE + va, d[ro:ro + min(rs, vs)])

STUB = 0x200000000
mu.mem_map(STUB, 0x1000)
mu.mem_map(0x7000000, 0x100000)   # pile
mu.mem_map(0x8000000, 0x10000)    # buffer entrée
mu.mem_write(STUB, b"\xc3" * 0x1000)
# IAT .rdata 0x6000..0x62d0 -> chaque slot pointe sur un stub (ret)
for slot in range(0x140006000, 0x1400063f0, 8):
    mu.mem_write(slot, struct.pack("<Q", STUB + ((slot - 0x140006000) // 8)))
slots = {STUB + (s - 0x140006000) // 8: s for s in range(0x140006000, 0x1400063f0, 8)}

def rd_w(a):
    out = b""
    while True:
        c = bytes(mu.mem_read(a, 2)); a += 2
        if c == b"\0\0": return out
        out += c

def hook(uc, addr, size, _):
    s = slots.get(addr)
    if s is None: return
    rcx, rdx, r8 = (uc.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
    ret = 0
    if s == 0x1400062b0:    # wcschr(str, ch)
        a = rcx
        while True:
            c = struct.unpack("<H", bytes(uc.mem_read(a, 2)))[0]
            if c == (rdx & 0xffff): ret = a; break
            if c == 0: break
            a += 2
    elif s == 0x1400063d0:  # wcscpy_s(dst, n, src)
        uc.mem_write(rcx, rd_w(r8) + b"\0\0")
    elif s == 0x1400063d8:  # wcscat_s(dst, n, src)
        uc.mem_write(rcx + len(rd_w(rcx)), rd_w(r8) + b"\0\0")
    elif s in (0x140006160,):  # FindFirstFileW -> INVALID_HANDLE_VALUE
        ret = 2**64 - 1
    elif s in (0x140006010, 0x140006000, 0x140006018, 0x140006138, 0x140006130):
        ret = 1                # erreurs / échecs API
    uc.reg_write(UC_X86_REG_RAX, ret)

mu.hook_add(UC_HOOK_CODE, hook, None, STUB, STUB + 0x1000)

text = sys.argv[1] if len(sys.argv) > 1 else None
if text is None:
    sys.path.insert(0, HERE)
    import importlib.util
    sp = importlib.util.spec_from_file_location("s", os.path.join(HERE, "flrscrnsvr-solve.py"))
    m = importlib.util.module_from_spec(sp); sp.loader.exec_module(m)
    text = m.solve()
mu.mem_write(0x8000000, text.encode("utf-16le") + b"\0\0")
mu.reg_write(UC_X86_REG_RSP, 0x7000000 + 0xf0000)
mu.reg_write(UC_X86_REG_RCX, 0x8000000)
ret = 0x7000000 + 0x1000
mu.mem_write(ret, b"\xf4")
mu.mem_write(0x7000000 + 0xf0000, struct.pack("<Q", ret))
try:
    mu.emu_start(BASE + 0x1300, ret, count=5_000_000)
except UcError as e:
    print("emu stop:", e)
res = rd_w(0x8000000).decode("utf-16le")
exp = bytes(mu.mem_read(BASE + 0x64d0, 50)).decode("utf-16le").rstrip("\0")
print("entrée    :", text)
print("transformé:", [hex(ord(c)) for c in res])
print("attendu   :", [hex(ord(c)) for c in exp])
print("MATCH" if res == exp else "NO MATCH")
