#!/usr/bin/env python3
"""Keygen guys_first_crackme (Guy, C++/CLI mixed-mode).

Le serial = getserial(nom), fonction native VA 0x402410, appliquée octet par octet :
  c = (c ^ 0x33) << 1 (sur 8 bits) ; c ^= 0x89 ; si c == 0 -> 'a'
  tant que (signed char)c < 'A' : c <<= 1
  tant que (signed char)c > 'z' : c >>= 1   (sar)
  si c < 'A' ou c > 'z' -> '1'
puis strcmp(getserial(nom), serial) == 0.
"""
import argparse, sys

def sb(x):
    x &= 0xFF
    return x - 256 if x > 127 else x

def getserial(name: str) -> str:
    out = []
    for ch in name.encode("latin-1"):
        c = sb(ch ^ 0x33); c = sb(c << 1); c = sb(c ^ 0x89)
        if c == 0:
            c = 0x61
        n = 0
        while c < 0x41:
            c = sb(c << 1); n += 1
            if n > 16:
                raise ValueError(f"caractère {chr(ch)!r} : boucle infinie dans le binaire (c devient 0)")
        while c > 0x7A:
            c >>= 1
        if c > 0x7A or c < 0x41:
            c = 0x31
        out.append(c & 0xFF)
    return bytes(out).decode("latin-1")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    s = getserial(a.name)
    if a.check is not None:
        ok = a.check == s
        print("OK" if ok else f"KO (attendu {s})"); sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name!r} serial={s}")

if __name__ == "__main__":
    main()
