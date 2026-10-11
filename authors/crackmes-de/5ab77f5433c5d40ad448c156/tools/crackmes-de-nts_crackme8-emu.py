# usage : emu.py NOM SERIAL [Crackme8.exe] -> exécute la vraie routine 0x405410(nom,serial) sous unicorn
import sys,struct
from unicorn import *; from unicorn.x86_const import *
import pefile
p=pefile.PE(sys.argv[3] if len(sys.argv)>3 else 'Crackme8.exe'); img=p.get_memory_mapped_image()
u=Uc(UC_ARCH_X86,UC_MODE_32); u.mem_map(0x400000,0x20000); u.mem_write(0x400000,img[:0x20000])
u.mem_map(0x100000,0x100000); u.mem_map(0x500000,0x1000); u.mem_write(0x500000,b'\xc3'*16)
u.mem_write(0x406190,struct.pack('<I',0x500000))  # IAT sprintf
def rs(a):
    b=b''
    while (c:=bytes(u.mem_read(a,1)))!=b'\0': b+=c;a+=1
    return b
def arg(n): return struct.unpack('<I',u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n,4))[0]
def hk(uc,a,s,_):
    if a==0x500000:
        assert rs(arg(1))==b'%08X%08X'; uc.mem_write(arg(0),b'%08X%08X\0'%(arg(2),arg(3)))
u.hook_add(UC_HOOK_CODE,hk,begin=0x500000,end=0x500001)
N,S=0x180000,0x180100; u.mem_write(N,sys.argv[1].encode()+b'\0'); u.mem_write(S,sys.argv[2].encode()+b'\0')
sp=0x1f0000; u.mem_write(sp,struct.pack('<III',0xdead0000,N,S)); u.reg_write(UC_X86_REG_ESP,sp)
u.mem_map(0xdead0000,0x1000); u.emu_start(0x405410,0xdead0000)
print('OK' if u.reg_read(UC_X86_REG_EAX)==1 else 'KO')
