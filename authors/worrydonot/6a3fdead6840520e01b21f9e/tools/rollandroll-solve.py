#!/usr/bin/env python3
"""Solveur rollandroll (worrydonot) : inverse c -> t=c^0xf -> t*(t+1)/2 -> "-".join.

Usage : rollandroll-solve.py [-q] [--check]   (--check : recalcule la chaîne attendue depuis le mot de passe)
"""
import argparse, math, re, struct, sys, pathlib

BIN = pathlib.Path(__file__).resolve().parent.parent / "original" / "rollandroll"

def target():
    m = re.search(rb"(?:\d{4}-)+\d{4}", BIN.read_bytes())
    return m.group().decode()

def forward(pw):
    return "-".join(str(((ord(c) ^ 0xF) * ((ord(c) ^ 0xF) + 1)) // 2) for c in pw)

def solve(t):
    out = ""
    for g in t.split("-"):
        n = int(g)
        v = (math.isqrt(8 * n + 1) - 1) // 2
        assert v * (v + 1) // 2 == n
        out += chr(v ^ 0xF)
    return out

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
t = target()
pw = solve(t)
if a.check:
    assert forward(pw) == t, "mismatch"
    print("OK", file=sys.stderr)
print(pw if a.q else f"password = {pw}")
