#!/usr/bin/env python3
"""Solveur "Jasper676767's Functions!" : de-XOR du fichier `output` (cle 0x4c).

Usage : python3 -I tools/functions-solve.py [-q] [--check] [chemin/output]
Par defaut lit analysis/extracted/Crackmes.one_Challenge/output (extrait de original/Chall.zip).
"""
import argparse, io, os, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "Chall.zip")
KEY = 0x4C  # retrouve par known-plaintext : "CMO{" ^ output[:4] = 4c 4c 4c 4c

def load(path):
    if path:
        return open(path, "rb").read()
    with zipfile.ZipFile(ZIP) as z:
        return z.read("Crackmes.one_Challenge/output")

def solve(data):
    # le dernier octet (0x0a) est le '\n' d'un echo, pas scramblé
    body = data.rstrip(b"\n")
    return bytes(b ^ KEY for b in body).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("output", nargs="?")
    a = ap.parse_args()
    flag = solve(load(a.output))
    if a.check:
        assert flag == "CMO{I_l0v3_fUnCt1OnS}", flag
        # re-scramble = output d'origine
        assert bytes(ord(c) ^ KEY for c in flag) + b"\n" == load(a.output)
        print("OK", flag)
    elif a.q:
        print(flag)
    else:
        print("Flag :", flag)

if __name__ == "__main__":
    main()
