import struct,sys,capstone
d=open(sys.argv[1],'rb').read()
n=struct.unpack_from('<I',d,16)[0];o=32
for i in range(n):
    c,s=struct.unpack_from('<II',d,o)
    if c==0x19:
        ns=struct.unpack_from('<I',d,o+64)[0];p=o+72
        for j in range(ns):
            nm=d[p:p+16].rstrip(b'\0');addr,size,off=struct.unpack_from('<QQI',d,p+32)
            print(nm,hex(addr),hex(size),hex(off))
            if nm==b'__text': T=(addr,size,off)
            p+=80
    o+=s
md=capstone.Cs(capstone.CS_ARCH_ARM64,capstone.CS_MODE_ARM)
a,s,f=T
for i in md.disasm(d[f:f+s],a): print("%x: %s %s"%(i.address,i.mnemonic,i.op_str))
