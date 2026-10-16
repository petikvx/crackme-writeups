#!/usr/bin/env python3
"""howosec — Password And Flag in C (senha-e-flag-C-2) : decode statique.

Les deux blobs (0x93 et 0x9d octets) sont ceux construits sur la pile par
getPass @0x152b et getFlag @0x12c9. Format d'un blob :
    [ 128 octets de "sel" ][ données XORées ]
    key8 = djb2(sel) en 64 bits LE  (8 octets)
    rrxor(data, key8) : out[i] = data[i] ^ key[(i+1)%8] ; key[(i+2)%8] = key[i%8]

Usage : senha-solve.py [-q] [--check]
"""
import argparse
import struct
import subprocess
import sys
from pathlib import Path

PASS_BLOB = bytes.fromhex(
    "a89c281ab1b8d3e4619e9fb453d30751040e5d998edf1e9830867b2b9525b23d"
    "c1da5873922b57f3c9f7a81ccaaf6ecebdcb684caa86e4da0c5f06a184b8df45"
    "9337b8256210192b07c148d170b6a02e81087a2c8e5e069abd0c3c41c51b8658"
    "523f7db44f96df56572727c8ddc7f65fcf708b5dce91f88b9e34cc634f52bba1"
    "a882b58fba81b483bad6e9d4efd2edd0e3deeb"
)
FLAG_BLOB = bytes.fromhex(
    "09c665ad4e4a54a6fe438cb3761afaacc9653f062064b39bd690b1607373d87c"
    "393d2988877e2e85c1ba3937d433e49e9823a4b98757545ee706be5a7997d6b3"
    "d4003b5c7e69e13f241a76f84d5a96e67e3a9f0591f36379f922d373b9aa268d"
    "aa61e928cacb67eee5dde733387d19b6b8b8bb49ab1fc2a5419618fa403e87ea"
    "ea7bf57bd966e762e766f17dec738f758f77ed79f278e76c8f6ced66df"
)


def djb2(data: bytes) -> int:
    h = 5381
    for b in data:
        h = (h * 33 + b) & 0xFFFFFFFFFFFFFFFF
    return h


def rrxor(data: bytes, key: bytes) -> bytes:
    k = bytearray(key)
    out = bytearray()
    n = len(k)
    for i, c in enumerate(data):
        out.append(c ^ k[(i + 1) % n])
        k[(i + 2) % n] = k[i % n]
    return bytes(out)


def xor_decode(blob: bytes) -> str:
    key = struct.pack("<Q", djb2(blob[:0x80]))
    return rrxor(blob[0x80:], key).decode()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    pw, flag = xor_decode(PASS_BLOB), xor_decode(FLAG_BLOB)
    if a.q:
        print(pw)
        return 0
    print(f"password = {pw}\nflag     = {flag}")
    if a.check:
        exe = Path(__file__).resolve().parent.parent / "original" / "senha-e-flag-C-2"
        r = subprocess.run([str(exe)], input=pw + "\n", capture_output=True, text=True)
        ok = flag in r.stdout
        print("check:", "OK" if ok else "KO", "-", r.stdout.strip())
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
