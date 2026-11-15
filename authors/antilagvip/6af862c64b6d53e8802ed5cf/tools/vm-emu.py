import sys
sys.path.insert(0,__import__("os").path.dirname(__file__))
from vm_disasm import *
AL="ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
TB=[7,2,11,4,9,0,6,3,10,1,8,5]
def run(inp,seed=0x1f123bb5159a55e5,trace=False):
    inp=[ord(c) for c in inp];S=[];R=[0]*16;mem=[0]*12;cs=[];pc=0
    code=[dec(seed,i) for i in range(0x258)]
    pop=lambda:S.pop()
    for step in range(0x3d091):
        o=code[pc];n=1
        if o==0: S.append(int.from_bytes(bytes(code[pc+1:pc+9]),'little'));n=9
        elif 1<=o<=6:
            b=pop();a=pop();S.append([a+b,a-b,a*b,a^b,a&b,a|b][o-1]&M)
        elif o==7: b=pop();a=pop();S.append(a>>(b&63))
        elif o==8: b=pop();a=pop();b&=63;S.append(((a<<b)|(a>>(64-b)))&M)
        elif o==9:
            x=pop();S.append(mix((x+G)&M))
        elif o==10:
            i=pop();S.append(inp[i] if i<len(inp) else 0)
        elif o==11:
            i=pop();S.append(mem[i] if i<12 else 0)
        elif o==12:S.append(len(inp))
        elif o==13:S.append(ord(AL[pop()&31]))
        elif o==14:
            c=pop()&0xff;S.append(AL.index(chr(c)) if chr(c) in AL else M)
        elif o==15:
            i=pop();S.append(TB[i] if i<12 else 0)
        elif o==16:S.append(R[code[pc+1]]);n=2
        elif o==17:R[code[pc+1]]=pop();n=2
        elif o==18:
            i=pop();v=pop()
            if i<12:mem[i]=v&0xff
        elif o==19:pc=code[pc+1]|code[pc+2]<<8;n=0
        elif o==20:
            x=pop()
            pc=pc+3 if x else code[pc+1]|code[pc+2]<<8;n=0
        elif o==21:cs.append(pc+3);pc=code[pc+1]|code[pc+2]<<8;n=0
        elif o==22:pc=cs.pop();n=0
        elif o==23:
            return pop()
        pc+=n
    return 'timeout'
if __name__=='__main__':
    print(run(sys.argv[1]))
