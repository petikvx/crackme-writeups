#!/usr/bin/env python3
"""Keygen / checker pour KeygenME1 (darkmaster2, VB6) — crackmes.one 5ab77f58...

Algo (Check_Click @ 0x402250) :
  s = sum(ord(c) for c in key)      # key : >= 8 caracteres, 8 premiers utilises
  x = (2*s) ^ s
  tant que len(Str(x)) > 3 (x >= 100) : x = somme des chiffres de x
  valide  <=>  x == 20

Usage :
  keygenme1-solve.py                 # une cle par defaut
  keygenme1-solve.py -n 5            # 5 cles
  keygenme1-solve.py --check Fa8dsaXf
  keygenme1-solve.py -q              # cle seule
"""
import argparse
import random
import string


def reduce_value(key: str) -> int:
    if len(key) < 8:
        raise ValueError("CD-Keys must be 8 Chars long!")
    s = sum(ord(c) for c in key[:8])
    x = (2 * s) ^ s
    while x >= 100:  # Len(Str$(x)) > 3 ; Str$ ajoute un espace de signe
        x = sum(int(d) for d in str(x))
    return x


def check(key: str) -> bool:
    try:
        return reduce_value(key) == 20
    except ValueError:
        return False


def keygen(rng: random.Random) -> str:
    alphabet = string.ascii_letters + string.digits
    while True:
        k = "".join(rng.choice(alphabet) for _ in range(8))
        if check(k):
            return k


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    ap.add_argument("--check", metavar="KEY")
    ap.add_argument("-n", type=int, default=1)
    ap.add_argument("--seed", type=int, default=1337)
    ap.add_argument("-q", action="store_true", help="sortie minimale")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check)
        print(("OK" if ok else "KO") if a.q else f"{a.check!r}: {'CD-Key correct!' if ok else 'CD-Key wrong!'}")
        raise SystemExit(0 if ok else 1)
    rng = random.Random(a.seed)
    for _ in range(a.n):
        print(keygen(rng))


if __name__ == "__main__":
    main()
