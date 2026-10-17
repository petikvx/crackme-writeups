#!/usr/bin/env python3
"""tynkute — Just crackme : la réponse dépend de $USER ET de l'heure courante au moment de l'exécution.

main @0x1236 : construit "Wait, your name is" + getenv("USER") dans un buffer (le malloc frais est
zéro, donc pas de préfixe parasite). compare(buf) @0x13a0 : XOR chaque octet de buf avec
UNE SEULE valeur, key = (tm_min >> tm_mday) & 0xff (localtime courant, décalage arithmétique).
strcp(buf_encodé, saisie) compare ensuite octet par octet sur strlen(buf_encodé).

Comme tm_min < 64, dès que tm_mday >= 6 (la quasi-totalité des jours du mois), key == 0 : la chaîne
à fournir est alors simplement le texte en clair "Wait, your name is<USER>".
Usage : justcrackme-solve.py [-q] [--check]
"""
import argparse, os, subprocess, sys, time
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "a.out"


def answer(user: str) -> str:
    t = time.localtime()
    key = (t.tm_min >> t.tm_mday) & 0xFF
    plain = f"Wait, your name is{user}"
    return "".join(chr(ord(c) ^ key) for c in plain)


ap = argparse.ArgumentParser()
ap.add_argument("--user", default=os.environ.get("USER", "petik"))
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
ans = answer(a.user)
if a.q:
    print(ans); sys.exit(0)
t = time.localtime()
print(f"heure courante : jour={t.tm_mday} minute={t.tm_min} -> clé = {(t.tm_min >> t.tm_mday) & 0xff:#x}")
print(f"réponse (pour USER={a.user!r}) = {ans!r}")
if a.check:
    env = {**os.environ, "USER": a.user}
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True, env=env).stdout
    ok, ko = run(ans), run("wrong")
    good = "Done." in ok and "Try again" in ko
    print("OK:", "Done." in ok, "| KO:", "Try again" in ko)
    sys.exit(0 if good else 1)
