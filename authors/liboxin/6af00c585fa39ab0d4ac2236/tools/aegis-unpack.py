"""Décrypte les pages .text du protecteur « aegis » (table AGIS @ .aegisd+0x280). Usage: aegis-unpack.py in.exe out.exe"""
import struct,sys
M=(1<<64)-1
def rol(x,n): return ((x<<n)|(x>>(64-n)))&M
def ks(c,i):
    a=(i*0x9e3779b97f4a7c15)&M
    a^=c
    a^=a>>0x1e; a=(a*0xbf58476d1ce4e5b9)&M
    a^=a>>0x1b; a=(a*0x94d049bb133111eb)&M
    a^=a>>0x1f
    a=(a+c)&M
    a^=a>>0x1e; a=(a*0xbf58476d1ce4e5b9)&M
    a^=a>>0x1b; a=(a*0x94d049bb133111eb)&M
    a^=a>>0x1f
    a^=c
    a=(a+0xd6e8feb86659fd93)&M
    a=rol(a,0x17)
    a^=c>>7
    a=(a*0xc2b2ae3d27d4eb4f)&M
    a^=a>>0x1d
    return a
def fnv(b):
    h=0xcbf29ce484222325
    for x in b: h=((h^x)*0x100000001b3)&M
    return h
d=bytearray(open(sys.argv[1],'rb').read())
def rva2off(r):
    # sections
    pe=struct.unpack_from('<I',d,0x3c)[0]
    n=struct.unpack_from('<H',d,pe+6)[0]; so=struct.unpack_from('<H',d,pe+20)[0]
    t=pe+24+so
    for i in range(n):
        vs,va,rs,ro=struct.unpack_from('<IIII',d,t+i*40+8)
        if va<=r<va+max(vs,rs): return r-va+ro
base=0x52280
h=rva2off(0x52280)
cnt=struct.unpack_from('<I',d,h+0x14)[0]; tab=struct.unpack_from('<I',d,h+0x18)[0]
to=rva2off(tab)
ok=0
for i in range(cnt):
    key,rva,size,hh,flag=struct.unpack_from('<QIIQI',d,to+i*32)
    off=rva2off(rva)
    buf=bytearray(d[off:off+size])
    o=0
    for b in range(0,size,8):
        k=ks(key,b//8); 
        chunk=buf[b:b+8]
        for j in range(len(chunk)): chunk[j]^=(k>>(8*j))&0xff
        buf[b:b+8]=chunk
    good = fnv(buf)==hh
    ok+=good
    d[off:off+size]=buf
    print(i,hex(rva),hex(size),good)
print(ok,cnt)
open(sys.argv[2],'wb').write(d)
