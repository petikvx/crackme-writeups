#!/usr/bin/env python3
"""Solveur — toasterbirb flags

ELF64 NASM static : read(8) puis 5 tours qui exigent ZF toujours set.

  Après un add qui laisse ZF=1, r10 = RFLAGS & 0xf0
  Pour i, shift in [(0,5),(1,4),(2,3),(3,2),(4,1)] :
      r10b &= (input[i] << shift)
      popf ; je continue  ⇒  bit 6 de r10 (ZF) doit rester 1
  ⇒ input[i] doit avoir le bit (6-shift) = bit (1+i) à 1

Exemple : 24800 (bits 1..5).

Usage:
  python3 flags-solve.py
  python3 flags-solve.py -q
  python3 flags-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "flags"
DEFAULT = "24800"


def is_valid(data: bytes) -> bool:
    if len(data) < 5:
        return False
    # bit (i+1) set on byte i for i=0..4
    return all((data[i] >> (i + 1)) & 1 for i in range(5))


def gen_example() -> str:
    return DEFAULT


def check_live(code: str) -> int:
    raw = code.encode()
    if len(raw) < 5:
        print("need >= 5 bytes", file=sys.stderr)
        return 1
    if not is_valid(raw):
        print(f"invalid bit pattern: {code!r}", file=sys.stderr)
        return 1
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    # pad to 8 like the read()
    payload = raw[:8].ljust(8, b"\x00")
    r = subprocess.run([str(BIN)], input=payload, capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "perfect" in out
    print(f"{code!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description="toasterbirb flags solver")
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT, metavar="CODE")
    ap.add_argument("code", nargs="?", help="verify bit pattern only")
    args = ap.parse_args()

    if args.check is not None:
        return check_live(args.check)

    if args.code is not None:
        ok = is_valid(args.code.encode())
        if args.quiet:
            print(args.code if ok else "")
        else:
            print(f"{args.code!r} valid={ok}")
        return 0 if ok else 1

    ex = gen_example()
    if args.quiet:
        print(ex)
    else:
        print(f"{ex}  # bytes with bits 1,2,3,4,5 set")
    return 0


if __name__ == "__main__":
    sys.exit(main())
