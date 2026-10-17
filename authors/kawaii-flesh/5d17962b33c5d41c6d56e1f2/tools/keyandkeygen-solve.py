#!/usr/bin/env python3
"""kawaii-flesh — Key and keygen : keygen generique pour tout nom.

encr(name) :
    n = len(name) ; s = sum(ord(c) for c in name)
    for i in 0..8:
        c = (unsigned char)(s // (n+i))      # division non signee
        key[i] = c
        s += trunc_div(s, (signed char)c)    # division signee tronquee vers 0
    # key = 9 caracteres

Exemple (user de reference petik) : petik -> "l[NE?951."

Usage : keyandkeygen-solve.py [-q] [--name petik] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keygenme"


def to_u8(x: int) -> int:
    return x & 0xFF


def to_i8(x: int) -> int:
    x &= 0xFF
    return x - 256 if x >= 128 else x


def c_trunc_div(a: int, b: int) -> int:
    q = abs(a) // abs(b)
    return -q if (a < 0) != (b < 0) else q


def encr(name: str) -> str:
    n = len(name)
    s = sum(ord(c) for c in name)
    out = bytearray()
    for i in range(9):
        c = to_u8(s // (n + i))
        out.append(c)
        s += c_trunc_div(s, to_i8(c))
    return out.decode(errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    key = encr(a.name)
    if a.q:
        print(key)
        return 0
    print(f"name={a.name!r} -> key={key!r}")
    if a.check:
        run = lambda n, k: subprocess.run([str(EXE)], input=f"{n}\n{k}\n", capture_output=True, text=True).stdout
        ok, ko = run(a.name, key), run(a.name, "wrong")
        good = "Good job!" in ok and "Wrong key" in ko
        print("OK:", ok.strip().splitlines()[-2:], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
