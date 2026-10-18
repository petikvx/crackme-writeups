#!/usr/bin/env python3
"""Basics::AHardcodedKeyGoneWrong — mot de passe du coffre chaînes.

La fiche 0xB9170251, lue par sub_140009DA0 après les constructeurs CRT,
est le mot de passe en clair. --check le passe à keycheck.exe sous Wine
et vérifie aussi un refus (petik).
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

KEY = "CMO{YouFoundMeWoohoo}"
ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "keycheck.exe"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-q", action="store_true", help="n'imprimer que la clé")
    parser.add_argument(
        "--check",
        action="store_true",
        help="preuve Wine : clé acceptée, petik rejeté",
    )
    args = parser.parse_args()
    if args.q:
        print(KEY)
    else:
        print(f"password: {KEY}")
    if not args.check:
        return 0
    if not EXE.is_file():
        print(f"binaire absent: {EXE}", file=sys.stderr)
        return 2
    ok = _wine(KEY + "\n")
    ko = _wine("petik\n")
    good = b"key: accepted" in ok and b"rejected" not in ok
    bad = b"key: rejected" in ko
    if not args.q:
        print("wine OK:", ok.decode("ascii", "replace").strip())
        print("wine KO:", ko.decode("ascii", "replace").strip())
    return 0 if good and bad else 1


def _wine(line: str) -> bytes:
    proc = subprocess.run(
        ["wine", str(EXE)],
        input=line.encode(),
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        timeout=60,
        check=False,
    )
    return proc.stdout


if __name__ == "__main__":
    raise SystemExit(main())
