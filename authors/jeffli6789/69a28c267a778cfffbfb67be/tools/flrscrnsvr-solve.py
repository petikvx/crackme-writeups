#!/usr/bin/env python3
"""FLRSCRNSVR.SCR (jeffli6789 / crackmes.one RE CTF 2026) — inverse de la transformation 0x140001300.

Flux binaire : Text(25 wchar) -> substitution (table -> table inversée)
               -> xor[i] ^= (i + KEY[i % 9]) & 0xffff -> reverse -> comparé à EXPECTED (0x1400064d0).
Ici on inverse : reverse, xor, substitution inverse.
"""
import argparse, sys

EXPECTED = [0x3c,0x51,0x6a,0x09,0x02,0x07,0x25,0x03,0x30,0x08,0x04,0x29,0x68,
            0x24,0x01,0x24,0x18,0x6b,0x77,0x0f,0x70,0x36,0x02,0x0e,0x0b]
TBL = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOP" "QRSTUVWXYZ0123456789}_{=-")
REV = ("-={_}9876543210ZYXWVUTSRQPONMLKJIHGF" "EDCBAzyxwvutsrqponmlkjihgfedcba")
KEY = "FLARERALF"


def forward(s: str) -> list[int]:
    v = [ord(REV[TBL.index(c)]) if c in TBL else ord(c) for c in s]
    v = [(x ^ ((i + ord(KEY[i % len(KEY)])) & 0xffff)) for i, x in enumerate(v)]
    return v[::-1]


def solve() -> str:
    t = EXPECTED[::-1]
    x = [c ^ ((i + ord(KEY[i % len(KEY)])) & 0xffff) for i, c in enumerate(t)]
    return "".join(TBL[REV.index(chr(c))] if chr(c) in REV else chr(c) for c in x)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="flag seul")
    ap.add_argument("--check", action="store_true", help="re-applique la transformation et compare")
    a = ap.parse_args()
    flag = solve()
    if a.check:
        ok = forward(flag) == EXPECTED
        print("check:", "OK" if ok else "KO")
        if not ok: sys.exit(1)
    print(flag if a.q else f"flag = {flag}")


if __name__ == "__main__":
    main()
