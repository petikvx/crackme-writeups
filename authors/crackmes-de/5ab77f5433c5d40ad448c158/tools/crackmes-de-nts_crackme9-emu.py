# usage : emu.py NOM SERIAL [Crackme9.exe]
import sys,struct,pefile
from unicorn import *; from unicorn.x86_const import *
p=pefile.PE(sys.argv[3] if len(sys.argv)>3 else 'Crackme9.exe'); img=p.get_memory_mapped_image()
u=Uc(UC_ARCH_X86,UC_MODE_32); u.mem_map(0x400000,0x10000); u.mem_write(0x400000,img[:0x10000])
u.mem_map(0x100000,0x100000); u.mem_map(0x500000,0x1000); u.mem_write(0x500000,b'\xc3'*64)
u.mem_write(0x403190,struct.pack('<I',0x500010)); u.mem_write(0x403194,struct.pack('<I',0x500020))
u.mem_write(0x40313c,struct.pack('<I',0x500030)); u.mem_write(0x403140,struct.pack('<I',0x500040))
fields={0x3e8:sys.argv[1].encode(),0x3e9:sys.argv[2].encode()}; msgs=[]
def rs(a):
    b=b''
    while (c:=bytes(u.mem_read(a,1)))!=b'\0': b+=c;a+=1
    return b
def arg(n): return struct.unpack('<I',u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n,4))[0]
def ret(v,pop=0):
    sp=u.reg_read(UC_X86_REG_ESP); ra=struct.unpack('<I',u.mem_read(sp,4))[0]
    u.reg_write(UC_X86_REG_EAX,v&0xffffffff); u.reg_write(UC_X86_REG_ESP,sp+4+pop); u.reg_write(UC_X86_REG_EIP,ra)
def hk(uc,a,s,_):
    if a==0x500040:
        i,b,n=arg(0),arg(1),arg(2); data=fields.get(i,b''); uc.mem_write(b,data[:n-1]+b'\0'); ret(len(data),12)
    elif a==0x500030: msgs.append(rs(arg(0))); ret(0,12)
    elif a==0x500010: uc.mem_write(arg(2),rs(arg(0))[:8]+b'\0'); ret(1)
    elif a==0x500020: uc.mem_write(arg(0),f'{arg(2)&0xff:02X}\0'.encode())
u.hook_add(UC_HOOK_CODE,hk)
sp=0x1f0000; u.mem_write(sp,struct.pack('<I',0xdead0000)); u.reg_write(UC_X86_REG_ESP,sp)
u.reg_write(UC_X86_REG_ECX,0x180000); u.mem_map(0xdead0000,0x1000)
u.emu_start(0x402050,0xdead0000); print(msgs[0].decode() if msgs else 'KO')
