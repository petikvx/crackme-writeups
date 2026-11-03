#!/usr/bin/env python3
"""KeygenME #3 (starzboy) : keygen.
Usage: keygenme3-solve.py [--user petik] [--company petik] [-q] [--check EXE]
Saisies : name, company, identity code, password, secret code."""
import argparse, subprocess, sys

M = 0xFFFFFFFF
def s32(x):
    x &= M
    return x - (1 << 32) if x >> 31 else x

def msvcrt_rand_seq(n):
    """rand() MSVCRT, jamais seedée (seed=1) : 41, 18467, 6334..."""
    seed, out = 1, []
    for _ in range(n):
        seed = (seed * 214013 + 2531011) & M
        out.append((seed >> 16) & 0x7FFF)
    return out

def solve(name: str, company: str):
    # main @0x401390 / boucle name @0x401569
    A = 0
    for c in name.encode():
        c = c - 256 if c > 127 else c
        t = c + 0x1456982 + 0x5893632
        t = 2 * t + 0x2365
        A = (63 * A + 2 * t) & M      # shl 6 - A  + 2t
        A = (2 * A + 0) & M           # + [ebp-0x110] (=0 à ce stade)
        A = (2 * A + 4) & M
    r1, r2 = msvcrt_rand_seq(2)       # r1 -> [ebp-0x12c], r2 -> rand() @0x40161b
    ident = s32(r2 % r1 + A)          # idiv signé ; r positifs
    # boucle company @0x401697 : B écrasé à chaque char (seul le dernier compte)
    B = 0
    for c in company.encode():
        c = c - 256 if c > 127 else c
        B = c + 0x56982
        B = 2 * B + 0x17
        B = 2 * B + 0x258963
        B = (B + 2) & M
    A, B = s32(A), s32(B)
    pw = A
    secret = s32(B * A * ident + pw + ident + A + 2)
    return ident, pw, secret

ap = argparse.ArgumentParser()
ap.add_argument("--user", "--name", default="petik")
ap.add_argument("--company", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", metavar="EXE")
a = ap.parse_args()
ident, pw, sec = solve(a.user, a.company)
if a.q:
    print(ident, pw, sec)
else:
    print(f"User-Name     : {a.user}\nCompany       : {a.company}\nIdentity Code : {ident}\nPassword      : {pw}\nSecret Code   : {sec}")
if a.check:
    inp = f"{a.user}\n{a.company}\n{ident}\n{pw}\n{sec}\n"
    out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=inp,
                         capture_output=True, text=True, timeout=120).stdout
    ok = "Access Granted" in out
    print("CHECK:", "OK" if ok else "KO"); sys.exit(0 if ok else 1)
