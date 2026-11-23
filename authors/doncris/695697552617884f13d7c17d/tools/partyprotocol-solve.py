#!/usr/bin/env python3
"""Keygen PartyProtocol (DonCris) : handle -> mix code.  Défaut : petik.
Usage: partyprotocol-solve.py [--user petik] [-q] [--check]
--check : lance l'exe d'origine sous wine (xvfb) et vérifie le message de succès.
Note : le binaire exige l'année système 2026 (GetLocalTime)."""
import argparse, subprocess, os

def mix(handle: str) -> int:
    h = 0xDEADBEEF
    for b in handle.rstrip().encode():
        c = b - 256 if b > 127 else b          # movsx
        e = ((c ^ h) * 0x12345678) & 0xFFFFFFFF
        h = ((e << 5) | (e >> 27)) & 0xFFFFFFFF  # rol 5
    h = (h * 0x7EA) & 0xFFFFFFFF
    if h >= 0xCAFEBABE:
        h -= 0xCAFEBABE
    return h

ap = argparse.ArgumentParser()
ap.add_argument("--user", "--name", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
code = mix(a.user)
print(code if a.q else f"handle={a.user} mix code={code}")
if a.check:
    exe = os.path.join(os.path.dirname(__file__), "..", "original", "PartyProtocol.exe")
    out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{a.user}\n{code}\n\n",
                         capture_output=True, text=True, timeout=120).stdout
    print(out)
    print("OK" if "PARTY HARD" in out else "KO")
