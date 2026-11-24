import struct,sys
from unicorn import *
from unicorn.arm64_const import *
d=open(sys.argv[1],'rb').read(); pw=sys.argv[2]
mu=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
B=0x100000000
mu.mem_map(B,0x10000); mu.mem_write(B,d[:0x9000] if len(d)>=0x9000 else d)
# __got etc live in file at 0x8000
mu.mem_map(0x200000,0x100000)  # stack
mu.mem_map(0x400000,0x100000)  # heap
heap=[0x400000]
STUB0,STUB1=0x1000044f0,0x1000044f0+0x228
mu.mem_write(0x100008000,d[0x8000:0x8000+0x1b8])
# fill GOT with fake distinct addrs pointing at stubs? stubs: adrp/ldr/br via got -> point got entries to trap addresses
TRAP=0x300000; mu.mem_map(TRAP,0x1000)
for i in range(0x1b8//8):
    mu.mem_write(0x100008000+i*8,struct.pack('<Q',TRAP+i*4))
    mu.mem_write(TRAP+i*4,b'\xc0\x03\x5f\xd6')
def alloc(n):
    a=heap[0]; heap[0]+=(n+15)&~15; return a
out=[]
def rd(a,n): return bytes(mu.mem_read(a,n))
def cstr(a):
    s=b''
    while True:
        c=rd(a,1)
        if c==b'\0':return s
        s+=c;a+=1
def sget(a):
    b=rd(a,24)
    if b[23]&0x80==0: return b[:b[23]]  # short (len in last byte)? libc++ new layout
    return None
mu.reg_write(UC_ARM64_REG_SP,0x2f0000)
hit={}
def hook(uc,addr,size,_):
    if TRAP<=addr<TRAP+0x1000:
        idx=(addr-TRAP)//4
        lr=uc.reg_read(UC_ARM64_REG_LR)
        hit.setdefault(idx,[]).append(hex(lr))
        if len(hit[idx])==1: print("stub got#%d from %x x0=%x x1=%x x2=%x"%(idx,lr,uc.reg_read(UC_ARM64_REG_X0),uc.reg_read(UC_ARM64_REG_X1),uc.reg_read(UC_ARM64_REG_X2)))
        h=HK.get(idx)
        if h: h(uc)
        else:
            uc.emu_stop(); print("unhandled",idx)
HK={}
mu.hook_add(UC_HOOK_CODE,hook)
mu.reg_write(UC_ARM64_REG_LR,0xdead0000)
mu.mem_map(0xdead0000,0x1000)
import json
exec(open(__import__('os').path.join(__import__('os').path.dirname(__file__),'rollandroll-unicorn-hooks.py')).read())
try: mu.emu_start(0x1000004e8,0xdead0000,count=2000000)
except UcError as e: print("ERR",e,hex(mu.reg_read(UC_ARM64_REG_PC)))
print("pc",hex(mu.reg_read(UC_ARM64_REG_PC)),"out",b''.join(out))
