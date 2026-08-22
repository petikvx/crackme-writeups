#!/usr/bin/env python3
"""Solveur — Xeeven FindThePassword1

Password en clair « 8675309\\n ». Attention : sys_read lit sur **fd 2** (stderr).

Usage:
  python3 findthepassword1-solve.py -q
  printf '8675309\\n' | ./original/findthepassword1.bin 2<&0
"""
from __future__ import annotations
import argparse
from pathlib import Path

_BIN = Path(__file__).resolve().parents[1] / "original" / "findthepassword1.bin"
PASSWORD = "8675309"


def load() -> str:
    data = _BIN.read_bytes()
    i = data.find(b"8675309\n")
    if i >= 0:
        return "8675309"
    return PASSWORD


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()
    pw = load()
    if args.check is not None:
        print("OK" if args.check == pw else "FAIL")
        return 0 if args.check == pw else 1
    if args.q:
        print(pw)
        return 0
    print("=== FindThePassword1 ===")
    print(f"password : {pw}")
    print("run      : printf '%s\\n' | ./original/findthepassword1.bin 2<&0" % pw)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
