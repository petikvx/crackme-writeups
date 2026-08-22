#!/usr/bin/env python3
"""Solveur — SimbaHDD's CRACKME

PE32+ MinGW : main fait
  printf("Enter password: ");
  scanf("%99s", input);
  strcmp(input, "simba123") → CORRECT! / WRONG!

Le password est en clair dans .data (VA 0x140003011).

Usage :
  python3 simbahdd-solve.py -q
  python3 simbahdd-solve.py --check simba123
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_PE = _DIR / "original" / "crackme.exe"
PASSWORD_MARKER = b"Enter password: \x00"
# après le prompt NUL → password NUL-terminated


def load_password(pe: Path | None = None) -> str:
    data = (pe or _PE).read_bytes()
    i = data.find(PASSWORD_MARKER)
    if i < 0:
        raise RuntimeError("prompt not found")
    off = i + len(PASSWORD_MARKER)
    return data[off:].split(b"\0", 1)[0].decode("ascii")


def check(s: str, pe: Path | None = None) -> bool:
    return s == load_password(pe)


def main() -> int:
    ap = argparse.ArgumentParser(description="SimbaHDD CRACKME solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()

    pw = load_password()
    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
        return 0
    print("=== SimbaHDD CRACKME ===")
    print(f"password : {pw}")
    print("check    : strcmp(input, pass) == 0 → CORRECT!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
