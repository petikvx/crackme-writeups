#!/usr/bin/env python3
"""Exécute la fonction native getserial (VA 0x402410) du binaire original sous Unicorn."""
import sys, struct, pefile
from unicorn import *
from unicorn.x86_const import *
import os
exe = os.environ.get("EXE", os.path.join(os.path.dirname(__file__), "..", "original", "My First Crackme.exe"))
names = sys.argv[1:] or ["John", "petik"]
pe = pefile.PE(exe); base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
STRLEN_THUNK, GETSERIAL, STACK, BUF, RET = 0x4021dc, 0x402410, 0x100000, 0x200000, 0x300000
def run(name):
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, (len(img) + 0xfff) & ~0xfff); mu.mem_write(base, img)
    for a in (STACK, BUF, RET): mu.mem_map(a, 0x10000)
    mu.mem_write(BUF, name.encode('latin-1') + b"\0")
    esp = STACK + 0x8000
    mu.mem_write(esp, struct.pack("<II", RET, BUF)); mu.reg_write(UC_X86_REG_ESP, esp)
    def hook(mu, addr, size, _):
        if addr == STRLEN_THUNK:  # jmp [__imp_strlen] -> strlen émulé
            sp = mu.reg_read(UC_X86_REG_ESP)
            r, p = struct.unpack("<II", mu.mem_read(sp, 8))
            s = bytes(mu.mem_read(p, 256)); mu.reg_write(UC_X86_REG_EAX, s.index(b"\0"))
            mu.reg_write(UC_X86_REG_ESP, sp + 4); mu.reg_write(UC_X86_REG_EIP, r)
    mu.hook_add(UC_HOOK_CODE, hook, begin=STRLEN_THUNK, end=STRLEN_THUNK)
    mu.emu_start(GETSERIAL, RET, timeout=2_000_000)
    p = mu.reg_read(UC_X86_REG_EAX)
    return bytes(mu.mem_read(p, 256)).split(b"\0")[0].decode('latin-1')
for n in names: print(f"{n} -> {run(n)}")
