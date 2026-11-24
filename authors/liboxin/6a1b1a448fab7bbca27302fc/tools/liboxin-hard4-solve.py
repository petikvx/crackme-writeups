#!/usr/bin/env python3
"""liboxin's CrackMe Hard 4 (rust_cm.exe) — solveur.

Le check 0x140002be4 découpe la clé (37 octets) en mots u32 de 3 octets LE
(w0..w11 = octets 0..35, w12 = octet 36, w13..w15 = 0) puis évalue le
polynôme P(x)=sum w_j x^j mod p (p=0x7fe001) en 16 points x_i=0x6d9^(i+1)
et exige P(x_i) == table[i] ^ 0x5a17c3. Système de Vandermonde mod p.

Usage: tools/liboxin-hard4-solve.py [-q] [--check [exe]]
"""
import sys, os, struct, subprocess, hashlib
P = 0x7fe001
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, '..', 'original', 'rust_cm.exe')
TABLE_FILE_OFF = 0x1aac8 - 0x1a000 + 0x18e00  # VA 0x14001aac8

def solve():
    d = open(EXE, 'rb').read()
    tab = struct.unpack('<16I', d[TABLE_FILE_OFF:TABLE_FILE_OFF + 64])
    xs, x = [], 1
    for _ in range(16):
        x = x * 0x6d9 % P; xs.append(x)
    ys = [t ^ 0x5a17c3 for t in tab]
    # Gauss mod p : V w = y, V[i][j] = x_i^j
    M = [[pow(xs[i], j, P) for j in range(16)] + [ys[i]] for i in range(16)]
    for c in range(16):
        r = next(r for r in range(c, 16) if M[r][c])
        M[c], M[r] = M[r], M[c]
        inv = pow(M[c][c], -1, P)
        M[c] = [v * inv % P for v in M[c]]
        for r in range(16):
            if r != c and M[r][c]:
                f = M[r][c]
                M[r] = [(a - f * b) % P for a, b in zip(M[r], M[c])]
    w = [M[i][16] for i in range(16)]
    assert w[12] < 256 and w[13] == w[14] == w[15] == 0, w
    key = b''.join(struct.pack('<I', v)[:3] for v in w[:12]) + bytes([w[12]])
    return key.decode('latin-1')

def check(key, exe=EXE):
    cmd = ['xvfb-run', '-a', 'wine', exe]
    out = subprocess.run(cmd, input=key + '\n', capture_output=True, text=True, timeout=60).stdout
    return out

if __name__ == '__main__':
    key = solve()
    if '-q' in sys.argv: print(key)
    else: print('key =', key)
    if '--check' in sys.argv:
        print(check(key))
