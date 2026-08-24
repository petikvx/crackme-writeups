#!/usr/bin/env python3
"""Solveur — soulreaper's Dead Terminal (ELF64 shell).

Commande : reap <key>
Key 8 chars : (key[i] ^ 0x2a) + (7 + 3*i) == enc[i]
enc = LE(0x34378e828a78797f)

Usage :
  python3 dead-terminal-solve.py -q
  python3 dead-terminal-solve.py --check REAPER42
"""

from __future__ import annotations

import argparse
import struct
import sys

ENC = struct.pack("<Q", 0x34378E828A78797F)


def derive() -> str:
    edx = 7
    out = bytearray()
    for e in ENC:
        out.append(((e - edx) & 0xFF) ^ 0x2A)
        edx += 3
    return out.decode("ascii")


PASSWORD = derive()


def check(pw: str) -> bool:
    if len(pw) != 8:
        return False
    edx = 7
    for i, e in enumerate(ENC):
        if ((ord(pw[i]) ^ 0x2A) + edx) & 0xFF != e:
            return False
        edx += 3
    return True


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="key only")
    ap.add_argument("--check", metavar="KEY", help="verify key")
    args = ap.parse_args()

    if args.check is not None:
        ok = check(args.check)
        print("OK" if args.q else f"check={'OK' if ok else 'FAIL'} expected={PASSWORD!r}")
        return 0 if ok else 1

    if args.q:
        print(PASSWORD)
    else:
        print(f"key={PASSWORD}")
        print(f"shell: reap {PASSWORD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
