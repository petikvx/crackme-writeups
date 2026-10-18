import sys
from dual import *
pw=sys.argv[1].encode() if len(sys.argv)>1 else b'petik'
MAXP=int(sys.argv[2]) if len(sys.argv)>2 else 30_000_000
VERB=len(sys.argv)>3 and sys.argv[3]=='v'
import os
WATCH=bool(os.environ.get('WATCH'))
TAINT=bool(os.environ.get('TAINT'))
class PProc(Proc):
    def syscall(s,n,a):
        mu=s.mu
        if n==56: return 4242
        if n==61: return s.wait4(a)
        if n==101: return s.ptrace(a)
        if n==310: # process_vm_readv(pid, liov, lcnt, riov, rcnt, flags)
            tot=0
            for i in range(a[2]):
                lb,ll=struct.unpack('<QQ',bytes(mu.mem_read(a[1]+16*i,16)))
                rb,rl=struct.unpack('<QQ',bytes(mu.mem_read(a[3]+16*i,16)))
                try: d=bytes(C.mu.mem_read(rb,min(ll,rl)))
                except UcError: return -14&M64
                mu.mem_write(lb,d); tot+=len(d)
            return tot
        if n in(234,62): return 0
        if n==59: print('[P execve]',s.cstr(a[0])); return 0
        if n in(257,0,3,1,20,231,60): 
            if n==257: print('[P open]',s.cstr(a[1]))
            return Proc.syscall(s,n,a)
        if n!=110: print('[P syscall]',n,[hex(x) for x in a])
        return Proc.syscall(s,n,a)
    stage=0
    def ptrace(s,a):
        req,pid,addr,data=a[:4]
        if req==12:
            s.mu.mem_write(data,C.getregs()); return 0
        if req==13:
            C.setregs(bytes(s.mu.mem_read(data,27*8))); 
            if VERB: print('  [SETREGS] rip=%x'%C.reg('rip'))
            return 0
        if req in(1,2):
            try: s.mu.mem_write(data,bytes(C.mu.mem_read(addr,8)))
            except UcError: return -5&M64
            return 0
        if req in(4,5):
            C.mu.mem_write(addr,struct.pack('<Q',data)); return 0
        if req==7:
            s.stage=max(s.stage,1) ; s.sig=data
            if VERB: print('[CONT] sig',data,'child rip',hex(C.reg('rip')))
            return 0
        if req==3:
            i=addr//8
            v=M64 if REGORDER[i]=='orig_rax' else C.reg(REGORDER[i]) if i<27 else 0
            s.mu.mem_write(data,struct.pack('<Q',v)); 
            if VERB: print('  [PEEKUSER]',REGORDER[i] if i<27 else addr,hex(v))
            return 0
        if req==6:
            i=addr//8
            if VERB: print('  [POKEUSER]',REGORDER[i] if i<27 else addr,hex(data))
            if REGORDER[i] not in('orig_rax',): C.setreg(REGORDER[i],data)
            return 0
        if req in(0x4200,): return 0
        print('[P ptrace]',hex(req),pid,hex(addr),hex(data)); return 0
    def wait4(s,a):
        if s.stage==0:
            s.mu.mem_write(a[1],struct.pack('<I',0x137f)); s.stage=0.5; return 4242
        if s.stage==0.5:
            # post exec SIGTRAP
            s.stage=1; s.mu.mem_write(a[1],struct.pack('<I',0x57f)); print('[wait4] exec SIGTRAP'); return 4242
        # run child
        C.stop=None
        try: C.mu.emu_start(C.reg('rip'),0,count=0)
        except UcError as ex:
            C.stop=('err',str(ex),C.reg('rip'))
        st=C.stop
        if VERB or st[0]!='int': print('[child stop]',st,'rip=%x'%C.reg('rip'),'cnt',C.cnt)
        if st[0]=='exit':
            s.mu.mem_write(a[1],struct.pack('<I',(st[1]&0xff)<<8)); return 4242
        if st[0]=='int': sig=5
        elif st[0]=='err': sig=4 if 'INSN' in st[1] else 11
        else: sig=5
        s.mu.mem_write(a[1],struct.pack('<I',(sig<<8)|0x7f)); return 4242
P=PProc(D+'LeetCrackme','P',b'./LeetCrackme')
C=Proc(D+'CXXD4','C',b'./CXXD4',stdin=pw+b'\n')
segs=[(g['p_vaddr'],g['p_memsz'],g['p_flags']) for g in C.e.iter_segments() if g['p_type']=='PT_LOAD']
maps=''
for v,sz,fl in segs:
    maps+='%08x-%08x %s%s%sp 00000000 08:01 1 /home/x/CXXD4\n'%(pg(v),pu(v+sz),'r' if fl&4 else '-','w' if fl&2 else '-','x' if fl&1 else '-')
P.fakefiles[b'/proc/4242/maps']=maps.encode()
P.fakefiles[b'/proc/self/status']=b'Name:\tLeetCrackme\nTracerPid:\t0\n'
P.fakefiles[b'/proc/1/comm']=b'systemd\n'
P.fakefiles[b'./CXXD4']=C.data
import collections
def onread_mark(): pass
P.maxi=MAXP
orig=C.syscall
def csys(n,a):
    r=orig(n,a)
    if n==0 and a[0]==0:
        C.trace=[]; C.readbuf=a[1]; print('[mark read] buf',hex(a[1]),'ret',r)
        def mh(uc,acc,addr,size,val,ud):
            print('  [buf %s] %x size %d at idx %d rip %x'%('R' if acc==UC_MEM_READ else 'W',addr,size,len(C.trace),C.reg('rip')))
        if os.environ.get('SCAN'):
            def scan(uc,addr,size,ud):
                if len(C.trace)%int(os.environ['SCAN'])==0:
                    for base,sz in ((C.STACK-0x200000,0x200000),(0x20000000,0x4000000),(0x49d000,0x10000),(0x4ab000,0x9000)):
                        try: d=bytes(uc.mem_read(base,sz))
                        except Exception: continue
                        i=d.find(pw)
                        hits=[]
                        while i>=0 and len(hits)<6: hits.append(hex(base+i)); i=d.find(pw,i+1)
                        if hits: print('  [scan idx %d]'%len(C.trace),hits)
            C.mu.hook_add(UC_HOOK_CODE,scan)
        if WATCH:
            lo=int(os.environ['WATCH'],16) if os.environ['WATCH']!='1' else a[1]
            C.mu.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,mh,None,lo,lo+r+8)
        if TAINT:
            from taint import Taint
            T=Taint(C); C.T=T
            for i in range(r): T.mt.add(a[1]+i)
            C.mu.hook_add(UC_HOOK_CODE,T.hook)
    return r
C.syscall=csys

try: P.mu.emu_start(P.entry,0,count=0)
except UcError as ex: print('P ERR',ex,hex(P.reg('rip')))
print('P stop',P.stop,'cnt',P.cnt,'C cnt',C.cnt, 'C out',C.out)

import pickle
pickle.dump(C.trace,open('ctrace_%s.pkl'%pw.decode(),'wb'))
cnt=collections.Counter(a>>12 for a in C.trace)
print('trace len',len(C.trace)); print(sorted(((hex(k<<12),v) for k,v in cnt.items()),key=lambda x:-x[1])[:20])

if TAINT:
    T=C.T
    print('tainted branch sites',len(T.dec),'total',sum(T.dec.values()))
    pickle.dump((T.dec,T.log),open('taint_%s.pkl'%pw.decode(),'wb'))
