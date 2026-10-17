#!/usr/bin/env python3
"""Yekong — Salt and Hash - Linux (hash, Rust) : --verify compare l'entrée à une constante codée en dur,
INDÉPENDAMMENT du hash affiché (MD5/SHA1 alterné aléatoirement à chaque lancement — c'est un leurre).

check_ans @0x106f0 (binaire dépacké de ida) :
    a2[2] == 13 && (*v3 ^ 0x7473316E316D6461) | (*(v3+5) ^ 0x7230746172747331) == 0
=> réponse de 13 octets : qword[0:8] = 0x7473316E316D6461 (LE) = "adm1n1st" ; qword[5:13] = 0x7230746172747331 (LE) = "1strat0r"
   recouvrement sur les octets 5..7 -> "adm1n1strat0r" (13 car.)
Usage : hash-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE = ROOT / "analysis" / "x" / "hash"
q1 = struct.pack("<Q", 0x7473316E316D6461)
q2 = struct.pack("<Q", 0x7230746172747331)
buf = bytearray(13)
buf[0:8] = q1
buf[5:13] = q2
answer = buf.decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(answer); sys.exit(0)
print(f"réponse = {answer}  (commande : ./hash --verify, puis saisir la réponse)")
if a.check:
    run = lambda s: subprocess.run([str(EXE), "--verify"], input=s + "\n", capture_output=True, text=True, timeout=5).stdout
    ok, ko1, ko2 = run(answer), run(answer + "x"), run("administrator")
    good = "Congratulation" in ok and "Wrong answer" in ko1 and "Wrong answer" in ko2
    print("OK:", "Congratulation" in ok, "| KO (+x, sans leet):", "Wrong answer" in ko1, "Wrong answer" in ko2)
    sys.exit(0 if good else 1)
