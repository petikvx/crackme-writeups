#!/usr/bin/env python3
"""Solveur — mms_crackme (M&M's) by haiklr.

GetDlgItemText → hash rotatif → wsprintfA(buf,"%X",hash) → prédicats sur les
chiffres hex. Les 8 contraintes forcent hash == 0x80D1F55F. Un préimage
printable de longueur 4 : `_!Q$`.

Usage:
  python3 mms-crackme-solve.py -q
  python3 mms-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import sys

TARGET = 0x80D1F55F
SERIAL = "_!Q$"  # hash_serial == TARGET


def hash_serial(s: bytes) -> int:
    ebx = 0
    ecx = 0
    for c in s:
        ebx = (ebx & ~0xFF) | c
        ebx = ((ebx << 8) | (ebx >> 24)) & 0xFFFFFFFF
        ecx = (ecx + ebx) & 0xFFFFFFFF
    return ecx


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    h = hash_serial(SERIAL.encode())
    if args.check:
        ok = h == TARGET and f"{h:X}" == "80D1F55F"
        print("OK" if ok else "FAIL", SERIAL, f"{h:08X}")
        return 0 if ok else 1
    if args.q:
        print(SERIAL)
        return 0
    print(f"serial={SERIAL!r}  hash=0x{h:08X}  %X → {h:X}")
    print("Attendue : SetDlgItemText → \"M&M's owned !\"")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
