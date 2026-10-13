#!/usr/bin/env python3
"""Keygen « mishka_tribute » (KeyGenMe v1 by zart, crackmes.de).

Le nom saisi est reconstruit par std::string::append(i, c) : le i-ème
caractère tapé est ajouté i fois (le 1er 0 fois). Puis hash sur 32 bits :
    a = 0 ; m = 0x43BA
    pour chaque octet c (signé) : a = a*m + c ; m = m*0x6E6FA
Le serial est ce hash écrit en décimal (parse a = a*10 + (c-'0') mod 2^32).

Usage : mishka_tribute-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse


def expand(name: str) -> bytes:
    return b"".join(bytes([c]) * i for i, c in enumerate(name.encode("latin-1")))


def keygen(name: str) -> int:
    a, m = 0, 0x43BA
    for c in expand(name):
        cv = c - 256 if c > 127 else c          # movsx
        a = (a * m + cv) & 0xFFFFFFFF            # imul eax,edi ; add eax,ecx
        m = (m * 0x6E6FA) & 0xFFFFFFFF           # imul edi,edi,0x6e6fa
    return a


def parse_serial(s: str) -> int:
    v = 0
    for ch in s:                                 # lea ebx,[ecx+eax*2-0x30]
        v = (v * 10 + ord(ch) - 0x30) & 0xFFFFFFFF
    return v


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    if len(a.name) < 1:
        ap.error("nom vide refusé par le binaire")
    s = keygen(a.name)
    if a.check is not None:
        ok = parse_serial(a.check) == s
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    if a.q:
        print(s)
    else:
        print(f"name   : {a.name}")
        print(f"buffer : {expand(a.name).decode('latin-1')!r}")
        print(f"serial : {s}")


if __name__ == "__main__":
    main()
