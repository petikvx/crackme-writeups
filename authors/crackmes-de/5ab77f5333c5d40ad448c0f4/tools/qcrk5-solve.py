#!/usr/bin/env python3
"""Solveur qcrk5 by qnix (id 5ab77f5333c5d40ad448c0f4).

atoi(password), puis ((n+5+0x60)*255*0x909090) == 0x4b7f3da0 (mod 2^32).
Plus petite solution positive : 91867153.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "analysis" / "qcrk5"
PASSWORD = "91867153"


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", action="store_true")
    args = p.parse_args()
    print(PASSWORD if args.q else f"password = {PASSWORD}")
    if not args.check:
        return 0
    proc = subprocess.run([str(BIN), PASSWORD], capture_output=True)
    out = proc.stdout + proc.stderr
    if b"Correct, Cracked" not in out:
        print(out.decode(errors="replace"), file=sys.stderr)
        return 1
    if not args.q:
        print("check: OK")
        print(out.decode(errors="replace"), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
