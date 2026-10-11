# usage : emu.py NOM EMAIL SERIAL 40177b [u.exe = crackme4.exe dépacké : CYC->UPX puis upx -d]
import sys,struct
from unicorn import *; from unicorn.x86_const import *
d=open(sys.argv[5] if len(sys.argv)>5 else 'u.exe','rb').read()
u=Uc(UC_ARCH_X86,UC_MODE_32)
u.mem_map(0x400000,0x10000); 
for off,va,sz in [(0x1000,0x401000,0x4000),(0x5000,0x405000,0x1000),(0x6000,0x406000,0x1000),(0x7000,0x407000,0x1000)]:
    u.mem_write(va,d[off:off+sz])
u.mem_map(0x100000,0x100000); ESP=0x1f0000
HEAP=0x300000; u.mem_map(HEAP,0x10000)
FN={0x40764c:0x500000,0x407668:0x500010}
u.mem_map(0x500000,0x1000); u.mem_write(0x500000,b'\xc3'*0x100)
for k,v in FN.items(): u.mem_write(k,struct.pack('<I',v))
fields={0x3e8:sys.argv[1].encode(),0x3e9:sys.argv[2].encode(),0x3ea:sys.argv[3].encode()}
res=[]
def rs(a):
    b=b''
    while True:
        c=u.mem_read(a,1)
        if c==b'\0':return b
        b+=c;a+=1
def arg(n): return struct.unpack('<I',u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n,4))[0]
def ret(v,pop=0):
    sp=u.reg_read(UC_X86_REG_ESP); ra=struct.unpack('<I',u.mem_read(sp,4))[0]
    u.reg_write(UC_X86_REG_EAX,v&0xffffffff); u.reg_write(UC_X86_REG_ESP,sp+4+pop); u.reg_write(UC_X86_REG_EIP,ra)
def hk(uc,a,s,_):
    if a==0x40218c: i,b,n=arg(0),arg(1),arg(2); uc.mem_write(b,fields[i][:n-1]+b'\0'); ret(0,12)
    elif a==0x402186: res.append(rs(arg(0))); ret(0,12)
    elif a in(0x402192,): ret(u.reg_read(UC_X86_REG_EAX))
    elif a==0x402030: ret(0); uc.emu_stop()
    elif a==0x402218: x,y=rs(arg(0)),rs(arg(1)); ret((x>y)-(x<y))
    elif a==0x402212: ret(len(rs(arg(0))))
    elif a==0x402206: uc.mem_write(arg(0),rs(arg(1))+b'\0'); ret(arg(0))
    elif a==0x402200: x=rs(arg(0)); uc.mem_write(arg(0)+len(x),rs(arg(1))+b'\0'); ret(arg(0))
    elif a==0x500000:
        f=rs(arg(1)); assert f==b'%d'; uc.mem_write(arg(0),str(arg(2)).encode()+b'\0'); ret(0)
    elif a==0x500010:
        x,y=rs(arg(0)),rs(arg(1)); i=x.find(y); ret(0 if i<0 else arg(0)+i)
u.hook_add(UC_HOOK_CODE,hk)
START=int(sys.argv[4],16)
sp=ESP; u.mem_write(sp,struct.pack('<I',0xdead0000)); u.reg_write(UC_X86_REG_ESP,sp)
u.reg_write(UC_X86_REG_ECX,HEAP)
u.mem_map(0xdead0000,0x1000)
try: u.emu_start(START,0xdead0000)
except UcError as e: print('err',e,hex(u.reg_read(UC_X86_REG_EIP)))
print(res)
