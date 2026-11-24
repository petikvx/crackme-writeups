#!/usr/bin/env python3
"""Keygen pour crackmepls.exe (Kryptos) : user -> pass (décimal signé).
Usage: kryptos-solve.py [--user petik] [-q] [--check EXE]"""
import argparse, subprocess, sys

def key(user: str) -> str:
    h = 0
    for i, c in enumerate(user.encode()):
        c = c - 256 if c > 127 else c            # movsx
        t = (((i + 1) * c) + h) & 0xFFFFFFFF
        h = (((t << 3) & 0xFFFFFFFF) ^ t)
    v = ((h * 0x539) & 0xFFFFFFFF) ^ 0x5A5A
    if v & 0x80000000:
        v -= 1 << 32                              # to_string(int) signé
    return str(v)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance le binaire sous Wine")
    a = ap.parse_args()
    k = key(a.user)
    if a.q:
        print(k)
    else:
        print(f"user={a.user} pass={k}")
    if a.check:
        for p in (k, "0000"):
            r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{a.user}\n{p}\n",
                               capture_output=True, text=True, timeout=60)
            print(repr(p), "->", [l for l in r.stdout.splitlines() if "Access" in l])
if __name__ == "__main__":
    main()
