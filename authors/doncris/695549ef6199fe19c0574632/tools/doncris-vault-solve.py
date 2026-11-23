#!/usr/bin/env python3
"""Keygen DonCris New Year's Resolution Vault 2026 : resolution -> unlock code (u64).
Usage: doncris-vault-solve.py [resolution] [-q] [--check path/to/crackme.exe]"""
import argparse, subprocess, sys
M = (1 << 64) - 1

def code(s: str) -> int:
    h = 0x7e9
    for i, c in enumerate(s.encode()):
        h = (h + c * (i + 1)) & M
        h = ((h << 3) | (h >> 61)) & M
        h ^= 0x20262026
    return h

ap = argparse.ArgumentParser()
ap.add_argument("resolution", nargs="?", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check")
a = ap.parse_args()
c = code(a.resolution)
print(c if a.q else f"resolution={a.resolution!r} unlock code={c}")
if a.check:
    out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{a.resolution}\n{c}\n\n",
                         capture_output=True, text=True, timeout=120).stdout
    ok = "[SUCCESS]" in out
    print("check:", "OK" if ok else "KO")
    sys.exit(0 if ok else 1)
