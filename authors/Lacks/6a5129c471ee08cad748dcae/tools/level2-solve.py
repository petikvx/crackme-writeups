#!/usr/bin/env python3
"""Lacks's Level 2 : le secret est stocké XOR 0x5a (7 octets, initialisés par un static init)."""
import argparse, subprocess, sys, os

# Octets immédiats de l'init @0x140001000 : 0x3f2c3f28 (LE), 0x2928 (LE), 0x3f
ENC = bytes([0x28, 0x3f, 0x2c, 0x3f, 0x28, 0x29, 0x3f])
KEY = 0x5A

def solve() -> str:
    return bytes(b ^ KEY for b in ENC).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le secret")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe (xvfb-run wine) et vérifie")
    a = ap.parse_args()
    s = solve()
    print(s if a.q else f"Secret Key : {s}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=s + "\n\n",
                           capture_output=True, text=True, timeout=120)
        ok = "Access Granted" in r.stdout
        print("check:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
