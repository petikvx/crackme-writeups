#!/usr/bin/env python3
"""latch (0xg_m3) : inverse 4 rondes (xor clé -> sbox -> permutation de bits) + xor final.

Usage : latch-solve.py [-q] [--check] [binaire]
Les tables (cibles, clés, sbox, perm) sont lues dans .rodata du binaire (offset fichier == VMA).
"""
import struct, subprocess, sys, os, argparse

N = 46
here = os.path.dirname(os.path.abspath(__file__))
ap = argparse.ArgumentParser()
ap.add_argument("binary", nargs="?", default=os.path.join(here, "..", "original", "latch"))
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true", help="lance le binaire d'origine sur le flag")
a = ap.parse_args()
d = open(a.binary, "rb").read()

target = d[0x2040:0x2040 + N]
keys = [d[0x2070 + N * i:0x2070 + N * (i + 1)] for i in range(4)]
sbox = d[0x2160:0x2260]
perm = struct.unpack("<368H", d[0x2260:0x2260 + 736])
final = struct.pack("<QQQQQ", 0xb889b94491e7cf7a, 0x27348fe81140efa1,
                    0x34c0ba823b04d08e, 0x448679276a0e5f59, 0x8628d9fcd7fe59d8) \
        + bytes([0xd4, 0x1d, 0x05, 0x56, 0x08, 0x84])
inv_sbox = [0] * 256
for i, v in enumerate(sbox):
    inv_sbox[v] = i

def bit(b, i): return (b[i >> 3] >> (i & 7)) & 1

s = bytes(x ^ y for x, y in zip(target, final))
for r in (3, 2, 1, 0):
    # out bit i = in bit perm[i]  -> inverse
    t = bytearray(N)
    for i in range(368):
        if bit(s, i):
            t[perm[i] >> 3] |= 1 << (perm[i] & 7)
    s = bytes(x ^ y for x, y in zip((inv_sbox[c] for c in t), keys[r]))

flag = s.decode()
print(flag if a.q else f"flag = {flag}")
if a.check:
    out = subprocess.run(["bash", "-c", 'cp "$1" /tmp/latch_chk && chmod +x /tmp/latch_chk && /tmp/latch_chk', "_", a.binary],
                         input=flag + "\n", capture_output=True, text=True).stdout
    print("binaire :", out.strip())
    sys.exit(0 if out.startswith("Correct") else 1)
