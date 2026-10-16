#!/usr/bin/env python3
"""thedollar — Bingus (ELF stripped) : argv[1] = "cc" avec 0x66 + sum("This is a red herring") + 2*c == 0x8c5.

main @0x1149 : argc==2, argv[1][0]==argv[1][1], strlen(argv[1])==2.
Le seed 0x66 est augmenté de la somme des octets de la chaîne @0x202e (celle qui dit "a red herring", pas
la chaîne @0x2014 "not a red herring", qui est un leurre jamais lu), puis de argv[1][0]+argv[1][1].
Usage : bingus-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "bingus"
SEED, TARGET = 0x66, 0x8C5


def solve(d: bytes) -> str:
    s = d[0x202E:d.index(b"\0", 0x202E)]
    need = TARGET - SEED - sum(s)
    assert need % 2 == 0 and 0 < need // 2 < 128
    return chr(need // 2) * 2


ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
key = solve(EXE.read_bytes())
if a.q:
    print(key); sys.exit(0)
print("argv[1] =", key)
if a.check:
    run = lambda k: subprocess.run([str(EXE), k], capture_output=True, text=True).stdout.strip()
    ok, ko, ko2 = run(key), run("qq"), run("pq")
    print("OK:", ok, "| KO:", ko, "|", ko2)
    sys.exit(0 if ok == "Bingus survived" and ko == ko2 == "Bingus exploded" else 1)
