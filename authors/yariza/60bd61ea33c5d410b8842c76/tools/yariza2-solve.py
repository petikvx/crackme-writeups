#!/usr/bin/env python3
"""Yariza — Yariza Crackme #2 (crackme) : mot de passe en clair, construit par immediates.

check_password @0x1155 : constante "super_secret_pass_56178" montée octet par octet sur la pile,
stringCompare(argv[1], constante). Égal -> system("for value in Good job!; do ...; done;").
Usage : yariza2-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
PASSWORD = "super_secret_pass_56178"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD); sys.exit(0)
print(f"password = {PASSWORD}")
if a.check:
    run = lambda p: subprocess.run([str(EXE), p], capture_output=True, text=True, timeout=10).stdout
    ok, ko = run(PASSWORD), run("wrong")
    good = "Good job!" in ok and "Wrong password" in ko
    print("OK:", "Good job!" in ok, "| KO:", "Wrong password" in ko)
    sys.exit(0 if good else 1)
