#!/usr/bin/env python3
"""Keygen crackme_8 by fr1c (crackmes.de, MFC/VC++6, UPX 1.02).

Reproduit OnOK (0x4018f0 dans l'exe dépaqueté) :
  len  = strlen(name)            (>= 4)
  sum  = somme des octets du nom (movsx -> signés)
  x    = ((sum + len) ^ len) >> 1
  x    = x - (len-2) - 25000 + len + 4 - (len-2) + len + 2 - 50000
  x    = (rol32(x,1) >> 2) - 50000000 + (sum - 0x41)
  serial = "%d" % int32(x) + "Q_W" + "65"
"""
import sys

M = 0xFFFFFFFF


def s8(b):
    return b - 256 if b >= 128 else b


def keygen(name: str) -> str:
    raw = name.encode("latin-1")
    n = len(raw)
    if n < 4:
        raise ValueError("Name must have at least 4 chars!")
    s = sum(s8(b) for b in raw) & M
    x = (((s + n) & M) ^ n) >> 1
    x = (x - (n - 2)) & M
    x = (x - 0x61A8) & M
    x = (x + n + 4) & M
    x = (x - (n - 2)) & M
    x = (x + n + 2) & M
    x = (x - 0xC350) & M
    x = ((((x << 1) | (x >> 31)) & M) >> 2)
    x = (x - 0x2FAF080) & M
    x = (x + s - 0x41) & M
    if x & 0x80000000:
        x -= 1 << 32
    return "%dQ_W65" % x


if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} -> {keygen(name)}")
