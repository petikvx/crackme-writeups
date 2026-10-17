#!/usr/bin/env python3
"""cbm-hackers — jumpjumpjump (rev03) : magic string = "}}}}}}}}" (8x '}').

main() lit une ligne (fgets, buffer 100 octets), exige strlen <= 11, somme
des octets (signed char) == 1000 (0x3e8). Avec exactement 1000 reparti sur
8 octets identiques : 1000/8 = 125 = chr('}'). ATTENTION : fgets inclut le
'\\n' final dans la chaine -> ne PAS envoyer de saut de ligne (sinon la
somme et la longueur changent), ou compenser son octet (10) dans la somme.

Le flag affiche est une CONSTANTE (jamais derivee de l'entree) : la
fonction strcat_str() remplit un buffer de 10 octets via une recurrence
f[0]=0x21, f[i]=f[i-1]+i+1, puis main affiche "flag{" + buffer + "}".

Usage : jumpjumpjump-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "rev03"
MAGIC = "}" * 8


def compute_flag() -> str:
    buf = [0x21]
    for i in range(1, 10):
        buf.append((buf[-1] + i + 1) & 0xFF)
    return "flag{" + bytes(buf).decode() + "}"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la magic string")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(MAGIC)
        return 0
    print(f"magic string = {MAGIC!r}")
    print(f"flag attendu = {compute_flag()!r}")
    if a.check:
        # pas de '\n' final : fgets l'inclurait dans la somme/longueur
        r = subprocess.run([str(EXE)], input=MAGIC, capture_output=True, text=True)
        good = "flag{" in r.stdout
        print("sortie:", r.stdout.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
