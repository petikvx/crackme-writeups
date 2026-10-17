#!/usr/bin/env python3
"""c1 — c1_keygenme1 : vrai keygen.

main() :
    h = crc32(username)                        # 32 bits
    key = 32 octets, lus depuis la 1ere moitie du champ "license key"
          (64 hex chars) ; le bit de poids faible de key[i] doit valoir
          le bit (31-i) de h, puis ce bit est mis a 0 dans une copie
    checksum = crc32(key_avec_LSB_a_0, 32)       # doit egaler le suffixe
                                                   # "-XXXXXXXX" (hex) du champ

En choisissant directement key[i] = bit(31-i) de h (valeur 0 ou 1 par
octet), la version "LSB efface" est exactement 32 octets nuls -> le
checksum est une CONSTANTE (crc32(32 octets nuls)), calculable une fois.

Usage : keygenme1-solve.py --user petik [-q] [--check]
"""
import argparse
import subprocess
import sys
import zlib
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keygenme1"
CHECKSUM = zlib.crc32(bytes(32)) & 0xFFFFFFFF


def make_key(username: str) -> str:
    h = zlib.crc32(username.encode()) & 0xFFFFFFFF
    v2 = bytes((h >> (31 - i)) & 1 for i in range(32))
    hexpart = v2.hex()
    return f"{hexpart}-{CHECKSUM:08x}"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik", help="nom d'utilisateur (defaut: petik)")
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    key = make_key(a.user)
    if a.q:
        print(key)
        return 0
    print(f"user={a.user!r} -> key={key!r}")
    if a.check:
        stdin = f"{a.user}\n{key}\n"
        ok = subprocess.run([str(EXE)], input=stdin, capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE)], input=f"{a.user}\nwrong\n", capture_output=True, text=True).stdout
        good = "good job!" in ok and "Invalid" in ko
        print("OK:", "good job!" in ok, "| KO:", "Invalid" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
