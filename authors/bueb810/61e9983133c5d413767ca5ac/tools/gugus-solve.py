#!/usr/bin/env python3
"""bueb810 — gugus the first (gugus.out, ELF 32 bits) : argv[1] attendu = "gu!gu?s" (immediates sur la pile).

main @0x11bd : exige argc > 1 ; construit "gu!gu?s" via deux mov DWORD PTR (0x67217567, 0x733f75) ;
strcmp(argv[1], secret) -> "Access granted / Congratulation" ou "Sorry.... / Try again".
Usage : gugus-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "gugus.out"
SECRET = struct.pack("<II", 0x67217567, 0x733F75).split(b"\0")[0].decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(SECRET); sys.exit(0)
print(f"argv[1] = {SECRET!r}")
if a.check:
    run = lambda *x: subprocess.run([str(EXE), *x], capture_output=True, text=True).stdout
    ok, ko, ko2 = run(SECRET), run("wrong"), run()
    good = "Access granted" in ok and "Sorry" in ko and "missing argument" in ko2
    print("OK:", "Access granted" in ok, "| KO:", "Sorry" in ko, "| sans argument:", "missing argument" in ko2)
    sys.exit(0 if good else 1)
