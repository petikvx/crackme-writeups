#!/usr/bin/env python3
"""Solveur oloL_neB's Goth House (ELF x86-64).

Pour chaque i : h_i = SHA256(bytes((j+c_i)&0xff for j in 0..5)),
acc ^= h_i, acc == TABLE[i] (0x4060, 17*32 octets). Donc h_i = T[i]^T[i-1].
Usage : gothhouse-solve.py [-q] [--check] [binaire]
"""
import argparse, hashlib, os, subprocess, sys

def main():
    here = os.path.dirname(os.path.abspath(__file__))
    ap = argparse.ArgumentParser()
    ap.add_argument("binary", nargs="?", default=os.path.join(here, "..", "original", "gothhouse"))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = open(a.binary, "rb").read()
    tab = [d[0x3060 + 32 * i: 0x3060 + 32 * i + 32] for i in range(17)]
    prev = bytes(32); out = ""
    for t in tab:
        h = bytes(x ^ y for x, y in zip(t, prev)); prev = t
        for c in range(256):
            if hashlib.sha256(bytes((j + c) & 0xff for j in range(6))).digest() == h:
                out += chr(c); break
        else:
            sys.exit("pas de solution")
    print(out if a.q else f"secret = {out}")
    if a.check:
        import shutil, tempfile
        tmp = tempfile.mkdtemp(); p = os.path.join(tmp, "g"); shutil.copy(a.binary, p); os.chmod(p, 0o755)
        r = subprocess.run([p], input=out + "\n", capture_output=True, text=True)
        print(r.stdout); sys.exit(0 if "Access granted" in r.stdout else 1)

main()
