#!/usr/bin/env python3
"""Keygen NewKeygenME (bikers80, VB.NET).

serial = 6*f(Environ("UserName")) + round(f(NAME.upper()) / 3)
f(s): Chr(Asc(s[i])+i) (i=1..) -> reverse -> hex de chaque octet (majuscules)
      -> retire A..F -> garde les 10 premiers chiffres.
Le serial dépend aussi du nom d'utilisateur Windows (par défaut : petik).

Usage: new-keygenme-solve.py [--name petik] [--winuser petik] [-q]
"""
import argparse


def f(s: str) -> int:
    if not s:
        return 0
    t = bytes((c + i) & 0xFF for i, c in enumerate(s.encode("cp1252"), 1))
    h = "".join("%X" % b for b in t[::-1])
    h = "".join(ch for ch in h if ch not in "ABCDEF")
    return int(h[:10])


def keygen(name: str, winuser: str) -> int:
    num2 = f(name.upper())
    q, r = divmod(num2, 3)  # Math.Round banker's: r/3 n'est jamais .5
    q += 1 if r == 2 else 0
    return f(winuser) * 6 + q


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--winuser", default="petik", help="Environ('UserName') de la machine cible")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = keygen(a.name, a.winuser)
    print(s if a.q else f"name={a.name} winuser={a.winuser} serial={s}")
