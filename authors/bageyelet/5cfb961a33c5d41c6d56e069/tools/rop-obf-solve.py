#!/usr/bin/env python3
"""Solveur — bageyelet rop-obf

ELF32 PIE asm : programme entier en ROP-chain (gadgets + salto conditionnels).
6× `scanf("%d")` ; pour i∈[0..5] exige
  input[i] ^ vars[i] == vars[i+6]
avec vars init = [0x83,0x36,0x9d,0xcd,0xec,0xf6, 0x87,0x3e,0x92,0xdd,0xfb,0xdc].
→ password « 4 8 15 16 23 42 » (imprime « 1 »).

Usage:
  python3 rop-obf-solve.py -q
  python3 rop-obf-solve.py --check
  printf '%s\\n' \"$(python3 rop-obf-solve.py -q)\" | ./original/rop-obf
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "rop-obf"

VARS = [0x83, 0x36, 0x9D, 0xCD, 0xEC, 0xF6, 0x87, 0x3E, 0x92, 0xDD, 0xFB, 0xDC]
PASSWORD_NUMS = [VARS[i] ^ VARS[i + 6] for i in range(6)]
PASSWORD = " ".join(str(n) for n in PASSWORD_NUMS)  # 4 8 15 16 23 42


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        out = subprocess.check_output([str(BIN)], input=(PASSWORD + "\n").encode())
        text = out.decode(errors="replace").strip()
        print(text)
        ok = text == "1"
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(PASSWORD)
        return 0
    print("=== bageyelet rop-obf ===")
    print(f"password : {PASSWORD}")
    print(f"nums     : {PASSWORD_NUMS}")
    print("check    : input[i] ^ V[i] == V[i+6]  (i=0..5)")
    print(f"verify   : printf '%s\\n' '{PASSWORD}' | ./original/rop-obf")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
