#!/usr/bin/env python3
"""Solveur — toasterbirb branchless-fixed

DLC / fix de [branchless](../../68692748aadb6eeafb398fe3/) :
  bug : idiv rax  →  fix : idiv rcx  (vrai modulo pour is_prime)

Même prédicat utilisateur :
  L=strlen, S=Σord ; OK ⇔ L et S ∈ Fibonacci ∩ Premiers
Exemple : 5$ (L=2, S=89)

Usage:
  python3 branchless-fixed-solve.py -q
  python3 branchless-fixed-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "branchless"
DEFAULT = "5$"


def fib_from_2(limit: int = 10**6) -> list[int]:
    out, a, b = [], 1, 1
    while True:
        a, b = a + b, a
        if a > limit:
            break
        out.append(a)
    return out


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


def is_valid(pw: str) -> bool:
    L, S = len(pw), sum(map(ord, pw))
    good = {f for f in fib_from_2(max(S, L) + 10) if is_prime(f)}
    return L in good and S in good


def check_live(pw: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    r = subprocess.run([str(BIN), pw], capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "correct!" in out
    print(f"{pw!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT, metavar="PW")
    ap.add_argument("password", nargs="?")
    args = ap.parse_args()
    if args.check is not None:
        return check_live(args.check)
    if args.password is not None:
        ok = is_valid(args.password)
        print(args.password if args.quiet and ok else ("" if args.quiet else f"{args.password!r} valid={ok}"))
        return 0 if ok else 1
    print(DEFAULT if args.quiet else f"{DEFAULT}  # len=2, sum=89 ∈ fib∩prime")
    return 0


if __name__ == "__main__":
    sys.exit(main())
