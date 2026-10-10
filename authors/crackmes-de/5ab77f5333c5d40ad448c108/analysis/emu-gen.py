#!/usr/bin/env python3
"""Usage: emu-gen.py tools/ k.exe nom cpuid_byte [serial]
Emulation unicorn de 0x4010e1 / 0x4011fa (md5 + strupr + cpuid + xor + %1d) pour valider le keygen.
cpuid est intercepte (eax = valeur fixe) ; malloc/sprintf/free/cookie sont stubbes."""
import sys,pefile
from unicorn import *; from unicorn.x86_const import *
sys.path.insert(0,sys.argv[1]); 
pe=pefile.PE(sys.argv[2]); name=sys.argv[3].encode(); K=int(sys.argv[4],0)
mu=Uc(UC_ARCH_X86,UC_MODE_32); mu.mem_map(0x400000,(pe.OPTIONAL_HEADER.SizeOfImage+0xfff)&~0xfff)
for s in pe.sections: mu.mem_write(0x400000+s.VirtualAddress,s.get_data())
mu.mem_map(0x100000,0x10000); mu.mem_map(0x200000,0x1000)
heap=[0x200000]
mu.mem_write(0x40da7c,name+b"\0")
cp=[0]
leaves=[K,0,0,0,0]
def ret(v,n=0):
    esp=mu.reg_read(UC_X86_REG_ESP); r=int.from_bytes(mu.mem_read(esp,4),'little')
    mu.reg_write(UC_X86_REG_EAX,v); mu.reg_write(UC_X86_REG_ESP,esp+4); mu.reg_write(UC_X86_REG_EIP,r)
def arg(i):
    esp=mu.reg_read(UC_X86_REG_ESP); return int.from_bytes(mu.mem_read(esp+4+4*i,4),'little')
def cstr(a):
    b=b""
    while (c:=mu.mem_read(a,1))!=b"\0": b+=c; a+=1
    return b
def hook(uc,addr,size,_):
    if addr==0x401d8b: a=heap[0]; heap[0]+=0x100; ret(a)
    elif addr==0x401ccd:
        fmt=cstr(arg(1)).decode(); v=arg(2); v=v-(1<<32) if v>>31 else v
        s=(fmt%v).encode()+b"\0"; mu.mem_write(arg(0),s); ret(len(s)-1)
    elif addr==0x401d51: ret(0)  # free
    elif addr==0x401cbe: ret(mu.reg_read(UC_X86_REG_EAX))  # __security_check_cookie
    elif addr==0x408993:  # _strupr
        a=arg(0); mu.mem_write(a,cstr(a).upper()); ret(a)
    elif bytes(uc.mem_read(addr,2))==b"\x0f\xa2":
        lf=uc.reg_read(UC_X86_REG_EAX)
        uc.reg_write(UC_X86_REG_EAX,leaves[lf]); [uc.reg_write(r,0) for r in (UC_X86_REG_EBX,UC_X86_REG_ECX,UC_X86_REG_EDX)]
        uc.reg_write(UC_X86_REG_EIP,addr+2)
mu.hook_add(UC_HOOK_CODE,hook)
mu.reg_write(UC_X86_REG_ESP,0x10f000); mu.mem_write(0x10f000,(0xdead0000).to_bytes(4,'little'))
mu.mem_map(0xdead0000,0x1000)
if len(sys.argv)>5:   # mode check : emule 0x4011fa avec le serial en 0x40da90
    mu.mem_write(0x40da90,sys.argv[5].encode()+b"\0")
    mu.emu_start(0x4011fa,0xdead0000); print("check(0x4011fa) =",mu.reg_read(UC_X86_REG_EAX))
else:
    mu.emu_start(0x4010e1,0xdead0000); print(cstr(mu.reg_read(UC_X86_REG_EAX))[:32].decode())
