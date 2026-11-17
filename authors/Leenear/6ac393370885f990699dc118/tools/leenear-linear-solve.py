#!/usr/bin/env python3
"""Keygen/solveur : Leenear "Wait, it was all linear? Always have been."
Usage: leenear-linear-solve.py [-q] [--check ./crackme]
Le crackme n'a pas de nom d'utilisateur : le serial (32 car.) est unique.
"""
import sys, subprocess
from fractions import Fraction

M32, M64 = 0xFFFFFFFF, (1 << 64) - 1
KEY = [0x9e3779b9, 0x7f4a7c15, 0xf39cc060, 0x5cedc834,
       0x2b3e1e9b, 0xa54ff53a, 0x510e527f, 0x1f83d9ab]
D = [0x5f, 0x75, 0x33, 0x47, 0x21, 0x3f, 0x21, 0x79]       # diag (.rodata 0x2050)
PERM = [3, 0, 5, 2, 7, 4, 1, 6]                              # mot multiplié par D[i]
# cibles lues dans .rodata 0x2090..0x20cf (voir targets())

def xs(x):
    a = (x ^ (x << 13)) & M32
    b = (a ^ (a >> 17)) & M32
    c = (b ^ (b << 5)) & M32
    return b, c

def gen_rows():
    st, rows = 0x6054d23c, []
    for i in range(8):
        b, st = xs(st); i0 = ((b & 1) + i + 1) & 7
        _, st = xs(st); c0 = st % 15 - 7
        b, st = xs(st); i1 = ((b & 1) + i + 3) & 7
        _, st = xs(st); c1 = st % 15 - 7
        b, st = xs(st); i2 = ((b & 1) + i + 5) & 7
        _, st = xs(st); c2 = st % 15 - 7
        rows.append(((i0, c0), (i1, c1), (i2, c2)))
    return rows

def targets(binpath):
    d = open(binpath, 'rb').read()
    # .rodata file offset == vaddr pour ce binaire (0x2000)
    q = [int.from_bytes(d[0x2090 + 8*k:0x2098 + 8*k], 'little') for k in range(8)]
    out = [0]*8
    out[4], out[5], out[6], out[7], out[0], out[1], out[2], out[3] = q
    return out

def solve(binpath):
    rows, tg = gen_rows(), targets(binpath)
    n = 8
    A = [[Fraction(0)]*n + [Fraction(0)] for _ in range(n)]
    for s in range(n):
        A[s][PERM[s]] += D[s]
        for idx, c in rows[s]:
            A[s][idx] += c * 256
        t = tg[s]
        A[s][n] = Fraction(t - (1 << 64) if t >> 63 else t)
    for c in range(n):                      # Gauss-Jordan exact
        p = next(r for r in range(c, n) if A[r][c] != 0)
        A[c], A[p] = A[p], A[c]
        A[c] = [x / A[c][c] for x in A[c]]
        for r in range(n):
            if r != c and A[r][c] != 0:
                f = A[r][c]; A[r] = [x - f*y for x, y in zip(A[r], A[c])]
    v = [A[i][n] for i in range(n)]
    assert all(x.denominator == 1 and 0 <= x < 1 << 32 for x in v), v
    words = [int(x) ^ k for x, k in zip(v, KEY)]
    return b''.join(w.to_bytes(4, 'little') for w in words)

if __name__ == '__main__':
    args = sys.argv[1:]
    quiet = '-q' in args
    binpath = 'analysis/extract/crackme'
    if '--check' in args:
        binpath = args[args.index('--check') + 1]
    s = solve(binpath)
    print(s.decode('latin1') if quiet else f"serial: {s.decode('latin1')!r}  (hex {s.hex()})")
    if '--check' in args:
        r = subprocess.run([binpath], input=s + b'\n', capture_output=True)
        print(r.stdout.decode(), 'rc=', r.returncode)
