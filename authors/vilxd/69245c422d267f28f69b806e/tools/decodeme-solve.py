#!/usr/bin/env python3
"""vilxd's decode me — calcule le mot de passe attendu (pas de username).

Usage: decodeme-solve.py [-q] [--check <decodeme.exe>]
  --check : lance le binaire sous wine (xvfb) et vérifie « Yes! ».
Le binaire est dans original/download.bin (ZIP, mdp crackmes.one) -> decodeme.exe.
"""
import argparse, subprocess, sys

SECRET = "Pa100-322-1L@101"          # .rdata 0x14001302a
MAP = {"0": "_", "1": ">", "2": "\\"}  # transformChar @ 0x1400016f0


def solve():
    return "".join(MAP.get(c, c) for c in SECRET)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + "\n",
                             capture_output=True, text=True, timeout=60).stdout
        ok = "Yes!" in out
        print("check:", "OK (Yes!)" if ok else "KO", file=sys.stderr)
        sys.exit(0 if ok else 1)


main()
