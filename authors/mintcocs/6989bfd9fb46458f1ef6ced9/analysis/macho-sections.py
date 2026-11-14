import struct,sys
d=open('/tmp/slice0','rb').read()
ncmds=struct.unpack('<I',d[16:20])[0]
off=32;secs={};syms=None
for _ in range(ncmds):
    c,s=struct.unpack('<II',d[off:off+8])
    if c==0x19:
        nsec=struct.unpack('<I',d[off+64:off+68])[0]
        for i in range(nsec):
            o=off+72+80*i
            n=d[o:o+16].rstrip(b'\0').decode();addr,size,fo=struct.unpack('<QQI',d[o+32:o+52])
            secs[n]=(addr,size,fo)
    if c==2: syms=struct.unpack('<IIII',d[off+8:off+24])
    off+=s
