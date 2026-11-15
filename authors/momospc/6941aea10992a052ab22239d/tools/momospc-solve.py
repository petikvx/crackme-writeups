#!/usr/bin/env python3
"""momospc MyCrackme : keygen du mot de passe (somme y() == 0x539).

Pas de user : un mot de passe libre. Défaut = plus court mot de passe
imprimable (sans espace) dont le score vaut 1337, minimum lexicographique.

  momospc-solve.py            -> affiche le mot de passe
  momospc-solve.py -q         -> mot de passe seul
  momospc-solve.py --score petik   -> score y() d'une chaîne
  momospc-solve.py --check ./original/MyCrackme   -> lance le binaire
"""
import argparse, subprocess, sys

TARGET = 0x539
CHARS = range(0x21, 0x7F)


def x(v):
    t = 3 * v + 7
    t = int(t / 2) if t >= 0 else -((-t) // 2)  # idiv signé par 2 (trunc)
    return 5 * t - 11


def y(s):
    return sum(x(ord(c) + i) for i, c in enumerate(s)) & 0xFFFFFFFF


def solve(maxlen=64):
    # BFS par position (x dépend de i) sur les sommes partielles <= TARGET
    # (x(v) > 0 pour tout char imprimable : la somme est croissante)
    layers = [{0: ""}]
    for i in range(maxlen):
        nxt = {}
        for s, pw in layers[-1].items():
            for c in CHARS:
                ns = s + x(c + i)
                if ns > TARGET:
                    continue
                if ns not in nxt:  # c croissant -> lexico min
                    nxt[ns] = pw + chr(c)
        if TARGET in nxt:
            return nxt[TARGET]
        layers.append(nxt)
    raise SystemExit("pas de solution")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--score")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    if a.score is not None:
        print(y(a.score)); return
    pw = solve()
    assert y(pw) == TARGET
    if a.check:
        for cand, want in ((pw, b"access granted"), ("petik", b"nope")):
            out = subprocess.run([a.check], input=cand + "\n", capture_output=True, text=True).stdout.encode()
            ok = want in out
            print(f"{cand!r}: {out!r} {'OK' if ok else 'KO'}")
            if not ok: sys.exit(1)
        return
    print(pw if a.q else f"password = {pw}  (y = {y(pw)} = {TARGET:#x})")


main()
