#!/usr/bin/env python3
"""Dépack FSG 1.0 de xCrackMe.exe via unicorn (stub émulé, imports simulés).
Usage: unpack-fsg.py <xCrackMe.exe> <out.bin>   -> dump brut 0x13141000..0x13144000 + infos."""
import sys, struct
from unicorn import *
from unicorn.x86_const import *
IB = 0x13140000
data = open(sys.argv[1], 'rb').read()
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(IB, 0x4000)
mu.mem_write(IB, data[:0x200])
mu.mem_write(IB + 0x3000, data[0x200:0x200 + 0x325])
mu.mem_map(0x100000, 0x100000)
mu.mem_write(0x100000, b'\0' * 0x100000)
mu.reg_write(UC_X86_REG_ESP, 0x1f0000)
imports = []
def hook_code(uc, addr, size, ud):
    esp = uc.reg_read(UC_X86_REG_ESP)
    if addr == IB + 0x1c6:       # call [ebx+0x10] = LoadLibraryA(name)
        name = uc.mem_read(struct.unpack('<I', uc.mem_read(esp, 4))[0], 20).split(b'\0')[0]
        imports.append(('DLL', name.decode()))
        uc.reg_write(UC_X86_REG_EAX, 0x70000000)
        uc.reg_write(UC_X86_REG_ESP, esp + 4)
        uc.reg_write(UC_X86_REG_EIP, addr + 3)
    elif addr == IB + 0x1d6:     # call [ebx+0x14] = GetProcAddress(h, name)
        p = struct.unpack('<I', uc.mem_read(esp + 4, 4))[0]
        if p < IB: p += IB if p > 0xffff else 0
        nm = uc.mem_read(p, 40).split(b'\0')[0] if p > 0x10000 else str(p)
        imports.append(('FN', nm if isinstance(nm, str) else nm.decode()))
        uc.reg_write(UC_X86_REG_EAX, 0x71000000 + 4 * len(imports))
        uc.reg_write(UC_X86_REG_ESP, esp + 4)
        uc.reg_write(UC_X86_REG_EIP, addr + 3)
    elif addr == IB + 0x1d1:     # jmp [ebx+0xc] -> OEP
        oep = struct.unpack('<I', uc.mem_read(uc.reg_read(UC_X86_REG_EBX) + 0xc, 4))[0]
        print('OEP = %#x' % oep)
        uc.emu_stop()
mu.hook_add(UC_HOOK_CODE, hook_code)
try:
    mu.emu_start(IB + 0x154, 0, count=5_000_000)
except UcError as e:
    print('err', e, hex(mu.reg_read(UC_X86_REG_EIP)))
print(imports)
open(sys.argv[2], 'wb').write(bytes(mu.mem_read(IB + 0x1000, 0x3000)))
