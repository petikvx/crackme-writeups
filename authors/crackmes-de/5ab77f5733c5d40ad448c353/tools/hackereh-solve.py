#!/usr/bin/env python3
"""Keygen pour hackereh@.exe (KeygenMe by hackereh@, crackmes.de).

serial = %u du dernier `eax` de la boucle (voir README.md).
Usage : hackereh-solve.py [--name petik] [-q] [--check]
"""
import argparse, sys

M = 0xFFFFFFFF


def serial(name: str) -> str:
    b = name.encode("latin-1")
    if not 1 <= len(b) <= 24:
        raise ValueError("nom : 1 à 24 caractères")
    edx = 0xDEADC0DE
    eax = 0
    for c in b:
        c = c - 256 if c > 127 else c            # movsx
        eax = ((c + edx) & M) * 0x666 & M        # add + imul
        edx = (edx + eax) & M                    # add edx,eax
        eax = (eax - 0x777) & M                  # sub eax,0x777
    return str(eax)                              # wsprintfA("%u")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true", help="auto-test vecteurs connus")
    a = ap.parse_args()
    if a.check:
        ok = serial("petik") == "2636335687" and serial("a") == "3418517923"
        print("OK" if ok else "KO"); sys.exit(not ok)
    s = serial(a.name)
    print(s if a.q else f"name={a.name!r} serial={s}")
