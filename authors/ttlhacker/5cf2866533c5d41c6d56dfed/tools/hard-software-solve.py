#!/usr/bin/env python3
"""Mot de passe de hard_software (ttlhacker).

Chaque caractère c vérifie Step^{y+1}(x ^ c) == x ^ z sur un LFSR 12 bits.
x, y, z sont les constantes chargées par init aux indices 0x2b2, 0x2d2, 0x2f2.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "hard_software"

# Trois tables de 32 valeurs, lues par le programme de la VM.
X = [2027, 3833, 1366, 2033, 1558, 1662, 3043, 1030, 3035, 3310, 44, 707, 3449, 2955, 59, 45, 1179, 3893, 1097, 1306, 3371, 315, 1255, 638, 1761, 820, 885, 3456, 2259, 2596, 3001, 352]
Y = [177, 653, 519, 380, 680, 157, 482, 444, 424, 556, 263, 103, 278, 327, 301, 126, 680, 642, 225, 291, 604, 667, 520, 522, 162, 232, 357, 397, 594, 529, 557, 361]
Z = [283, 2959, 184, 2385, 2518, 2766, 4073, 1309, 137, 3073, 115, 2998, 3997, 1656, 2515, 1333, 2179, 3571, 731, 470, 1467, 2157, 723, 2819, 1679, 1659, 975, 2991, 3283, 449, 734, 3034]


def inv_step(bits: list[int]) -> list[int]:
    """Inverse d'un pas du LFSR. bits[0] est le poids fort."""
    new_bit = bits[11] ^ bits[5] ^ bits[3] ^ bits[0]
    return [new_bit] + bits[:-1]


def password() -> str:
    out = []
    for x, y, z in zip(X, Y, Z):
        bits = [int(b) for b in f"{x ^ z:012b}"]
        for _ in range(y + 1):
            bits = inv_step(bits)
        value = int("".join(str(b) for b in bits), 2)
        out.append(chr(value ^ x))
    return "".join(out)


def main() -> None:
    ap = argparse.ArgumentParser(description="hard_software password")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = password()
    if len(pw) != 32:
        raise SystemExit(f"longueur {len(pw)}")
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=(pw + "\n").encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if b"Correct!" not in proc.stdout:
            sys.stdout.buffer.write(proc.stdout)
            raise SystemExit(1)
        bad = subprocess.run(
            [str(BIN)],
            input=b"petik\n",
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if b"Correct!" in bad.stdout or b"Wrong, try again!" not in bad.stdout:
            raise SystemExit("le mot de passe faux n'est pas rejeté")
        print("ok")
        return
    print(pw)


if __name__ == "__main__":
    main()
