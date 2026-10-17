#!/usr/bin/env python3
"""NomanProdhan — License Checker 0x01 : clé en clair dans .rodata, strcmp(argv[1], clé).

Usage : license1-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "license_checker_1"
d = EXE.read_bytes()
import re
KEY = re.search(rb"KS-LICENSE-KEY-[0-9A-Z-]+", d).group().decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"key = {KEY}")
if a.check:
    run = lambda k: subprocess.run([str(EXE), k], capture_output=True, text=True).stdout.strip()
    ok, ko = run(KEY), run("wrong")
    good = "Congratulations" in ok and "not a valid license" in ko
    print("OK:", "Congratulations" in ok, "| KO:", "not a valid license" in ko)
    sys.exit(0 if good else 1)
