#!/usr/bin/env python3
"""Keygen pour boonz KeygenMe2 (crackmes.de) — name -> serial (entier signé 32 bits).

  S = somme des octets du nom, L = len(nom)
  serial = (445*S + 999 - L!) * trunc(L! / ((L-4)! * 4!))     (mod 2^32, signé)
  (fact(x) = 1 pour x <= 0 ; ftol hors plage -> 0x80000000)

Usage : keygenme2-solve.py [--name petik] [-q] [--check EXE]
"""
import argparse, math, struct, subprocess, shutil, sys


def fact(x):
    return 1.0 if x <= 0 else x * fact(x - 1)


def ftol(d):
    if d != d or abs(d) >= 2**31:
        return -2**31
    return int(d)


def serial(name: str) -> int:
    b = name.encode()
    S, L = sum(b), len(b)
    a = 445 * S + 999
    B = 401 * S - 22 * L + 999
    C = ftol(B + fact(L))
    D = ftol(fact(L) / (fact(L - 4) * fact(4)))
    v = (a + B - C) * D
    v &= 0xFFFFFFFF
    return v - 2**32 if v >= 2**31 else v


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance le binaire sous wine (xvfb-run)")
    a = ap.parse_args()
    s = serial(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        w = ["xvfb-run", "-a", "wine", a.check] if shutil.which("xvfb-run") else ["wine", a.check]
        out = subprocess.run(w, input=f"{a.name}\n{s}\n", capture_output=True, text=True, timeout=60).stdout
        print(out[-200:])
        ok = "ain' so good" not in out
        print("CHECK:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)


main()
