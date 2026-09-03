#!/usr/bin/env python3
"""stigger crackme #1 — keygen name→serial (algo *après* self-patch).

Au démarrage le PE se charge en heap et patch le DialogProc :
  xor 0xCC → 0xFA, xor 0x256 → 0x133, (sum+0x666)^0x666 → imul 0x666
+ neutralise les nags trial/kill me dans la copie.

Serial = ('A'*len(name)) + transform(name)[len:]  (suffixe A–Z)

Usage:
  python3 tools/stigger-solve.py -q
  python3 tools/stigger-solve.py --user petik --check
"""
from __future__ import annotations

import argparse
import sys


def _norm(k: int) -> int:
    k &= 0xFF
    while True:
        if k > 90:
            k = (k - 16) & 0xFF
            continue
        if k < 65:
            k = (k + 16) & 0xFF
            continue
        return k


def transform(name: bytes) -> bytes:
    buf = bytearray()
    for i, c in enumerate(name):
        buf.append(((c ^ 0xFA) + i - 0x52) & 0xFF)
    n = len(buf)
    for j in range(n):
        edx = (buf[j] ^ 0x133) - 0x22
        buf.append(edx & 0xFF)
    return bytes(_norm(b) for b in buf)


def keygen(name: str) -> str:
    nb = name.encode("latin1")
    if not nb:
        raise ValueError("empty name")
    tr = transform(nb)
    return (b"A" * len(nb) + tr[len(nb) :]).decode("latin1")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1
    if args.q:
        print(serial)
        return 0
    print(f"{args.user} → {serial}")
    if args.check:
        assert keygen("petik") == "AAAAAYKKUN"
        print("self-check OK (petik→AAAAAYKKUN)")
        print("Wine: cwd=original/_u ; MessageBox « good w0rk! »")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
