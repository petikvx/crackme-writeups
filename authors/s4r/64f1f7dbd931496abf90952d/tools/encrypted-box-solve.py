#!/usr/bin/env python3
"""Solveur — s4r encrypted_box (Barbhack CTF 2023)

Le binaire lit des blocs de 16 octets en série (sys_read), chacun validé
par une round AES-NI (aesdec) puis utilisé pour déchiffrer la suite du .text.
Le fichier tools/encrypted-box-password.bin contient la concaténation
de tous les blocs (16016 octets).

Flag : BRB{as_deep_as_OceanGate}

Usage:
  python3 encrypted-box-solve.py -q
  python3 encrypted-box-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "encrypted_box"
PWFILE = Path(__file__).resolve().parent / "encrypted-box-password.bin"
FLAG = "BRB{as_deep_as_OceanGate}"


def check_live() -> int:
    if not BIN.is_file() or not PWFILE.is_file():
        print("missing binary or password.bin", file=sys.stderr)
        return 1
    pw = PWFILE.read_bytes()
    r = subprocess.run([str(BIN)], input=pw, capture_output=True, timeout=10)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip().rstrip("\x00"))
    ok = FLAG in out
    print(f"{len(pw)} bytes -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="chemin du password blob")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        return check_live()
    if args.q:
        print(PWFILE)
    else:
        print(f"password blob: {PWFILE} ({PWFILE.stat().st_size} bytes)")
        print(f"flag: {FLAG}")
        print("run: python3 tools/encrypted-box-solve.py --check")
    return 0


if __name__ == "__main__":
    sys.exit(main())
