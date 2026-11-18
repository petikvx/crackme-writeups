#!/usr/bin/env python3
"""janicious WinAPI GUI Crackme — keygen.

Format : XXXX-XXXX-XXXX (14 car., '-' en 4 et 9, reste alnum),
somme des chiffres '0'-'9' == 24 (les lettres comptent 0).
Pas de username : serial seul. Exemple petik -> déterministe via seed.

  janicious-solve.py [--seed petik] [-q] [--check SERIAL]
"""
import argparse, hashlib, random

def validate(s: str) -> bool:
    if len(s) != 14 or s[4] != '-' or s[9] != '-':
        return False
    tot = 0
    for i, c in enumerate(s):
        if i in (4, 9):
            continue
        if not c.isascii() or not c.isalnum():
            return False
        if c.isdigit():
            tot += int(c)
    return tot == 24

def gen(seed: str) -> str:
    r = random.Random(hashlib.sha256(seed.encode()).digest())
    while True:
        # 12 slots ; on répartit 24 sur des chiffres (1..9), reste en lettres
        digits = [0] * 12
        left = 24
        while left:
            i = r.randrange(12)
            if digits[i] < 9:
                d = min(left, r.randint(1, 9 - digits[i]))
                digits[i] += d; left -= d
        chars = [str(d) if d else r.choice("ABCDEFGHJKLMNPQRSTUVWXYZ") for d in digits]
        s = "".join(chars[:4]) + "-" + "".join(chars[4:8]) + "-" + "".join(chars[8:])
        if validate(s):
            return s

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--seed", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check is not None:
        ok = validate(a.check)
        print("OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    s = gen(a.seed)
    print(s if a.q else f"serial (seed {a.seed}) : {s}")
