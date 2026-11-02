#!/usr/bin/env python3
"""CrackMe#2 by nEo_TheOne (VB6) — keygen name -> serial.

Prédicat : T = (sum(Asc(c)) * 7) As Integer ; valide ssi Val(serial) / 11 / 13 == T
=>  serial = sum(Asc(c)) * 7 * 11 * 13 = sum * 1001   (ex. petik -> 541541)

Usage : crackmes-de-crackme2-neo-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse

def target(name):
    t = sum(name.encode("latin-1")) * 7
    if t > 32767:
        raise SystemExit("Integer overflow VB (somme*7 > 32767) : nom trop long")
    return t

def keygen(name):
    return str(target(name) * 143)

def check(name, serial):
    try:
        return float(serial) / 11 / 13 == float(target(name)) and len(name) > 0
    except ValueError:
        return False

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    if a.check is not None:
        print("OK" if check(a.name, a.check) else "KO"); raise SystemExit(0)
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} sum={sum(a.name.encode())} sum*7={target(a.name)} serial={s}")
