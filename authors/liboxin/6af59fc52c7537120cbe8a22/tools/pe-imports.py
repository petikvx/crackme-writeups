import struct
f=open('zip/crackme.protected.exe','rb').read()
secs=[(0x1000,0x29800,0x400),(0x2b000,0xac00,0x29c00),(0x36000,0xe00,0x34800),(0x38000,0x1600,0x35600)]
def r2o(r):
    for va,rs,off in secs:
        if va<=r<va+rs: return r-va+off
    raise Exception(hex(r))
for imp in [0x3527c]:
    o=r2o(imp)
    while True:
        ol,ts,fc,name,ft=struct.unpack_from('<5I',f,o)
        if not name:break
        print(f[r2o(name):].split(b'\0')[0].decode(),hex(ft))
        t=r2o(ol);k=0
        while True:
            v=struct.unpack_from('<Q',f,t)[0]
            if not v:break
            print('  ',hex(ft+8*k),f[r2o(v&0x7fffffff)+2:].split(b'\0')[0].decode());t+=8;k+=1
        o+=20
