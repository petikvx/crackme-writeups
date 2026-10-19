#!/usr/bin/env python3
"""Keygen AnonimoSer CrackME III : génère clave.txt.
Ligne 1 = nom, ligne 2 = somme décimale des codes ASCII du nom.
  ./crackmes-de-anonimoser_crackme_iii-solve.py [nom] [dossier]
"""
import sys, pathlib
name = sys.argv[1] if len(sys.argv) > 1 else "petik"
out = pathlib.Path(sys.argv[2] if len(sys.argv) > 2 else ".") / "clave.txt"
serial = str(sum(name.encode("latin-1")))
out.write_bytes(name.encode("latin-1") + b"\r\n" + serial.encode())
print(f"{name} -> {serial}  ({out})")
