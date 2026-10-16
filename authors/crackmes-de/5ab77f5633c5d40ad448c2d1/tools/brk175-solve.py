#!/usr/bin/env python3
"""Solveur — BuLLeT CRaCKMe V1.75 (VB5 p-code, TOL'98).

Command1_Click compare Text1.Text à la BSTR littérale « 2hard4u2crackm8 »
(pool de chaînes du handler, juste avant « BuL_LeT@hotmail.com » et
« Nope. That's not the one! »). Mot de passe constant, pas de nom.

usage : tools/brk175-solve.py
        tools/brk175-solve.py --check MOTDEPASSE
"""
from __future__ import annotations

import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "BRK175.EXE"
PASSWORD = "2hard4u2crackm8"


def extract_from_binary() -> str:
    data = EXE.read_bytes()
    needle = PASSWORD.encode("utf-16le")
    if needle not in data:
        raise SystemExit(f"password UTF-16LE introuvable dans {EXE}")
    # Confirm it sits in the Command1_Click string pool
    idx = data.find(needle)
    window = data[max(0, idx - 80) : idx + 120]
    if b"Command1_Click" not in data[max(0, idx - 200) : idx]:
        # still OK if nearby in same pool
        pass
    if "Nope".encode("utf-16le") not in data[idx : idx + 200]:
        raise SystemExit("pool Command1_Click inattendu (Nope manquant après password)")
    return PASSWORD


def main() -> int:
    pwd = extract_from_binary()
    if len(sys.argv) == 3 and sys.argv[1] == "--check":
        ok = sys.argv[2] == pwd
        print("OK" if ok else "Nope. That's not the one!")
        return 0 if ok else 1
    print(pwd)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
