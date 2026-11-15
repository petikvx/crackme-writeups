import struct
M=(1<<64)-1;G=0x9e3779b97f4a7c15
import os
d=open(os.path.join(os.path.dirname(os.path.abspath(__file__)),"../analysis/crackme_med.exe"),"rb").read()
T=d[0xbc800+0xa0:0xbc800+0xa0+0x258]
def mix(z):
    z=((z>>30)^z)*0xbf58476d1ce4e5b9&M
    z=((z>>27)^z)*0x94d049bb133111eb&M
    return z^(z>>31)
def dec(seed,i):
    z=mix((((i+1)*G&M)^seed)+G&M)
    return ((z>>29)^(z>>52))&0xff^T[i]
names={0:'PUSH',1:'ADD',2:'SUB',3:'MUL',4:'XOR',5:'AND',6:'OR',7:'SHR',8:'ROL',9:'HASH',10:'INPUT',11:'MEM',12:'LEN',13:'ALPHA',14:'RALPHA',15:'TAB',16:'RLOAD',17:'RSTORE',18:'MSTORE',19:'JMP',20:'JZ',21:'CALL',22:'RET',23:'END'}
if __name__=='__main__':
  import sys
  for seed in (0x1f123bb5159a55e5,0x4eff1cbe69856fb0):
    c=[dec(seed,i) for i in range(0x258)]
    print(hex(seed),sum(x<24 for x in c[:0x256]))
  seed=0x1f123bb5159a55e5
  pc=0
  while pc<0x256:
    o=dec(seed,pc);n=names.get(o,'?%x'%o)
    if o==0: v=int.from_bytes(bytes(dec(seed,pc+1+k) for k in range(8)),'little');print('%03x %s %#x'%(pc,n,v));pc+=9
    elif o in(16,17): print('%03x %s r%d'%(pc,n,dec(seed,pc+1)));pc+=2
    elif o in(19,20,21): print('%03x %s %03x'%(pc,n,dec(seed,pc+1)|dec(seed,pc+2)<<8));pc+=3
    else: print('%03x %s'%(pc,n));pc+=1
