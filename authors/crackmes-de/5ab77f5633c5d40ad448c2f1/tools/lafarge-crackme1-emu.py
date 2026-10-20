#!/usr/bin/env python3
"""Preuve : execute la VRAIE routine de generation (0x401170..0x4012da) du dump
unpacke (analysis/crackme.unpacked-dump.bin) sous unicorn et compare au keygen."""
import sys, os
from unicorn import *
from unicorn.x86_const import *
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import importlib.util
sp = importlib.util.spec_from_file_location("k", os.path.join(os.path.dirname(os.path.abspath(__file__)), "lafarge-crackme1-solve.py"))
k = importlib.util.module_from_spec(sp); sp.loader.exec_module(k)
img = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "analysis", "crackme.unpacked-dump.bin"), "rb").read()

def real(name):
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x1a000); mu.mem_write(0x400000, img)
    mu.mem_map(0x200000, 0x10000)
    b = name.encode()
    mu.mem_write(0x40631b, b + b"\0"); mu.mem_write(0x406343, b + b"\0")  # lstrcpyA deja fait
    mu.reg_write(UC_X86_REG_EAX, len(b)); mu.reg_write(UC_X86_REG_ESP, 0x208000)
    mu.emu_start(0x401170, 0x4012da)
    return bytes(mu.mem_read(0x40632f, 17)).split(b"\0")[0].decode("latin1")

ok = True
for n in sys.argv[1:] or ["petik", "abcd", "lafarge", "a_much_longer_name_over_15", "0123456789abcde", "x" * 44]:
    r, s = real(n), k.keygen(n)
    print(f"{n!r:34} binaire={r!r} keygen={s!r} {'OK' if r == s else 'KO'}")
    ok &= r == s
sys.exit(0 if ok else 1)
