#!/usr/bin/env python3
"""igr0t7 CrackMeBaby2 : solveur / vérification.

Étape 1 : mot de passe = C ^ 0x0a (C = "lfkm0cmx:~'~boacdm" en .rdata 0x140007a80)
Étape 2 : "Say my name..." -> "igr0t" (en clair, .rdata 0x140007a5c)
Pas d'username : le crackme n'en demande pas (exemple petik : non applicable).

  ./crackmebaby2-solve.py [-q] [--check path/to/CanYouCrackMeBaby2.exe]
"""
import argparse, subprocess, sys

C = b"lfkm0cmx:~'~boacdm"
STEP1 = bytes(b ^ 0x0A for b in C).decode()
STEP2 = "igr0t"

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true", help="n'affiche que les 2 réponses")
ap.add_argument("--check", metavar="EXE", help="exécute l'exe via xvfb-run wine")
a = ap.parse_args()

if a.q:
    print(STEP1); print(STEP2)
else:
    print(f"Input the pass   : {STEP1}\nSay my name...   : {STEP2}")
if a.check:
    out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{STEP1}\n{STEP2}\n",
                         capture_output=True, text=True, timeout=60).stdout
    print(out)
    sys.exit(0 if "You Win" in out else 1)
