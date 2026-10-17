#!/usr/bin/env python3
"""Yekong — Vending Machine (Rust) : quantité NÉGATIVE = pièces gratuites, puis achat du flag.

vending_machine::main @0x9080 (pseudo Hex-Rays) : coins:i32 = 10 ; cases 1/2 (Coca/Pepsi) : seul `coins >= 5` est testé,
la quantité est un i32 lu sans test de signe, `coins -= 5 * qty` -> qty < 0 AJOUTE des pièces ;
case 3 (Flag) : `coins >= 100` et quantité == stock (1) -> show_flag().
=> qty <= -18 sur le Coca (10 - 5*qty >= 100) puis flag x1.
Les sorties du binaire bouclent sur le menu à la fin de l'entrée : toujours borner (timeout + head).
Usage : vending-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "vending_machine"
d = EXE.read_bytes()
flag = re.search(rb"flag\{[^}]*\}", d).group().decode()
start, price, need = 10, 5, 100
qty = -((need - start + price - 1) // price)      # -18  (10 - 5*qty >= 100)
seq = f"1\n{qty}\n3\n1\n4\n"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(flag); sys.exit(0)
print(f"séquence d'entrées : 1, {qty}, 3, 1, 4   ->  flag = {flag}")
if a.check:
    def run(s):
        r = subprocess.run(["timeout", "5", str(EXE)], input=s, capture_output=True, text=True)
        return r.stdout[:20000]
    ok = run(seq)
    ko = run(f"1\n{qty + 1}\n3\n1\n4\n")
    ko2 = run("3\n1\n4\n")
    good = flag in ok and "You have 100 coins" in ok and flag not in ko and flag not in ko2
    print("OK:", flag in ok, "| qty", qty + 1, "-> flag:", flag in ko, "| sans exploit -> flag:", flag in ko2)
    sys.exit(0 if good else 1)
