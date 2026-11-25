#!/usr/bin/env python3
"""Nexus! (Lite) — sally1337. Master key en clair dans .rdata.

Usage : nexus-lite-solve.py [-q] [--check [exe]]
"""
import argparse, subprocess, sys, pathlib

KEY = "NEXUS-MASTER-KEY-2025"
EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "nexus-lite.exe"


def check(exe, key):
    # le binaire boucle sur stdin EOF si la clé est fausse -> timeout = KO
    try:
        out = subprocess.run(["xvfb-run", "-a", "wine", str(exe)], input=key + "\n",
                             capture_output=True, text=True, timeout=30).stdout
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"").decode(errors="ignore") if isinstance(e.stdout, bytes) else (e.stdout or "")
    return "ACCESS GRANTED" in out


ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", nargs="?", const=str(EXE))
a = ap.parse_args()
print(KEY)
if a.check:
    ok = check(a.check, KEY)
    if not a.q:
        print("OK" if ok else "KO", file=sys.stderr)
    sys.exit(0 if ok else 1)
