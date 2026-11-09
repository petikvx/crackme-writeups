#!/usr/bin/env python3
"""Solveur kamil123 "Needle in a Haystack" : réimplémente les 2 hashes du binaire
et retrouve parmi les chaînes de .rdata celle dont le hash == ebx attendu.
Usage: needle-solve.py [-q] [--check]   (--check lance le binaire sous wine)"""
import sys, struct, subprocess, os, re
M = 0xFFFFFFFF
BASE = 0x140000000
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, '..', 'original', 'crackme.exe')
d = open(EXE, 'rb').read()
# .rdata : VMA 0x14000a000 <-> file 0x8600 ; .data : 0x140009000 <-> 0x8400
def rd(va):
    if va >= 0x14000a000: return va - 0x14000a000 + 0x8600
    return va - 0x140009000 + 0x8400
def u32(va): return struct.unpack_from('<I', d, rd(va))[0]
def cstr(va):
    o = rd(va); return d[o:d.index(b'\0', o)]
rol = lambda x, n: ((x << n) | (x >> (32 - n))) & M
K = 0x80be9c3f
d150, d154, d158, d15c = (u32(0x14000a150 + 4*i) for i in range(4))

def target():
    eax = ((((d154 ^ 0x47f28a6c) + 0x56) & M) * K) & M
    eax ^= eax >> 13
    for i in range(41):  # table de 41 pointeurs @0x14000a3e8
        p = struct.unpack_from('<Q', d, rd(0x14000a3e8) + 8*i)[0]
        eax = ((eax + d[rd(p)]) * K) & M
        eax ^= eax >> 13
    ebx = (((eax + 0x13e04bcc) & M) * d158) & M
    return rol(ebx ^ d150, 13)  # rol ebx,0xd @0x140008c04

def h(s):
    b = s + b'\0'
    if not s:
        r9 = ((d15c ^ 0xdacc22a3) * d158) & M
        r9 ^= r9 >> 16
        return 0x3c6abc72 ^ r9 ^ 0x1e355
    r9, r8, ecx = d15c, 0x1505, 0xdacc37a6
    edx, i = b[0], 0
    while True:
        edx = ((edx ^ r9) * K) & M
        r9 = (edx + 0x22c78598) & M
        edx = (r9 + ecx) & M
        ecx >>= 7
        ecx ^= edx
        i += 1
        edx = b[i]
        r8 ^= ecx
        r8 = rol((r8 - 0x3ecf7383) & M, 9)
        if edx == 0: break
    r9 = ((r9 ^ r8 ^ ecx) * d158) & M
    r9 ^= r9 >> 16
    eax, ecx, edx, i = b[0], 0x982700e7, 0xba6c4821, 0
    while True:
        r10 = (eax + edx) & M
        eax = ((eax ^ ecx) * 0x2080d069) & M
        i += 1
        edx >>= 5
        edx ^= r10
        ecx = rol((eax + 0x70189490) & M, 11)
        eax = b[i]
        if eax == 0: break
    edx ^= ecx
    edx = (edx * 0xb259efb3) & M
    eax = edx >> 13
    return edx ^ r9 ^ eax

def solve():
    t = target()
    tbl = [struct.unpack_from('<Q', d, rd(0x14000a3e8) + 8*i)[0] for i in range(41)]
    for p in tbl:
        s = cstr(p)
        if h(s) == t: return s.decode()
    return None

if __name__ == '__main__':
    q = '-q' in sys.argv
    pw = solve()
    if pw is None: sys.exit('aucun candidat')
    print(pw if q else f'[+] mot de passe : {pw}')
    if '--check' in sys.argv:
        r = subprocess.run(['xvfb-run', '-a', 'wine', EXE], input=(pw+'\n').encode(),
                           capture_output=True, timeout=60)
        out = r.stdout.decode(errors='replace')
        print(out[-200:]); sys.exit(0 if 'Correct' in out else 1)
