#!/usr/bin/env python3
"""ker2x — guild hall adventure Ch.1 (adventure) : ./adventure hello, puis
repondre par un prefixe exact de argv[0] a "So, why are you here ?".

main() :
  - exige argc==2 et argv[1]=="hello" (strlen==5 + strncmp)
  - demande une 2e saisie (scanf %s) et verifie strncmp(argv[0], saisie,
    strlen(saisie)) == 0 -- la saisie doit etre un PREFIXE EXACT du chemin
    utilise pour invoquer le programme (argv[0], pas une constante).

Invoque depuis ce dossier comme "./adventure", argv[0] = "./adventure".

Usage : adventure-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "adventure"
GREETING = "hello"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que 'hello ARGV0'")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire via './adventure'")
    a = ap.parse_args()
    argv0 = "./adventure"
    if a.q:
        print(GREETING, argv0)
        return 0
    print(f"argv[1]={GREETING!r}, reponse (prefixe de argv[0])={argv0!r}")
    if a.check:
        run_dir = EXE.parent
        ok = subprocess.run(["stdbuf", "-o0", "./adventure", GREETING], input=argv0 + "\n",
                             capture_output=True, text=True, cwd=run_dir).stdout
        ko = subprocess.run(["stdbuf", "-o0", "./adventure", GREETING], input="wrong\n",
                             capture_output=True, text=True, cwd=run_dir).stdout
        good = "welcome to the guild hall" in ok and "kill you now" in ko
        print("OK:", ok.strip().splitlines()[-1] if ok.strip() else "(vide)")
        print("KO:", ko.strip().splitlines()[-1] if ko.strip() else "(vide)")
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
