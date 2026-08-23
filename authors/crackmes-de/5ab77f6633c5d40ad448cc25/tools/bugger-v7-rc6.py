#!/usr/bin/env python3
"""bugger_v.7 RC6-32/20 (custom S init) — offline decrypt helper.

Matches PE decrypt @0x403425 + schedule @0x4034B8 (Unicorn-verified).
Final sub is swapped vs Rivest: B-=S[0], D-=S[1].

  ./bugger-v7-rc6.py -k KEY
  ./bugger-v7-rc6.py -k KEY --hex
"""
from __future__ import annotations

import argparse
import struct
import sys

CT = bytes.fromhex("c59f1ee93bec2739c442e7d9f3a3aa8c")
EAX0 = 0x402099 ^ 0x243F6A88  # 0x247F4A11
Q = 0x8F3665C7


def rol(x: int, n: int) -> int:
    n &= 31
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def ror(x: int, n: int) -> int:
    n &= 31
    return ((x >> n) | (x << (32 - n))) & 0xFFFFFFFF


def schedule(key: bytes, eax0: int = EAX0, s0: int = 0) -> list[int]:
    key = key.ljust(16, b"\0")[:16]
    S = [0] * 44
    S[0] = s0 & 0xFFFFFFFF
    eax = eax0 & 0xFFFFFFFF
    for i in range(1, 44):
        eax = (eax + Q) & 0xFFFFFFFF
        S[i] = eax
    L = list(struct.unpack("<4I", key))
    A = B = i = j = 0
    for _ in range(132):
        A = S[i] = rol((S[i] + A + B) & 0xFFFFFFFF, 3)
        B = L[j] = rol((L[j] + A + B) & 0xFFFFFFFF, (A + B) & 31)
        i = (i + 1) % 44
        j = (j + 1) % 4
    return S


def decrypt_block(ct: bytes, S: list[int]) -> bytes:
    a, b, c, d = struct.unpack("<4I", ct)
    c = (c - S[43]) & 0xFFFFFFFF
    a = (a - S[42]) & 0xFFFFFFFF
    for r in range(20, 0, -1):
        a, b, c, d = d, a, b, c
        u = rol((d * (2 * d + 1)) & 0xFFFFFFFF, 5)
        t = rol((b * (2 * b + 1)) & 0xFFFFFFFF, 5)
        c = (ror((c - S[2 * r + 1]) & 0xFFFFFFFF, t) ^ u) & 0xFFFFFFFF
        a = (ror((a - S[2 * r]) & 0xFFFFFFFF, u) ^ t) & 0xFFFFFFFF
    d = (d - S[1]) & 0xFFFFFFFF
    b = (b - S[0]) & 0xFFFFFFFF  # swapped vs Rivest
    return struct.pack("<4I", a, b, c, d)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-k", "--key", default="petik", help="RC6 key (default petik)")
    ap.add_argument("--hex", action="store_true", help="print PT as hex")
    ap.add_argument("-q", action="store_true", help="quiet: PT only")
    args = ap.parse_args()
    key = args.key.encode() if isinstance(args.key, str) else args.key
    pt = decrypt_block(CT, schedule(key))
    if args.hex:
        out = pt.hex()
    else:
        out = "".join(chr(c) if 32 <= c < 127 else "." for c in pt)
    if args.q:
        print(out)
    else:
        print(f"key={args.key!r}")
        print(f"pt={out!r}")
        print(f"hex={pt.hex()}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
