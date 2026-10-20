#!/usr/bin/env python3
"""Exécute les vraies routines du binaire (MD5 0x403e14, TEA 0x406840/0x406878) sous unicorn
et compare avec le keygen. wsprintfA (0x404754) est remplacé par un stub Python.
Usage : python3 tools/unicorn-check.py [nom...]"""
import struct, sys, importlib.util, os
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *
H = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("kg", os.path.join(H, "keygenme2-solve.py")); kg = importlib.util.module_from_spec(spec); spec.loader.exec_module(kg)
import zipfile
pe = zipfile.ZipFile(os.path.join(H, "../original/keygenme#2_saytos.zip")).read("keygenme#2.exe")
def run(name):
    mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x200000); mu.mem_map(0x100000, 0x10000)
    for va, raw, sz in ((0x401000, 0x1000, 0x5a00), (0x407000, 0x7000, 0x600), (0x408000, 0x8000, 0x1000)):
        mu.mem_write(va, pe[raw:raw+sz])
    def hook(mu, addr, size, _):
        if addr == 0x404754:   # wsprintfA(buf, "%.8x"*4, a, b, c, d)
            esp = mu.reg_read(UC_X86_REG_ESP); ret, buf, fmt, *a = struct.unpack("<7I", mu.mem_read(esp, 28))
            mu.mem_write(buf, ("%.8x" * 4 % tuple(a)).encode() + b"\0"); mu.reg_write(UC_X86_REG_ESP, esp + 4); mu.reg_write(UC_X86_REG_EIP, ret)
        if addr == 0xdead: mu.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    def call(fn, *args):
        esp = 0x10f000 - 4 * (len(args) + 1); mu.mem_write(esp, struct.pack("<%dI" % (len(args) + 1), 0xdead, *args))
        mu.reg_write(UC_X86_REG_ESP, esp); mu.emu_start(fn, 0xdead)
    raw = name.encode("latin-1")
    mu.mem_write(0x408065, raw.ljust(0x1e, b"\0")); mu.mem_write(0x4080b5, raw.ljust(0x64, b"\0"))
    call(0x403e14, 0x4080b5, len(raw), 0x4082a1)              # MD5 (longueur = strlen(nom))
    md5 = bytes(mu.mem_read(0x4080b5, 32)).decode()
    call(0x406840, 0x4081af); call(0x406878, 0x408065, 0x408065)  # clé "crackmes\0Hmm,but", TEA
    lo, hi = struct.unpack("<2I", mu.mem_read(0x408065, 8))
    s = list(md5 + "-" + "%.8x%.8x" % (hi, lo)); s[6] = "C"; s[20] = "x"; s = list("".join(s).upper()); s[31] = "$"
    return "".join(s)
ok = True
for n in sys.argv[1:] or ["petik", "crackmes", "saytos2007", "A"]:
    e, k = run(n), kg.serial(n); ok &= e == k; print(("OK " if e == k else "KO ") + n, e)
sys.exit(0 if ok else 1)
