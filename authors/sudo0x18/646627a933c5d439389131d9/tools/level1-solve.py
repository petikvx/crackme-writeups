#!/usr/bin/env python3
"""sudo0x18 — Level1 : checkPass @0x1149 compare les 8 premiers octets de la saisie à des immediates (cmp al,imm8).

    s=0x73 u=0x75 d=0x64 o=0x6f 0=0x30 x=0x78 1=0x31 8=0x38   -> "sudo0x18"
Aucun test du 9e octet ni de la longueur : tout suffixe est accepté (préfixe seul comparé).
Usage : level1-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "level1"
d = EXE.read_bytes()
fn = d[0x1149:0x11D5]
pw = bytes(m.group(1)[0] for m in re.finditer(rb"\x3c(.)\x75", fn, re.S)).decode()     # cmp al,imm8 ; jne
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw, "(préfixe de 8 octets ; aucun test de la suite)")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ok2, ko1, ko2 = run(pw), run(pw + "XYZ"), run(pw[:-1]), run(pw.capitalize())
    good = "correct" in ok and "correct" in ok2 and "Better luck" in ko1 and "Better luck" in ko2
    print("OK:", "correct" in ok, "| OK avec suffixe:", "correct" in ok2, "| KO (7 car., casse):", "Better luck" in ko1, "Better luck" in ko2)
    sys.exit(0 if good else 1)
