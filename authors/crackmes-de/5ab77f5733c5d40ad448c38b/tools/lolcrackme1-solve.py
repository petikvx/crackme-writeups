#!/usr/bin/env python3
"""lolcrackme1 (jim) — solveur : séquence de boutons à presser.

Modèle (VB6 natif) :
  - 5 boutons {a/1, b/2, c/3, d/4, e/5} : si Len(s) impair -> ajoute la lettre, sinon le chiffre
  - Check : transforme s par paires hex : out = Chr(Val("&h" & Mid(s,i,2))), i=1,3,5…
    puis compare à la constante "*" & Chr(30) & "\\" (octets 2A 1E 5C)
Usage : lolcrackme1-solve.py [-q] [--check]
"""
import argparse

TARGET = b"*\x1e\\"          # constante 0x401e28 (UTF-16 : 2A 00 1E 00 5C 00)
BUTTONS = {c: i for i, c in enumerate("abcde")}   # lettre -> index bouton (1 = "a/1")
BTN_OF = {**{c: c for c in "abcde"}, **{str(i + 1): "abcde"[i] for i in range(5)}}

def press(s, btn):
    """Handler d'un bouton : parité de Len(s) -> lettre ou chiffre."""
    return s + (btn if len(s) % 2 else str("abcde".index(btn) + 1))

def transform(s):
    return bytes(int(s[i:i + 2], 16) for i in range(0, len(s) - 1, 2))

def solve():
    hexs = TARGET.hex()                      # "2a1e5c"
    seq, s = [], ""
    for ch in hexs:
        btn = BTN_OF[ch]
        s = press(s, btn)
        assert s[-1] == ch, "parité incompatible"
        seq.append(btn)
    return hexs, seq

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    hexs, seq = solve()
    if a.check:
        s = ""
        for b in seq: s = press(s, b)
        assert transform(s) == TARGET and s == hexs
    if a.q:
        print(" ".join(str("abcde".index(b) + 1) for b in seq))
    else:
        print("Chaîne interne :", hexs)
        print("Boutons à presser dans l'ordre (libellé 'x/N') :", " ".join(f"{b}/{'abcde'.index(b)+1}" for b in seq))
        print("Soit (n° de bouton) :", " ".join(str("abcde".index(b) + 1) for b in seq))
