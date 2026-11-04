#!/usr/bin/env python3
"""Harry Potter Crackme (shalamandra) — inverse la permutation du nom.

Le binaire lit un nom (getline, 20 octets max), construit
out[k] = in[PERM[k]] (k=0..18) et compare à "I am Lord Voldemort".
Solution : in[PERM[k]] = TARGET[k].

Usage: harry-potter-solve.py [-q] [--check EXE]
"""
import argparse, subprocess, sys
TARGET = "I am Lord Voldemort"
# index source dans le buffer d'entrée pour chaque octet de sortie (main @0x4016a0..0x4016f6)
PERM = [13, 3, 5, 4, 18, 9, 1, 6, 15, 11, 7, 8, 16, 14, 17, 2, 10, 12, 0]

def solve():
    buf = [None] * len(PERM)
    for k, s in enumerate(PERM):
        buf[s] = TARGET[k]
    return "".join(buf)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    name = solve()
    print(name if a.q else f"Nom attendu : {name!r}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=name + "\n",
                           capture_output=True, text=True, timeout=90)
        ok = "Nice job boy" in r.stdout
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
