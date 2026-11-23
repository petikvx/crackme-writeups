#!/usr/bin/env python3
"""Santa's Secret Gift Vault (DonCris) : code = TARGET[18] XOR 0x1f.

Usage : christmas-solve.py [-q] [--check EXE]
"""
import argparse, subprocess, sys

TARGET = bytes.fromhex("5770577057704052" "7a6d6d66404772" "7e6c3e")
KEY = 0x1F


def solve() -> str:
    return bytes(b ^ KEY for b in TARGET).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe (via wine) avec le code")
    a = ap.parse_args()
    code = solve()
    print(code if a.q else f"Code : {code}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=code + "\n\n",
                           capture_output=True, text=True, timeout=60)
        ok = "FLAG{" in r.stdout
        print(r.stdout[-200:])
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
