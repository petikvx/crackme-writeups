import os,struct,sys
"""Émulation Unicorn de la fonction de check (0x14000e660) sur l'exe dépacké.
Prérequis : pip install unicorn pefile ; python3 tools/aegis-unpack.py analysis/extracted/hellgate.exe analysis/hellgate.unpacked.exe
Var d'env HELLGATE_UNPACKED pour changer le chemin. Les stubs API renvoient 0 (anti-debug neutralisé)."""
from unicorn import *
from unicorn.x86_const import *
import pefile
IMG=0x140000000
pe=pefile.PE(os.environ.get('HELLGATE_UNPACKED','analysis/hellgate.unpacked.exe'))
data=open(os.environ.get('HELLGATE_UNPACKED','analysis/hellgate.unpacked.exe'),'rb').read()
class Emu:
    def __init__(s,log=False):
        s.mu=mu=Uc(UC_ARCH_X86,UC_MODE_64)
        mu.mem_map(IMG,0x60000)
        mu.mem_write(IMG,data[:pe.OPTIONAL_HEADER.SizeOfHeaders])
        for sec in pe.sections:
            mu.mem_write(IMG+sec.VirtualAddress,sec.get_data())
        s.heapbase=0x200000000; mu.mem_map(s.heapbase,0x4000000); s.hp=s.heapbase
        s.stack=0x7ff00000; mu.mem_map(s.stack,0x200000)
        s.stub=0x300000000; mu.mem_map(s.stub,0x10000)
        s.teb=0x310000000; mu.mem_map(s.teb,0x10000); mu.mem_write(s.teb+0x60,struct.pack('<Q',s.teb+0x1000)); mu.msr_write(0xC0000101,s.teb)
        s.names={}
        i=0
        for e in pe.DIRECTORY_ENTRY_IMPORT:
            for imp in e.imports:
                a=s.stub+i*16; i+=1
                mu.mem_write(a,b'\xc3')
                mu.mem_write(imp.address,struct.pack('<Q',a))
                s.names[a]=imp.name.decode()
        mu.hook_add(UC_HOOK_CODE,s.hook,begin=s.stub,end=s.stub+0x10000)
        s.trace=[]
    def alloc(s,n,zero=True):
        a=s.hp; s.hp+=(n+31)&~15; return a
    def hook(s,mu,addr,size,ud):
        n=s.names[addr]
        rcx=mu.reg_read(UC_X86_REG_RCX);rdx=mu.reg_read(UC_X86_REG_RDX);r8=mu.reg_read(UC_X86_REG_R8)
        ret=0
        if n=='GetProcessHeap': ret=1
        elif n=='HeapAlloc': ret=s.alloc(r8)
        elif n=='HeapReAlloc':
            r9=mu.reg_read(UC_X86_REG_R9); ret=s.alloc(r9)
            if r8: mu.mem_write(ret,bytes(mu.mem_read(r8,min(r9,0x10000))))
        elif n=='HeapFree': ret=1
        elif n in('malloc',): ret=s.alloc(rcx)
        elif n=='calloc': ret=s.alloc(rcx*rdx)
        elif n=='free': ret=0
        elif n in ('memcpy','memmove'):
            mu.mem_write(rcx,bytes(mu.mem_read(rdx,r8))); ret=rcx
        elif n=='memset': mu.mem_write(rcx,bytes([rdx&0xff])*r8); ret=rcx
        else:
            print('API',n,hex(rcx),hex(rdx)); ret=0
        mu.reg_write(UC_X86_REG_RAX,ret)
    def call(s,fn,args,stackargs=()):
        mu=s.mu
        sp=s.stack+0x1f0000
        mu.reg_write(UC_X86_REG_RSP,sp)
        regs=[UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]
        for r,v in zip(regs,args): mu.reg_write(r,v)
        sp-=0x100
        for i,v in enumerate(stackargs): mu.mem_write(sp+0x28+i*8,struct.pack('<Q',v))
        # NB: after 'call', [rsp+8..0x20] shadow, args at rsp+0x28
        ret=s.stub+0xff00; mu.mem_write(ret,b'\xf4')
        sp-=8; mu.mem_write(sp,struct.pack('<Q',ret))
        mu.reg_write(UC_X86_REG_RSP,sp)
        mu.emu_start(fn,ret,count=50_000_000)
        return mu.reg_read(UC_X86_REG_RAX)
def unm(mu,acc,addr,size,val,ud):
    print('UNMAPPED',acc,hex(addr),'rip',hex(mu.reg_read(UC_X86_REG_RIP)));return False
