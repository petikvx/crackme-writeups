#!/usr/bin/env python3
"""Solveur — oguzbey Lucky Numbers

2 digits on stderr (fd 2). ADC + DAA → AL==0x16, second digit ASCII '8'.
Solution: « 88 ».

Usage:
  python3 lucky-numbers-solve.py -q
  printf '88' | ./original/lucky_numbers 2<&0
"""
from __future__ import annotations
import argparse

PASSWORD = "88"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()
    if args.check is not None:
        print("OK" if args.check == PASSWORD else "FAIL")
        return 0 if args.check == PASSWORD else 1
    if args.q:
        print(PASSWORD)
        return 0
    print("=== Lucky Numbers ===")
    print(f"input : {PASSWORD}  (2 digits, via stderr)")
    print("check : ADC+DAA → 0x16 and second digit == '8'")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
