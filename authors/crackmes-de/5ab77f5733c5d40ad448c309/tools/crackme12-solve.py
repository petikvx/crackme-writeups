#!/usr/bin/env python3
"""Crackme12 (attilhaz) : génère keyfile.dat valide.

Le binaire ouvre "keyfile.dat" (cwd), lit tout le fichier (Input(LOF(1),1))
et fait StrCmp avec la chaîne UTF-16 en .text:0x4019cc.
Usage : crackme12-solve.py [-q] [-o DIR] [--check EXE]
"""
import argparse, os, subprocess, sys
KEY = "abcx-rmno-fdas-fass"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la clé")
    ap.add_argument("-o", default=".", help="dossier de sortie de keyfile.dat")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe sous xvfb-run wine (GUI : inspection manuelle)")
    a = ap.parse_args()
    os.makedirs(a.o, exist_ok=True)
    with open(os.path.join(a.o, "keyfile.dat"), "wb") as f:
        f.write(KEY.encode())  # pas de CRLF final
    print(KEY if a.q else f"keyfile.dat = {KEY!r} (écrit dans {a.o})")
    if a.check:
        subprocess.run(["xvfb-run", "-a", "wine", os.path.abspath(a.check)], cwd=a.o, timeout=20)
if __name__ == "__main__":
    sys.exit(main())
