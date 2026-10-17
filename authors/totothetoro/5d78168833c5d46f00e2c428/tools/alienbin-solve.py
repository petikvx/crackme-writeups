#!/usr/bin/env python3
"""totothetoro — alien_bin : mot de passe = "bd23cf3f56baa86bc".

main() copie une table de 100 pointeurs de chaines "SHA-256-like" (en fait
de simples leurres hexadecimaux, 72 octets chacune en .rodata) sur la pile,
puis extrait les 17 premiers octets d'UNE SEULE de ces chaines (celle dont
le pointeur se trouve a l'offset fixe rbp-0x2e0 dans la table copiee, soit
l'index 10 sur 100) et compare la saisie a ce prefixe via strcmp. Les 99
autres chaines ne servent a rien d'autre qu'a noyer la vraie dans la masse.

Usage : alienbin-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "alien_bin"
# chaine complete a l'index 10 de la table (lue en .rodata, offset fichier 0x3308)
FULL_STRING = "bd23cf3f56baa86bc11b3256f22ac1a573113d639833a119f02357e3fb705266"
PASSWORD = FULL_STRING[:17]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    print(f"password = {PASSWORD!r} (17 premiers octets de {FULL_STRING!r})")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(PASSWORD), run("wrong")
        good = "blip blop" in ok and "ERROR" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
