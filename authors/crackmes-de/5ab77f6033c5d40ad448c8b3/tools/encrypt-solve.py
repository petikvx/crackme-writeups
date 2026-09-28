#!/usr/bin/env python3
"""Déchiffrement rascal999 (FreeBASIC, MT19937).

Mots de passe par défaut : 756384985 et 999345234.
``-q`` n'écrit que les deux entiers. ``--check`` re-chiffre le clair et
compare au fichier ``original/crackme``.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

N = 624
M = 397
A = 0x9908B0DF
UPPER = 0x80000000
LOWER = 0x7FFFFFFF


class FBRnd:
    def __init__(self, seed: int):
        self.mt = [0] * N
        self.mt[0] = seed & 0xFFFFFFFF
        for i in range(1, N):
            self.mt[i] = (1664525 * self.mt[i - 1] + 1013904223) & 0xFFFFFFFF
        self.idx = N

    def _twist(self) -> None:
        mag = (0, A)
        mt = self.mt
        for i in range(N - M):
            y = (mt[i] & UPPER) | (mt[i + 1] & LOWER)
            mt[i] = (mt[i + M] ^ (y >> 1) ^ mag[y & 1]) & 0xFFFFFFFF
        for i in range(N - M, N - 1):
            y = (mt[i] & UPPER) | (mt[i + 1] & LOWER)
            mt[i] = (mt[i - (N - M)] ^ (y >> 1) ^ mag[y & 1]) & 0xFFFFFFFF
        y = (mt[N - 1] & UPPER) | (mt[0] & LOWER)
        mt[N - 1] = (mt[M - 1] ^ (y >> 1) ^ mag[mt[0] & 1]) & 0xFFFFFFFF
        self.idx = 0

    def next_u32(self) -> int:
        if self.idx >= N:
            self._twist()
        y = self.mt[self.idx]
        self.idx += 1
        y ^= y >> 11
        y ^= (y << 7) & 0x9D2C5680
        y ^= (y << 15) & 0xEFC60000
        y ^= y >> 18
        return y & 0xFFFFFFFF


def round_even(num: int) -> int:
    neg = num < 0
    mag = -num if neg else num
    q, r = divmod(mag, 1 << 32)
    if r < 0x80000000:
        out = q
    elif r > 0x80000000:
        out = q + 1
    else:
        out = q + (q & 1)
    return -out if neg else out


def fist_add(c: int, y: int) -> int:
    return round_even((c << 32) + y * 10)


def fist_sub(c: int, y: int) -> int:
    return round_even((c << 32) - y * 10)


def decrypt(data: bytes, p1: int, p2: int) -> bytes:
    r2 = FBRnd(p2)
    mid = bytes(fist_add(b, r2.next_u32()) & 0xFF for b in data)
    r1 = FBRnd(p1)
    return bytes(fist_sub(b, r1.next_u32()) & 0xFF for b in mid)


P1 = 756384985
P2 = 999345234


def encrypt(data: bytes, p1: int, p2: int) -> bytes:
    r1 = FBRnd(p1)
    mid = bytes(fist_add(b, r1.next_u32()) & 0xFF for b in data)
    r2 = FBRnd(p2)
    return bytes(fist_sub(b, r2.next_u32()) & 0xFF for b in mid)


def main() -> None:
    ap = argparse.ArgumentParser(description="rascal999 encrypt")
    ap.add_argument("--p1", type=int, default=P1)
    ap.add_argument("--p2", type=int, default=P2)
    ap.add_argument("-q", action="store_true", help="n'afficher que les deux entiers")
    ap.add_argument("--check", action="store_true", help="re-chiffrer et comparer au fichier")
    args = ap.parse_args()
    blob = (Path(__file__).resolve().parent.parent / "original" / "crackme").read_bytes()
    out = decrypt(blob, args.p1, args.p2)
    if args.check:
        if encrypt(out, args.p1, args.p2) != blob or not out.startswith(b"Congratulations"):
            print("echec", file=sys.stderr)
            sys.exit(1)
        print("ok")
        return
    if args.q:
        print(args.p1, args.p2)
        return
    sys.stdout.buffer.write(out + b"\n")


if __name__ == "__main__":
    main()
