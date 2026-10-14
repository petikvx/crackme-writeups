#!/usr/bin/env python3
"""Keygen andsoon_crackme1 (AndSoOn, Turbo Pascal DOS).

s   = somme des UpCase(c) du nom (longint)
s  ^= 0x00031337
s   = s div 10            (LongDiv TP, signé, troncature vers 0)
s   = s * 20              (LongMul)
s  += 0x5EFC051A
password = s (longint signé, saisi en décimal)
"""
import argparse, sys

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def keygen(name: str) -> int:
    s = sum(ord(c.upper()) if 'a' <= c <= 'z' else ord(c) for c in name)
    s = s32(s ^ 0x31337)
    q = abs(s) // 10 * (1 if s >= 0 else -1)
    return s32(q * 20 + 0x5EFC051A)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que le password")
    ap.add_argument("--check", metavar="PASS", help="vérifie un password pour le nom")
    a = ap.parse_args()
    k = keygen(a.name)
    if a.check is not None:
        ok = int(a.check) == k
        print("OK" if ok else f"KO (attendu {k})")
        sys.exit(0 if ok else 1)
    print(k if a.q else f"name={a.name!r} password={k}")

if __name__ == "__main__":
    main()
