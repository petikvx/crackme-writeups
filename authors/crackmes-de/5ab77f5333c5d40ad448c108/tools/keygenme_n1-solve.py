#!/usr/bin/env python3
"""Keygen LXD's KeygenMe N°1.
h = md5(nom).hexdigest() (32 car.) ; k = octet bas de sum(eax de cpuid(0..4))
v[i] = h[i] ^ k ^ "d41d8cd98f00b204e9800998ecf8427e"[i] (signe), g[i] = 1er chiffre de |v|
serial = 3 blocs de 10 (g[0:10], g[11:21], g[22:32]) passés par la permutation inverse,
separés par '-' (positions 10 et 21)."""
import hashlib,sys
T=b"d41d8cd98f00b204e9800998ecf8427e"; P=(3,5,9,4,2,1,0,6,8,7)
def gen(name,k):
    h=hashlib.md5(name.encode()).hexdigest().upper().encode()  # _strupr @0x408993
    g=[]
    for i in range(32):
        v=h[i]^k^T[i]; v=v-256 if v>127 else v
        g.append(str(abs(v))[0])
    return g
def perm(b):           # 0x40118e : swap(p[i], p[P[i]]) pour i=0..9
    b=list(b)
    for i in range(10): b[i],b[P[i]]=b[P[i]],b[i]
    return b
def inv(b):
    b=list(b)
    for i in reversed(range(10)): b[i],b[P[i]]=b[P[i]],b[i]
    return b
def keygen(name,k):
    g=gen(name,k); parts=[g[0:10],g[11:21],g[22:32]]
    return "-".join("".join(inv(p)) for p in parts)
def check(name,serial,k):  # reimplementation de 0x4011fa
    if len(serial)<32 or serial[10]!='-' or serial[21]!='-': return False
    if not all(c.isdigit() or i in (10,21) for i,c in enumerate(serial[:32])): return False
    g=gen(name,k)
    return all(perm(serial[a:a+10])==g[a:a+10] for a in (0,11,22))
if __name__=="__main__":
    name=sys.argv[1] if len(sys.argv)>1 else "petik"
    k=int(sys.argv[2],0) if len(sys.argv)>2 else None
    if k is None: sys.exit("usage: keygenme_n1-solve.py nom cpuid_byte (voir README)")
    s=keygen(name,k); assert check(name,s,k); print(name,s)
