#!/usr/bin/env python3
"""Solveur — vetementsvmnts's a bit of a challenge

name (5–32, printable ASCII) → sigil 24 hex.
Mix maison : FNV-1a + 2 accumulateurs ROL, puis avalanche Murmur-like.

Usage:
  python3 tools/sigil-challenge-solve.py -q
  python3 tools/sigil-challenge-solve.py --name petik --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "hard_crackme"


def u32(x: int) -> int:
    return x & 0xFFFFFFFF


def rol32(x: int, n: int) -> int:
    x = u32(x)
    n &= 31
    return u32((x << n) | (x >> (32 - n)))


def sigil_for(name: str) -> str:
    # inits (signed immediates du binaire)
    h = u32(-2128831035)  # 0x811C9DC5 FNV-1a offset
    a = u32(-1640531527)  # 0x9E3779B9
    b = u32(-873292572)  # 0xCBF29CE4
    idx = 0
    pos = 1  # 1-based multiplier in the loop
    for ch in name.encode("latin-1"):
        prod = u32(pos * ch)
        pos += 1
        h = u32(16777619 * (ch ^ h))  # FNV prime 0x01000193
        b = rol32(b + prod, 7)
        # LOBYTE(prod) = idx  → shift amount = idx & 0xF
        shift = idx & 0xF
        idx = u32(idx + 3)
        a = rol32(a ^ u32(ch << shift), 13)

    m1 = 2146121005  # 0x7FEB352D
    m2 = u32(-2073254261)  # 0x846CA68B

    def avalanche(x: int, other: int, xor_k: int = 0) -> int:
        t = u32(x ^ other ^ xor_k)
        t = u32(m1 * (t ^ (t >> 16)))
        t = u32(m2 * ((t >> 15) ^ t))
        return u32((t >> 16) ^ t)

    # première jambe : other = DEADBEEF « dans » x via xor avant mix
    t = u32(h ^ 0xDEADBEEF)
    t = u32(m1 * (t ^ (t >> 16)))
    t = u32(m2 * ((t >> 15) ^ t))
    w0 = u32((t >> 16) ^ t)

    w1 = avalanche(w0, b)
    w2 = avalanche(w1, a, 0xCAFEBABE)
    return f"{u32(w2 ^ w0):08x}{u32(w2 ^ w0 ^ w1):08x}{w2:08x}"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="petik")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if not (5 <= len(args.name) <= 32):
        print("name length must be 5..32", file=sys.stderr)
        return 2
    if any(ord(c) < 32 or ord(c) > 126 for c in args.name):
        print("name must be printable ASCII", file=sys.stderr)
        return 2
    sig = sigil_for(args.name)
    if args.check:
        r = subprocess.run(
            [str(BIN)],
            input=f"{args.name}\n{sig}\n",
            capture_output=True,
            text=True,
            timeout=5,
        )
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "the pact is sealed" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(sig)
    else:
        print(f"{args.name} → {sig}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
