import sys,pefile
from unicorn import *; from unicorn.x86_const import *
pw=(sys.argv[1] if len(sys.argv)>1 else 'Nrsisj{').encode()
pe=pefile.PE(sys.argv[2] if len(sys.argv)>2 else 'TinyAsm.exe');m=pe.get_memory_mapped_image()
u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(0x400000,0x10000);u.mem_write(0x400000,m)
u.mem_write(0x40302c,(pw+b'\0'*8)[:8]);u.mem_map(0x100000,0x10000);u.reg_write(UC_X86_REG_ESP,0x108000)
r={}
def h(uc,a,s,d):
    if a in(0x40131b,0x401330): r['a']=a; uc.emu_stop()
u.hook_add(UC_HOOK_CODE,h)
u.emu_start(0x4012c6,0x401400)
print('Yes_Succes (0x401330)' if r.get('a')==0x401330 else 'Wrong_Code (0x40131b)')
