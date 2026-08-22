#!/usr/bin/env python3
"""Solveur — crackmes.de dll_disaster (issogoo)

Ce n’est **pas** un keygen offline classique : au clic Check le PE
  1. sauve GetTickCount() @ 0x403282
  2. LoadLibraryA("inject_here.dll") puis FreeLibrary  ← point d’injection
  3. [0x403282] += 0xCAFFEE
  4. formate ce DWORD en 8 hex **majuscules** dans 0x40304A
  5. memcmp avec le champ serial (longueur 8)

Solution autorisée : fournir `inject_here.dll` à côté de l’exe (sans patcher
exe/magic.dll). La DLL lue le tick et affiche le serial (MessageBox).

Usage:
  python3 dll-disaster-solve.py -q --tick 0x12345678
  python3 dll-disaster-solve.py --check --tick 0
  # live : cp tools/inject_here.dll original/ && wine original/dll_disaster.exe
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADD = 0xCAFFEE


def serial_from_tick(tick: int) -> str:
    return f"{(tick + ADD) & 0xFFFFFFFF:08X}"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="imprime seulement le serial")
    ap.add_argument("--check", action="store_true", help="vérifie format / round-trip")
    ap.add_argument("--tick", type=lambda s: int(s, 0), default=0, help="valeur GetTickCount (avant +CAFFEE)")
    args = ap.parse_args()

    ser = serial_from_tick(args.tick)
    if args.check:
        ok = len(ser) == 8 and ser == ser.upper() and all(c in "0123456789ABCDEF" for c in ser)
        print("OK" if ok else "FAIL", ser)
        return 0 if ok else 1
    if args.q:
        print(ser)
        return 0
    print(f"tick=0x{args.tick:08X}  + 0xCAFFEE → serial={ser}")
    print("Place tools/inject_here.dll next to dll_disaster.exe, run, Check → MessageBox.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
