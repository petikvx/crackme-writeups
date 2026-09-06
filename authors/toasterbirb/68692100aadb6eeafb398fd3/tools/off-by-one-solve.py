#!/usr/bin/env python3
"""Solveur — toasterbirb off_by_one

ELF64 NASM static, CFG via table d’adresses +1 (r12).

Prédicat (8 tours) :
  secret = 8 premiers octets de la string d’échec « The given… » @ 0x401069
  pass[i] = (secret[i] % 0x40) + ord('0')
  → DXUPWYfU

Usage:
  python3 off-by-one-solve.py -q
  python3 off-by-one-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "off-by-one"
# first 8 bytes of fail string embedded in .text
SECRET = b"The give"
DEFAULT = bytes((b % 0x40) + 0x30 for b in SECRET).decode("ascii")


def keygen() -> str:
    return DEFAULT


def check_live(pw: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    r = subprocess.run([str(BIN)], input=pw.encode(), capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "Yes!" in out or "correct passphrase" in out
    print(f"{pw!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT, metavar="PW")
    args = ap.parse_args()
    if args.check is not None:
        return check_live(args.check)
    pw = keygen()
    print(pw if args.quiet else f"{pw}  # (secret[i]%64)+0x30, secret='The give'")
    return 0


if __name__ == "__main__":
    sys.exit(main())
