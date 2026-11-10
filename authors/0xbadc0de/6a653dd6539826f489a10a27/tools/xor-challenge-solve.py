#!/usr/bin/env python3
"""0xbadc0de XOR Challenge : password = bytes_chiffrés XOR 0x55 (check @ 0x1400173d0)."""
import argparse, subprocess, sys

ENC = bytes([0x38, 0x27, 0x64, 0x66, 0x66, 0x62])
KEY = 0x55

def solve() -> str:
    return bytes(b ^ KEY for b in ENC).decode()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", metavar="EXE", help="lance EXE sous xvfb-run wine et vérifie")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + "\n",
                           capture_output=True, text=True, timeout=120)
        out = r.stdout + r.stderr
        print(out)
        sys.exit(0 if "ACCESS GRANTED" in out else 1)
