#!/usr/bin/env python3
"""RafaelGFreveng — Sexy 1337 (sexy1337.out) : password = seed + 3 par octet, seed "sexy1337" lu en .rodata+0x4.

main @0x120e : generate_password(buf, "sexy1337") -> buf[i] = seed[i] + 3 ;  encrypt_decrypt(buf, 0xaa) (XOR) ;
fgets(input, 0x32) ; encrypt_decrypt(input, 0xaa) ; strcmp(input, buf).  Le XOR 0xaa s'annule : input == seed+3.
Usage : sexy1337-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "sexy1337.out"
d = EXE.read_bytes()
seed = d[0x2004:d.index(b"\0", 0x2004)]
pw = bytes((c + 3) & 0xFF for c in seed).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"seed = {seed.decode()}  ->  password = {pw}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko, ko_seed = run(pw), run("wrong"), run(seed.decode())
    print("OK:", ok, "| KO:", ko, "|", ko_seed, "(seed brut)")
    sys.exit(0 if "Granted" in ok and "Denied" in ko and "Denied" in ko_seed else 1)
