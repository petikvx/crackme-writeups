#!/usr/bin/env python3
"""Exécute la vraie routine de vérification (0x401260) de Crackme7.exe sous Unicorn.
sscanf/sprintf (MSVCRT) sont émulés en Python. Usage: emulate_check.py exe name serial"""
import sys, re, struct, pefile
from unicorn import *
from unicorn.x86_const import *
exe, name, serial = sys.argv[1], sys.argv[2].encode(), sys.argv[3].encode()
pe = pefile.PE(exe); base = pe.OPTIONAL_HEADER.ImageBase
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(base, 0x10000); mu.mem_write(base, pe.get_memory_mapped_image()[:0x10000])
STK, BUF, STUB = 0x100000, 0x200000, 0x300000
mu.mem_map(STK, 0x10000); mu.mem_map(BUF, 0x1000); mu.mem_map(STUB, 0x1000)
mu.mem_write(STUB, b'\xc3\xc3\xc3')                 # sscanf, sprintf, retour final
mu.mem_write(0x4021d4, struct.pack('<I', STUB)); mu.mem_write(0x4021d0, struct.pack('<I', STUB+1))
def cstr(a):
    s=b''
    while (c:=mu.mem_read(a+len(s),1))!=b'\0': s+=c
    return s
def arg(i): return struct.unpack('<I', mu.mem_read(mu.reg_read(UC_X86_REG_ESP)+4+4*i,4))[0]
def hook(uc, addr, size, _):
    if addr==STUB:   # sscanf(src, "%[^-]-%s", a, b)
        m=re.match(rb'([^-]+)-(\S+)', cstr(arg(0)))
        if m: uc.mem_write(arg(2), m[1]+b'\0'); uc.mem_write(arg(3), m[2]+b'\0')
        uc.reg_write(UC_X86_REG_EAX, 2 if m else 0)
    elif addr==STUB+1:  # sprintf(dst, "%08X", v)
        uc.mem_write(arg(0), b'%08X\0' % arg(2))
mu.hook_add(UC_HOOK_CODE, hook, begin=STUB, end=STUB+1)
mu.mem_write(BUF, name+b'\0'); mu.mem_write(BUF+0x100, serial+b'\0')
sp = STK+0x8000; mu.mem_write(sp, struct.pack('<III', STUB+2, BUF, BUF+0x100))
mu.reg_write(UC_X86_REG_ESP, sp); mu.emu_start(0x401220, STUB+2)  # init table CRC
mu.reg_write(UC_X86_REG_ESP, sp); mu.emu_start(0x401260, STUB+2)
r = mu.reg_read(UC_X86_REG_EAX); print('check() =', r, '=> Registered' if r else '=> refusé'); sys.exit(0 if r else 1)
