#!/usr/bin/env python3
"""DonCris Time Rift 2026 — keygen.  Usage: timerift-solve.py [-q] [--check EXE] [name]
Entrées attendues : identité (>=3 car.), flux, mot de passe 'tomorrow', clé."""
import argparse, subprocess, sys

def soul(s):  # djb2 32 bits, char signé
    h = 0x1505
    for c in s.encode():
        h = (h * 33 + (c - 256 if c > 127 else c)) & 0xFFFFFFFF
    return h

def solve(name):
    flux = 2026 - 1894
    return flux, "tomorrow", (soul(name) ^ 0x2026) * flux

ap = argparse.ArgumentParser()
ap.add_argument("name", nargs="?", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", metavar="EXE")
a = ap.parse_args()
flux, pw, key = solve(a.name)
if a.q:
    print(key)
else:
    print(f"identité={a.name} soul=0x{soul(a.name):08x}\nflux={flux}\nmot de passe={pw}\nclé={key}")
if a.check:
    inp = f"{a.name}\n{flux}\n{pw}\n{key}\n\n"
    r = subprocess.run(["wine", a.check], input=inp, capture_output=True, text=True, timeout=120)
    ok = "TIMELINE STABILIZED" in r.stdout
    print("CHECK:", "OK" if ok else "KO"); sys.exit(0 if ok else 1)
