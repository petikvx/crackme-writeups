#!/usr/bin/env python3
"""anonimoser_crackme_iv : le crackme lit le DERNIER octet de son propre .exe
(FileOpen(ExeName) ; FileSeek(h,-1,2) ; FileRead 1 octet) et l'affiche « REGISTRADO »
si cet octet vaut 'U' (0x55). Ce script produit une copie « enregistrée » en ajoutant 'U'.
Usage : ./crackmes-de-anonimoser_crackme_iv-solve.py "AnonimoSer Crackme IV.exe" [sortie.exe]
"""
import sys
src = sys.argv[1]; dst = sys.argv[2] if len(sys.argv) > 2 else "registrado.exe"
data = open(src, "rb").read()
if data[-1:] != b"U":
    data += b"U"          # ajout en overlay : ignoré par le loader PE et par UPX
open(dst, "wb").write(data)
print(f"{dst} : dernier octet = {data[-1:]!r} -> REGISTRADO")
