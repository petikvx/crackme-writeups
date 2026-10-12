#!/usr/bin/env python3
"""Émule (Unicorn) la vraie boucle 0x4010AE..0x4010DD de keyme2.exe et compare au keygen."""
import sys, pefile
from unicorn import *; from unicorn.x86_const import *
pe = pefile.PE(sys.argv[1]); img = pe.get_memory_mapped_image()
def run(name, serial):
    mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, (len(img)+0xfff)&~0xfff); mu.mem_write(0x400000, img)
    mu.mem_map(0x100000, 0x10000); mu.reg_write(UC_X86_REG_ESP, 0x108000)
    mu.mem_write(0x4031eb, name.encode('latin-1') + b'\0')
    mu.reg_write(UC_X86_REG_ESP, 0x107ffc); mu.mem_write(0x107ffc, serial.to_bytes(4, 'little'))  # push eax (GetDlgItemInt)
    mu.emu_start(0x4010ae, 0x4010df)
    return mu.reg_read(UC_X86_REG_ECX) == mu.reg_read(UC_X86_REG_ESI), mu.reg_read(UC_X86_REG_ESI)
sys.path.insert(0, __import__('os').path.dirname(__file__)); from importlib import import_module; keygen = import_module("korbut_keygenme2-solve").keygen  # keygen
for n in ['petik', 'crackmes', 'Asma']:
    print(n, keygen(n), run(n, keygen(n)), run(n, keygen(n) + 1)[0])
