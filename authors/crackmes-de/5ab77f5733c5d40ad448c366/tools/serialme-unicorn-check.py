import sys
from unicorn import *
from unicorn.x86_const import *
exe=open('SerialMe.exe','rb').read()
def run(serial):
    mu=Uc(UC_ARCH_X86,UC_MODE_32)
    mu.mem_map(0x400000,0x10000)
    mu.mem_write(0x401000,exe[0x400:0x400+0x31a])
    mu.mem_write(0x403000,exe[0xc00:0xc00+0x12a])
    mu.mem_write(0x4030f0,serial)
    mu.mem_map(0x100000,0x10000); mu.reg_write(UC_X86_REG_ESP,0x108000)
    # start 0x401159 (après GetDlgItemText ok), succès 0x401219, échec 0x40122f
    mu.emu_start(0x401159,0x401219) if False else None
    res=[]
    def hook(m,a,s,u):
        res.append(a); m.emu_stop()
    mu.hook_add(UC_HOOK_CODE,hook,begin=0x401219,end=0x401219)
    mu.hook_add(UC_HOOK_CODE,hook,begin=0x40122f,end=0x40122f)
    mu.emu_start(0x401159,0x401300)
    return res[0]==0x401219
for s in sys.argv[1:]:
    print(s, run(s.encode()))
