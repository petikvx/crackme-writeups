import re,struct,sys
exe=open(sys.argv[1],'rb').read()
# rva->file via sections
pe=struct.unpack_from('<I',exe,0x3c)[0]
ns=struct.unpack_from('<H',exe,pe+6)[0]; so=struct.unpack_from('<H',exe,pe+20)[0]
secs=[]
for i in range(ns):
    o=pe+24+so+40*i
    vs,va,rs,rp=struct.unpack_from('<IIII',exe,o+8); secs.append((va,vs,rp))
def rd(va,n):
    r=va-0x140000000
    for a,s,p in secs:
        if a<=r<a+s: return exe[p+r-a:p+r-a+n]
lines=open(sys.argv[2]).read().split('\n')
buf=bytearray(240); KEY=[]
# stack offsets: rsp+Y -> Y-0x60 ; rbp+X -> X+0xa0 ; key at rsp+0x20+i
def off(base,d):
    return (d-0x60) if base=='rsp' else d+0xa0
ops=[]; xm={}
for l in lines:
    m=re.match(r'\s*14000[0-9a-f]+:\t[0-9a-f ]+\t(.*)',l)
    if not m: continue
    t=m.group(1); a=int(l.split(':')[0],16)
    if not (0x140002223<=a<=0x1400023d0): continue
    mm=re.match(r'movdqa xmm(\d+),XMMWORD PTR \[rip\+0x[0-9a-f]+\]\s+# 0x([0-9a-f]+)',t)
    if mm: xm[int(mm.group(1))]=rd(int(mm.group(2),16),16); continue
    mm=re.match(r'mov(?:dqa)?\s+(BYTE|WORD|DWORD|XMMWORD) PTR \[(rsp|rbp)([+-]0x[0-9a-f]+)\],(.*)',t)
    if mm:
        sz,b,d,src=mm.groups(); d=int(d,16); o=off(b,d); src=src.strip()
        if src.startswith('xmm'): v=xm[int(src[3:])]; 
        elif src.startswith('0x'):
            n={'BYTE':1,'WORD':2,'DWORD':4}[sz]; v=int(src,16).to_bytes(n,'little')
        else:
            # register source: key byte
            v=None
        if v is None:
            print("reg src",hex(a),t); continue
        if o<0 or o+len(v)>240: print("skip",hex(a),t); continue
        buf[o:o+len(v)]=v
    elif t.startswith('movzx') and 'rsp+0x2' in t: print(hex(a),t)
open('/tmp/w/buf.bin','wb').write(buf)
for i in range(80): print(i,bytes(buf[i*3:i*3+3]))
