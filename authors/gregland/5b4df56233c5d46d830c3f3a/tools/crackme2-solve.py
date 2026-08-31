#!/usr/bin/env python3
"""gregland CrackMe 2 — password from VDS predicate.

Script (heap dump):
  _G @_L(@_I(EDIT1), @_¤(sdfg)45@_¤(erz)dqf, EXACT)

@_¤ = @UPPER (protect token 0xA4). Literals stay as-is.
→ UPPER(sdfg) + "45" + UPPER(erz) + "dqf" = SDFG45ERZdqf

Validate with button caption OK 6 (control name=ok → :okbutton).
"""
from __future__ import annotations

import argparse
import sys

PASSWORD = "SDFG45ERZdqf"
BUTTON = "OK 6"


def expected() -> str:
    return f"{'sdfg'.upper()}45{'erz'.upper()}dqf"


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="gregland CrackMe 2 solver")
    p.add_argument("-q", action="store_true", help="password only")
    p.add_argument("--check", metavar="PW", help="verify a password")
    args = p.parse_args(argv)

    pw = expected()
    assert pw == PASSWORD

    if args.check is not None:
        ok = args.check == pw
        if args.q:
            print("OK" if ok else "NOK")
        else:
            print(f"{'OK' if ok else 'NOK'} (expected {pw!r}, button {BUTTON})")
        return 0 if ok else 1

    if args.q:
        print(pw)
    else:
        print(f"password : {pw}")
        print(f"button   : {BUTTON}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
