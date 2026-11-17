import sys,hashlib,struct
from unicorn import *
from unicorn.x86_const import *
BIN=__import__('os').path.join(__import__('os').path.dirname(__file__),'..','analysis','orbital')
code=open(BIN,'rb').read()
def run(name,serial,trace=False,force=False):
    mu=Uc(UC_ARCH_X86,UC_MODE_64)
    mu.mem_map(0,0x6000); mu.mem_write(0,code[:0x4000])
    mu.mem_map(0x100000,0x10000)   # stack
    mu.mem_map(0x200000,0x1000)    # fs
    mu.mem_map(0x300000,0x1000)
    mu.mem_write(0x300000,name.encode()+b'\0')
    mu.mem_write(0x300100,struct.pack('<4I',*serial))
    mu.msr_write(0xC0000100,0x200000)
    mu.mem_write(0x200028,b'A'*8)
    sp=0x108000; mu.mem_write(sp,struct.pack('<Q',0x5000))
    mu.reg_write(UC_X86_REG_RSP,sp)
    mu.reg_write(UC_X86_REG_RDI,0x300000); mu.reg_write(UC_X86_REG_RSI,0x300100)
    snaps={}
    def hook(uc,addr,size,ud):
        if addr==0x10c0:
            d,s,n=[uc.reg_read(r) for r in (UC_X86_REG_RDI,UC_X86_REG_RSI,UC_X86_REG_RDX)]
            uc.mem_write(d,bytes(uc.mem_read(s,n)))
            ret=struct.unpack('<Q',uc.mem_read(uc.reg_read(UC_X86_REG_RSP),8))[0]
            uc.reg_write(UC_X86_REG_RSP,uc.reg_read(UC_X86_REG_RSP)+8); uc.reg_write(UC_X86_REG_RIP,ret)
        elif addr==0x10a0:
            s=uc.reg_read(UC_X86_REG_RDI); n=0
            while uc.mem_read(s+n,1)[0]: n+=1
            uc.reg_write(UC_X86_REG_RAX,n)
            ret=struct.unpack('<Q',uc.mem_read(uc.reg_read(UC_X86_REG_RSP),8))[0]
            uc.reg_write(UC_X86_REG_RSP,uc.reg_read(UC_X86_REG_RSP)+8); uc.reg_write(UC_X86_REG_RIP,ret)
        elif addr==0x1a6a:
            snaps['digest']=bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RSP),32))
        elif addr in (0x1e44,0x1eee,0x1f12,0x1f5c):
            snaps.setdefault('cmp',[]).append((hex(addr),[uc.reg_read(r)&0xffffffff for r in (UC_X86_REG_R8,UC_X86_REG_EAX,UC_X86_REG_R9,UC_X86_REG_ECX,UC_X86_REG_EDX)]))
            if force:
                if addr==0x1e44: uc.reg_write(UC_X86_REG_R8D,uc.reg_read(UC_X86_REG_EAX))
                if addr==0x1eee: uc.reg_write(UC_X86_REG_ECX,uc.reg_read(UC_X86_REG_R9))
                if addr==0x1f12: uc.reg_write(UC_X86_REG_EAX,uc.reg_read(UC_X86_REG_ECX))
    mu.hook_add(UC_HOOK_CODE,hook)
    try: mu.emu_start(0x1960,0x5000)
    except UcError as e: print('err',e,hex(mu.reg_read(UC_X86_REG_RIP)))
    snaps['ret']=mu.reg_read(UC_X86_REG_RAX)&0xff
    return snaps
if __name__=='__main__':
    n='petik'
    s=run(n,[1,2,3,4])
    print(s)
    h=hashlib.sha256(b'ORBITAL/V1:'+n.encode()+b':SOYUZ/2026').digest()
    print(h.hex()); print(s['digest'].hex())
    print([hex(x) for x in struct.unpack('>8I',h)])
