#!/usr/bin/env python3
"""s0k1t — GO GO GO - Harmful Logic (Go, statique) : mot de passe = decodehex("736f6c617277696e6473313233").

main.main (pseudo Hex-Rays via MCP ida) : la chaîne hex "736f6c617277696e6473313233" est décodée
(encoding/hex.Decode) et comparée (runtime.memequal) à la saisie (fmt.Fscan).
Usage : harmfullogic-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "main"
PASSWORD = bytes.fromhex("736f6c617277696e6473313233").decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD); sys.exit(0)
print(f"password = {PASSWORD}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(PASSWORD), run("wrong")
    good = "Welcome" in ok and "try again loser" in ko
    print("OK:", "Welcome" in ok, "| KO:", "try again loser" in ko)
    sys.exit(0 if good else 1)
