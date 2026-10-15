#!/usr/bin/env python3
"""Solveur — crackme1_s4tan by s4tan (CrakMe.exe, .NET).

La validation est émise dynamiquement (Reflection.Emit) dans
GenerateOpcode → ActivateProduct(name, key) :

  1. len(key) == 2 * len(name)
  2. pour j ∈ [0, len(key)) avec i = j % len(name) (i démarre à 0) :
       ord(key[j]) == ord(name[i]) + j

Usage :
  python3 crackme1-s4tan-solve.py          # détail
  python3 crackme1-s4tan-solve.py -q       # clé seule (name=petik)
  python3 crackme1-s4tan-solve.py petik
  python3 crackme1-s4tan-solve.py --check petik pfvlouk{qt
"""
from __future__ import annotations

import argparse
import sys


def generate_key(name: str) -> str:
    if not name:
        raise ValueError("name vide")
    n = len(name)
    out: list[str] = []
    i = 0
    for j in range(n * 2):
        out.append(chr(ord(name[i]) + j))
        i = (i + 1) % n
    return "".join(out)


def check(name: str, key: str) -> bool:
    if len(key) != len(name) * 2 or not name:
        return False
    i = 0
    for j, ch in enumerate(key):
        if ord(ch) != ord(name[i]) + j:
            return False
        i = (i + 1) % len(name)
    return True


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true", help="clé seule")
    ap.add_argument("--check", nargs=2, metavar=("NAME", "KEY"))
    args = ap.parse_args()

    if args.check:
        name, key = args.check
        ok = check(name, key)
        print("ok" if ok else "fail")
        return 0 if ok else 1

    key = generate_key(args.name)
    if args.q:
        print(key)
        return 0
    print(f"name = {args.name!r}")
    print(f"key  = {key!r}")
    print(f"check = {check(args.name, key)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
