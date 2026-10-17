#!/usr/bin/env python3
"""kawaii-flesh — Simple crackme : key = "bd4c217637bc828982c090b2de41b84d".

main() definit 3 chaines qui ressemblent toutes a des hash MD5 (32 chars) :
    v5 = "ag7`124504a`;1;:;1`3:3a1gf72a;7g"   (XOR 3 -> la VRAIE cle)
    v6 = "1381d5357780928686957ce0bb9c1eaa"    (deja hexadecimal, jamais utilisee -> leurre)
    v7 = ";7;:2;1a:;1``gfa3a25a11`47307g4g"   (jamais utilisee -> leurre, meme forme que v5)

Seul v5 est decode (XOR chaque octet par 3, sub_1179) et compare a la saisie.

Usage : simplecrackme-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
ENCODED = "ag7`124504a`;1;:;1`3:3a1gf72a;7g"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    key = "".join(chr(ord(c) ^ 3) for c in ENCODED)
    if a.q:
        print(key)
        return 0
    print(f"key = {key!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(key), run("wrong")
        good = "good job!" in ok and "try again!" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
