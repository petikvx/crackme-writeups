#!/usr/bin/env python3
"""Keygen pour werrec 'Retro OEM License Check' (crackme_02.exe).

Format : AAAAA-OEM-DDDDDDD-BBBBB   (23 car.)
  A : 5 car. [0-9A-Z], XOR des 5 octets == 0x5a
  D : 7 chiffres, somme des chiffres % 7 == 0
  B : B[i] = enc((val(A[i]) + 7) % 36)   val: 0-9 -> 0-9, A-Z -> 10-35
Usage: werrec-oem-solve.py [-q] [--check serial] [--seed N] [--part1 XXXXX] [--digits NNNNNNN]
"""
import argparse, itertools, random, string

ALPHA = string.digits + string.ascii_uppercase
BAIT = "FLAG0-OEM-1337133-HAHA1"


def enc(x):
    x %= 36
    return chr(x + 0x30) if x < 10 else chr(x + 0x37)


def val(c):
    return ALPHA.index(c)


def check(s):
    if len(s) != 23 or s == BAIT:
        return False
    if not (s[5] == s[9] == s[17] == "-" and s[6:9] == "OEM"):
        return False
    a, d, b = s[0:5], s[10:17], s[18:23]
    if any(c not in ALPHA for c in a + b) or not d.isdigit():
        return False
    x = 0
    for c in a:
        x ^= ord(c)
    if x != 0x5a:
        return False
    if sum(map(int, d)) % 7:
        return False
    return all(b[i] == enc(val(a[i]) + 7) for i in range(5))


def gen(part1=None, digits="1234560", rng=None):
    if part1 is None:
        while True:
            c = [(rng.choice(ALPHA) if rng else ALPHA[10 + i]) for i in range(4)]
            last = 0x5a
            for ch in c:
                last ^= ord(ch)
            if chr(last) in ALPHA:
                part1 = "".join(c) + chr(last)
                break
            if not rng:
                # déterministe : balayage
                for t in itertools.product(ALPHA, repeat=4):
                    l = 0x5a
                    for ch in t:
                        l ^= ord(ch)
                    if chr(l) in ALPHA:
                        part1 = "".join(t) + chr(l)
                        break
                break
    return f"{part1}-OEM-{digits}-" + "".join(enc(val(c) + 7) for c in part1)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("-q", action="store_true")
    p.add_argument("--check")
    p.add_argument("--seed", type=int)
    p.add_argument("--part1")
    p.add_argument("--digits", default="1234560")
    a = p.parse_args()
    if a.check:
        ok = check(a.check)
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    s = gen(a.part1, a.digits, random.Random(a.seed) if a.seed is not None else None)
    assert check(s), s
    print(s if a.q else f"serial = {s}")
