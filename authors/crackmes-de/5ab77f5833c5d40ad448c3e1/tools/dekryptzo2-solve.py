#!/usr/bin/env python3
"""Keygen — starzboy De-KryptZo2.

Name + Key → Hash (%x) → SMC decrypt key byte ∈ {93, 221}.

Exemple (AGENTS) :
  name=petik  key=2ZUGRLbN  → hash=4c2ed685  → u made it (MessageBox)

Usage:
  python3 dekryptzo2-solve.py -q --name petik
  python3 dekryptzo2-solve.py --name petik --search
"""
from __future__ import annotations

import argparse
import random
import string
from pathlib import Path

BUF = 0x40308C
GOOD_KEYS = {93, 221}


def hash1(name: bytes, base: int = BUF) -> int:
    esi, ebx, ecx, eax, edx = len(name), 0, 0, 0, base
    ecx = (ecx + 0x3265 + 1) & 0xFFFFFFFF
    ebx = (ebx + 1) & 0xFFFFFFFF
    edx = (edx + ecx) & 0xFFFFFFFF
    ecx = (edx + ecx) & 0xFFFFFFFF
    while True:
        idx = eax + 1
        bval = name[idx] if idx < len(name) else 0
        ebx = bval
        ebx = (ebx + edx) & 0xFFFFFFFF
        ecx = (ecx + ebx) & 0xFFFFFFFF
        ecx = (ecx + ebx) & 0xFFFFFFFF
        ecx = (ecx * ebx) & 0xFFFFFFFF
        ecx = (ecx + eax) & 0xFFFFFFFF
        ecx = (ecx * eax) & 0xFFFFFFFF
        ebx = (ebx + 1) & 0xFFFFFFFF
        ebx ^= 0x41256
        ecx = (ecx << 1) & 0xFFFFFFFF
        ecx ^= 0x56C
        ebx &= 0x800000F
        ecx = (ecx + ebx) & 0xFFFFFFFF
        eax += 1
        if eax >= esi:
            break
    return ecx


def hash2(key: bytes, base: int = BUF) -> int:
    esi, ebx, ecx, eax, edx = len(key), 0, 0, 0, base
    ecx = (ecx + 0xFF85 + 1) & 0xFFFFFFFF
    ebx = (ebx + 1) & 0xFFFFFFFF
    edx = (edx + ecx) & 0xFFFFFFFF
    ecx = (edx + ecx) & 0xFFFFFFFF
    while True:
        idx = eax + 5
        bval = key[idx] if idx < len(key) else 0
        ebx = bval
        ebx = (ebx + edx) & 0xFFFFFFFF
        ecx = (ecx + ebx) & 0xFFFFFFFF
        ecx = (ecx + ebx) & 0xFFFFFFFF
        ecx = (ecx * ebx) & 0xFFFFFFFF
        ecx = (ecx - eax) & 0xFFFFFFFF
        ecx = (ecx * eax) & 0xFFFFFFFF
        ebx = (ebx + 2) & 0xFFFFFFFF
        ebx ^= 0x41256
        ecx = (ecx << 1) & 0xFFFFFFFF
        ecx |= 0x56C
        ebx &= 0x800000F
        ecx = (ecx + ebx) & 0xFFFFFFFF
        eax += 1
        if eax >= esi:
            break
    return ecx


def combine(h1: int, h2: int) -> int:
    edx, ecx = h1, h2
    e8 = (edx + ecx) & 0xFFFFFFFF
    mul = (ecx * edx) & 0xFFFFFFFF
    e8 = (e8 + (edx ^ 0x25F65)) & 0xFFFFFFFF
    e8 = (e8 + mul) & 0xFFFFFFFF
    return e8


def hash_to_keybyte(s: bytes) -> int:
    acc = 0
    bl = len(s) & 0xFF
    for ch in s:
        al = ch
        al = (al + 0x32) & 0xFF
        al = (al + 1) & 0xFF
        al ^= 0x56
        al = (al + 0x71) & 0xFF
        al = (al - 0x65) & 0xFF
        al = (al + 0x95) & 0xFF
        al = (al + 0x9C) & 0xFF
        bl = (bl << 5) & 0xFF
        al = (al + bl) & 0xFF
        acc = (acc + al + 0x91) & 0xFF
    return acc


def solve_for(name: str, key: str) -> tuple[str, int, int]:
    val = combine(hash1(name.encode()), hash2(key.encode()))
    hx = format(val, "x")
    return hx, val, hash_to_keybyte(hx.encode())


def search_key(name: str, seed: int = 1) -> str:
    rng = random.Random(seed)
    chars = string.ascii_letters + string.digits
    for _ in range(5_000_000):
        key = "".join(rng.choice(chars) for _ in range(rng.randint(4, 10)))
        hx, _, kb = solve_for(name, key)
        if len(hx) > 3 and kb in GOOD_KEYS:
            return key
    raise RuntimeError("no key found")


DEFAULT_NAME = "petik"
DEFAULT_KEY = "2ZUGRLbN"  # → 4c2ed685, keybyte 221


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default=DEFAULT_NAME)
    ap.add_argument("--key", default=DEFAULT_KEY)
    ap.add_argument("--search", action="store_true", help="search a key for --name")
    a = ap.parse_args()
    key = search_key(a.name) if a.search else a.key
    hx, val, kb = solve_for(a.name, key)
    ok = kb in GOOD_KEYS
    if a.q:
        print(f"{a.name}:{key}:{hx}")
        return 0 if ok else 1
    print("name :", a.name)
    print("key  :", key)
    print("hash :", hx, f"(0x{val:08x})")
    print("SMC  :", kb, "OK" if ok else "BAD")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
