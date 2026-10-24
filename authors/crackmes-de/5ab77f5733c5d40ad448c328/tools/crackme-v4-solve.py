#!/usr/bin/env python3
"""crackme_v4 (Logan) — password solver. Pas de user : mot de passe unique.

Contraintes (crackme.exe, 0x401e3b..0x401f81) :
  len == 10 ; p5<p2<p8<p1<p0<p7<p3<p4<p6<p9 (signed) ;
  chaîne de différences p0=p1+2, p1=p2+6, p3=p2+12, p4=p3+1, p4=p5+14,
  p6=p5+15, p6=p7+5, p7=p8+4, p9=p8+14 ; sum(p) == 0x45b.
Usage : crackme-v4-solve.py [-q] [--check [exe]]
"""
import argparse, subprocess, sys, os

def solve():
    # tout est exprimé en fonction de p9 = x
    off = {9: 0, 8: -14, 7: -10, 6: -5, 5: -20, 4: -6, 3: -7, 2: -19, 1: -13, 0: -11}
    x = (0x45B - sum(off.values())) // 10
    assert 10 * x + sum(off.values()) == 0x45B
    p = [x + off[i] for i in range(10)]
    order = [5, 2, 8, 1, 0, 7, 3, 4, 6, 9]
    assert all(p[a] < p[b] for a, b in zip(order, order[1:]))
    return bytes(p).decode()

def check(pw, exe):
    cmd = ["xvfb-run", "-a", "wine", exe]
    out = subprocess.run(cmd, input=pw + "\n", capture_output=True, text=True, timeout=60).stdout
    return "Good Job" in out, out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="analysis/ex/crackme.exe")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        ok, out = check(pw, a.check)
        print("OK" if ok else "KO", file=sys.stderr)
        sys.exit(0 if ok else 1)
