#!/usr/bin/env python3
"""XMM.exe (pavler6) : inverse la mini-VM SSE -> mot de passe de 16 octets.
Usage : pavler6-solve.py [-q] [--check]   (--check : forward VM sur le résultat)
"""
import argparse, os, struct, subprocess, sys
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, '..', 'original', 'XMM.exe')
d = open(EXE, 'rb').read()
def rva(r, n=16):            # sections : .rdata va 0x6000 -> raw 0x4600
    return d[r - 0x6000 + 0x4600: r - 0x6000 + 0x4600 + n]
M = rva(0x6440, 0x390)       # mémoire VM
m = lambda o: M[o:o + 16]
def pshufb(v, c): return bytes(0 if c[i] & 0x80 else v[c[i] & 15] for i in range(16))
rol = lambda x, n: ((x << n) | (x >> (8 - n))) & 255
ror = lambda x, n: ((x >> n) | (x << (8 - n))) & 255
def fwd(p):
    r = pshufb(p, m(0x00))
    r = bytes((b + 0x13) & 255 for b in r)
    r = bytes(a ^ b for a, b in zip(r, m(0x10)))
    r = bytes(rol(b, 3) for b in r)
    r = pshufb(r, m(0x20))
    r = bytes(a ^ b for a, b in zip(r, m(0x30)))
    s = bytes(4) + r[:12]; r = bytes(a ^ b for a, b in zip(r, s))   # r ^= r<<4 octets
    r = pshufb(r, m(0x40))
    r = bytes(a ^ b for a, b in zip(r, m(0x50)))
    return bytes((b * 3) & 255 for b in r)
def inv_pshufb(v, c):
    out = [0] * 16
    for i in range(16):
        assert not c[i] & 0x80
        out[c[i] & 15] = v[i]
    return bytes(out)
# cible : (0x6a50 ^ 0x64a0) permuté, puis ^ 0x6a40
x = bytes(a ^ b for a, b in zip(rva(0x6a50), rva(0x64a0)))
perm = [11,14,1,4,7,10,13,0,3,6,9,12,15,2,5,8]
T = bytes(a ^ b for a, b in zip(bytes(x[i] for i in perm), rva(0x6a40)))
def solve():
    r = bytes((b * 171) & 255 for b in T)
    r = bytes(a ^ b for a, b in zip(r, m(0x50)))
    r = inv_pshufb(r, m(0x40))
    o = bytearray(r)                       # inverse de r ^= r<<4 : séquentiel
    for i in range(4, 16): o[i] ^= o[i - 4]
    r = bytes(o)
    r = bytes(a ^ b for a, b in zip(r, m(0x30)))
    r = inv_pshufb(r, m(0x20))
    r = bytes(ror(b, 3) for b in r)
    r = bytes(a ^ b for a, b in zip(r, m(0x10)))
    r = bytes((b - 0x13) & 255 for b in r)
    return inv_pshufb(r, m(0x00))
ap = argparse.ArgumentParser(); ap.add_argument('-q', action='store_true'); ap.add_argument('--check', action='store_true')
a = ap.parse_args()
pw = solve()
assert fwd(pw) == T
print(pw.decode('latin1') if a.q else f'password = {pw.decode("latin1")!r}  ({pw.hex()})')
if a.check:
    o = subprocess.run(['xvfb-run', '-a', 'wine', EXE], input=pw + b'\n', capture_output=True, timeout=60)
    print(o.stdout.decode('latin1', 'replace'))
