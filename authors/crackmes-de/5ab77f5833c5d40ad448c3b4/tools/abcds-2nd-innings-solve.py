#!/usr/bin/env python3
"""Keygen abcds_2nd_innings (crackme.exe, abcd) : username -> password `L x R`.

Usage : abcds-2nd-innings-solve.py [--user petik] [-q] [--check USER PWD]
Le username doit avoir une longueur paire >= 8 : le solveur complète le préfixe
(défaut `petik`) avec des caractères de padding.
"""
import argparse, sys

def msvcrt_rand(seed):
    s = (seed * 214013 + 2531011) & 0xFFFFFFFF
    return (s >> 16) & 0x7FFF

# T[] : "Username" filtré (U a e m n r s) puis T[0..4] écrasés par rand()
T = [msvcrt_rand(13) - 1, msvcrt_rand(25) - 1, msvcrt_rand(19),
     msvcrt_rand(6), msvcrt_rand(0) - 6, ord('r'), ord('s')]

def sb(v):  # signed byte
    v &= 0xFF
    return v - 256 if v >= 128 else v

def tdiv(a, b):  # division C (troncature vers 0)
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b > 0) else -q

def f(c, i):
    b = (c << 4) & 0xFF
    b = sb(b)
    if b < 0:
        b = sb(-b)
    v = b + T[i % 7]
    r = v - 127 * tdiv(v, 127)
    if r <= 0x1F:
        r += 0x20
    return sb(r)

def check(user, pwd):
    x = pwd.find('x')
    if len(user) <= 7 or x < 0 or len(user) < x:
        return False
    L, R = pwd[:x], pwd[x + 1:]
    s2, s1 = user[:x], user[x:]
    if not (len(L) == len(R) == len(s1)):
        return False
    s4 = [f(ord(c), i) for i, c in enumerate(s1)]
    s3 = [tdiv(ord(s2[i]) + ord(R[i]) + ord(L[i]), 3) for i in range(len(R))]
    return s4[::-1] == s3

def keygen(user):
    PAD = "!#$%&*+,-./;=?@_~"
    for n in range(max(4, (len(user) + 1) // 2), 40):
        for off in range(len(PAD)):
            u = user + "".join(PAD[(off + k) % len(PAD)] for k in range(2 * n - len(user)))
            t = [f(ord(c), i) for i, c in enumerate(u[n:])][::-1]
            L = R = ""
            for i in range(n):
                lo = 3 * t[i] - ord(u[i])
                for s in range(lo, lo + 3):
                    c = [(a, s - a) for a in range(33, 127)
                         if a != ord('x') and 33 <= s - a <= 126]
                    if c:
                        L += chr(c[0][0]); R += chr(c[0][1]); break
                else:
                    break
            else:
                p = L + "x" + R
                if check(u, p):
                    return u, p
    return None

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("USER", "PWD"))
    a = ap.parse_args()
    if a.check:
        ok = check(*a.check); print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    r = keygen(a.user)
    if not r: sys.exit("no solution")
    print(f"{r[0]}\n{r[1]}" if a.q else f"Username: {r[0]}\nPwd: {r[1]}")
