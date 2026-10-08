#!/usr/bin/env python3
"""Solveur — NimaNikjoo's nightmare CrackMe

Mini-VM (sub_1402E4460) + SHA-256 (opcode 12) :

    x = ROL64((0xA5A5A5A5A5A5A5A5 ^ 0x5A5A5A5A5A5A5A5A) + 0xC0DEC0DEC0DEC0DE, 13)
    h = LE64(SHA256(password || LE64(x))[:8])
    y = ROL64((h ^ 0x1337133713371337) + 0xDEADBEEF, 19)
    y == 0xE00CF2F3BFC67B27

password = G0_VM_15_H4RD_4S_H3LL_2026!
flag     = CTF{G0_VM_15_H4RD_4S_H3LL_2026!}   (imprimé tel quel)

Usage:
  python tools/nightmare-solve.py
  python tools/nightmare-solve.py -q
  python tools/nightmare-solve.py --check
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "nightmare.exe"

PASSWORD = "G0_VM_15_H4RD_4S_H3LL_2026!"
FLAG = "CTF{G0_VM_15_H4RD_4S_H3LL_2026!}"

MASK = (1 << 64) - 1
TARGET = 0xE00CF2F3BFC67B27
XOR_A = 0xA5A5A5A5A5A5A5A5
XOR_B = 0x5A5A5A5A5A5A5A5A
ADD_C0DE = 0xC0DEC0DEC0DEC0DE
XOR_1337 = 0x1337133713371337
ADD_BEEF = 0xDEADBEEF


def rol64(x: int, n: int) -> int:
    n &= 63
    x &= MASK
    return ((x << n) | (x >> (64 - n))) & MASK


def ror64(x: int, n: int) -> int:
    n &= 63
    x &= MASK
    return ((x >> n) | (x << (64 - n))) & MASK


def mix_constant() -> int:
    return rol64(((XOR_A ^ XOR_B) + ADD_C0DE) & MASK, 13)


def expected_hash_prefix() -> int:
    inner = (ror64(TARGET, 19) - ADD_BEEF) & MASK
    return inner ^ XOR_1337


def check_password(password: str) -> bool:
    x = mix_constant()
    digest = hashlib.sha256(password.encode("ascii") + struct.pack("<Q", x)).digest()
    h = struct.unpack("<Q", digest[:8])[0]
    y = rol64((h ^ XOR_1337) + ADD_BEEF, 19)
    return y == TARGET


def verify_binary(blob: bytes) -> None:
    needles = [
        struct.pack("<Q", TARGET),
        struct.pack("<Q", XOR_A),
        struct.pack("<Q", XOR_B),
        struct.pack("<Q", ADD_C0DE),
        struct.pack("<Q", XOR_1337),
        struct.pack("<I", ADD_BEEF),
    ]
    missing = [n.hex() for n in needles if n not in blob]
    if missing:
        raise SystemExit(f"FAIL: immediates absents du PE: {missing}")
    if not check_password(PASSWORD):
        raise SystemExit("FAIL: prédicat SHA-256 / ROL")
    if FLAG != f"CTF{{{PASSWORD}}}":
        raise SystemExit("FAIL: flag")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    if args.check:
        verify_binary(EXE.read_bytes())
        print(PASSWORD)
        print(FLAG)
        print("OK")
        return 0

    if args.q:
        print(FLAG)
    else:
        x = mix_constant()
        h = expected_hash_prefix()
        print(f"password {PASSWORD}")
        print(f"flag     {FLAG}")
        print(f"x        {x:#018x}")
        print(f"h        {h:#018x}")
        print(f"pred     {check_password(PASSWORD)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
