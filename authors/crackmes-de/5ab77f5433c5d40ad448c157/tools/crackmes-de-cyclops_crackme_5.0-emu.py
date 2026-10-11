# usage : emu.py "TEXTE TAPE" [crackme5.exe] -> envoie chaque caractère au vrai OnChar (0x4010a0) sous unicorn
import sys,struct,pefile
from unicorn import *; from unicorn.x86_const import *
p=pefile.PE(sys.argv[2] if len(sys.argv)>2 else 'crackme5.exe'); img=p.get_memory_mapped_image()
u=Uc(UC_ARCH_X86,UC_MODE_32); u.mem_map(0x400000,0x20000); u.mem_write(0x400000,img[:0x20000])
u.mem_map(0x100000,0x100000); u.mem_map(0xdead0000,0x1000); u.mem_map(0x500000,0x1000)
u.mem_write(0x417584,struct.pack('<I',0x500000))  # IAT strstr (appel direct en 0x40117a)
THIS=0x180000; msgs=[]
def rs(a):
    b=b''
    while (c:=bytes(u.mem_read(a,1)))!=b'\0': b+=c;a+=1
    return b
def arg(n): return struct.unpack('<I',u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n,4))[0]
def ret(v,pop=0):
    sp=u.reg_read(UC_X86_REG_ESP); ra=struct.unpack('<I',u.mem_read(sp,4))[0]
    u.reg_write(UC_X86_REG_EAX,v&0xffffffff); u.reg_write(UC_X86_REG_ESP,sp+4+pop); u.reg_write(UC_X86_REG_EIP,ra)
def hk(uc,a,s,_):
    if a==0x401b88: uc.mem_write(arg(0),rs(arg(1))+b'\0'); ret(arg(0))      # strcpy
    elif a in(0x401b82,0x500000):                                                      # strstr
        h,n=rs(arg(0)),rs(arg(1)); i=h.find(n); ret(0 if i<0 else arg(0)+i)
    elif a==0x401b7c: ret(uc.reg_read(UC_X86_REG_EAX))                     # _chkesp
    elif a==0x401942: msgs.append((rs(arg(0)),rs(arg(1)))); ret(0,12)       # CWnd::MessageBox
u.hook_add(UC_HOOK_CODE,hk)
for ch in sys.argv[1].encode():
    sp=0x1f0000; u.mem_write(sp,struct.pack('<IIII',0xdead0000,ch,1,0)); u.reg_write(UC_X86_REG_ESP,sp)
    u.reg_write(UC_X86_REG_ECX,THIS); u.emu_start(0x4010a0,0xdead0000)
print(msgs if msgs else 'aucun message')
