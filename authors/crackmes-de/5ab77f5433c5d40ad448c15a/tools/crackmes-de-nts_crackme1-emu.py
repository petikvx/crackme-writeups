# usage : emu.py [crackme1.exe] — exécute le entry et capture MessageBoxA
import sys,struct,pefile
from unicorn import *; from unicorn.x86_const import *
p=pefile.PE(sys.argv[1] if len(sys.argv)>1 else 'crackme1.exe'); img=p.get_memory_mapped_image()
u=Uc(UC_ARCH_X86,UC_MODE_32); u.mem_map(0x400000,0x10000); u.mem_write(0x400000,img[:0x10000])
u.mem_map(0x100000,0x100000); u.mem_map(0x500000,0x1000); u.mem_write(0x500000,b'\xc3'*16)
u.mem_write(0x402000,struct.pack('<I',0x500000))
msgs=[]
def rs(a):
    b=b''
    while (c:=bytes(u.mem_read(a,1)))!=b'\0': b+=c;a+=1
    return b
def arg(n): return struct.unpack('<I',u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n,4))[0]
u.hook_add(UC_HOOK_CODE,lambda uc,a,s,_: (msgs.append(rs(arg(1))), uc.emu_stop()) if a==0x500000 else None)
sp=0x1f0000; u.mem_write(sp,struct.pack('<I',0xdead0000)); u.reg_write(UC_X86_REG_ESP,sp)
u.mem_map(0xdead0000,0x1000); u.emu_start(0x401000,0xdead0000)
print(msgs[0].decode() if msgs else '?')
