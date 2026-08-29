#!/usr/bin/env python3
"""scarabee Crackme #5 — keygen name → serial (Delphi PE32, ASPack).

Formulaire (Edit1Change) :

  1. Edit1 doit être exactement « SerialCheck » (sinon « About » → hint).
  2. Edit3 = name (longueur ≥ 4) → calcule le serial.
  3. Edit2 = serial décimal (IntToStr) à comparer.

Algo (entiers signés 32-bit, comme Delphi Integer / imul / idiv) :

  acc = 0
  for i, c in enumerate(name, 1):          # i 1-based
      acc += (ord(c) XOR 0x7D3) * i
      acc -= 0x1D
  acc = acc * len(name)
  acc = acc / ord(name[0])                 # idiv (tronque vers 0)
  acc = acc * acc
  serial = str(acc + 0x15)

Exemple : user **petik** → serial **1723990**.

  ./scarabee5-solve.py -q
  ./scarabee5-solve.py --user petik
  ./scarabee5-solve.py --check
"""
from __future__ import annotations

import argparse
import sys


def to_i32(x: int) -> int:
    x &= 0xFFFFFFFF
    return x - 0x100000000 if x >= 0x80000000 else x


def imul32(a: int, b: int) -> int:
    return to_i32(to_i32(a) * to_i32(b))


def idiv32(a: int, b: int) -> int:
    """Division entière x86 (tronque vers 0)."""
    a, b = to_i32(a), to_i32(b)
    if b == 0:
        raise ZeroDivisionError("name[0] == NUL")
    q = abs(a) // abs(b)
    if (a < 0) ^ (b < 0):
        q = -q
    return q


def unlock_ok(edit1: str) -> bool:
    """Edit1 transformé : (c XOR 0xE0) + 0x20, comparé à « SerialCheck » encodé."""
    return edit1 == "SerialCheck"


def keygen(name: str) -> str:
    if len(name) < 4:
        raise ValueError("name length must be >= 4 (Edit3)")
    if not name[0]:
        raise ValueError("name must be non-empty")
    acc = 0
    for i, c in enumerate(name, 1):
        acc = to_i32(acc + imul32(ord(c) ^ 0x7D3, i))
        acc = to_i32(acc - 0x1D)
    acc = imul32(acc, len(name))
    acc = idiv32(acc, ord(name[0]))
    acc = imul32(acc, acc)
    acc = to_i32(acc + 0x15)
    return str(acc)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--user", "--name", default="petik", help="Edit3 (default petik)")
    ap.add_argument(
        "--check",
        action="store_true",
        help="vérifie petik→1723990 et unlock SerialCheck",
    )
    args = ap.parse_args()

    if args.check:
        got = keygen("petik")
        ok = got == "1723990" and unlock_ok("SerialCheck")
        print(f"unlock=SerialCheck petik → {got} (expect 1723990) {'OK' if ok else 'FAIL'}")
        return 0 if ok else 1

    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.q:
        print(serial)
    else:
        print(f"Edit1='SerialCheck' Edit3={args.user!r} Edit2={serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
