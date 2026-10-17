#!/usr/bin/env python3
"""ker2x - guild hall adventure Ch.2 (adventure2) : chemin "cheat" + reponse step2.

main() :
  - si argv[1] existe et strlen(argv[1]+1) == argv[1][0]-'0' (et argv[1] !=
    "222" litteralement) : saute directement a step2() sans jouer la
    narration interactive (indice explicite du jeu : "./adventure2 2...probably").
    On choisit argv[1] = "1A" (digit '1', puis exactement 1 caractere).

step2() demande un caractere (purement cosmetique, affiche dans la question)
puis un entier, et compare a :
    v8 = (signed char)argv[1][0] + 15

Pour argv[1]="1A" : ord('1')=0x31=49 -> reponse = 64.

Sequence stdin pour step2 (4 getchar() avant le scanf, dans cet ordre) :
  1. getchar() jete ("press enter" apres l'intro)
  2. getchar() -> le caractere affiche dans "what's X + 3*5?" (cosmetique, ignore)
  3. getchar() jete (reste de la ligne)
  4. getchar() jete ("press enter" avant le clear screen)
  puis scanf("%d", reponse)

Le programme segfault volontairement a la fin dans TOUS les cas (uninitialized
function pointer appele sans condition) -- le signal de reussite est le
message "ho damn, that's right...\nWHY ?" affiche juste avant le crash final,
pas le code de sortie.

Usage : adventure2-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "adventure2-package" / "adventure2"
ARG1 = "1A"
ANSWER = ord(ARG1[0]) + 15  # 64


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que 'ARG1 ANSWER'")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(ARG1, ANSWER)
        return 0
    print(f"argv1={ARG1!r} reponse_math={ANSWER}")
    if a.check:
        stdin = f"\nY\n\n{ANSWER}\n\n\n\n\n"
        r = subprocess.run(["stdbuf", "-o0", str(EXE), ARG1], input=stdin, capture_output=True, text=True)
        good = "ho damn, that's right" in r.stdout
        print("OK:", good)
        print(r.stdout[-300:])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
