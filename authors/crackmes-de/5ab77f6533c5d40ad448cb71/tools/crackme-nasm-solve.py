#!/usr/bin/env python3
"""Solveur — crackmes.de CrackMe_ASM / crackme_nasm (rezk2ll)

Construit en clair dans le BSS : « S3CrE+Fl4G! ».
Le check ne compare en pratique que le 1er dword (« S3Cr »),
mais le password intentionnel est la chaîne complète.

Usage:
  python3 crackme-nasm-solve.py -q
  python3 crackme-nasm-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "CrackMe_ASM"
PASSWORD = "S3CrE+Fl4G!"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        # sys_exit laisse ebx=1 → code retour 1 même en succès
        proc = subprocess.run(
            [str(BIN)],
            input=(PASSWORD + "\n").encode(),
            capture_output=True,
            timeout=2,
        )
        text = proc.stdout.decode(errors="replace")
        ok = "correct" in text
        print(text.strip().splitlines()[-1] if text.strip() else text)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(PASSWORD)
        return 0
    print("=== CrackMe_ASM ===")
    print(f"password : {PASSWORD}")
    print("note     : cmp dword only → any string starting with S3Cr also passes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
