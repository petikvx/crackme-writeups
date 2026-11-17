#!/usr/bin/env python3
"""Keygen Orbital Relay (victormeloasm) : username -> serial XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX.

h = SHA-256("ORBITAL/V1:" + user + ":SOYUZ/2026") (8 mots BE h0..h7)
cibles : T1=rol(h4,5)^h0  T2=rol(h6,13)^h2  T3=rol(h5,9)+h1  T4=ror(h7,15)+h3
Les 4 mots du serial (s0..s3, hex BE) passent par un mélange ARX (0x1a6a..0x1f5c) ;
z3 résout le système (4 équations / 128 bits) pour chaque utilisateur.

Usage : orbital-solve.py [-q] [--user petik] [--check BINAIRE]
"""
import argparse, hashlib, re, struct, subprocess, sys
import z3

M = 0xffffffff
def bv(x): return z3.BitVecVal(x, 32)
def rol(x, n): return z3.RotateLeft(x, n)
def ror(x, n): return z3.RotateRight(x, n)

def targets(user):
    h = struct.unpack('>8I', hashlib.sha256(b'ORBITAL/V1:' + user.encode() + b':SOYUZ/2026').digest())
    r = lambda x, n: ((x << n) | (x >> (32 - n))) & M
    rr = lambda x, n: ((x >> n) | (x << (32 - n))) & M
    return (r(h[4], 5) ^ h[0], r(h[6], 13) ^ h[2], (r(h[5], 9) + h[1]) & M, (rr(h[7], 15) + h[3]) & M)

def model(s0, s1, s2, s3):
    """Reproduit l'asm ; retourne les 4 expressions à égaler à T1..T4."""
    K = bv
    eax, edi, edx = s2, s3, s1
    esi = rol(eax, 3) ^ K(0x6c9e7b12); ecx = eax ^ K(0xe28f41d5); ecx += edi
    r10 = edi ^ K(0x7523a6c9); esi += edx; ecx = rol(ecx, 11); esi = rol(esi, 7); esi ^= ecx
    ecx = rol(edi, 4); esi -= K(0x61c88647); esi ^= s0; r10 += esi; ecx ^= K(0x914d3fa9); ecx += eax
    r10 = rol(r10, 12); ecx = rol(ecx, 8); ecx ^= r10
    r10 = esi ^ K(0x4f19bd83); ecx += K(0x3c6ef372); ecx ^= edx; edx = rol(esi, 5); r10 += ecx
    edx ^= K(0x3db4e50f); r10 = rol(r10, 13); edx += edi; edx = rol(edx, 9); edx ^= r10
    r10 = ecx; edx -= K(0x255992d5); edx ^= eax; eax = rol(ecx, 6); r10 ^= K(0x9c0e5a37)
    eax ^= K(0xb5c28761); r10 += edx; eax += esi; r10 = rol(r10, 14); eax = rol(eax, 10); eax ^= r10
    r10 = edx ^ K(0x127bf6d1); eax += K(0x78dde6e4); eax ^= edi; edi = rol(edx, 7); r10 += eax
    edi ^= K(0x0a76d94b); r10 = rol(r10, 15); edi += ecx; edi = rol(edi, 11); edi ^= r10
    r10 = eax ^ K(0xdb65a402); edi += K(0x1715609d); edi ^= esi; esi = rol(eax, 8); r10 += edi
    esi ^= K(0xe28f41d5); r10 = rol(r10, 16); esi += edx; esi = rol(esi, 12); esi ^= r10
    r10 = edi; esi -= K(0x4ab325aa); esi ^= ecx; ecx = rol(edi, 9); ecx ^= K(0x7523a6c9); ecx += eax
    r10 ^= K(0x86f9c13b); r10 += esi; ecx = rol(ecx, 13); r10 = ror(r10, 15); ecx ^= r10
    r10 = esi ^ K(0x29ad70e5); ecx += K(0x5384540f); ecx ^= edx; edx = rol(esi, 10); r10 += ecx
    edx ^= K(0x4f19bd83); r10 = ror(r10, 14); edx += edi; edx = rol(edx, 14); edx ^= r10
    r10 = ecx ^ K(0xf36c82a1); edx -= K(0x0e443238); edx ^= eax; eax = rol(ecx, 11); r10 += edx
    eax ^= K(0x9c0e5a37); r10 = ror(r10, 13); eax += esi; eax = rol(eax, 15); eax ^= r10
    r10 = edx ^ K(0x58b104d7); eax -= K(0x700cb87f); eax ^= edi; edi = rol(edx, 12); r10 += eax
    edi ^= K(0x127bf6d1); r10 = ror(r10, 12); edi += ecx; edi = rol(edi, 16); edi ^= r10
    r10 = eax ^ K(0xc74e96f2); edi += K(0x2e2ac13a); esi ^= edi; edi = rol(eax, 13); r10 += esi
    edi ^= K(0xdb65a402); r10 = ror(r10, 11); edi += edx; edi = ror(edi, 15); edi ^= r10
    r10 = esi ^ K(0x6c9e7b12); edi -= K(0x339dc50d); ecx ^= edi; edi = rol(esi, 3); r10 += ecx
    edi ^= K(0x86f9c13b); r10 = ror(r10, 10); edi += eax; edi = ror(edi, 14); edi ^= r10
    r10 = ecx ^ K(0x914d3fa9); edi += K(0x6a99b4ac); edx ^= edi; edi = rol(ecx, 4); r10 += edx
    edi ^= K(0x29ad70e5); edi += esi; edi = ror(edi, 13); r10 = ror(r10, 9); edi ^= r10
    edi += K(0x08d12e65); eax ^= edi
    e1 = eax                                  # C1 : == T1  (r8d = T1 ensuite)
    # étape 2 : T1 joue le rôle de r8d
    return dict(eax=eax, ecx=ecx, edx=edx, esi=esi)

