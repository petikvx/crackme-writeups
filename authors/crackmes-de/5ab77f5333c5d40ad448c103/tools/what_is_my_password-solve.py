#!/usr/bin/env python3
"""what_is_my_password / Crackme 6 (br0ken) — résolution des contraintes.
Mot de passe de 9 caractères b0..b8 (0x401064..0x401178) :
  3(b0+b4) + 2b2 - b1 - b3            = 0x15b
  3(b3+2b0) - 2(b1+2b4) - b2          = 0x68
  7b3 + b0 + 3(b1-b2) + b4      = 0x1c2
  3(b3+b2) - 7b4 + 2b0 + b1           = 0x57
  b1+b3+b2+b0+b4                      = 0x10e
  b6 ^ 0x6f == 0x5f ; b7 == b6 ; b8-b5 == 3 ; b8+b5 == 0xeb
Le crackme donne aussi le MD5 attendu : 7eeeec6420a2a99b123f66b5c5231547."""
import hashlib
from fractions import Fraction as F

A = [[3,-1,2,-1,3],[6,-2,-1,3,-4],[1,3,-3,7,1],[2,1,3,3,-7],[1,1,1,1,1]]
B = [0x15b, 0x68, 0x1c2, 0x57, 0x10e]

def solve(A, B):
    M = [[F(x) for x in r] + [F(b)] for r, b in zip(A, B)]
    n = len(M)
    for c in range(n):
        p = next(r for r in range(c, n) if M[r][c] != 0)
        M[c], M[p] = M[p], M[c]
        M[c] = [x / M[c][c] for x in M[c]]
        for r in range(n):
            if r != c:
                M[r] = [a - M[r][c] * b for a, b in zip(M[r], M[c])]
    return [int(r[-1]) for r in M]

b = solve(A, B)
b6 = 0x5f ^ 0x6f
b5 = (0xeb - 3) // 2
pwd = bytes(b + [b5, b6, b6, b5 + 3]).decode()
assert hashlib.md5(pwd.encode()).hexdigest() == "7eeeec6420a2a99b123f66b5c5231547"
print(pwd)
