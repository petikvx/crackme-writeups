#!/usr/bin/env python3
"""Keygen — Fatih's S-BOX / sbox_lab.exe (PE64).

S-Box runtime : identité 0..255, Fisher-Yates avec xorshift32 seed 0x12345678.
Pour i in 0..11 :
  out[i] = sbox[ key[i] ^ (0xA5 + i) ]
Doit égaler la cible LE :
  FF 68 31 7C 90 57 29 97 D9 83 BE 68

Inverse : key[i] = inv_sbox[target[i]] ^ (0xA5 + i)  → NOKTOSLABKEY

Usage :
  python3 sbox-solve.py -q
  python3 sbox-solve.py --check NOKTOSLABKEY
"""

from __future__ import annotations

import argparse
import sys

SEED = 0x12345678
BASE = 0xA5
TARGET = bytes([0xFF, 0x68, 0x31, 0x7C, 0x90, 0x57, 0x29, 0x97, 0xD9, 0x83, 0xBE, 0x68])


def xstep(s: int) -> int:
    s &= 0xFFFFFFFF
    s ^= (s << 13) & 0xFFFFFFFF
    s ^= s >> 17
    s ^= (s << 5) & 0xFFFFFFFF
    return s & 0xFFFFFFFF


def build_sbox() -> list[int]:
    tab = list(range(256))
    rng = SEED
    for i in range(255, 0, -1):
        j = rng % (i + 1)
        tab[i], tab[j] = tab[j], tab[i]
        rng = xstep(rng)
    return tab


def derive() -> str:
    tab = build_sbox()
    inv = [0] * 256
    for i, v in enumerate(tab):
        inv[v] = i
    return bytes(inv[TARGET[i]] ^ ((BASE + i) & 0xFF) for i in range(12)).decode("ascii")


def check(key: str) -> bool:
    if len(key) != 12:
        return False
    tab = build_sbox()
    out = bytes(tab[ord(key[i]) ^ ((BASE + i) & 0xFF)] for i in range(12))
    return out == TARGET


PASSWORD = derive()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="key only")
    ap.add_argument("--check", metavar="KEY", help="verify license key")
    args = ap.parse_args()

    if args.check is not None:
        ok = check(args.check)
        print("OK" if args.q else f"check={'OK' if ok else 'FAIL'} expected={PASSWORD!r}")
        return 0 if ok else 1

    if args.q:
        print(PASSWORD)
    else:
        print(f"license_key={PASSWORD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