def solve(user):
    T1, T2, T3, T4 = (bv(t) for t in targets(user))
    s = [z3.BitVec(f's{i}', 32) for i in range(4)]
    r = model(*s)
    eax, ecx, edx, esi = r['eax'], r['ecx'], r['edx'], r['esi']
    sv = z3.Solver()
    sv.add(eax == T1)
    r8 = T1
    # 0x1e6e..0x1eee : C2
    a = rol(edx, 5) ^ bv(0xf36c82a1); r11 = (edx ^ bv(0x3db4e50f)) + r8
    a += ecx; r11 = rol(r11, 11); a = ror(a, 12); a ^= r11; a -= bv(0x58f757e2); a ^= esi
    r11 = (r8 ^ bv(0xb5c28761)) + a
    e = rol(r8, 6) ^ bv(0x58b104d7); e += edx; e = ror(e, 11); r11 = rol(r11, 12); e ^= r11
    e += bv(0x454021d7); ecx2 = ecx ^ e
    sv.add(ecx2 == T2)
    sv.add(a == T3)                            # C3 : eax(étape 2) == T3
    # C4
    t = T3
    c = (t ^ bv(0x0a76d94b)) + T2
    d = rol(t, 7) ^ bv(0xc74e96f2); d += r8; c = rol(c, 13); d = ror(d, 10)
    c ^= d; c -= bv(0x1c886470)
    sv.add((edx ^ c) == T4)
    if sv.check() != z3.sat:
        return None
    m = sv.model()
    return [m[x].as_long() for x in s]

def fmt(w): return '-'.join(f'{x:08X}' for x in w)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--user', '--name', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', metavar='BIN')
    a = ap.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_.-]{3,32}', a.user):
        sys.exit('username invalide (3-32 car. [A-Za-z0-9_.-])')
    w = solve(a.user)
    if w is None:
        sys.exit('pas de solution')
    ser = fmt(w)
    if a.q: print(ser)
    else: print(f'user={a.user}\nserial={ser}')
    if a.check:
        out = subprocess.run([a.check, a.user, ser], capture_output=True, text=True).stdout
        ok = 'LICENSE ACCEPTED' in out
        print('check:', 'OK' if ok else 'KO', file=sys.stderr)
        sys.exit(0 if ok else 1)

if __name__ == '__main__':
    main()
