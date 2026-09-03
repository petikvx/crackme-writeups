#!/usr/bin/env python3
"""nonzenzes_keygenme1 — username (≥5) → RegCode 8 hex.

Algo (après SEH leurre div0) :
  ebx=0 ; c = name[0]
  répéter len(name) fois :
      bswap ebx ; ebx += c ; c += 1
  RegCode = f\"{ebx:08X}\"  (comparé via table xlat case-fold)

Usage:
  python3 tools/nonzenze-kg1-solve.py -q
  python3 tools/nonzenze-kg1-solve.py --user petik --check
"""
from __future__ import annotations

import argparse
import sys


def bswap(x: int) -> int:
    return int.from_bytes(x.to_bytes(4, "little"), "big")


def keygen(name: str) -> str:
    name = name.strip()
    if len(name) < 5:
        raise ValueError("username min 5 chars")
    ebx = 0
    c = ord(name[0]) & 0xFF
    for _ in range(len(name)):
        ebx = bswap(ebx)
        ebx = (ebx + c) & 0xFFFFFFFF
        c = (c + 1) & 0xFF
    return f"{ebx:08X}"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    try:
        code = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1
    if args.q:
        print(code)
        return 0
    print(f"{args.user} → {code}")
    if args.check:
        assert keygen("petik") == "E4000156"
        assert len(code) == 8
        print("self-check OK (petik→E4000156)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
