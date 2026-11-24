R=lambda r:uc_reg(r)
def X(i): return mu.reg_read(UC_ARM64_REG_X0+i)
def SX(i,v): mu.reg_write(UC_ARM64_REG_X0+i,v)
def ret(v=None):
    if v is not None: SX(0,v)
    mu.reg_write(UC_ARM64_REG_PC,mu.reg_read(UC_ARM64_REG_LR))
def setstr(a,b):
    p=alloc(len(b)+1); mu.mem_write(p,b+b'\0')
    mu.mem_write(a,struct.pack('<QQQ',p,len(b),(len(b)+16)|(1<<63)))
def getstr(a):
    p,sz,cap=struct.unpack('<QQQ',rd(a,24)); return rd(p,sz)
def u(f):
    HK[f[0]]=f[1]
# slot handlers
def strlen_(uc): ret(len(cstr(X(0))))
def memcpy_(uc):
    n=X(2)
    if n: mu.mem_write(X(0),rd(X(1),n))
    ret()
def memcmp_(uc):
    a,b=rd(X(0),X(2)),rd(X(1),X(2)); ret((a>b)-(a<b)&0xffffffffffffffff)
def znwm(uc): ret(alloc(X(0)))
def init(uc): setstr(X(0),rd(X(1),X(2))); ret()
def append(uc):
    s=getstr(X(0))+rd(X(1),X(2)); setstr(X(0),s); ret(X(0))
def pushback(uc): setstr(X(0),getstr(X(0))+bytes([X(1)&0xff])); ret()
def tostr(uc): setstr(X(8),str(struct.unpack('<i',struct.pack('<I',X(0)&0xffffffff))[0]).encode()); ret()
def nop(uc): ret()
def emplace(uc):
    v=X(0); b,e,c=struct.unpack('<QQQ',rd(v,24))
    val=struct.unpack('<I',rd(X(1),4))[0]
    if e==c:
        nb=alloc(4*(max(1,(e-b)//4)*2)); 
        if e>b: mu.mem_write(nb,rd(b,e-b))
        c=nb+4*(max(1,(e-b)//4)*2); e=nb+(e-b); b=nb
    mu.mem_write(e,struct.pack('<I',val)); e+=4
    mu.mem_write(v,struct.pack('<QQQ',b,e,c)); ret()
HK.update({37:strlen_,35:memcpy_,36:memcpy_,34:memcmp_,54:znwm,6:init,8:append,10:pushback,21:tostr,11:nop,53:nop,48:emplace})
# function-level hooks by address
printed=[]
FH={0x100000894:lambda: (printed.append(cstr(X(1))),ret(X(0))),
    0x1000008dc:lambda: (setstr(X(1),pw.encode()),ret(X(0))),
    0x100000db0:lambda: ret(X(0))}
def ch(uc,addr,size,_):
    f=FH.get(addr)
    if f: f()
mu.hook_add(UC_HOOK_CODE,ch)
import atexit
atexit.register(lambda:print("printed:",printed))
HK[50]=lambda uc: ret()
HK[46]=lambda uc: ret(0x1fffffffffffffff)
HK[44]=lambda uc: ret(0x7fffffffffffffef)
HK[45]=lambda uc: ret()
HK[47]=lambda uc: (mu.mem_write(X(1),rd(X(2),4)),ret())
