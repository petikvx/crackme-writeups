#!/usr/bin/env python3
"""soulreaper Death Trap — serial 16 chars (Java hash + ROL hash)."""
from __future__ import annotations

import argparse
import subprocess
import sys
from itertools import product
from pathlib import Path

TARGET1 = 0x67C91E15  # 1741233685
TARGET2 = 0x0C5B6C81
SEED2 = 0xDEADBEEF
SUB = 0x61C88647
DEFAULT_SERIAL = "mLE1AAHrQU3xAhAV"
CHARSET = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"

BIN = Path(__file__).resolve().parents[1] / "original" / "sysupdate"


def rol32(x: int, n: int) -> int:
    x &= 0xFFFFFFFF
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def java_hash(bs: bytes) -> int:
    h = 0
    for b in bs:
        h = (31 * h + b) & 0xFFFFFFFF
    return h


def step(edx: int, b: int) -> int:
    eax = rol32(edx ^ b, 5)
    eax = (eax - SUB) & 0xFFFFFFFF
    return (eax ^ (eax >> 16)) & 0xFFFFFFFF


def hash2(bs: bytes) -> int:
    edx = SEED2
    for b in bs:
        edx = step(edx, b)
    return edx


def inv_xor_shr16(y: int) -> int:
    a = (y >> 16) & 0xFFFF
    b = (y & 0xFFFF) ^ a
    return ((a << 16) | b) & 0xFFFFFFFF


def inv_step(out: int, b: int) -> int:
    eax = inv_xor_shr16(out)
    t = (eax + SUB) & 0xFFFFFFFF
    ror = ((t >> 5) | (t << 27)) & 0xFFFFFFFF
    return ror ^ b


def mitm_java(charset: bytes = CHARSET) -> bytes:
    pow4 = pow(31, 4, 0x100000000)
    inv = pow(pow4, -1, 0x100000000)
    fwd: dict[int, bytes] = {}
    for pref in product(charset, repeat=4):
        h = 0
        for b in pref:
            h = (31 * h + b) & 0xFFFFFFFF
        fwd[h] = bytes(pref)
    for suf in product(charset, repeat=4):
        hs = 0
        for b in suf:
            hs = (31 * hs + b) & 0xFFFFFFFF
        need = ((TARGET1 - hs) * inv) & 0xFFFFFFFF
        if need in fwd:
            return fwd[need] + bytes(suf)
    raise RuntimeError("part1 not found")


def mitm_rol(charset: bytes = CHARSET) -> bytes:
    fwd: dict[int, bytes] = {}
    for pref in product(charset, repeat=4):
        st = SEED2
        for b in pref:
            st = step(st, b)
        fwd[st] = bytes(pref)
    for suf in product(charset, repeat=4):
        st = TARGET2
        for b in reversed(suf):
            st = inv_step(st, b)
        if st in fwd:
            return fwd[st] + bytes(suf)
    raise RuntimeError("part2 not found")


def solve(charset: bytes = CHARSET) -> str:
    return (mitm_java(charset) + mitm_rol(charset)).decode()


def check(serial: str) -> bool:
    p = subprocess.run(
        [str(BIN)],
        input=serial + "\n",
        capture_output=True,
        text=True,
        timeout=5,
    )
    out = p.stdout + p.stderr
    return "Valid serial" in out


def main() -> int:
    ap = argparse.ArgumentParser(description="Death Trap serial keygen")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--solve", action="store_true", help="MITM (lent ~30s)")
    ap.add_argument("--check", nargs="?", const=DEFAULT_SERIAL, help="preuve live")
    args = ap.parse_args()

    serial = DEFAULT_SERIAL
    if args.solve:
        serial = solve()

    if args.q:
        print(serial)
        return 0

    if args.check is not None:
        serial = args.check
        ok = check(serial)
        print(f"serial={serial}")
        print("Valid serial" if ok else "Invalid serial")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    print(serial)
    print(f"java[0:8]={java_hash(serial[:8].encode()):#x} target={TARGET1:#x}")
    print(f"rol [8:16]={hash2(serial[8:16].encode()):#x} target={TARGET2:#x}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
