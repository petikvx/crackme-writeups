import sys,time
from z3 import *
c=bytes.fromhex(open(sys.argv[1]).read())
M=(1<<64)-1; C1=0xff51afd7ed558ccd; G=0x9e3779b97f4a7c15
T=BitVec('T',64)
cs=[]
for i in range(41):
    x=T+BitVecVal((i*G)&M,64)
    xp=x^LShR(x,33)
    y=Extract(40,0,xp)*BitVecVal(C1&((1<<41)-1),41)
    b=Extract(7,0,y)^Extract(40,33,y)
    ch=b^BitVecVal(c[i],8)
    known={0:'C',1:'M',2:'O',3:'{',40:'}'}
    if i in known: cs.append(ch==ord(known[i]))
    else: cs += [UGE(ch,0x20),ULE(ch,0x7e)]
g=Goal(); g.add(*cs)
t=Then('simplify','bit-blast')
sg=t(g)[0]
from pysat.solvers import Cadical153
sys.setrecursionlimit(1000000)
var={}; clauses=[]; nid=[0]
def newv(): nid[0]+=1; return nid[0]
for i in range(64): var['k!%d'%i]=newv()
memo={}
def enc(e):
    global clauses
    i=e.get_id()
    if i in memo: return memo[i]
    k_=e.decl().kind()
    if k_==Z3_OP_TRUE: v=newv(); clauses.append([v]); r=v
    elif k_==Z3_OP_FALSE: v=newv(); clauses.append([-v]); r=v
    elif k_==Z3_OP_UNINTERPRETED: r=var[str(e)]
    elif k_==Z3_OP_NOT: r=-enc(e.arg(0))
    elif k_==Z3_OP_AND:
        a=[enc(x) for x in e.children()]; v=newv()
        for x in a: clauses.append([-v,x])
        clauses.append([v]+[-x for x in a]); r=v
    elif k_==Z3_OP_OR:
        a=[enc(x) for x in e.children()]; v=newv()
        for x in a: clauses.append([v,-x])
        clauses.append([-v]+a); r=v
    elif k_==Z3_OP_XOR:
        a=[enc(x) for x in e.children()]; r=a[0]
        for x in a[1:]:
            v=newv(); clauses += [[-v,r,x],[-v,-r,-x],[v,-r,x],[v,r,-x]]; r=v
    elif k_==Z3_OP_EQ or k_==Z3_OP_IFF:
        a,b=enc(e.arg(0)),enc(e.arg(1)); v=newv(); clauses += [[v,a,b],[v,-a,-b],[-v,-a,b],[-v,a,-b]]; r=v
    elif k_==Z3_OP_ITE:
        c_,a,b=enc(e.arg(0)),enc(e.arg(1)),enc(e.arg(2)); v=newv()
        clauses += [[-c_,-a,v],[-c_,a,-v],[c_,-b,v],[c_,b,-v]]; r=v
    else: raise Exception('op '+str(e.decl()))
    memo[i]=r; return r
for f in sg: clauses.append([enc(f)])
print('vars',nid[0],'clauses',len(clauses),flush=True)
sol=Cadical153(bootstrap_with=clauses)
t0=time.time(); ok=sol.solve(); print('sat?',ok,time.time()-t0,flush=True)
if ok:
    m=set(l for l in sol.get_model() if l>0)
    Tv=sum(1<<i for i in range(64) if var['k!%d'%i] in m); print('T =',hex(Tv))
    def fm(x):
        y=x^(x>>33); y=(y*C1)&M; y^=y>>33; return y&0xff
    print(bytes(fm((Tv+i*G)&M)^c[i] for i in range(41)))


