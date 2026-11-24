#!/usr/bin/env python3
"""Solveur DeLuks's Chamber of Reflections (VM JS obfusquée).

Mot de passe = KEY[i] ^ 0xab. Pas de username (petik n'est pas utilisé).
  deluks-solve.py [-q] [--check]
"""
import argparse, os, subprocess, sys

KEY = [237, 231, 234, 236, 134, 225, 248, 253, 230, 134, 154, 152, 152, 156]
XOR = 0xAB


def solve() -> str:
    return "".join(chr(b ^ XOR) for b in KEY)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="teste via node sur original/")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        js = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "crackme_mini.js")
        out = subprocess.run(["node", js], input=pw + "\n", capture_output=True, text=True, timeout=15).stdout
        ok = "Correct!" in out
        print("check:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
