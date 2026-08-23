#!/usr/bin/env python3
"""QERR0R crackit — flag = join(parts).

  ./crackit-solve.py -q
  ./crackit-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PARTS = ("CTF{", "My_", "S3c", "r3t_", "Fl4g", "}WoW", "You", "Found", "Me")
FLAG = "".join(PARTS)
BIN = Path(__file__).resolve().parents[1] / "original" / "crackit"


def check() -> bool:
    BIN.chmod(BIN.stat().st_mode | 0o111)
    out = subprocess.check_output([str(BIN), FLAG], text=True, timeout=30)
    return "You cracked me!" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    print(FLAG if args.q else f"flag = {FLAG}")
    if args.check:
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
