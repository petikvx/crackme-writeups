#!/usr/bin/env python3
"""Solveur s4r prime : out[i] = (0x81^c mod 0xfb) ^ key[i % len(key)], comparé en hex."""
KEY = b"Th4t's a P455W0rD"
TARGET = bytes.fromhex("113e5c6eac71358d3a4727639f55f02457565ae57662a2a2727610d84646")

def enc(c):
    r = 1
    for _ in range(c):
        r = (0x81 * r) % 0xfb
    return r

def solve():
    out = ""
    for i, t in enumerate(TARGET):
        want = t ^ KEY[i % len(KEY)]
        cands = [c for c in range(0x20, 0x7f) if enc(c) == want]
        assert cands, (i, want)
        out += chr(cands[0])
    return out

if __name__ == "__main__":
    print(solve())
