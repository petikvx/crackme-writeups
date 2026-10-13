#!/usr/bin/env python3
"""Émulateur Unicorn pour crackme#1_FJLJ.exe (adresses XP SP2 codées en dur).
usage: emu.py NAME [SERIAL]  -> rejoue le binaire avec stubs GetModuleHandleA/GetProcAddress/printf/scanf/ExitProcess."""
import struct, sys, re
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *
EXE = Path(__file__).resolve().parent.parent / "original" / "crackme#1_FJLJ.exe"
data = EXE.read_bytes()
pe = struct.unpack_from("<I", data, 0x3c)[0]
nsec = struct.unpack_from("<H", data, pe + 6)[0]
optsz = struct.unpack_from("<H", data, pe + 20)[0]
base = struct.unpack_from("<I", data, pe + 52)[0]
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(base, 0x10000)
mu.mem_write(base, data[:0x400])
for i in range(nsec):
    o = pe + 24 + optsz + 40 * i
    vs, va, rs, ro = struct.unpack_from("<IIII", data, o + 8)
    mu.mem_write(base + va, data[ro:ro + rs])
STUB = 0x70000000
mu.mem_map(STUB, 0x1000); mu.mem_write(STUB, b"\xc3" * 0x1000)
names = {"GetModuleHandleA": STUB, "GetProcAddress": STUB + 0x10, "ExitProcess": STUB + 0x20,
         "printf": STUB + 0x30, "scanf": STUB + 0x40}
addr2name = {v: k for k, v in names.items()}
mu.mem_map(0x77c10000, 0x2000)
mu.mem_write(0x77c110e8, struct.pack("<I", names["GetModuleHandleA"]))
mu.mem_write(0x77c110d0, struct.pack("<I", names["GetProcAddress"]))
mu.mem_map(0x77c41000, 0x1000); mu.mem_write(0x77c4186a, b"\xc3")   # printf XP SP2
mu.mem_map(0x7c81c000, 0x1000); mu.mem_write(0x7c81caa2, b"\xc3")   # ExitProcess XP SP2
addr2name[0x77c4186a] = "printf"; addr2name[0x7c81caa2] = "ExitProcess"
STK = 0x00200000; mu.mem_map(STK - 0x10000, 0x20000)
inputs = list(sys.argv[1:]); out = []; calls = []
def cstr(a):
    b = bytearray()
    while True:
        c = mu.mem_read(a, 1)[0]
        if c == 0: return bytes(b)
        b.append(c); a += 1
def arg(n):
    return struct.unpack("<I", mu.mem_read(mu.reg_read(UC_X86_REG_ESP) + 4 + 4 * n, 4))[0]
def ret(val, nargs=0):
    esp = mu.reg_read(UC_X86_REG_ESP)
    ra = struct.unpack("<I", mu.mem_read(esp, 4))[0]
    mu.reg_write(UC_X86_REG_ESP, esp + 4 + 4 * nargs)
    mu.reg_write(UC_X86_REG_EAX, val); mu.reg_write(UC_X86_REG_EIP, ra)
def fmt(f, i):
    s = ""; parts = re.split(rb"(%[sdxuc])", f)
    for p in parts:
        if p in (b"%s",): s += cstr(arg(i)).decode("latin1"); i += 1
        elif p in (b"%d", b"%u"): s += str(arg(i)); i += 1
        elif p == b"%x": s += "%x" % arg(i); i += 1
        else: s += p.decode("latin1")
    return s
def hook(uc, a, size, ud):
    n = addr2name.get(a)
    if not n: return
    if n == "GetModuleHandleA": calls.append(("GMH", cstr(arg(0)))); ret(0x77c10000, 1)
    elif n == "GetProcAddress":
        pn = cstr(arg(1)).decode(); calls.append(("GPA", pn)); ret(names.get(pn, 0), 2)
    elif n == "printf": out.append(fmt(cstr(arg(0)), 1)); ret(0)
    elif n == "scanf":
        if not inputs: out.append("<EOF>"); uc.emu_stop(); return
        s = inputs.pop(0).encode() + b"\0"; mu.mem_write(arg(1), s); ret(1)
    elif n == "ExitProcess": out.append("<ExitProcess>"); uc.emu_stop()
mu.hook_add(UC_HOOK_CODE, hook)
esp = STK; esp -= 4; mu.mem_write(esp, struct.pack("<I", names["ExitProcess"]))
mu.reg_write(UC_X86_REG_ESP, esp); mu.reg_write(UC_X86_REG_EBP, esp)
try:
    mu.emu_start(0x4012c2, 0, count=2_000_000)
except Exception as e:
    out.append(f"<crash {e} eip={mu.reg_read(UC_X86_REG_EIP):#x}>")
if "--trace" in sys.argv or True:
    sys.stderr.write(repr(calls) + "\n")
print("".join(out))
print("serial@0x4015c3 =", cstr(0x4015c3))
