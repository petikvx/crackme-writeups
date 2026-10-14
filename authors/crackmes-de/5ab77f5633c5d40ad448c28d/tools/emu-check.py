#!/usr/bin/env python3
# Recoupement unicorn : exécute la routine 0x4015e3 du dump mémoire (post-ASPack) sur un nom.
# usage : tools/emu-check.py NAME   (depuis le dossier du challenge)
import sys
from unicorn import *
from unicorn.x86_const import *
d=bytearray(open('analysis/RaMMy-mem-0x401000-0x404000.bin','rb').read())
mu=Uc(UC_ARCH_X86,UC_MODE_32)
mu.mem_map(0x400000,0x50000); mu.mem_write(0x401000,bytes(d))
mu.mem_map(0x100000,0x10000)
name=sys.argv[1].encode()
mu.mem_write(0x403134,name+b'\0')
LSTRLEN=0x401820
def hook(uc,addr,size,ud):
    if addr==LSTRLEN:
        p=struct.unpack('<I',uc.mem_read(uc.reg_read(UC_X86_REG_ESP)+4,4))[0]
        s=bytes(uc.mem_read(p,256)).split(b'\0')[0]
        esp=uc.reg_read(UC_X86_REG_ESP); ret=struct.unpack('<I',uc.mem_read(esp,4))[0]
        uc.reg_write(UC_X86_REG_EAX,len(s)); uc.reg_write(UC_X86_REG_ESP,esp+8); uc.reg_write(UC_X86_REG_EIP,ret)
import struct
mu.hook_add(UC_HOOK_CODE,hook,begin=LSTRLEN,end=LSTRLEN)
esp=0x10f000; mu.mem_write(esp,struct.pack('<II',0xdead0000,0x403134))
mu.reg_write(UC_X86_REG_ESP,esp)
mu.hook_add(UC_HOOK_CODE,lambda uc,a,s,u: uc.emu_stop(),begin=0x4016a5,end=0x4016a5)
mu.emu_start(0x4015e3,0)
p=mu.reg_read(UC_X86_REG_EAX)
print(hex(p), bytes(mu.mem_read(p,16)).split(b'\0')[0], hex(struct.unpack('<I',mu.mem_read(0x403138,4))[0]))
