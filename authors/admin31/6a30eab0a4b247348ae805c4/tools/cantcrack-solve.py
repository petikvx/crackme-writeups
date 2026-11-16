#!/usr/bin/env python3
"""cantcrack (admin31) : password statique, format XXXXX-XXXX-XXX.

Clé en immediates (0x56585959, 0x73717352, 0x50534b77) XORée par tranches :
[0:5]^0x37, [5:9]^0x41, [9:12]^0x23.  Pas de user : réponse fixe.
Usage : cantcrack-solve.py [-q] [--check]   (--check lance wine/xvfb-run)
"""
import argparse, struct, subprocess, sys, zipfile, tempfile, os, hashlib

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")

def solve():
    key = struct.pack("<III", 0x56585959, 0x73717352, 0x50534B77)[:12]
    out = bytes(b ^ (0x37 if i < 5 else 0x41 if i < 9 else 0x23) for i, b in enumerate(key))
    s = out.decode()
    return f"{s[:5]}-{s[5:9]}-{s[9:]}"

def run(pw):
    with tempfile.TemporaryDirectory() as d:
        zipfile.ZipFile(ZIP).extract("cantcrack.exe", d, pwd=b"crackmes.one")
        r = subprocess.run(["xvfb-run", "-a", "wine", os.path.join(d, "cantcrack.exe")],
                           input=(pw + "\n").encode(), capture_output=True, timeout=90,
                           env={**os.environ, "WINEDEBUG": "-all"})
        return b"CONGRATULATIONS" in r.stdout

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
pw = solve()
print(pw if a.q else f"password = {pw}")
if a.check:
    ok, ko = run(pw), run(pw[:-1] + "x")
    print(f"OK={ok} KO(altéré)={not ko}")
    sys.exit(0 if ok and not ko else 1)
