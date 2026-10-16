#!/usr/bin/env python3
"""Fragus — Very simple crackme (prog) : scanf("%d") == 0xb3c (2876).

main @0x1189 : mov [rbp-0xc],0xb3c ; scanf("%d",[rbp-0x10]) ; cmp [rbp-0xc],eax ; je "YOU HAVE WIN !!!".
Le solveur lit l'immediate dans le code (mov DWORD PTR [rbp-0xc],imm32 = c7 45 f4 <imm32>).
Usage : prog-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "prog"
d = EXE.read_bytes()
i = d.index(bytes.fromhex("c745f4"))          # mov DWORD PTR [rbp-0xc], imm32
val = struct.unpack_from("<I", d, i + 3)[0]
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(val); sys.exit(0)
print(f"password = {val} (0x{val:x})")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=f"{s}\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko = run(val), run(val + 1)
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if "WIN" in ok and "FAILED" in ko else 1)
