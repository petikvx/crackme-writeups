#!/usr/bin/env python3
"""Keygen pour keygenme1_v2.1 (haspor, crackmes.de) -- pas de nom : serial seul.

Serial XXXX-XXXX-XXXX-XXXX, alphabet 32 symboles, 5 bits/char (LSB first) -> 80 bits.
  - 64 bits "D" : bits hors masque 0x258410C103108904 = donnees libres ;
    aux 16 positions du masque (ordre croissant j=0..15) D[p_j] = bit (64+j) du serial
  - serial[p_j] = bit (15-j) de CRC16/ARC(D en 8 octets little-endian)

Usage : keygenme1-v21-solve.py [-q] [--seed N] [--check]
"""
import argparse, random, struct, sys

ALPHA = "23456789ABCDEFGHJKLMNPQRSTUWVXYZ"
MASK = 0x258410C103108904
POS = [i for i in range(64) if MASK >> i & 1]


def crc16(data):
    c = 0
    for b in data:
        c ^= b
        for _ in range(8):
            c = (c >> 1) ^ (0xA001 if c & 1 else 0)
    return c


def decode(serial):
    """Reproduit 0x4010ad..0x401424. Retourne True si serial valide."""
    if len(serial) != 19 or any(serial[i] != '-' for i in (4, 9, 14)):
        return False
    chars = serial.replace('-', '')
    if any(c not in ALPHA for c in chars):
        return False
    v = 0
    for i, c in enumerate(chars):
        v |= ALPHA.index(c) << (5 * i)
    if v == 0:
        return False
    d = 0
    chk = 0
    for k, p in enumerate(POS):
        if v >> p & 1:
            chk |= 1 << (15 - k)
        if v >> (64 + k) & 1:
            d |= 1 << p
    for i in range(64):
        if not MASK >> i & 1 and v >> i & 1:
            d |= 1 << i
    return crc16(struct.pack('<Q', d)) == chk


def keygen(rng):
    while True:
        free = rng.getrandbits(64) & ~MASK
        m = rng.getrandbits(16)
        d = free
        for k, p in enumerate(POS):
            if m >> k & 1:
                d |= 1 << p
        c = crc16(struct.pack('<Q', d))
        v = free | (m << 64)
        for k, p in enumerate(POS):
            if c >> (15 - k) & 1:
                v |= 1 << p
        chars = ''.join(ALPHA[v >> (5 * i) & 31] for i in range(16))
        s = '-'.join(chars[i:i + 4] for i in range(0, 16, 4))
        if decode(s):
            return s


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--seed', type=int, default=None)
    ap.add_argument('--check', metavar='SERIAL')
    a = ap.parse_args()
    if a.check:
        ok = decode(a.check)
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    s = keygen(random.Random(a.seed))
    print(s if a.q else f"Serial : {s}")
