import struct,sys
from unicorn import *
from unicorn.x86_const import *
from capstone import *
d=open('x/test.obf.exe','rb').read()
IB=0x140000000
mu=Uc(UC_ARCH_X86,UC_MODE_64)
mu.mem_map(IB,0x40000)
mu.mem_write(IB,d[:0x400])
for va,sz,off,rsz in [(0x1000,0x28890,0x400,0x28a00),(0x2a000,0xaa6e,0x28e00,0xac00),(0x35000,0xe00,0x33a00,0xe00),(0x37000,0x13f8,0x34800,0x1400),(0x39000,0x100,0x35c00,0x100)]:
    mu.mem_write(IB+va,d[off:off+min(sz,rsz)])
mu.mem_map(0x7ff000000000,0x100000)
STK=0x7ff000080000
mu.mem_map(0x10000,0x1000)
cs=Cs(CS_ARCH_X86,CS_MODE_64)
rs=[]


PW=sys.argv[1].encode()
fs=set()
for i in range(0,0x13f8,12):
    b,e,u=struct.unpack_from('<III',d,0x34800+i); fs.add(IB+b)
def rd(a,n=64):
    b=bytes(mu.mem_read(a,n)); return b.split(b'\0')[0]
def hk(uc,a,sz,u):
    if a in fs and a!=0x140001000:
        rsp=uc.reg_read(UC_X86_REG_RSP)
        ret=struct.unpack('<Q',uc.mem_read(rsp,8))[0]
        rc=uc.reg_read(UC_X86_REG_RCX)
        if a==0x14000fba0: return
        print(hex(a),'ret',hex(ret),'rcx',hex(rc),'rdx',hex(uc.reg_read(UC_X86_REG_RDX)),'r8',hex(uc.reg_read(UC_X86_REG_R8)))
        try: print('   str',rd(rc))
        except: pass
        if a==0x140016188:
            mu.mem_write(rc,PW+b'\n\0'); uc.reg_write(UC_X86_REG_RAX,rc); uc.reg_write(UC_X86_REG_RSP,rsp+8); uc.reg_write(UC_X86_REG_RIP,ret)
        elif a==0x1400163c0:
            r=len(rd(rc,64).split(bytes(mu.mem_read(uc.reg_read(UC_X86_REG_RDX),1)))[0]); print('strcspn',r)
            uc.reg_write(UC_X86_REG_RAX,r); uc.reg_write(UC_X86_REG_RSP,rsp+8); uc.reg_write(UC_X86_REG_RIP,ret)
        elif a==0x140029210:
            print('STRCMP expected', bytes(mu.mem_read(uc.reg_read(UC_X86_REG_RDX),32))); uc.emu_stop()
        elif a==0x140012710:
            uc.reg_write(UC_X86_REG_RAX,0); uc.reg_write(UC_X86_REG_RSP,rsp+8); uc.reg_write(UC_X86_REG_RIP,ret)
        else: uc.emu_stop()
mu.hook_add(UC_HOOK_CODE,hk)
mu.reg_write(UC_X86_REG_RSP,STK)
mu.mem_write(STK,struct.pack('<Q',0x10000))
try: mu.emu_start(0x140001000,0,count=50000000)
except Exception as e: print('err',e,hex(mu.reg_read(UC_X86_REG_RIP)))
