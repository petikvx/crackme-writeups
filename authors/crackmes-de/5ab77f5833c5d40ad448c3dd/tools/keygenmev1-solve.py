#!/usr/bin/env python3
"""keygenmev1_seasy (pxor, crackmes.de) — keygen + checker.

Serial = "AAAAAAAA-BBBBBBBB" (2 x 8 hex MAJUSCULES, A puis B, int32 signés).
Valide si round(x²·B − y·A) == H(name) avec x=1.22, y≈0.4883 (long doubles du binaire)
et H = hash 32 bits du nom (répété cycliquement sur 32 octets). Nom : 3..31 caractères.

  keygenmev1-solve.py [--name petik]   -> serial pour le nom
  keygenmev1-solve.py -q               -> serial seul
  keygenmev1-solve.py --check NAME SERIAL
"""
import argparse, re, random
from fractions import Fraction as F

M = 0xFFFFFFFF
rol = lambda x, n: ((x << (n & 31)) | (x >> (32 - (n & 31)))) & M if n & 31 else x & M
ror = lambda x, n: rol(x, 32 - (n & 31))

def ld(mant, exp):                      # long double 80 bits -> Fraction exact
    return F(mant, 1 << 63) * F(2) ** (exp - 0x3fff)
X = ld(0x9c28f5c28f5c28f6, 0x3fff)      # 0x403197  (= 1.22)
Y = ld(0xfa0f9096bb98c7e3, 0x3ffd)      # 0x4031a1  (~ 0.4883)

def pad32(name):
    b = name.encode()
    return bytes(b[i % len(b)] for i in range(32))

def hname(name):                        # boucle 0x4012b2..0x4012c0
    eax = ebx = cl = 0                  # ecx mis à 0 UNE fois (hors boucle)
    for c in pad32(name):
        eax = (eax & ~0xff) | c         # lodsb ne touche que AL
        ebx = (ebx + eax) & M
        cl = (cl + ebx) & 0xff
        ebx = rol(ebx, cl)
        eax = ror(eax, cl)
        eax = (eax + ebx) & M
        eax = (-eax) & M
    return eax - (1 << 32) if eax >> 31 else eax    # ficom : int32 signé

def s32(v): return v - (1 << 32) if v >> 31 else v

def rnd(v):                             # fistp, arrondi au plus proche (pair)
    fl = v.numerator // v.denominator
    r = v - fl
    return fl + (1 if r > F(1, 2) or (r == F(1, 2) and fl & 1) else 0)

def check(name, serial):
    if not 3 <= len(name) <= 31 or not re.fullmatch(r'[0-9A-F]{8}-[0-9A-F]{8}', serial):
        return False
    A, B = s32(int(serial[:8], 16)), s32(int(serial[9:], 16))
    return rnd(X * X * B - Y * A) == hname(name)

def keygen(name, A=0x1000):
    H = hname(name)
    for a in range(A, A + 100000):
        B0 = rnd((F(H) + Y * a) / (X * X))
        for B in range(B0 - 2, B0 + 3):
            v = X * X * B - Y * a
            if -2**31 <= B < 2**31 and abs(v - H) < F(1, 4):      # marge loin du .5
                return "%08X-%08X" % (a & M, B & M)
    raise SystemExit("pas de solution")

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("NAME", "SERIAL"))
    a = ap.parse_args()
    if a.check:
        ok = check(a.check[0], a.check[1].upper()); print("OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    s = keygen(a.name)
    assert check(a.name, s)
    print(s if a.q else f"name={a.name} serial={s}  (H={hname(a.name) & M:#010x})")
