import pefile
from unicorn import *
from unicorn.x86_const import *
pe=pefile.PE('upxed.exe');base=pe.OPTIONAL_HEADER.ImageBase
mu=Uc(UC_ARCH_X86,UC_MODE_32)
mu.mem_map(base,0x100000);mu.mem_write(base,pe.header[:0x1000])
for s in pe.sections:
    mu.mem_write(base+s.VirtualAddress,s.get_data())
STUB=0x7000000;mu.mem_map(STUB,0x10000)
names={}
for e in pe.DIRECTORY_ENTRY_IMPORT:
    for i,imp in enumerate(e.imports):
        a=STUB+len(names)*16;names[a]=imp.name;mu.mem_write(a,b'\xc3')
        mu.mem_write(imp.address,a.to_bytes(4,'little'))
mu.mem_map(0x100000,0x100000);mu.reg_write(UC_X86_REG_ESP,0x1f0000)
fake=[0x7100000]
def hook(mu,addr,size,u):
    if addr in names:
        n=names[addr];esp=mu.reg_read(UC_X86_REG_ESP)
        ret=int.from_bytes(mu.mem_read(esp,4),'little')
        print('call',n,hex(ret))
        if n in(b'ExitProcess',):mu.emu_stop();return
        if n==b'MessageBoxA':
            p=int.from_bytes(mu.mem_read(esp+8,4),'little');print(mu.mem_read(p,64).split(b'\0')[0]);print('PW',bytes(mu.mem_read(0x401040,0x20)));mu.emu_stop();return
        if n==b'GetProcAddress':
            p=int.from_bytes(mu.mem_read(esp+8,4),'little');nm=bytes(mu.mem_read(p,32)).split(b'\0')[0]
            a=STUB+0x8000+len(names)*16;names[a]=nm;mu.mem_write(a,b'\xc2\x08\x00' if False else b'\xc3');mu.reg_write(UC_X86_REG_EAX,a)
        else: mu.reg_write(UC_X86_REG_EAX,0x7a890000)
        nargs={b'LoadLibraryA':1,b'GetProcAddress':2,b'MessageBoxA':4,b'ExitProcess':1}.get(n,0)
        mu.reg_write(UC_X86_REG_ESP,esp+4+4*nargs);mu.reg_write(UC_X86_REG_EIP,ret)
    if base+0x1000<=addr<base+0x2000 and not u.get('d'):
        u['d']=1;print('OEP',hex(addr));open('oep.bin','wb').write(mu.mem_read(base+0x1000,0x3000))
u={}
mu.mem_write(0x4050a9,b'\xb8\x00\x80\x1f\x00\x90')
mu.hook_add(UC_HOOK_CODE,hook,u)
try: mu.emu_start(base+pe.OPTIONAL_HEADER.AddressOfEntryPoint,0,count=20000000)
except UcError as e:
    eip=mu.reg_read(UC_X86_REG_EIP);print(e,hex(eip),hex(mu.reg_read(UC_X86_REG_ESP)));open("cur.bin","wb").write(mu.mem_read(eip-0x40,0x80));open("img.bin","wb").write(mu.mem_read(base,0x10000))
