from capstone import *
from capstone.x86 import *
import collections
GP={}
for i,n in enumerate(['ax','bx','cx','dx','si','di','bp','sp']):
    for nm in (n,'e'+n,'r'+n): GP[nm]='r'+n
    if n in('ax','bx','cx','dx'):
        GP[n[0]+'l']='r'+n; GP[n[0]+'h']='r'+n
for n in('si','di','bp','sp'): GP[n+'l']='r'+n
for i in range(8,16):
    for sfx in('','d','w','b'): GP['r%d%s'%(i,sfx)]='r%d'%i
class Taint:
    def __init__(s,proc):
        s.p=proc; s.md=Cs(CS_ARCH_X86,CS_MODE_64); s.md.detail=True
        s.rt=set(); s.mt=set(); s.dec=collections.OrderedDict(); s.n=0; s.cache={}
        s.log=[]
    def canon(s,ins,r):
        n=ins.reg_name(r)
        if n in GP: return GP[n]
        if n.startswith(('xmm','ymm','zmm')): return 'v'+n[3:]
        return n
    def memaddr(s,ins,op):
        m=op.mem; a=m.disp
        pr=s.p
        if m.base: 
            nm=ins.reg_name(m.base)
            a+= ins.address+ins.size if nm=='rip' else pr.mu.reg_read(s.rid(nm))
        if m.index: a+=pr.mu.reg_read(s.rid(ins.reg_name(m.index)))*m.scale
        return a&0xffffffffffffffff
    def rid(s,nm):
        from unicorn.x86_const import UC_X86_REG_RAX
        import unicorn.x86_const as X
        return getattr(X,'UC_X86_REG_'+nm.upper())
    def hook(s,uc,addr,size,ud):
        s.n+=1
        code=bytes(uc.mem_read(addr,size))
        key=(addr,code)
        ent=s.cache.get(key)
        if ent is None:
            ins=next(s.md.disasm(code,addr),None)
            s.cache[key]=ent=ins
        ins=ent
        if ins is None: return
        m=ins.mnemonic
        rd,wr=ins.regs_access()
        rdc={s.canon(ins,r) for r in rd}; wrc={s.canon(ins,r) for r in wr}
        # zeroing idioms
        ops=ins.operands
        if m in('xor','sub','pxor','xorps','vpxor','sbb') and len(ops)==2 and ops[0].type==X86_OP_REG and ops[1].type==X86_OP_REG and ops[0].reg==ops[1].reg and m!='sbb':
            for r in wrc: s.rt.discard(r)
            return
        memread=False; memwrite=None; memrd_taint=False
        pr=s.p
        rsp=pr.mu.reg_read(s.rid('rsp'))
        wsz=0
        for op in ops:
            if op.type==X86_OP_MEM and m!='lea' and m!='nop':
                a=s.memaddr(ins,op)
                acc=op.access
                if acc & CS_AC_READ:
                    if any((a+i) in s.mt for i in range(op.size)): memrd_taint=True
                if acc & CS_AC_WRITE: memwrite=(a,op.size)
        if m=='lea': 
            # taint from address regs
            pass
        if m=='push': memwrite=(rsp-8,8)
        if m=='call': memwrite=(rsp-8,8); 
        if m in('pop','ret'):
            if any((rsp+i) in s.mt for i in range(8)): memrd_taint=True
        if m.startswith('rep') or m in('movsb','movsq','movsd','movsw','stosb','stosq','stosd','stosw'):
            rcx=pr.mu.reg_read(s.rid('rcx')) if m.startswith('rep') else 1
            rsi=pr.mu.reg_read(s.rid('rsi')); rdi=pr.mu.reg_read(s.rid('rdi'))
            sz={'b':1,'w':2,'d':4,'q':8}.get(ins.mnemonic[-1],1)
            if 'movs' in m:
                for i in range(rcx*sz):
                    if (rsi+i) in s.mt: s.mt.add(rdi+i)
                    else: s.mt.discard(rdi+i)
            elif 'stos' in m:
                t='rax' in s.rt
                for i in range(rcx*sz):
                    (s.mt.add if t else s.mt.discard)(rdi+i)
            return
        srct = memrd_taint or any(r in s.rt for r in rdc if r not in('rsp','rip','rbp') or True)
        # careful: rsp/rip never tainted anyway
        if m.startswith('j') and m!='jmp':
            if 'eflags' in s.rt:
                s.dec[addr]=s.dec.get(addr,0)+1
                s.log.append((s.n,addr))
            return
        if m in('jmp','call') and ops and ops[0].type!=X86_OP_IMM:
            if srct and (ops[0].type==X86_OP_REG and s.canon(ins,ops[0].reg) in s.rt):
                s.log.append((s.n,addr,'TAINTED-INDIRECT'))
        # data-source regs only (exclude address regs of mem operands)
        addr_regs=set()
        for op in ops:
            if op.type==X86_OP_MEM:
                if op.mem.base: addr_regs.add(s.canon(ins,op.mem.base))
                if op.mem.index: addr_regs.add(s.canon(ins,op.mem.index))
        if m=='lea': 
            srct=bool(addr_regs & s.rt)
        else:
            srct=memrd_taint or bool((rdc-addr_regs) & s.rt) or (m in('mov','movzx') and False)
            # address taint (table lookups) counts too
            if addr_regs & s.rt: srct=True
        if m in('cmp','test'): 
            # flags only
            if srct: s.rt.add('eflags')
            else: s.rt.discard('eflags')
            return
        for r in wrc:
            if r=='rsp': continue
            if srct: s.rt.add(r)
            else:
                if r not in('rax','rbx','rcx','rdx','rsi','rdi','rbp') or True:
                    # partial writes keep old taint: only clear on full 32/64-bit writes (approx: clear)
                    s.rt.discard(r)
        if memwrite:
            a,sz=memwrite
            for i in range(sz): (s.mt.add if srct else s.mt.discard)(a+i)
        if m=='xchg':
            pass
