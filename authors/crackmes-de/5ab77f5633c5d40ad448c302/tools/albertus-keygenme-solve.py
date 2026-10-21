#!/usr/bin/env python3
"""Keygen pour Keygenme v.1 by albertus (crackmes.de).

Username : longueur impaire 11..29, non multiple de 3 ; SEUL le 1er caractère est
           réellement contrôlé (dans ALLOWED = s1[i]+s2[j]) car la boucle de main sort
           dès le premier check_usr() vrai. 'petik' est impossible (trop court, 'p' interdit).
Serial   : chiffres ; dernier chiffre = (somme pondérée des précédents) % 10.

Usage: albertus-keygenme-solve.py [--user NAME] [--serial-prefix DIGITS] [-q] [--check]
"""
import argparse, sys

S1 = b"8IR$@PB#NN1DD'LRDM)EJ?'=FABN\0"
S2 = b"!&#$"
ALLOWED = sorted({(S1[i] + S2[i % 4]) & 255 for i in range(len(S1))} - {0})


def user_ok(u: str) -> bool:
    n = len(u)
    return 10 < n <= 29 and n % 2 == 1 and n % 3 != 0 and ord(u[0]) in ALLOWED


def last_digit(prefix: str) -> int:
    s = 0
    for i, ch in enumerate(prefix):
        d = ord(ch) - 0x30
        v = d if i & 1 else 2 * d
        if not i & 1 and v > 9:
            v //= 2
        s += v
    return s % 10


def keygen(prefix: str) -> str:
    if not prefix.isdigit():
        raise SystemExit("prefix: chiffres uniquement")
    return prefix + str(last_digit(prefix))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="ketiketiket")  # 'petik' interdit par le binaire
    ap.add_argument("--serial-prefix", default="12345678")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    if not user_ok(a.user):
        sys.exit("username invalide (voir docstring)")
    if a.check is not None:
        ok = a.check[:-1].isdigit() and ord(a.check[-1]) - 0x30 == last_digit(a.check[:-1])
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    sn = keygen(a.serial_prefix)
    print(sn if a.q else f"user={a.user}\nserial={sn}")


if __name__ == "__main__":
    main()
