#!/usr/bin/env python3
"""DirkD — EZwan : key[i] = table[i+1] ^ 0x55 (8 octets), table décalé de 1 (le 1er octet est inutilisé).

main @0x11a9 : table de 10 octets sur la pile (movabs 0x31201130363c1b55 + word 0x1730) ;
pour i = 0..7 : argv[1][i] ^ 0x55 == table[i+1].
Usage : ezwan-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "EZwan"
TABLE = struct.pack("<Q", 0x31201130363C1B55) + struct.pack("<H", 0x1730)
KEY = bytes(TABLE[i + 1] ^ 0x55 for i in range(8)).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"key = {KEY}")
if a.check:
    run = lambda k: subprocess.run([str(EXE), k], capture_output=True, text=True).stdout
    ok, ko = run(KEY), run("wrong123")
    good = "congratulations" in ok and "Wrong Password" in ko
    print("OK:", "congratulations" in ok, "| KO:", "Wrong Password" in ko)
    sys.exit(0 if good else 1)
