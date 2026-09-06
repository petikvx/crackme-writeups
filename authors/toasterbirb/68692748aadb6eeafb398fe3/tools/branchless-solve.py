#!/usr/bin/env python3
"""Solveur — toasterbirb branchless

ELF64 NASM, section headers corrompus, CFG 100 % branchless (imul/sete/jmp).

  usage: branchless <password>

  L = strlen(password)
  S = Σ ord(password[i])
  OK ⇔ L et S ∈ Fibonacci ∩ Premiers
       (fib générés 2,3,5,8,13,… ; test primalité branchless)

Exemple : L=2, S=89 → « 5$ » (et 25 autres paires ASCII imprimables).

Usage:
  python3 branchless-solve.py -q
  python3 branchless-solve.py --check
  python3 branchless-solve.py --list
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
    out = []
    a, b = 1, 1
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


def fib_primes(limit: int = 10**6) -> list[int]:
    return [f for f in fib_from_2(limit) if is_prime(f)]


def is_valid(pw: str) -> bool:
    L = len(pw)
    S = sum(map(ord, pw))
    good = set(fib_primes(max(S, L) + 10))
    return L in good and S in good


def pairs_len2_sum89() -> list[str]:
    return [chr(a) + chr(89 - a) for a in range(0x20, 0x7F) if 0x20 <= 89 - a <= 0x7E]


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
    ap.add_argument("--list", action="store_true", help="paires L=2 S=89")
    ap.add_argument("password", nargs="?", help="vérifier prédicat seul")
    args = ap.parse_args()

    if args.list:
        for p in pairs_len2_sum89():
            print(repr(p))
        return 0
    if args.check is not None:
        return check_live(args.check)
    if args.password is not None:
        ok = is_valid(args.password)
        if args.quiet:
            print(args.password if ok else "")
        else:
            L, S = len(args.password), sum(map(ord, args.password))
            print(f"{args.password!r} L={L} S={S} valid={ok}")
        return 0 if ok else 1

    if args.quiet:
        print(DEFAULT)
    else:
        print(f"{DEFAULT}  # len=2 (fib∩prime), sum=89 (fib∩prime)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
