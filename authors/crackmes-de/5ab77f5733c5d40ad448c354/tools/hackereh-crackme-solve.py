#!/usr/bin/env python3
"""Solveur pour crackme_by_hackereh (hackereh@.exe, crackmes.de).

Serial = 6 caractères c[i] tels que c[i] & MASKS[i] == 0 (check à 0x401194).
Plusieurs serials valides : on affiche le premier (ou tous avec --all).
Usage : hackereh-crackme-solve.py [-q] [--all] [--check]
"""
import argparse, itertools, sys

# masques du binaire (movsx + and) ; le dernier octet 0x5fc5 -> 0xc5 + exigence c < 0x80
MASKS = [0xAD, 0x9A, 0x97, 0xBF, 0x5FC5, 0xD6]


def ok(s: str) -> bool:
    b = s.encode("latin-1")
    if len(b) != 6:
        return False
    for c, m in zip(b, MASKS):
        c = c - 256 if c > 127 else c        # movsx
        if (c & m) & 0xFFFFFFFF:
            return False
    return True


def candidates():
    """Positions : caractères ASCII imprimables (0x20..0x7e) compatibles avec le masque."""
    return [[chr(c) for c in range(0x20, 0x7F) if not (c & m)] for m in MASKS]


def serials():
    return ("".join(t) for t in itertools.product(*candidates()))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        good = ok("Reh@0)") and not ok("Reh@0") and not ok("AAAAAA")
        print("OK" if good else "KO"); sys.exit(not good)
    if a.all:
        for s in serials(): print(s)
    else:
        s = "Reh@0)"
        assert ok(s)
        print(s if a.q else f"serial={s}  ({sum(map(len, candidates()[:1]))} choix pos0, "
              f"{len(list(serials()))} serials imprimables au total)")
