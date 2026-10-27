#!/usr/bin/env python3
"""Keygen dpswtch Crackme #1 (Delphi 7, PE32). Name (>=5 car.) -> serial de 3*(len-1) chiffres.
Usage: crackme1-solve.py [petik] [-q]"""
import sys, argparse

def keygen(name: str) -> str:
    n = name.encode("latin-1")
    if len(n) < 5:
        raise ValueError("name >= 5 caracteres")
    out = ""
    for i in range(1, len(n)):
        v = n[i-1] * (i + 1) - n[i] * i
        if v < 1:
            v = -v
        if v < 100:              # do { v += 100 } while (v <= 100)
            v += 100
            while v <= 100:
                v += 100
        while v >= 1000:
            v -= 100
        out += "%03d" % v
    return out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
