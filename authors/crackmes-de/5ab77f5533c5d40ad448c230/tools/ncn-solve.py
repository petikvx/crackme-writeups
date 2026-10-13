#!/usr/bin/env python3
"""ncn (eslimasec / NoConName) : chiffreur + déchiffreur.

Algorithme reconstruit depuis main / vacia (voir README) :
  min     = "a..z0..9A..Z" (62 car.)
  SEMILLA = rand() % 62           -> cifred[1] = min[SEMILLA]
  cifred  = '0' * (len+1)          (len = strlen(clair), max 80)
  newpos=1, SALTO=3, increase=5
  pour chaque car. c du clair :
      newpos = vacia(newpos + SALTO, len)      # 1re case encore à '0' (avec retour au début)
      j      = min.index(c)  (62 si absent)
      cifred[newpos] = min[(SEMILLA + j + increase) % 62]
      increase += 5
Usage :
  ./ncn-solve.py                      # déchiffre la chaîne du Readme
  ./ncn-solve.py -e TEXTE [-s SEED]   # chiffre (seed 0..61)
  ./ncn-solve.py -d CHIFFRE
"""
import sys

MIN = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
TARGET = "0J3N2rElwSr1KrOPiJW0Th6ZjxQ06poPnwCfybk3ZtARCXWEId8YuBiyMr9JkCZl"

def vacia(buf, p, n):
    while True:
        if p > n:
            p = p - n - 1
        if buf[p] == "0":
            return p
        p += 1

def encrypt(clear, seed):
    n = min(len(clear), 80)
    buf = ["0"] * (n + 1)
    buf[1] = MIN[seed]
    newpos, inc = 1, 5
    for c in clear[:n]:
        newpos = vacia(buf, newpos + 3, n)
        j = MIN.index(c) if c in MIN else 62
        buf[newpos] = MIN[(seed + j + inc) % 62]
        inc += 5
    return "".join(buf)

def decrypt(ct):
    n = len(ct) - 1
    seed = MIN.index(ct[1])
    buf = ["0"] * (n + 1)
    buf[1] = MIN[seed]
    newpos, inc, out = 1, 5, []
    for _ in range(n):
        newpos = vacia(buf, newpos + 3, n)
        buf[newpos] = ct[newpos]
        out.append(MIN[(MIN.index(ct[newpos]) - seed - inc) % 62])
        inc += 5
    clear = "".join(out)
    assert encrypt(clear, seed) == ct, "re-chiffrement différent"
    return clear, seed

if __name__ == "__main__":
    a = sys.argv[1:]
    if a[:1] == ["-e"]:
        seed = int(a[3]) if len(a) > 3 and a[2] == "-s" else 0
        print(encrypt(a[1], seed))
    else:
        ct = a[1] if a[:1] == ["-d"] else TARGET
        clear, seed = decrypt(ct)
        print(f"seed={seed} ({MIN[seed]!r})")
        print(clear)
