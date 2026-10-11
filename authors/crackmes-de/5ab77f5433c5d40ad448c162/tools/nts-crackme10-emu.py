#!/usr/bin/env python3
"""Vérif Unicorn : exécute la vraie routine 0x4013d0 de Crackme10.exe (nom, serial, key=0)."""
import struct,sys,os,zipfile,io,subprocess,importlib.util
from unicorn import *; from unicorn.x86_const import *
here=os.path.dirname(os.path.abspath(__file__))
exe=sys.argv[1] if len(sys.argv)>1 else '/tmp/nts/Crackme10.exe'
d=open(exe,'rb').read()
sp=importlib.util.spec_from_file_location('s',os.path.join(here,'nts-crackme10-solve.py'));s=importlib.util.module_from_spec(sp);sp.loader.exec_module(s)
def check(name,ser):
    u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(0x400000,0x10000)
    u.mem_write(0x401000,d[0x1000:0x19a2]);u.mem_write(0x403000,d[0x3000:0x31b4])
    u.mem_map(0x100000,0x10000);u.mem_write(0x101000,name+b'\0');u.mem_write(0x102000,ser+b'\0')
    u.mem_map(0x500000,0x1000);u.mem_map(0x600000,0x1000);u.mem_write(0x600000,b'\xc3')
    u.mem_write(0x40219c,struct.pack('<I',0x600000))
    def spf(uc,a,sz,ud):  # sprintf(buf,"%08X",v)
        e=uc.reg_read(UC_X86_REG_ESP);b,f,v=struct.unpack('<III',uc.mem_read(e+4,12));uc.mem_write(b,b"%08X\0"%v)
    u.hook_add(UC_HOOK_CODE,spf,begin=0x600000,end=0x600000)
    st=0x10f000;u.mem_write(st,struct.pack('<IIII',0x500000,0x101000,0x102000,0));u.reg_write(UC_X86_REG_ESP,st)
    u.emu_start(0x4013d0,0x500000);return u.reg_read(UC_X86_REG_EAX)
for n in ["petik!","crackmesone","AbCdEfGh"]:
    sr=s.serial(n);print(n,sr,check(n.encode(),sr.encode()),check(n.encode(),b"00000000"))
