import sys, struct
from unicorn import *
from unicorn.x86_const import *
from elftools.elf.elffile import ELFFile
D='/home/petik/Documents/crackme-writeups/authors/zydak/6ab666ec5ef425e62ef7fd50/original/'
def pg(x): return x&~0xfff
def pu(x): return (x+0xfff)&~0xfff
M64=0xffffffffffffffff
REGORDER=['r15','r14','r13','r12','rbp','rbx','r11','r10','r9','r8','rax','rcx','rdx','rsi','rdi','orig_rax','rip','cs','eflags','rsp','ss','fs_base','gs_base','ds','es','fs','gs']
UCR={n:getattr(__import__('unicorn.x86_const',fromlist=['x']),'UC_X86_REG_'+n.upper()) for n in REGORDER if n not in('orig_rax','cs','ss','ds','es','fs','gs')}
UCR['cs']=UC_X86_REG_CS;UCR['ss']=UC_X86_REG_SS;UCR['ds']=UC_X86_REG_DS;UCR['es']=UC_X86_REG_ES;UCR['fs']=UC_X86_REG_FS;UCR['gs']=UC_X86_REG_GS

class Proc:
    def __init__(s,path,name,argv0,stdin=b''):
        s.name=name; s.data=open(path,'rb').read(); s.e=ELFFile(open(path,'rb'))
        s.mu=Uc(UC_ARCH_X86,UC_MODE_64); mu=s.mu
        for g in s.e.iter_segments():
            if g['p_type']!='PT_LOAD': continue
            va=pg(g['p_vaddr']); end=pu(g['p_vaddr']+g['p_memsz'])
            try: mu.mem_map(va,end-va)
            except UcError: pass
            mu.mem_write(g['p_vaddr'],s.data[g['p_offset']:g['p_offset']+g['p_filesz']])
        s.entry=s.e.header['e_entry']
        s.STACK=0x7ffff0000000
        mu.mem_map(s.STACK-0x200000,0x200000)
        FS=0x10000000; mu.mem_map(FS,0x10000); mu.mem_write(FS+0x28,b'\x11'*8)
        mu.reg_write(UC_X86_REG_FS_BASE,FS)
        S=s.STACK; argv=S-0x800; mu.mem_write(argv,argv0+b'\0'); envp=S-0x700; mu.mem_write(envp,b'PATH=/bin\0')
        mu.mem_write(S-0x600,b'A'*16)
        auxv=[(25,S-0x600),(6,4096),(23,0),(9,s.entry),(0,0)]
        blob=struct.pack('<QQQQQ',1,argv,0,envp,0)
        for k,v in auxv: blob+=struct.pack('<QQ',k,v)
        sp=(S-0x1000-len(blob))&~0xf; mu.mem_write(sp,blob)
        mu.reg_write(UC_X86_REG_RSP,sp); mu.reg_write(UC_X86_REG_RIP,s.entry)
        s.brk=0x20000000; mu.mem_map(0x20000000,0x4000000); s.mm=0x30000000
        s.stdin=bytearray(stdin); s.out=b''; s.exited=None; s.stop=None; s.cnt=0; s.maxi=None
        s.fakefiles={}; s.nextfd=100; s.fds={}
        s.trace=None
        mu.hook_add(UC_HOOK_INSN,s.on_sys,None,1,0,UC_X86_INS_SYSCALL)
        mu.hook_add(UC_HOOK_INTR,s.on_intr)
        mu.hook_add(UC_HOOK_CODE,s.on_code)
    def on_code(s,uc,a,sz,ud):
        s.cnt+=1
        if s.trace is not None: s.trace.append(a)
        if s.maxi and s.cnt>s.maxi: s.stop=('limit',); uc.emu_stop()
    def on_intr(s,uc,intno,ud):
        s.stop=('int',intno); uc.emu_stop()
    def reg(s,n): return s.mu.reg_read(UCR[n])
    def setreg(s,n,v): s.mu.reg_write(UCR[n],v&M64)
    def getregs(s):
        b=b''
        for n in REGORDER:
            if n=='orig_rax': v=M64
            else: v=s.reg(n)
            b+=struct.pack('<Q',v)
        return b
    def setregs(s,b):
        for i,n in enumerate(REGORDER):
            if n=='orig_rax': continue
            v=struct.unpack_from('<Q',b,8*i)[0]
            if n in('cs','ss','ds','es','fs','gs'): continue
            s.setreg(n,v)
    def cstr(s,a,n=200):
        try: return bytes(s.mu.mem_read(a,n)).split(b'\0')[0]
        except Exception: return b'?'
    def on_sys(s,uc,ud):
        rax=s.reg('rax'); a=[s.reg(r) for r in('rdi','rsi','rdx','r10','r8','r9')]
        ret=s.syscall(rax,a)
        if ret is not None: s.setreg('rax',ret)
    def syscall(s,n,a):
        mu=s.mu
        if s.name=='C' and n not in (110,): print('  C-sys',n,[hex(x) for x in a[:4]])
        if n==158:
            if a[0]==0x1002: mu.reg_write(UC_X86_REG_FS_BASE,a[1])
            return 0
        if n==12:
            if a[0]: s.brk=a[0]
            return s.brk
        if n==5:
            f=s.fds.get(a[0])
            st=bytearray(144)
            if f is not None: struct.pack_into('<Q',st,48,len(f['data'])); struct.pack_into('<I',st,24,0o100644)
            mu.mem_write(a[1],bytes(st)); return 0
        if n==9:
            r=s.mm; mu.mem_map(r,pu(a[1])); s.mm+=pu(a[1])+0x1000
            f=s.fds.get(a[4]) if not (a[3]&0x20) else None
            if f is not None: mu.mem_write(r,f['data'][a[5]:a[5]+a[1]])
            return r
        if n==0:
            if a[0]==0:
                d=bytes(s.stdin[:a[2]]); del s.stdin[:a[2]]; mu.mem_write(a[1],d); return len(d)
            f=s.fds.get(a[0])
            if f is not None:
                d=f['data'][f['pos']:f['pos']+a[2]]; f['pos']+=len(d); mu.mem_write(a[1],d); return len(d)
            return -9&M64
        if n==1:
            d=bytes(mu.mem_read(a[1],a[2])); s.out+=d; print(f'[{s.name} write fd{a[0]}]',d); return a[2]
        if n==20:
            out=b''
            for i in range(a[2]):
                b,l=struct.unpack('<QQ',bytes(mu.mem_read(a[1]+16*i,16))); out+=bytes(mu.mem_read(b,l))
            s.out+=out; print(f'[{s.name} writev]',out); return len(out)
        if n==267:
            p=b'/home/x/'+s.name.encode(); mu.mem_write(a[2],p); return len(p)
        if n==89: p=b'/home/x/'+s.name.encode(); mu.mem_write(a[1],p); return len(p)
        if n==257:
            p=s.cstr(a[1])
            if p in s.fakefiles:
                fd=s.nextfd; s.nextfd+=1; s.fds[fd]={'data':s.fakefiles[p],'pos':0}; return fd
            return -2&M64
        if n==3: s.fds.pop(a[0],None); return 0
        if n in(231,60): s.exited=a[0]; s.stop=('exit',a[0]); mu.emu_stop(); return None
        if n==39: return 1000 if s.name=='P' else 4242
        if n==186: return 4242
        if n==110: return 1
        if n in(21,2,16,63,97,204,99,102,104,107,13,14,302,318,262,4,6,8,72): 
            if n==318: return 8
            if n in(13,14): return 0
            if n==16: return -25&M64
            return -2&M64
        return 0
