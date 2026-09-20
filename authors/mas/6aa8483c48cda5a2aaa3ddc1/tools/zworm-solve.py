#!/usr/bin/env python3
"""Solveur — MAS's zW0rM

Jeu console Win64 : dual anti-debug + score≥5 → MessageBox flag.
Flag vérifié par le prédicat interne sum==4354 && fold%1234==854.

Usage:
  python3 tools/zworm-solve.py -q
  python3 tools/zworm-solve.py --check
"""
from __future__ import annotations

import argparse
import sys

FLAG = "Z+{SOm3_T1Mes_Y0u_N33dToEn_joyTheGameT0Crack_it}"


def verify_flag(s: str) -> bool:
    """Réplique sub_1400026E0 (hors IsDebuggerPresent)."""
    data = s.encode("ascii")
    total = 0
    acc = 1
    rem = 0
    for c in data:
        total += c
        prod = acc * c
        rem = prod % 1234
        acc = rem
    return total == 4354 and rem == 854


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie le prédicat sum/fold du binaire")
    args = ap.parse_args()

    if args.check:
        ok = verify_flag(FLAG)
        print(FLAG)
        print("checksum OK" if ok else "checksum FAIL")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(FLAG)
    else:
        print(FLAG)
        print("# score=5 sous anti-debug contourné → MessageBoxA titre Pro")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
