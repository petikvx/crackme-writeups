#!/usr/bin/env python3
"""Solveur CrackMe#1 by br0ken (id 5ab77f5333c5d40ad448c100).

Stage 1 — mot de passe :
    La cible est la chaîne "QbTTx1sE" (@ .rdata 0x403000). Le programme
    incrémente chaque caractère saisi de +1 puis strcmp avec la cible, donc
    le mot de passe = cible[i] - 1  ==>  "PaSSw0rD".

Stage 2 — keygen (Name 2..10 chars -> Serial entier) :
    acc = somme(ord(c) for c in Name) - len(Name) - 1   (la boucle parcourt
    aussi l'octet nul final, d'où le -1 supplémentaire). Le serial saisi (%d)
    doit égaler acc.
"""
from __future__ import annotations

import argparse

PASSWORD = "PaSSw0rD"


def serial(name: str) -> int:
    return sum(ord(c) for c in name) - len(name) - 1


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("name", nargs="?", default="petik")
    p.add_argument("-q", action="store_true")
    args = p.parse_args()
    s = serial(args.name)
    if args.q:
        print(s)
        return 0
    print(f"Stage 1 — password : {PASSWORD}")
    print(f"Stage 2 — name {args.name!r} -> serial {s}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
