from unicorn import *; from unicorn.x86_const import *
import sys
d=open('d.exe','rb').read()
mu=Uc(UC_ARCH_X86,UC_MODE_32); mu.mem_map(0x400000,0x10000)
mu.mem_write(0x401000,d[0x400:0x610]); mu.mem_map(0x100000,0x10000)
name=sys.argv[1].encode()
mu.mem_write(0x4030c0,name); mu.mem_write(0x403100,len(name).to_bytes(4,'little')); mu.mem_write(0x403128,(1).to_bytes(4,'little'))
mu.reg_write(UC_X86_REG_ESP,0x108000)
# stop at the wsprintf push sequence: read esi/edi right before call 0x4011da
out={}
def hk(mu,a,s,u):
    if mu.mem_read(a,1)==b'\x57' and a>0x40114c and a<0x401160 and 'e' not in out:
        out['e']=1; esi=mu.reg_read(UC_X86_REG_ESI); edi=mu.reg_read(UC_X86_REG_EDI)
        print("LOD-%u-%X"%(esi,edi)); mu.emu_stop()
mu.hook_add(UC_HOOK_CODE,hk)
mu.emu_start(0x401114,0x401200)
