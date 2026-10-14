#!/usr/bin/env python3
"""kylix_crackme (warleyalex) — id 5ab77f5e33c5d40ad448c728. ELF32 Borland Kylix (CLX), strippé, 531 Ko.

Gestionnaire du bouton OK @0x80a1be8 :
    t  = Edit1.Text
    p  = Decode(0x80a1cc0)          # sub @0x80a1b14 : chaque octet de la chaîne Pascal ^ 0xff
    si LStrCmp(t, p) == 0 : ShowMessage(Decode(0x80a1cd4)) = "Good"  sinon Decode(0x80a1ce4) = "Bad"
Chaînes Pascal longues (refcnt, len, données) en .rodata : ff ff ff ff 0a 00 00 00 | 88 9e 8d 93 9a 86 9e 93 9a 87 ...

  kylix-solve.py [-q] [--check]       (pas de test GUI : libs Kylix absentes ; preuve statique)
"""
import argparse, struct, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "crackme"
BASE = 0x8048000


def pstr(d, va):
    o = va - BASE
    n = struct.unpack_from("<I", d, o - 4)[0]
    return bytes(c ^ 0xFF for c in d[o:o + n])


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = BIN.read_bytes()
    pw, good, bad = (pstr(d, v) for v in (0x80A1CC0, 0x80A1CD4, 0x80A1CE4))
    print(pw.decode() if a.q else f"password : {pw.decode()}   (Good={good.decode()!r}, Bad={bad.decode()!r})")
    if a.check:
        ok = pw == b"warleyalex" and good == b"Good" and bad == b"Bad"
        print("check:", "OK" if ok else "KO", "(décodage XOR 0xff des 3 chaînes Pascal ; preuve statique)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
