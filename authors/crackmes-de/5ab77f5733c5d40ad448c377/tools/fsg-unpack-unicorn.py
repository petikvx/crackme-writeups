import sys,struct,pefile
from unicorn import *
from unicorn.x86_const import *
src=sys.argv[1]; out=sys.argv[2]
raw=open(src,'rb').read()
pe=pefile.PE(src)
B=0x400000
mu=Uc(UC_ARCH_X86,UC_MODE_32)
mu.mem_map(B,0x10000)
mu.mem_write(B,raw[:0x200])
mu.mem_write(B+0x7000,raw[0x200:0x200+0x891])
STK=0x200000
mu.mem_map(STK,0x100000); mu.mem_map(0x70000000,0x1000)
mu.mem_write(0x70000000,b'\xc3'*16)
mu.reg_write(UC_X86_REG_ESP,STK+0x80000)
# fake imports
mu.mem_write(B+0x7868,struct.pack('<II',0x70000000,0x70000004))
n=0;names={}
def hook(mu,addr,size,ud):
    if addr==0x70000000 or addr==0x70000004:
        esp=mu.reg_read(UC_X86_REG_ESP)
        a=struct.unpack('<I',mu.mem_read(esp+(4 if addr==0x70000000 else 8),4))[0]
        s=bytes(mu.mem_read(a,40)).split(b'\0')[0] if a>0x10000 else a
        print('API',hex(addr),s)
        global n
        n+=1; mu.reg_write(UC_X86_REG_EAX,0x71000000+n*0x10); names[0x71000000+n*0x10]=s
    if 0x401000<=addr<0x407000:
        print('OEP',hex(addr)); mu.dump=1; mu.emu_stop()
mu.hook_add(UC_HOOK_CODE,hook)
mu.hook_add(UC_HOOK_MEM_READ_UNMAPPED|UC_HOOK_MEM_WRITE_UNMAPPED,lambda mu,t,a,s,v,u:print("unm",t,hex(a),hex(mu.reg_read(UC_X86_REG_EIP))) or False)
try: mu.emu_start(B+0x154,0,count=5000000)
except UcError as e: print(e,hex(mu.reg_read(UC_X86_REG_EIP)))
mem=bytes(mu.mem_read(B,0x7000))
open(out+'.mem','wb').write(mem)

import json;json.dump({hex(k):str(v) for k,v in names.items()},open(out+'.names','w'))
