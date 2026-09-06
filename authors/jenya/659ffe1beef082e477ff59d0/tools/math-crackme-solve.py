#!/usr/bin/env python3
"""Solveur — Jenya math_crackme

  n2 = 6  si n1 % 6 == 0
  n2 = 2  si n1 % 2 == 0 (et pas % 6)
  n2 = 0  sinon

Implémenté sans branche dans check() (div/and/shl/mul).

Attention : chaque input fait read(20) — pour un pipe unique, padder
la 1re ligne à 20 octets (après le \\n).

Usage:
  python3 math-crackme-solve.py              # ex. 12 → 6
  python3 math-crackme-solve.py -q --n1 4
  python3 math-crackme-solve.py --check
  python3 math-crackme-solve.py --check --n1 5
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "main"
DEFAULT_N1 = 12


def expected(n1: int) -> int:
    if n1 % 6 == 0:
        return 6
    if n1 % 2 == 0:
        return 2
    return 0


def payload(n1: int, n2: int | None = None) -> bytes:
    if n2 is None:
        n2 = expected(n1)
    first = f"{n1}\n".encode()
    if len(first) < 20:
        first = first + b"X" * (20 - len(first))
    else:
        first = first[:20]
    return first + f"{n2}\n".encode()


def check_live(n1: int) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    n2 = expected(n1)
    r = subprocess.run([str(BIN)], input=payload(n1, n2), capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "CORRECT" in out
    print(f"n1={n1} n2={n2} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--n1", type=int, default=DEFAULT_N1)
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        return check_live(args.n1)
    n2 = expected(args.n1)
    if args.quiet:
        print(n2)
    else:
        print(f"n1={args.n1} → n2={n2}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
