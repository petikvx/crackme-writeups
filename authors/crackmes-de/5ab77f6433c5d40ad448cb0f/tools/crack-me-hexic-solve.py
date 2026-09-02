#!/usr/bin/env python3
"""hexic / cLoNeTrOnE KeyGenMe #1 — name→serial.

Serial: AA-XXXXXXXX-BB
  A = CHARMAP[name[i] % 16] for i in (0,1)
  XXXXXXXX = sum(name bytes) as %.8X
  B = CHARMAP[name[-2]%16], CHARMAP[name[-1]%16]
CHARMAP = "1AG4T3CX8ZF7R95Q"
Constraints: 4 ≤ len(name) ≤ 60, ASCII < 128.

  ./crack-me-hexic-solve.py -q
  ./crack-me-hexic-solve.py --name petik --check
"""
from __future__ import annotations

import argparse
import sys

CHARMAP = "1AG4T3CX8ZF7R95Q"


def keygen(name: str) -> str:
    raw = name.encode("ascii")
    if not (4 <= len(raw) <= 0x3C):
        raise ValueError("name length must be 4..60")
    if any(b > 127 for b in raw):
        raise ValueError("ASCII only (<128)")
    a = CHARMAP[raw[0] % 16]
    b = CHARMAP[raw[1] % 16]
    mid = f"{sum(raw):08X}"
    c = CHARMAP[raw[-2] % 16]
    d = CHARMAP[raw[-1] % 16]
    return f"{a}{b}-{mid}-{c}{d}"


def verify(name: str, serial: str) -> bool:
    return keygen(name) == serial


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--name", "--user", default="petik", dest="name")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    try:
        serial = keygen(args.name)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.q:
        print(serial)
    else:
        print(f"name   = {args.name!r}")
        print(f"serial = {serial}")

    if args.check:
        if not verify(args.name, serial):
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
