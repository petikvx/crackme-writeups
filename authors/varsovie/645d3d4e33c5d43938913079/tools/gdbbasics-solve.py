#!/usr/bin/env python3
"""Varsovie — GDB basics (a.out) : le nombre attendu est le résultat d'une boucle de produits en int32 (avec débordement).

main @0x1155 : x = 2 ; pour i de 2 à 0x13 (19) inclus : x = (int32)(x * i)   (imul eax,[rbp-8], 32 bits)
               scanf("%d", &n) ; n == x -> "There is the flag : I_LOVE_YOU" sinon "I cannot provide you a flag !"
Les constantes (valeur initiale 2, borne 0x13) sont relues dans le binaire.
Usage : gdbbasics-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "a.out"
d = EXE.read_bytes()
x0 = d[d.index(bytes.fromhex("c745fc"), 0x1155) + 3]                  # mov DWORD PTR [rbp-4], 2
bound = d[d.index(bytes.fromhex("837df8"), 0x1155) + 3]               # cmp DWORD PTR [rbp-8], 0x13
i0 = d[d.index(bytes.fromhex("c745f8"), 0x1155) + 3]                  # mov DWORD PTR [rbp-8], 2
x = x0
for i in range(i0, bound + 1):
    x = (x * i) & 0xFFFFFFFF
n = x - (1 << 32) if x >= 1 << 31 else x
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(n); sys.exit(0)
print(f"x0={x0} i={i0}..{bound}  ->  n = {n} ({n & 0xFFFFFFFF:#x})")
if a.check:
    run = lambda v: subprocess.run([str(EXE)], input=f"{v}\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko1, ko2, ovf = run(n), run(n + 1), run(0), run(2 * 121645100408832000)
    print("OK:", ok, "| KO:", ko1, "|", ko2, "| 2*19! non tronqué (scanf tronque):", ovf)
    sys.exit(0 if "I_LOVE_YOU" in ok and "cannot" in ko1 and "cannot" in ko2 else 1)
