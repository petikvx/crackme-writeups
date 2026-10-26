#!/usr/bin/env python3
"""crackme_4_combo (KLiZMA) : dépack FSG par émulation unicorn -> analysis/crackme4-fsg-image.bin
(image 0x400000..0x408000 ; code dépacké en 0x401000, OEP 0x401220). Ne touche pas original/."""
from unicorn import *
from unicorn.x86_const import *
exe=open('analysis/crackme4-orig.exe','rb').read()
mu=Uc(UC_ARCH_X86,UC_MODE_32)
mu.mem_map(0x400000,0x8000)
mu.mem_write(0x400000,exe[:0x200])
mu.mem_write(0x407000,exe[0x200:0x200+0xa5e])
mu.mem_map(0x500000,0x100000)
mu.reg_write(UC_X86_REG_ESP,0x5f0000)
try: mu.emu_start(0x4079fd,0x4001c6,count=5000000)
except Exception as e: print(e, hex(mu.reg_read(UC_X86_REG_EIP)))
print(hex(mu.reg_read(UC_X86_REG_EIP)))
img=mu.mem_read(0x400000,0x8000)
open('analysis/crackme4-fsg-image.bin','wb').write(img)
ebx=mu.reg_read(UC_X86_REG_EBX);print(hex(ebx))
import struct
print([hex(x) for x in struct.unpack('<8I',mu.mem_read(ebx,32))])
