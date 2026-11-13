#!/usr/bin/env python3
"""mesit21 "the stary console" : bug de scanf (pointeur NULL).

Le « code » attendu n'existe pas : le programme compare une valeur à elle-même.
Réponse : toute saisie NON numérique (défaut : petik). Un nombre (même 45563 = 0xb1fb)
fait écrire scanf à l'adresse 0 -> crash.

  mesit21-solve.py [-q] [--check] [--exe analysis/crackme2.exe]
"""
import argparse, os, subprocess, sys

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true", help="vérifie contre le binaire (wine/xvfb-run)")
ap.add_argument("--answer", default="petik")
ap.add_argument("--exe", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "analysis", "crackme2.exe"))
a = ap.parse_args()

if a.answer.lstrip("+-").isdigit():
    sys.exit("une saisie numérique fait crasher scanf(\"%d\", NULL)")
if a.q:
    print(a.answer)
else:
    print(f"Réponse : {a.answer}  (toute saisie non numérique convient)")

if a.check:
    def run(s):
        # sur crash, wine lance winedbg et bloque : timeout = crash
        env = dict(os.environ, WINEDEBUG="-all")
        try:
            r = subprocess.run(["xvfb-run", "-a", "wine", a.exe], input=s + "\n", capture_output=True, text=True, timeout=25, env=env)
        except subprocess.TimeoutExpired as e:
            return 124, (e.stdout or b"").decode(errors="replace") if isinstance(e.stdout, bytes) else (e.stdout or "")
        return r.returncode, r.stdout
    rc, out = run(a.answer)
    ok = rc == 0 and "correct :)" in out
    rc2, out2 = run("45563")
    ko = "correct :)" not in out2
    print("OK" if ok else "KO", "| 45563 ->", "crash/pas de succès" if ko else "succès?!")
    sys.exit(0 if ok and ko else 1)
