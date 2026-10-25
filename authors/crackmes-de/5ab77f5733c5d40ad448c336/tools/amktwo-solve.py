#!/usr/bin/env python3
"""Keygen amkTwo (am0k) : produit amkTwo.key (ligne 1 = nom, ligne 2 = serial 32 car.).

  python3 tools/amktwo-solve.py                 # nom par défaut : petik
  python3 tools/amktwo-solve.py -q --name petik -o amkTwo.key
  python3 tools/amktwo-solve.py --check         # vérifie l'involution + vecteur petik
Le .key doit être posé à côté de amkTwo.exe (même nom, extension .key), sans
retour à la ligne final (sinon fgets ne lève pas EOF -> boucle infinie / longueur KO).
"""
import argparse, sys

HEX = "0123456789ABCDEF"


def f_swap(s):  # sub_401000 : swap de parité lettres / chiffres
    o = []
    for ch in s:
        c = ord(ch)
        odd = c & 1
        if 0x61 <= c <= 0x7a or 0x41 <= c <= 0x5a:
            c = c + 1 if odd else c - 1
        elif 0x30 <= c <= 0x39:
            c = c - 1 if odd else c + 1
        o.append(chr(c))
    return "".join(o)


def f_rot(s):  # sub_401060 : ROT13 + ROT5 sur chiffres
    o = []
    for ch in s:
        c = ord(ch)
        if 0x61 <= c <= 0x6d or 0x41 <= c <= 0x4d:
            c += 13
        elif 0x6e <= c <= 0x7a or 0x4e <= c <= 0x5a:
            c -= 13
        elif 0x30 <= c <= 0x34:
            c += 5
        elif 0x35 <= c <= 0x39:
            c -= 5
        o.append(chr(c))
    return "".join(o)


def T(s):
    return f_rot(f_swap(s))


def gen(name):
    """sub_4010c0 : 32 chars hex, avec re-transformation à chaque tour de nom.
    `name` est la ligne 1 du fichier telle que lue par fgets (avec '\\n')."""
    L = len(name)
    out, j, k = [], 0, 0
    for i in range(32):
        v = (ord(name[j]) + k + i + 1)
        v = abs(v) % 16
        out.append(HEX[v])
        j += 1
        if j > L - 1:
            k += 1
            j = 0
            out = list(T("".join(out)))
    return T("".join(out))  # transformation finale (après out[32]=0)


def serial_for(name):
    target = gen(name + "\n")        # le '\n' de fgets fait partie du nom hashé
    return f_swap(f_rot(target))      # T est composée d'involutions : T^-1(x)=swap(rot(x))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-o", "--out", default="amkTwo.key")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serial_for(a.name)
    assert T(s) == gen(a.name + "\n")
    if a.check:
        print(a.name, s)
        return 0
    with open(a.out, "w", newline="") as f:
        f.write(a.name + "\r\n" + s)  # pas de saut de ligne final
    print(s if a.q else f"name={a.name!r} serial={s}  -> {a.out}")


if __name__ == "__main__":
    sys.exit(main())
