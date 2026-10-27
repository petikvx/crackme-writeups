#!/usr/bin/env python3
"""Keygen .NET Anarchy (sas0) : code = ".NET-<groupes de 4 car.>".

Usage : net-anarchy-solve.py [-q] [-n GROUPES] [--seed S] [--check CODE]
Pas de nom/login : le code ne dépend de rien (exemple pour `petik` : identique).
"""
import argparse, random, sys

PART0 = ".NET"  # bit-reverse(u32 LE) == ~(-1953669675)


def rev32(v):
    return int(f"{v & 0xffffffff:032b}"[::-1], 2)


def group_ok(i, g):
    b0, b1, b2, b3 = g  # F1=b0, F4=b1, F3=b2, F0=b3
    if i & 1:
        return b3 ^ b2 == 48 and b0 ^ b1 == 57
    return ((b3 ^ b0) * 2) % 127 == b2 and (b3 + b0 + b2) % 127 == b1


def check(code):
    p = code.split("-")
    p = [x for x in p if x]
    if len(p) != 2 or len(p[0]) != 4 or len(p[1]) % 4:
        return False
    v = int.from_bytes(p[0].encode("ascii"), "little")
    if (rev32(v) ^ (-1953669675 & 0xffffffff)) != 0xffffffff:
        return False
    b = p[1].encode("ascii")
    return all(group_ok(i, b[4 * i:4 * i + 4]) for i in range(len(b) // 4))


def gen(n, rnd):
    out = b""
    for i in range(n):
        cands = [bytes((b0, b1, b2, b3))
                 for b0 in range(33, 127) for b3 in range(33, 127)
                 for b2 in [(b3 ^ b0) * 2 % 127 if not i & 1 else b3 ^ 48]
                 for b1 in [(b3 + b0 + b2) % 127 if not i & 1 else b0 ^ 57]
                 if 33 <= b2 < 127 and 33 <= b1 < 127 and group_ok(i, (b0, b1, b2, b3))]
        out += rnd.choice(cands)
    return PART0 + "-" + out.decode()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("-n", type=int, default=2)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check:
        ok = check(a.check)
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    c = gen(a.n, random.Random(a.seed))
    assert check(c)
    print(c if a.q else f"code = {c}")
