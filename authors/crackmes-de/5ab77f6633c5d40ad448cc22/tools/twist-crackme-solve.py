#!/usr/bin/env python3
"""twist CrackMe — keygen name→serial (Asc Left*Right/Mid).

Exemple d'usage : user **petik**.

  ./twist-crackme-solve.py -q
  ./twist-crackme-solve.py --user petik
"""
from __future__ import annotations

import argparse
import sys


def keygen(name: str) -> str:
    if len(name) < 3:
        raise ValueError("name length must be >= 3")
    # Asc(Left(n,1)) * Asc(Right(n,1)) / Asc(Mid(n,3,1)) puis CStr / __vbaStrR8
    val = ord(name[0]) * ord(name[-1]) / ord(name[2])
    # VB Str$ / CStr double : espace initial pour positif
    return f" {val}"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default="petik")
    args = ap.parse_args()
    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1
    if args.q:
        print(serial)
    else:
        print(f"user={args.user!r} serial={serial!r}")
        print(f"  Asc('{args.user[0]}')*Asc('{args.user[-1]}')/Asc('{args.user[2]}') = {ord(args.user[0])*ord(args.user[-1])/ord(args.user[2])}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
