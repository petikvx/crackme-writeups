#!/usr/bin/env python3
"""Solveur 4F.CrackMe #2 (crackmes.de / ximus) — crackme.dll!Check(char*).

len == 15, s[7] == '-'
A: (s0+s3)^4 + (s1+s4)^3 + (s2+s5)^2 + s6   == 0x2722DCB0
B: (s8+s14)^4 + (s9+s13)^3 + (s10+s12)^2 + s11 == 0x3308239F
(pow() CRT + ftol, constantes 4.0 / 3.0 / 2.0 en .rdata)

Usage : solve.py [--check SERIAL]
"""
import sys

def check(s: str) -> bool:
    b = s.encode()
    if len(b) != 15 or b[7] != 0x2D: return False
    A = (b[0]+b[3])**4 + (b[1]+b[4])**3 + (b[2]+b[5])**2 + b[6]
    B = (b[8]+b[14])**4 + (b[9]+b[13])**3 + (b[10]+b[12])**2 + b[11]
    return A == 0x2722DCB0 and B == 0x3308239F

ALNUM = [c for c in range(0x30, 0x7B) if chr(c).isalnum()]

def part(T):
    """T = a^4 + b^3 + c^2 + d, d alnum, sommes a,b,c de 2 alnum."""
    for a in range(96, 245):
        for b in range(96, 245):
            r = T - a**4 - b**3
            if r < 0: continue
            for c in range(96, 245):
                d = r - c*c
                if d in ALNUM: return a, b, c, d

def split(n):
    for x in ALNUM:
        if n - x in ALNUM: return x, n - x

def solve():
    s = [0]*15; s[7] = 0x2D
    a, b, c, s[6] = part(0x2722DCB0)
    (s[0], s[3]), (s[1], s[4]), (s[2], s[5]) = split(a), split(b), split(c)
    a, b, c, s[11] = part(0x3308239F)
    (s[8], s[14]), (s[9], s[13]), (s[10], s[12]) = split(a), split(b), split(c)
    return bytes(s).decode()

if __name__ == '__main__':
    if len(sys.argv) > 2 and sys.argv[1] == '--check':
        ok = check(sys.argv[2]); print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)
    s = solve(); assert check(s); print(s)
