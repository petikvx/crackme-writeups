#!/usr/bin/env python3
"""Hide and C# (lambogames) : password = c[i] ^ k, avec c (16 octets) et k=0x5b
reconstruits par les DynamicMethod _0xA._0x2 / _0xA._0x3.
Usage : lambogames-solve.py [-q] [--check <exe>]   (pas de user : mot de passe unique)
"""
import argparse, subprocess, sys, os
C = [8, 14, 11, 30, 9, 4, 8, 30, 24, 9, 30, 15, 4, 16, 30, 2]  # newarr 16 + stelem.i1
K = 91

def solve():
    return "".join(chr(b ^ K) for b in C)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"Password : {pw}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + "\n",
                           capture_output=True, text=True, timeout=60)
        out = r.stdout + r.stderr
        print(out)
        sys.exit(0 if "Wrong" not in out else 1)
