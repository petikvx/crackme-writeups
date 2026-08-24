#!/usr/bin/env python3
"""Solveur — muhemed's muhemed crackme (ELF64).

Le password est assemblé sur la stack dans main (3 immediates LE),
puis comparé via strcmp. Aucune dépendance au user.

Usage :
  python3 muhemed-solve.py
  python3 muhemed-solve.py -q
  python3 muhemed-solve.py --check wvohXN8X7C14jrq1F*!j
"""

from __future__ import annotations

import argparse
import struct
import sys

# movabs immediates from main @ 0x1174 / 0x117e / 0x1196
PASSWORD = (
    struct.pack("<Q", 0x58384E58686F7677)
    + struct.pack("<Q", 0x3171726A34314337)
    + struct.pack("<I", 0x6A212A46)
).decode("ascii")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="PASS", help="verify password")
    args = ap.parse_args()

    if args.check is not None:
        ok = args.check == PASSWORD
        print("OK" if args.q else f"check={'OK' if ok else 'FAIL'} expected={PASSWORD!r}")
        return 0 if ok else 1

    if args.q:
        print(PASSWORD)
    else:
        print(f"password={PASSWORD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
