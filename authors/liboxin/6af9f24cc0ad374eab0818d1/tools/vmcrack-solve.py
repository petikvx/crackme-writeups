#!/usr/bin/env python3
"""Solveur vmcrack.protected.exe (liboxin, Unpack me v3).

Mot de passe = 48 octets, 12 blocs LE de 4 octets ; chaque bloc :
    r0 = H(r0 ^ w ^ 0x9e3779b9)  ==  T[k]      (r0 initial = 0x243f6a88)
H est inversible (xorshift + multiplications impaires) -> inversion bloc par bloc.

Usage : vmcrack-solve.py [-q] [--check]   (pas d'utilisateur : crackme à mot de passe seul)
  --check : rejoue le prédicat en Python (aucun accès au binaire).
"""
import struct, sys
M = 0xffffffff
INIT, K = 0x243f6a88, 0x9e3779b9
T = [0x61d19662, 0xcf4be1ab, 0xe7567332, 0xac7ab4ae, 0x9dbdf84e, 0x1641201d,
     0x1d35daf1, 0x029e8805, 0x2ddb7834, 0x63162d42, 0xa91a86c4, 0x16ae42ce]

def H(x):
    x ^= x >> 16; x = x * 0x85ebca6b & M
    x ^= x >> 13; x = x * 0xc2b2ae35 & M
    return x ^ (x >> 16)

def unxs(x, s):                      # inverse de x ^= x >> s (32 bits)
    r = x
    for _ in range(32 // s + 1): r = x ^ (r >> s)
    return r

def Hinv(y):
    y = unxs(y, 16); y = y * pow(0xc2b2ae35, -1, 1 << 32) & M
    y = unxs(y, 13); y = y * pow(0x85ebca6b, -1, 1 << 32) & M
    return unxs(y, 16)

def solve():
    out, r0 = b'', INIT
    for t in T:
        out += struct.pack('<I', Hinv(t) ^ K ^ r0); r0 = t
    return out.decode('latin-1')

def check(pw):
    b = pw.encode('latin-1')
    if len(b) != 48: return False
    r0 = INIT
    for k in range(12):
        r0 = H(r0 ^ struct.unpack_from('<I', b, 4 * k)[0] ^ K)
        if r0 != T[k]: return False
    return True

if __name__ == '__main__':
    pw = solve()
    if '--check' in sys.argv:
        ok = check(pw); print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)
    print(pw if '-q' in sys.argv else f'password = {pw}')
