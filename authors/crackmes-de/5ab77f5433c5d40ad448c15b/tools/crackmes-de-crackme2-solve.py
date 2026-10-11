#!/usr/bin/env python3
"""Keygen pour « crackme2 by cyclops » (crackmes.de, DOS Borland C++)."""
import sys

def serial(name: str) -> int:
    v = [ord(c.lower()) & 0x7F for c in name]
    n = len(v)
    for i in range(n):
        if n % 2 == 0:
            v[i] += i if i % 2 == 0 else i >> 1
        else:
            v[i] += (i >> 1) + 10 if i % 2 == 0 else i + 5
    s = sum(x * 0x8E for x in v) & 0xFFFFFFFF
    return s - (1 << 32) if s & 0x80000000 else s

if __name__ == "__main__":
    for name in sys.argv[1:] or ["petik"]:
        print(f"{name} -> {serial(name)}")
