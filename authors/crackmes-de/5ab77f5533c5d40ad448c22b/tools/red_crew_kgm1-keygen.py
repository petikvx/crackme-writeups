#!/usr/bin/env python3
"""Keygen RED CReW KGM #1 (KKR, Delphi 2009) — crackmes.one 5ab77f5533c5d40ad448c22b.

Serial = A + '+' + B, A = 19 chiffres 1-9, B = 20 chiffres 1-9 (40 car., '+' en position 20).
Condition (0x474F3C) : H(B)**2 mod H(nom) == H(A) mod H(nom)   (_llmod signé Delphi, signe du dividende)
H (0x475098) : hash 64 bits « gcd par soustractions » ; lit le mot haut de la longueur puis s[1..len-1]
(le dernier caractère n'est jamais lu : off-by-one).

  ./red_crew_kgm1-keygen.py petik
  ./red_crew_kgm1-keygen.py --check petik 7377844815588622487+47137769329314998558
"""
import argparse, random, sys

M = 1 << 64
def s64(x):
    x %= M
    return x - M if x >= 1 << 63 else x

def gcd_sub(a, b, cap=10**7):
    """0x475018 : tant que a != 0 : si b > a (signé) b -= a sinon a -= b ; renvoie b (a si b == 0)."""
    a, b = s64(a), s64(b)
    if b == 0:
        return a, 0
    if a == 0:
        raise ValueError("résultat non initialisé dans le binaire")
    steps = 0
    while a:
        if a > 0 and b > 0:            # avance rapide (même résultat que les soustractions une à une)
            if b > a:
                k = -(-(b - a) // a); b -= k * a
            else:
                k = a // b; a -= k * b
        else:
            k = 1
            if b > a: b = s64(b - a)
            else: a = s64(a - b)
        steps += k
        if steps > cap:
            raise ValueError("boucle trop longue (le binaire gèlerait)")
    return b, steps

def H(s):
    """0x475098 ; renvoie (hash, nb de soustractions)."""
    w = [0] + [ord(c) for c in s]     # itération i lit s[i] en 1-based décalé de -1 : i=0 -> mot haut de la longueur
    h18 = s30 = h38 = tot = 0
    for i in range(len(s)):
        h18 = s64(h18 + w[i])
        t20 = s64(s64(h18 * i) ^ h18)
        t28 = s64(s64(t20 * i) ^ t20)
        s30 = s64(s64(t28 + s30) ^ s64(h18 + t20))
        g, st = gcd_sub(h18, s30); tot += st
        h38 = s64(h38 + g); h18 = h38
    return h38, tot

def llmod(a, b):
    r = abs(a) % abs(b)
    return -r if a < 0 else r

def check(name, serial):
    if len(serial) != 40 or serial[19] != '+':
        return False
    A, B = serial[:19], serial[20:]
    if not all(c in '123456789' for c in A + B) or A == B:
        return False
    hn, ha, hb = H(name)[0], H(A)[0], H(B)[0]
    if hn == 0:
        return False
    return llmod(s64(hb * hb), hn) == llmod(ha, hn)

def keygen(name, seed=None):
    hn = H(name)[0]
    if hn == 0:
        raise SystemExit("H(nom) == 0 : nom impossible (division par zéro dans le binaire)")
    rnd = random.Random(seed if seed is not None else name)
    while True:
        A = ''.join(rnd.choice('123456789') for _ in range(19))
        B = ''.join(rnd.choice('123456789') for _ in range(20))
        try:
            ha, hb = H(A)[0], H(B)[0]
        except ValueError:
            continue
        if ha > 0 and hb > 0 and llmod(s64(hb * hb), hn) == llmod(ha, hn):
            return A + '+' + B

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name"); ap.add_argument("serial", nargs="?")
    ap.add_argument("--check", action="store_true"); ap.add_argument("-q", action="store_true")
    ap.add_argument("--seed", type=int)
    a = ap.parse_args()
    if a.check:
        ok = check(a.name, a.serial or "")
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name, a.seed if a.seed is not None else 1)
    if a.q:
        print(s)
    else:
        print(f"H({a.name!r}) = {H(a.name)[0]}\nserial = {s}")
