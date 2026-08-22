#!/usr/bin/env python3
"""Solveur — crackmes.de staple (chtis)

Password 13 chars [0-9a-z] : « bruceschneier ».
CRC custom (poly 0xedb88320, init 0x3c817a05) → clé XOR 0xcdc40493
déchiffre le blob → secret ZIP « 62f6sHpFshNh844rTh ».

Usage:
  python3 staple-solve.py -q
  python3 staple-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "staple"
PASSWORD = "bruceschneier"
SECRET = "62f6sHpFshNh844rTh"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--secret", action="store_true", help="code ZIP seul")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.secret:
        print(SECRET)
        return 0
    if args.check:
        out = subprocess.run(
            [str(BIN)],
            input=(PASSWORD + "\n").encode(),
            capture_output=True,
            timeout=5,
        ).stdout.decode(errors="replace")
        ok = "correct password" in out and SECRET in out
        print(out.strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(PASSWORD)
        return 0
    print("=== staple ===")
    print(f"password : {PASSWORD}")
    print(f"secret   : {SECRET}  (sourcecode.zip)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
