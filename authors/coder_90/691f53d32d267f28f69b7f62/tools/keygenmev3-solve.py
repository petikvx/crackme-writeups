#!/usr/bin/env python3
"""Coder_90 KeyGenMeV3 — keygen name -> serial (hex).  Exemple : petik"""
import argparse

M = 0xFFFFFFFF
rol = lambda v, n: ((v << n) | (v >> (32 - n))) & M


def serial(name: str) -> int:
    b = name.encode("latin-1")
    L = len(b)
    eax, edx = 0x55555555, 0xDEADC0DE
    for i, c in enumerate(b):
        if c & 1:
            eax = (rol(eax, 0x1D) + c + 0xE5D4C3B3) & M
        else:
            eax = ((rol(eax, 0xC) ^ c) + 0x90F01234) & M
        r9 = (edx + i) & M
        edx = ((r9 - L) & M) ^ r9
        eax ^= edx
    sq = (L * L) & M
    ecx = ((sq << 8) - sq) & M
    eax = (rol(eax, 0x1D) + edx) & M
    return eax ^ ecx


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = "%X" % serial(a.name)
    print(s if a.q else f"name={a.name!r} serial={s}")
