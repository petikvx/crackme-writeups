#!/usr/bin/env python3
"""Teknikclel69 hell — argv gate + two-phase char password.

Run:  hell.exe c
Then type one character per line (15 lines):

  Phase1 (.data walk): l i c r f t s d
  Phase2 (BSS movq):   e b a v f q r

Verified under x64dbg (argc==2, cmdline … hell.exe\" c, expected bytes at scan sites).
"""
from __future__ import annotations

import argparse
import sys

ARG = "c"
PHASE1 = "licrftsd"
PHASE2 = "ebavfqr"
PASSWORD_LINES = PHASE1 + PHASE2  # 15 chars
SUCCESS = "You did the thing no way!!!"


def lines() -> list[str]:
    return list(PASSWORD_LINES)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password chars as one string")
    ap.add_argument("--check", action="store_true", help="print how to verify live")
    ap.add_argument("--lines", action="store_true", help="one char per line (for piping)")
    args = ap.parse_args()

    assert len(PASSWORD_LINES) == 15
    if args.check:
        print(f"argv: hell.exe {ARG}")
        print(f"stdin ({len(PASSWORD_LINES)} lines):")
        print("\n".join(lines()))
        print()
        print("x64dbg: InitDebug hell.exe, \"c\" → BP you_win@main+0x1844")
        print(f"expect: {SUCCESS}")
        print("OK")
        return 0
    if args.lines:
        print("\n".join(lines()))
    elif args.q:
        print(PASSWORD_LINES)
    else:
        print(f"hell.exe {ARG}")
        print(f"password sequence: {' '.join(lines())}")
        print(f"concat: {PASSWORD_LINES}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
