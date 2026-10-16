#!/usr/bin/env python3
"""YandereMia — simple XOR crackme : key[i] = T0[i]^T1[i]^T2[i]^T3[i]^0x20 (16 octets).

Tables lues dans .rodata de l'ELF (VMA 0x2030/0x2040/0x2050/0x2060 = offset fichier identique).
Usage : xor-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
TABLES = (0x2030, 0x2040, 0x2050, 0x2060)


def solve(d: bytes) -> str:
    t = [d[o:o + 16] for o in TABLES]
    return bytes(a ^ b ^ c ^ e ^ 0x20 for a, b, c, e in zip(*t)).decode()


ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
key = solve(EXE.read_bytes())
if a.q:
    print(key); sys.exit(0)
print("key =", key)
if a.check:
    ok = subprocess.run([str(EXE), key], capture_output=True, text=True).stdout.strip()
    ko = subprocess.run([str(EXE), "x" * 16], capture_output=True, text=True).stdout.strip()
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if ok == "Pass valid!" and ko == "Nope." else 1)
