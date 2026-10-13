# Émule le stub UPX modifié jusqu'à l'OEP puis dumpe UPX0 (imports fictifs)
import pefile, struct
from unicorn import *
from unicorn.x86_const import *
p=pefile.PE('original/HyperCrackme.exe'); IB=p.OPTIONAL_HEADER.ImageBase
mu=Uc(UC_ARCH_X86,UC_MODE_32); mu.mem_map(IB,0x10000)
mu.mem_write(IB,p.get_memory_mapped_image()[:0x8000])
STUB=0x700000; mu.mem_map(STUB,0x10000); mu.mem_map(0x800000,0x100000)
names={}; n=0
for d in p.DIRECTORY_ENTRY_IMPORT:
    for imp in d.imports:
        a=STUB+n*16; names[a]=(imp.name or b'?').decode(); mu.mem_write(imp.address,struct.pack('<I',a)); n+=1
fake=[0x780000]
def hook(uc,addr,size,_):
    if STUB<=addr<STUB+0x10000:
        nm=names.get(addr,'?'); esp=uc.reg_read(UC_X86_REG_ESP); ret=struct.unpack('<I',uc.mem_read(esp,4))[0]
        args=struct.unpack('<2I',uc.mem_read(esp+4,8))
        if nm=='GetProcAddress':
            a=args[1]
            nmf=bytes(uc.mem_read(a,64)).split(b'\0')[0].decode() if a>0xffff else '#%d'%a
            fake[0]+=16; names[fake[0]]=nmf; v=fake[0]; npop=2
        elif nm=='LoadLibraryA': v=0x10000000; npop=1
        elif nm=='VirtualProtect': v=1; npop=4
        elif nm=='ExitProcess': uc.emu_stop(); return
        else: v=0; npop=0
        uc.reg_write(UC_X86_REG_EAX,v); uc.reg_write(UC_X86_REG_ESP,esp+4+4*npop); uc.reg_write(UC_X86_REG_EIP,ret)
    elif IB+0x1000<=addr<IB+0x6000:
        print('OEP',hex(addr)); uc.emu_stop()
mu.mem_map(0x780000,0x10000)
mu.hook_add(UC_HOOK_CODE,hook)
mu.reg_write(UC_X86_REG_ESP,0x8f0000)
mu.emu_start(IB+p.OPTIONAL_HEADER.AddressOfEntryPoint,0)
open('analysis/upx0.bin','wb').write(bytes(mu.mem_read(IB+0x1000,0x5000)))
# table IAT résolue -> noms
import json
iat={}
for off in range(0,0x5000,4):
    v=struct.unpack('<I',mu.mem_read(IB+0x1000+off,4))[0]
    if v in names and v>=0x780000: iat[hex(IB+0x1000+off)]=names[v]
json.dump(iat,open('analysis/iat.json','w'),indent=1); print(iat)
