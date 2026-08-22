#!/usr/bin/env python3
"""Solveur — crackmes.de easy_crackme_2 (lord)

ELF32 NASM : ciphertext « QTBXCTU » XOR 0x21 → « pucybut ».

Usage:
  python3 easy-crackme-2-solve.py -q
  python3 easy-crackme-2-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "cm1eng"
CIPHER = "QTBXCTU"
PASSWORD = "".join(chr(ord(c) ^ 0x21) for c in CIPHER)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=(PASSWORD + "\n").encode(),
            capture_output=True,
            timeout=2,
        )
        text = proc.stdout.decode(errors="replace")
        ok = "Great" in text
        print([ln for ln in text.splitlines() if ln.strip()][-1])
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(PASSWORD)
        return 0
    print(f"password : {PASSWORD}  (XOR 0x21 of {CIPHER!r})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
