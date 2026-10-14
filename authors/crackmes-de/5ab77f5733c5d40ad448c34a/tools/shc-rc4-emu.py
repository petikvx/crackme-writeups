import struct, sys
d=open('analysis/ha-ck.unpacked','rb').read()
ph=struct.unpack_from('<I',d,0x1c)[0]; n=struct.unpack_from('<H',d,0x2c)[0]
segs=[]
for i in range(n):
    t,off,va,pa,fs,ms,fl,al=struct.unpack_from('<8I',d,ph+32*i)
    if t==1: segs.append((va,off,fs,ms))
def rd(va,k):
    for v,o,fs,ms in segs:
        if v<=va<v+fs: return bytes(d[o+va-v:o+va-v+k])
    return b'\0'*k
class RC4:
    def __init__(s): s.S=list(range(256)); s.x=s.y=s.z=0   # stte_0 : S[i]=i, x=y=z=0
    def key(s,k):
        ln=len(k); p=0
        while ln>0:
            while True:
                a=s.S[s.x]; s.z=(s.z+a)&255
                s.z=(s.z+k[p+(s.x%ln)])&255
                s.S[s.x],s.S[s.z]=s.S[s.z],a
                s.x=(s.x+1)&255
                if s.x==0: break
            p+=256; ln-=256
    def arc4(s,b):
        b=bytearray(b)
        for i in range(len(b)):
            s.x=(s.x+1)&255
            a=s.S[s.x]; s.y=(s.y+a)&255
            s.S[s.x],s.S[s.y]=s.S[s.y],a
            c=(a+s.S[s.x])&255
            b[i]^=s.S[c]
        return bytes(b)
