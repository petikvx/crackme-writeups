import struct,sys
d=open(sys.argv[1],'rb').read()
n=struct.unpack_from('<I',d,16)[0];o=32
for i in range(n):
    c,s=struct.unpack_from('<II',d,o)
    if c==2: symoff,nsyms,stroff,strsize=struct.unpack_from('<IIII',d,o+8)
    if c==0xb: ind,nind=struct.unpack_from('<II',d,o+56)
    if c==0x19:
        ns=struct.unpack_from('<I',d,o+64)[0];p=o+72
        for j in range(ns):
            nm=d[p:p+16].rstrip(b'\0');addr,size=struct.unpack_from('<QQ',d,p+32);r1=struct.unpack_from('<I',d,p+68)[0]
            if nm==b'__stubs': S=(addr,size,r1)
            if nm==b'__got': G=(addr,size,r1)
            p+=80
    o+=s
def name(k):
    si=struct.unpack_from('<I',d,ind+4*k)[0]
    if si>=0x40000000: return '?'
    no=struct.unpack_from('<I',d,symoff+16*si)[0]
    e=d.index(b'\0',stroff+no);return d[stroff+no:e].decode()
for i in range(S[1]//12):
    stub=S[0]+i*12
    # find got slot via ldr: decode adrp/ldr
    a,l=struct.unpack_from('<II',d,stub-0x100000000)
    imm=((a>>29)&3)|(((a>>5)&0x7ffff)<<2)
    page=(stub&~0xfff)+(imm<<12)
    off=((l>>10)&0xfff)*8
    slot=(page+off-G[0])//8
    print(hex(stub),slot,name(S[2]+i))
