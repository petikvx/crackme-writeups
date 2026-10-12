import sys,struct
from unicorn import *; from unicorn.x86_const import *
import os; pe=open(os.path.join(os.path.dirname(os.path.abspath(__file__)),'..','original','crackme.exe'),'rb').read()
import pefile
p=pefile.PE(data=pe)
def run(name,serial):
    mu=Uc(UC_ARCH_X86,UC_MODE_32); mu.mem_map(0x400000,0x40000); mu.mem_map(0x100000,0x10000)
    for s in p.sections: mu.mem_write(0x400000+s.VirtualAddress,s.get_data())
    mu.mem_write(0x4032f0,name.encode()+b'\0'); mu.mem_write(0x4032e6,b'\1')
    mu.reg_write(UC_X86_REG_ESP,0x108000); mu.reg_write(UC_X86_REG_EAX,serial)
    mu.emu_start(0x401353,0x40137a)  # push eax ... up to cmp
    return mu.reg_read(UC_X86_REG_ESI)==mu.reg_read(UC_X86_REG_EBX)
print(run(sys.argv[1],int(sys.argv[2])))
