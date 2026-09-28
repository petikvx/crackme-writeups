#!/usr/bin/env python3
"""Mots de passe de fuckalight2 (s4r) : Callisto, Titan, Ganymede.

Callisto est un test direct (longueur 10). Les deux autres sont vérifiés
en rejouant le binaire d'origine avec --check.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "fuckalight2.bin"

# Callisto : s[0] == C[0], et s[i] - 3 == C[i] pour i = 1..9.
CALLISTO_C = bytes([0x55, 0x35, 0x47, 0x57, 0x6B, 0x6D, 0x52, 0x32, 0x6B, 0x41])
CALLISTO = "U8JZnpU5nD"
TITAN = "REbtr3L65GEK"
GANYMEDE = "m173aDjELq"


def callisto_ok(pw: str) -> bool:
    if len(pw) != 10:
        return False
    raw = pw.encode()
    if raw[0] != CALLISTO_C[0]:
        return False
    return all(raw[i] - 3 == CALLISTO_C[i] for i in range(1, 10))


def main() -> None:
    ap = argparse.ArgumentParser(description="fuckalight2 passwords")
    ap.add_argument("-q", action="store_true", help="une ligne par mot de passe")
    ap.add_argument("--check", action="store_true", help="rejouer les trois lignes sur le binaire")
    args = ap.parse_args()
    if not callisto_ok(CALLISTO):
        raise SystemExit("prédicat Callisto incohérent")
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=f"{CALLISTO}\n{TITAN}\n{GANYMEDE}\n".encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        out = proc.stdout
        if b"the last keeper of the forge" not in out or b"You're free, hero." not in out:
            sys.stdout.buffer.write(out)
            raise SystemExit(1)
        print("ok")
        return
    if args.q:
        print(CALLISTO)
        print(TITAN)
        print(GANYMEDE)
        return
    print(f"Callisto : {CALLISTO}")
    print(f"Titan    : {TITAN}")
    print(f"Ganymede : {GANYMEDE}")


if __name__ == "__main__":
    main()
