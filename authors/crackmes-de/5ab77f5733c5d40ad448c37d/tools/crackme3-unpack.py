#!/usr/bin/env python3
"""crackme_3_interval (KLiZMA) : dépack FSG par émulation unicorn -> analysis/crackme3-fsg-image.bin
Image 0x400000..0x408000 ; stoppe au 1er fetch non nul dans la zone dépackée (OEP). Ne touche pas original/."""
import os, sys, struct
from unicorn import *
from unicorn.x86_const import *
here = os.path.dirname(os.path.abspath(__file__)); an = os.path.join(here, '..', 'analysis')
exe = open(os.path.join(an, 'crackme3-orig.exe'), 'rb').read()
ep = 0x400154  # stub FSG dans l'en-tête chevauchant (EP PE=0x407979 mène au même flot)
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(0x400000, 0x8000)
mu.mem_write(0x400000, exe[:0x200])
mu.mem_write(0x407000, exe[0x200:0x200+0x9da])
mu.mem_map(0x500000, 0x100000)
mu.reg_write(UC_X86_REG_ESP, 0x5f0000)
def hook(uc, addr, size, ud):
    if 0x401000 <= addr < 0x407000 and uc.mem_read(addr, 1) != b'\x00':
        print('OEP candidat', hex(addr)); uc.emu_stop()
mu.hook_add(UC_HOOK_CODE, hook)
try: mu.emu_start(ep, 0, count=20000000)
except Exception as e: print(e, hex(mu.reg_read(UC_X86_REG_EIP)))
print('ep', hex(ep), 'eip', hex(mu.reg_read(UC_X86_REG_EIP)))
open(os.path.join(an, 'crackme3-fsg-image.bin'), 'wb').write(bytes(mu.mem_read(0x400000, 0x8000)))
