#!/usr/bin/env python3
"""marufmurtuza — Illogical Logic : PIN attendu = 0 (checker(int) @0x13b7 : cmp pin,0 ; je flag()).

main @0x143d : cin >> pin (int) ; checker(pin). checker : si pin == 0 -> flag() sinon message d'échec.
Piège : une saisie non numérique ("test") laisse std::cin en échec et pin reste à 0 (valeur par défaut) :
le flag s'affiche "par accident" même sans connaître la règle. La réponse canonique reste 0.
Usage : illogical-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "illogical_logic"
PIN = "0"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PIN); sys.exit(0)
print(f"pin = {PIN}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(PIN), run("1")
    good = "FLAG{" in ok and "digging deeper" in ko
    print("OK:", "FLAG{" in ok, "| KO (pin=1):", "digging deeper" in ko)
    sys.exit(0 if good else 1)
