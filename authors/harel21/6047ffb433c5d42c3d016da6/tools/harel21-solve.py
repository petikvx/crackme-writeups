#!/usr/bin/env python3
"""Harel21 — crackme (ELF strippé, BUGGÉ) : name="petik", serial=535341.

main() @0x127e lit le nom dans un POINTEUR NON INITIALISÉ ("mov rax,[rbp-0x10]" avant tout scanf) :
appeler le binaire normalement ("./crackme") SEGFAULT à chaque fois (bug de l'auteur, vérifié).
La seule preuve possible passe par GDB : appeler nameValue() et checker() DIRECTEMENT, en sautant
l'exécution normale de main (qui ne fonctionne jamais).

nameValue(name) @0x1169 : calcule un entier dépendant de strlen(name) (et du contenu si la longueur
est impaire). checker(a, b) @0x124b : simple `a == b` -> "yay you have the correct creds :)".
Usage : harel21-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
NAME, SERIAL = "petik", 535341   # valeur de nameValue("petik") lue sous gdb (voir README)


def gdb_calls(name: str, serial, fflush=True):
    cmds = [
        "set debuginfod enabled off",
        "break *0x555555555070",       # _start du binaire (après le chargement dynamique, avant main)
        "run",
        "call (char*)malloc(32)",
        f'call (int)strcpy($1,"{name}")',
        "call (int)0x555555555169($1)",   # nameValue(name) -> $3
    ]
    if isinstance(serial, tuple):
        ok_s, ko_s = serial
        cmds += [f"call (void)0x55555555524b($3,{ok_s})", f"call (void)0x55555555524b($3,{ko_s})"]
    else:
        cmds += [f"call (void)0x55555555524b($3,{serial})"]
    if fflush:
        cmds.append("call (int)fflush(0)")
    args = ["gdb", "-q", "-batch"]
    for c in cmds:
        args += ["-ex", c]
    return subprocess.run(args + [str(EXE)], input="", capture_output=True, text=True).stdout


ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(NAME, SERIAL); sys.exit(0)
print(f"name = {NAME}\nserial = {SERIAL}")
print("ATTENTION : ./original/crackme lit le nom via un pointeur non initialisé -> SEGFAULT systématique.")
print("La preuve passe par GDB (appel direct de nameValue()/checker()) :")
if a.check:
    out = gdb_calls(NAME, (SERIAL, SERIAL - 1))
    ok = "yay you have the correct creds" in out
    ko = "sorry, better luck next time" in out
    print("GDB -> OK:", ok, "| KO (serial-1):", ko)
    sys.exit(0 if ok and ko else 1)
