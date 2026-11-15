import sys,struct
sys.path.insert(0,'/tmp/pylib')
from unicorn import *
from unicorn.x86_const import *
d=open('analysis/vmcrack.unpacked.exe','rb').read()
live=open('analysis/aegisd_live.bin','rb').read()
pe=struct.unpack_from('<I',d,0x3c)[0]
n=struct.unpack_from('<H',d,pe+6)[0];opt=struct.unpack_from('<H',d,pe+20)[0]
def run(x,trace=False):
    mu=Uc(UC_ARCH_X86,UC_MODE_64)
    mu.mem_map(0x140000000,0x20000+0x1000)
    mu.mem_write(0x140000000,d[:0x400])
    for i in range(n):
        vs,va,rs,ro=struct.unpack_from('<IIII',d,pe+24+opt+i*40+8)
        if rs: mu.mem_write(0x140000000+va,d[ro:ro+min(rs,vs if vs else rs)])
    mu.mem_write(0x14001d000,live)
    mu.mem_map(0x7000000,0x100000)
    sp=0x7000000+0x80000
    mu.mem_write(sp,struct.pack('<Q',0xdead0000))
    mu.mem_map(0xdead0000,0x1000)
    mu.reg_write(UC_X86_REG_RSP,sp)
    mu.reg_write(UC_X86_REG_RCX,x)
    mu.reg_write(UC_X86_REG_RIP,0x140001450)
    try: mu.emu_start(0x140001450,0xdead0000,count=2000000)
    except UcError as e:
        print('err',e,hex(mu.reg_read(UC_X86_REG_RIP)));return None
    return mu.reg_read(UC_X86_REG_RAX)&0xffffffff
for x in [0,1,0xc0ffee]:
    r=run(x);print(hex(x),r and hex(r))
M=0xffffffff
def f(x):
    x=x*0x85ebca6b&M; x^=x>>13; x=x*0xc2b2ae35&M; return x^(x>>16)
inv=None
for x in [2,3,0x10,0x100,0x10000,0xc0ffee,0xffffffff]:
    r=run(x);print(hex(x),hex(r),hex(f(x)))
print('--')
for x in [0x10000,0xc0ffee,0xffffffff,0x12345678]:
    r=run(x);print(hex(r),hex(f(x^(x>>16))),hex(f(x^(x>>15))))
