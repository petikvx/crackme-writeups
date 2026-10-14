#!/usr/bin/env python3
"""Keygen therapy's CRACKME #1 (DOS COM).

Le mot de passe est valide ssi il contient EXACTEMENT :
  h x2, T x3, q x1, % x2, 7 x4, 6 x2, 2 x1   (sensible à la casse)
dans n'importe quel ordre ; les autres caractères sont ignorés. Longueur max 19
(buffer DOS AH=0Ah de 0x14 octets).

  ./therapy039s-crackme1-solve.py            # mot de passe canonique
  ./therapy039s-crackme1-solve.py -n 5       # 5 mots de passe aléatoires
  ./therapy039s-crackme1-solve.py --check PW # applique le prédicat
"""
import argparse, random, string
TABLE = "hTq%762"
COUNTS = [2, 3, 1, 2, 4, 2, 1]
MAXLEN = 19

def check(pw):
    if not pw or len(pw) > MAXLEN:
        return False
    return [pw.count(c) for c in TABLE] == COUNTS

def canonical():
    return "".join(c * n for c, n in zip(TABLE, COUNTS))

def random_pw(rng):
    chars = list(canonical())
    filler = [c for c in string.ascii_letters + string.digits if c not in TABLE]
    chars += rng.sample(filler, rng.randint(0, MAXLEN - len(chars)))
    rng.shuffle(chars)
    return "".join(chars)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-n", type=int, default=0)
    ap.add_argument("--check")
    ap.add_argument("--seed", type=int)
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check)
        print("OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    if a.n:
        rng = random.Random(a.seed)
        for _ in range(a.n):
            pw = random_pw(rng); assert check(pw); print(pw)
    else:
        print(canonical())
