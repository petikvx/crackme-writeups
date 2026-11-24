#!/usr/bin/env python3
"""karity-crackme-A : 29 octets, 4 CRC32 (init 0, sans xorout) sur fenetres.
Usage: karity-solve.py [-q] [--check]   (--check : lance le binaire via wine)"""
import sys, subprocess, os
import z3

POLY = 0xEDB88320
CHECKS = [(0, 16, 0xAA2406EA), (6, 16, 0xAB8140DE), (13, 16, 0xE347258E), (0, 29, 0x1093CFEB)]

def crc(data):
    c = 0
    for b in data:
        c ^= b
        for _ in range(8):
            c = (c >> 1) ^ (POLY if c & 1 else 0)
    return c

def zcrc(bs):
    c = z3.BitVecVal(0, 32)
    for b in bs:
        c = c ^ z3.ZeroExt(24, b)
        for _ in range(8):
            c = z3.If(c & 1 == 1, z3.LShR(c, 1) ^ POLY, z3.LShR(c, 1))
    return c

def solve():
    s = z3.Solver()
    bs = [z3.BitVec(f"b{i}", 8) for i in range(29)]
    for b in bs:
        s.add(z3.UGE(b, 0x21), z3.ULE(b, 0x7E))
    for off, ln, v in CHECKS:
        s.add(zcrc(bs[off:off + ln]) == v)
    assert s.check() == z3.sat
    m = s.model()
    return bytes(m[b].as_long() for b in bs)

def ok(d):
    return len(d) == 29 and all(crc(d[o:o + l]) == v for o, l, v in CHECKS)

if __name__ == "__main__":
    pw = solve()
    assert ok(pw)
    if "-q" in sys.argv:
        print(pw.decode())
    else:
        print("serial:", pw.decode())
    if "--check" in sys.argv:
        exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "karity-crackme-A.exe")
        r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=pw + b"\n", capture_output=True, timeout=120)
        print(r.stdout.decode(errors="replace"))
