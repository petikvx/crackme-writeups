#!/usr/bin/env python3
"""Keygen / solveur pour crackmes.de's crackme_1_1 by fr1c (C++ Builder).
Le serial est une constante dans .data (0x431445) : « F988f91 ».
Le nom n'est pas demandé (un seul TEdit).
"""
from __future__ import annotations
import argparse
import sys
from pathlib import Path

SERIAL = "F988f91"
# marqueur dans l'exe pour auto-vérifier
MARKER = b"F988f91\x00Very good!"

def extract_from_exe(path: Path) -> str | None:
    data = path.read_bytes()
    i = data.find(MARKER)
    if i < 0:
        return None
    return data[i : i + 7].decode("ascii")

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("name", nargs="?", default="petik", help="ignoré (compat)")
    ap.add_argument("--exe", type=Path, default=None)
    args = ap.parse_args()
    serial = SERIAL
    exe = args.exe
    if exe is None:
        cand = Path(__file__).resolve().parents[1] / "original" / "CrackME.exe"
        if cand.is_file():
            exe = cand
    if exe and exe.is_file():
        got = extract_from_exe(exe)
        if got:
            serial = got
    # username petik documenté même s'il n'est pas utilisé
    print(f"Name: {args.name} (non utilisé) / Serial: {serial}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
