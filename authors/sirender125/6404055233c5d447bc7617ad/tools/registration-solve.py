#!/usr/bin/env python3
"""SirEnder125 — RegistrationCrackme (crackme1) : gabarit de caractères, pas une clé unique.

validate(s) @0x12ae : pour chaque caractère de s (passé par tolower), vérifie qu'il est dans la
chaîne "accepted" = "cdelmnpstvwz0912" (@0x4010, strchr). Toute chaîne (même vide) composée
uniquement de ces lettres/chiffres (insensible à la casse) est acceptée.

Exception à la convention `petik` du dépôt : les lettres 'i' et 'k' de "petik" ne font PAS partie
du jeu de caractères accepté -> pas de clé "petik" possible. On fournit la plus proche variante
utilisable (lettres communes p, e, t) complétée par des caractères acceptés.
Usage : registration-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme1"
ACCEPTED = "cdelmnpstvwz0912"
KEY = "pet0912"          # p,e,t communs avec 'petik' + chiffres acceptés (pas de i/k disponibles)
assert all(c in ACCEPTED for c in KEY)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"jeu de caractères accepté : {ACCEPTED!r}\nclé d'exemple (variante de petik, i/k indisponibles) : {KEY!r}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok1, ok2, ko = run(KEY), run(ACCEPTED), run("a")
    good = "successful" in ok1 and "successful" in ok2 and "Invalid" in ko
    print("OK (clé):", "successful" in ok1, "| OK (alphabet entier):", "successful" in ok2, "| KO ('a'):", "Invalid" in ko)
    sys.exit(0 if good else 1)
