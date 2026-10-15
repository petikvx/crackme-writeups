#!/usr/bin/env python3
"""U Can't Pass (mystergaif) -- il n'y a pas de mot de passe a trouver.

main() ecrit systematiquement "Error!" : il n'y a ni scanf, ni lecture
d'argv, juste une variable locale fixee a 10 puis comparee a 10 -- une
tautologie. Le code qui imprime "Success!" existe mais n'est jamais
atteint par un appel normal du binaire. Le titre "U Can't Pass" est
littéral : il n'existe AUCUNE entree (stdin, argv, env) qui change l'issue.

La seule facon de voir "Success!" s'afficher est de modifier l'etat du
process en live (debugger) -- voir tools/gdb-force-success.py et la
section "Debug GDB (pas a pas)" du README. Ce script se contente de
lancer cette preuve et de verifier le resultat.

Usage : ucp-solve.py [--bin BINAIRE] [--check]
"""
import argparse
import pathlib
import subprocess
import sys


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bin", default="original/main.out")
    ap.add_argument("--check", action="store_true",
                     help="lance la preuve gdb et verifie que Success! est bien imprime")
    a = ap.parse_args()

    if not a.check:
        print("Pas de mot de passe : le binaire imprime toujours 'Error!' sans "
              "intervention externe (aucune entree lue). Voir --check / tools/gdb-force-success.py.")
        return

    script = str(pathlib.Path(__file__).with_name("gdb-force-success.py"))
    r = subprocess.run(["gdb", "-q", "-batch", "-ex", f"source {script}", a.bin],
                        capture_output=True, text=True, timeout=15)
    print(r.stdout)
    ok = "Success!" in r.stdout
    print("Success! force avec succes" if ok else "echec")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
