#!/usr/bin/env python3
"""Solveur genass3 "Continental" (PE64, mini-VM).

Le password est passé dans une VM dont le bytecode (55 octets) fait, par caractère :
    out = ((c ^ 0xAA ^ k) << (k & 0xF)) & 0xFF ;  k = ((k << 1) ^ 0x55)   (k0 = flags anti-debug = 0)
puis memcmp(out, TARGET, len(password)).

Usage : continental-solve.py [-q] [--len N] [--check [--exe PATH]]
"""
import argparse, os, subprocess, sys

TARGET = bytes([0xEE, 0xC0, 0x00, 0x00, 0xB0, 0x58, 0x80, 0xD0, 0x88])
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "continental.exe")


def candidates(i, k):
    return [c for c in range(32, 127) if ((c ^ 0xAA ^ k) << (k & 0xF)) & 0xFF == TARGET[i]]


def solve(n=len(TARGET)):
    k, out = 0, ""
    for i in range(n):
        cs = candidates(i, k)
        alnum = [c for c in cs if chr(c).isalnum()]
        out += chr((alnum or cs)[0])
        k = ((k << 1) ^ 0x55) & 0xFFFFFFFF
    return out


def check(pw, exe):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=(pw + "\n").encode(),
                       capture_output=True, timeout=60)
    return b"Enjoy your stay" in r.stdout


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--len", type=int, default=len(TARGET))
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=EXE)
    a = ap.parse_args()
    pw = solve(a.len)
    print(pw if a.q else f"password = {pw}")
    if a.check:
        ok = check(pw, a.exe)
        print("OK (Enjoy your stay)" if ok else "KO", file=sys.stderr)
        sys.exit(0 if ok else 1)
