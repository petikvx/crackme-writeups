#!/usr/bin/env python3
"""cyclone by double_zer0 — mot de passe.

main (0x401000) : scanf("%d", &v) puis  ror(v, 0x11) == 0x554F0000  → Congratulation!!
donc v = rol(0x554F0000, 17) = 0xAA9E = 43678.

  ./cyclone-solve.py            # affiche le mot de passe (avec explication)
  ./cyclone-solve.py -q         # mot de passe seul
  ./cyclone-solve.py --check N  # rejoue le test du binaire sur l'entier N (int32 signé, comme %d)
"""
import argparse, sys

TARGET = 0x554F0000
M = 0xFFFFFFFF

def ror(x, n):
    return ((x >> n) | (x << (32 - n))) & M

def rol(x, n):
    return ((x << n) | (x >> (32 - n))) & M

def solve():
    v = rol(TARGET, 17)
    return v - (1 << 32) if v & 0x80000000 else v

def check(n):
    return ror(n & M, 0x11) == TARGET

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", type=int, metavar="N")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check)
        print("Congratulation!!" if ok else "Oops Wrong Password!!")
        sys.exit(0 if ok else 1)
    p = solve()
    assert check(p)
    if a.q:
        print(p)
    else:
        print(f"rol(0x{TARGET:08X}, 17) = 0x{p & M:X} = {p}")
        print(f"mot de passe : {p}")

if __name__ == "__main__":
    main()
