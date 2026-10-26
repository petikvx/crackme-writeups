#!/usr/bin/env python3
"""Solveur gc_crackme_9 (gandalf) — Delphi, UPX.

Pas de nom d'utilisateur : un seul champ « serial ».
Prédicat : len(texte) == 5, n = StrToInt(texte), et les chiffres base 3
(poids faible d'abord) de n doivent être un préfixe de TARGET.

Usage : gc-crackme9-solve.py [-q] [--all] [--check]
"""
import argparse

TARGET = [2, 0, 2, 0, 1, 2, 2, 1, 0, 2]   # octets écrits en 0x427a88 (index 0..9)

def check(text):
    """Réplique exacte de 0x427b48 / 0x427ab8 (n < 3 : d[0] jamais écrit -> KO)."""
    if len(text) != 5:
        return False
    try:
        n = int(text)
    except ValueError:
        return False
    if n < 3:
        return False
    d = []
    while n >= 3:
        d.append(n % 3); n //= 3
        if n < 3:
            d.append(n)
    return d == TARGET[:len(d)]

def solutions():
    out = []
    for k in range(1, 11):
        if TARGET[k - 1] == 0:
            continue                      # chiffre de tête nul = même n que k-1
        n = sum(t * 3 ** i for i, t in enumerate(TARGET[:k]))
        s = f"{n:05d}"
        if len(s) == 5 and check(s):
            out.append(s)
    return out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", action="store_true")
    o = ap.parse_args()
    sols = solutions()
    if o.check:
        # validés en live (Wine) : 00020 00101 00587 02045 04232 43598 OK, 00021 KO
        assert sols == ["00020", "00101", "00587", "02045", "04232", "43598"], sols
        assert not check("00021") and not check("1234")
        print("OK")
    elif o.all:
        print(*sols)
    else:
        print("43598" if o.q else "Serial : 43598  (autres : " + " ".join(s for s in sols if s != "43598") + ")")
