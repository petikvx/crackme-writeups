#!/usr/bin/env python3
"""Solveur — Teknikclel69's silly

ELF32 NASM : trole() mute « chinese baguette\\n » → « chicken baguette\\n »,
puis cmpsb 0x11 octets.

Usage:
  python3 silly-solve.py -q
  python3 silly-solve.py --check 'chicken baguette'
"""
from __future__ import annotations
import argparse

PASSWORD = "chicken baguette"  # + \\n lu par sys_read(0x11)


def decode_lmao() -> str:
    s = bytearray(b"chinese baguette\n")
    s[3], s[4], s[5], s[6] = 0x63, 0x6B, 0x65, 0x6E  # cken
    return s[:-1].decode("ascii")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()
    pw = decode_lmao()
    if args.check is not None:
        ok = args.check == pw
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
        return 0
    print("=== silly ===")
    print(f"password : {pw}")
    print("note     : compare inclut '\\n' (read 17 octets)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
