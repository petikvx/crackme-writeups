#!/usr/bin/env python3
"""Solveur creepys_crackme (Creepy`sfirstcrackme.exe) : serial = long double 80 bits @ 0x4400f0.

Usage : creepys-crackme1-solve.py [-q] [--check]
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile, zipfile
from fractions import Fraction

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "Creepy`sfirstcrackme.zip")
EXE = "Creepy`sfirstcrackme.exe"
RDATA_VA, RDATA_OFF, CONST_VA = 0x440000, 0x3E200, 0x4400F0


def serial(exe: bytes) -> str:
    o = CONST_VA - RDATA_VA + RDATA_OFF
    mant, se = struct.unpack("<QH", exe[o:o + 10])
    val = Fraction(mant, 1 << 63) * Fraction(2) ** ((se & 0x7FFF) - 16383)
    assert val.denominator == 1 and not se >> 15
    return str(int(val))


def run(exe_path, s):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe_path], input=s + "\n",
                       capture_output=True, text=True, timeout=90)
    return r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    tmp = tempfile.mkdtemp()
    try:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(tmp, pwd=b"crackmes.one")
        exe = os.path.join(tmp, EXE)
        s = serial(open(exe, "rb").read())
        print(s if a.q else f"Serial : {s}")
        if a.check:
            ok = "Great Work" in run(exe, s)
            ko = "good luck next time" in run(exe, "12345")
            print("OK:", ok, "KO:", ko)
            sys.exit(0 if ok and ko else 1)
    finally:
        shutil.rmtree(tmp)


main()
