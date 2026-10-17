#!/usr/bin/env python3
"""skibur — Just In Time (ski000, ELF stripped) : mot de passe de 15 caractères qui n'est accepté
qu'à CERTAINES secondes (titre du challenge).

main (@0x1422, binaire strippé, repéré via l'entry point de _start) : time()+localtime() une seule
fois au début ; check1 @0x1189 : strlen(pw)==15 ; check2 @0x11ba : n = (tm_sec % 10) % 3 (deux divisions
par constantes magiques, 0x66666667 puis 0x55555556), puis 14 comparaisons sur les octets 0..13 de pw :
certaines directes (pw[i]==c), d'autres "pw[i] << n == cible" (l'octet 14 n'est jamais testé : libre).

n ne prend jamais que les valeurs {0,1,2}. Seul n=1 donne des cibles divisibles proprement par 2
(toutes les autres valeurs de n cassent au moins une contrainte, ou retombent sur un octet >= 0x80
qui devient négatif après movsx et ne correspond plus à la cible positive comparée). Donc UNE seule
réponse existe, et elle n'est acceptée que quand tm_sec % 10 ∈ {1, 4, 7} (n==1) au moment du run —
d'où le nom "Just In Time". Le solveur réessaie en boucle jusqu'à tomber sur la bonne fenêtre.

PIÈGE VÉRIFIÉ SOUS GDB : la saisie ne doit comporter AUCUN retour à la ligne. fgets() conserve le
'\n' ; avec lui, strlen(pw) == 16 et le DEUXIÈME contrôle (check1 @0x1189, strlen==15) échoue même
quand le premier contrôle (temporel) passe. Un envoi par heredoc/pipe classique (`printf '%s\n'`)
échoue donc TOUJOURS, y compris pendant la bonne fenêtre temporelle — il faut `printf '%s'` (pas de \n).
Usage : justintime-solve.py [-q] [--check]
"""
import argparse, subprocess, sys, time
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "ski000"
PASSWORD = "%djk(9^{.f@1F4X"          # n=1 ; le 15e caractère (index 14) n'est jamais vérifié
assert len(PASSWORD) == 15
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD); sys.exit(0)
print(f"password = {PASSWORD!r}  (valide seulement quand seconde courante % 10 ∈ {{1,4,7}})")
if a.check:
    good = bad = 0
    deadline = time.time() + 20
    out = ""
    while time.time() < deadline:
        # SANS retour à la ligne : fgets ne doit PAS inclure de \n (sinon strlen == 16 != 15)
        out = subprocess.run([str(EXE)], input=PASSWORD, capture_output=True, text=True).stdout
        if "Incorrect" not in out:
            good += 1; break
        bad += 1
        time.sleep(0.15)
    print(f"tentatives ratées (mauvaise seconde) : {bad} | réussite :", good == 1, "| sortie finale:", out.strip()[-60:])
    sys.exit(0 if good == 1 else 1)
