#!/usr/bin/env python3
"""crackme05 (seveb) — id 5ab77f5e33c5d40ad448c78c. ELF32 + ELF64. Serial de 19 caractères en argument.

rock     : chaque caractère ∈ {'-'} ∪ [0-9A-Za-z] ; longueur exactement 19
paper    : v2 = (s[8]^s[10]) + 48 ∈ [48,57] ; v3 = (s[5]^s[13]) + 48 ∈ [48,57] ;
           s[3] == s[15] == v2 ; s[0] == s[18] == v3
scissors : s[1]+s[2] > 170 ; s[16]+s[17] > 170 ; s[1]+s[2] != s[16]+s[17]
cracker  : s[9]+s[4]+s[14] == 135  (=> les trois valent '-' = 45, seule décomposition avec des octets >= 45)
sinon bomb() : message ASCII-art + citation, exit(1).

  crackme05-solve.py [--seed N] [-q] [--check]
"""
import argparse, random, string, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis" / "crackme05"
ALNUM = string.ascii_letters + string.digits


def gen(rng):
    s = [None] * 19
    s[4] = s[9] = s[14] = "-"
    d1, d2 = rng.randrange(10), rng.randrange(10)       # s[8]^s[10], s[5]^s[13]
    a = rng.choice(ALNUM)
    while chr(ord(a) ^ d1) not in ALNUM:
        a = rng.choice(ALNUM)
    s[8], s[10] = a, chr(ord(a) ^ d1)
    b = rng.choice(ALNUM)
    while chr(ord(b) ^ d2) not in ALNUM:
        b = rng.choice(ALNUM)
    s[5], s[13] = b, chr(ord(b) ^ d2)
    s[3] = s[15] = chr(48 + d1)
    s[0] = s[18] = chr(48 + d2)
    low = string.ascii_lowercase[-8:]                   # 'q'..'z' : somme de deux >= 226 > 170
    while True:
        x1, x2, y1, y2 = (rng.choice(low) for _ in range(4))
        if ord(x1) + ord(x2) != ord(y1) + ord(y2):
            break
    s[1], s[2], s[16], s[17] = x1, x2, y1, y2
    for i in (6, 7, 11, 12):
        s[i] = rng.choice(ALNUM)
    return "".join(s)


def valid(s):
    if len(s) != 19 or any(not (c == "-" or c in ALNUM) for c in s):
        return False
    o = [ord(c) for c in s]
    v2, v3 = (o[8] ^ o[10]) + 48, (o[5] ^ o[13]) + 48
    return (48 <= v2 <= 57 and 48 <= v3 <= 57 and o[3] == o[15] == v2 and o[0] == o[18] == v3
            and o[1] + o[2] > 170 and o[16] + o[17] > 170 and o[1] + o[2] != o[16] + o[17]
            and o[9] + o[4] + o[14] == 135)


def run(exe, s):
    return subprocess.run([str(A / exe), s], capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = "0zz0-bcda-aefb-0yy0" if a.seed == 0 else gen(random.Random(a.seed))
    assert valid(s)
    print(s if a.q else f"serial : {s}   (--seed N pour d'autres)")
    if a.check:
        others = [gen(random.Random(n)) for n in (1, 2, 3)]
        ok = all("Good Job!" in run(e, x) for e in ("crackme05_64bit", "crackme05_32bit") for x in [s] + others)
        ko = all("Good Job!" not in run("crackme05_64bit", x) for x in (s[:-1] + "1", s[:-2], "abc!"))
        print("check:", "OK" if ok and ko else "KO", f"(4 serials × 2 binaires acceptés={ok}, altérés rejetés={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
