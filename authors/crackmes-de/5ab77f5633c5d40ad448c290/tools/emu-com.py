import sys
from unicorn import *
from unicorn.x86_const import *
from capstone import *
import os, zipfile
_zip=os.path.join(os.path.dirname(os.path.abspath(__file__)),'..','original','therapy_crackme1.zip')
data=zipfile.ZipFile(_zip).read('CRACKME.COM')  # usage: emu-com.py PASSWORD [-t]
inp=(sys.argv[1] if len(sys.argv)>1 else 'petik').encode()
inp2=(sys.argv[2] if len(sys.argv)>2 else '1234').encode()
inputs=[inp,inp2]
mu=Uc(UC_ARCH_X86,UC_MODE_16)
SEG=0x1000;base=SEG*16
mu.mem_map(0,0x100000)
mu.mem_write(base+0x100,data)
for r in (UC_X86_REG_CS,UC_X86_REG_DS,UC_X86_REG_ES,UC_X86_REG_SS): mu.reg_write(r,SEG)
mu.reg_write(UC_X86_REG_SP,0xfffe); mu.reg_write(UC_X86_REG_IP,0x100)
out=[]
trace='-t' in sys.argv
md=Cs(CS_ARCH_X86,CS_MODE_16)
def hook_int(mu,intno,u):
    ah=mu.reg_read(UC_X86_REG_AH); ds=mu.reg_read(UC_X86_REG_DS); dx=mu.reg_read(UC_X86_REG_DX)
    if intno==0x21:
        if ah==9:
            a=ds*16+dx; s=b''
            while True:
                c=mu.mem_read(a,1)
                if c==b'$':break
                s+=bytes(c);a+=1
            out.append(s.decode('latin1'))
        elif ah==0x0a:
            a=ds*16+dx; mx=mu.mem_read(a,1)[0]; t=inputs.pop(0)[:mx-1]
            mu.mem_write(a+1,bytes([len(t)])+t+b'\r'); out.append('<'+t.decode()+'>')
        elif ah in (1,8,7):
            t=inputs[0]
            c=t[:1] or b'\r'; inputs[0]=t[1:]
            if not t and len(inputs)>1: inputs.pop(0)
            mu.reg_write(UC_X86_REG_AL,c[0])
        elif ah==2: out.append(chr(dx&0xff))
        elif ah==0x4c or ah==0: mu.emu_stop()
        else: out.append('[int21 %02x]'%ah)
    elif intno==0x20: mu.emu_stop()
    elif intno==0x16:
        out.append('[int16]')
    else: out.append('[int %02x ah=%02x]'%(intno,ah))
mu.hook_add(UC_HOOK_INTR,hook_int)
if trace:
    def hc(mu,addr,size,u):
        b=mu.mem_read(addr,size)
        for i in md.disasm(bytes(b),addr-base): print('%04x %s %s'%(i.address,i.mnemonic,i.op_str))
    mu.hook_add(UC_HOOK_CODE,hc)
try: mu.emu_start(base+0x100,0,count=2000000)
except UcError as e: print('ERR',e,hex(mu.reg_read(UC_X86_REG_IP)))
print(''.join(out))
