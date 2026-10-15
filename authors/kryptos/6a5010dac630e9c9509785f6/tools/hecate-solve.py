#!/usr/bin/env python3
"""Hecate (Kryptos) -- keygen name -> serial.

main() lit un nom (>3 caracteres sinon "Access denied"), le passe en
MAJUSCULES, calcule un hash FNV-1a 32 bits sur le nom majuscule, puis derive
un serial "%04X-%04X-%04X" a partir de ce hash et de la LONGUEUR du nom
(avant mise en majuscules) :

    A    = fnv1a_32(NOM_MAJUSCULE)
    L    = len(nom)                      # note : avant toupper
    mul  = (0x1234 * L) & 0xFFFF
    xorv = A ^ mul                       # 32 bits
    tmp  = (A >> 11) + 3*xorv
    f1   = xorv & 0xFFFF
    f2   = tmp  & 0xFFFF
    f3   = ((tmp ^ xorv) & 0xFFFF) ^ 0xC0DE
    serial = f"{f1:04X}-{f2:04X}-{f3:04X}"

Usage : hecate-solve.py [name] [-q] [--check BINAIRE]
"""
import argparse
import subprocess


def fnv1a32(data: bytes) -> int:
    h = 0x811C9DC5  # -2128831035 en int32 signe == 2166136261 unsigned
    for b in data:
        h = (0x01000193 * (b ^ h)) & 0xFFFFFFFF
    return h


def serial_for(name: str) -> str:
    A = fnv1a32(name.encode())
    L = len(name) & 0xFFFF
    mul = (0x1234 * L) & 0xFFFF
    xorv = A ^ mul
    tmp = (A >> 11) + 3 * xorv
    f1 = xorv & 0xFFFF
    f2 = tmp & 0xFFFF
    f3 = ((tmp ^ xorv) & 0xFFFF) ^ 0xC0DE
    return f"{f1:04X}-{f2:04X}-{f3:04X}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    serial = serial_for(a.name)
    if a.check:
        r = subprocess.run([a.check], input=f"{a.name}\n{serial}\n", capture_output=True, text=True)
        print(serial if a.q else f"name={a.name}\nserial={serial}")
        print(r.stdout.strip().splitlines()[-1])
        return
    print(serial if a.q else f"name={a.name}\nserial={serial}")


if __name__ == "__main__":
    main()
