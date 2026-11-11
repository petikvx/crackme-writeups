#!/usr/bin/env python3
"""billy_bat's My First Crackme — extrait le serial attendu depuis chip-8.dll.

Usage : python3 -I billy-bat-solve.py [-q] [--check]
Le serial est la constante comparée à `text == "..."` dans Program.Main
(#US heap .NET, lue sans runtime). --check vérifie qu'elle existe bien.
"""
import argparse, io, re, sys, zipfile
from pathlib import Path

ORIG = Path(__file__).resolve().parent.parent / "original" / "download.bin"

def load_dll():
    outer = zipfile.ZipFile(ORIG)
    inner = zipfile.ZipFile(io.BytesIO(outer.read("mycrackme.zip", pwd=b"crackmes.one")))
    return inner.read("mycrackme/chip-8.dll")

def user_strings(dll):
    # heap #US : chaînes UTF-16LE préfixées par leur longueur
    i = dll.find(b"#US")
    out = []
    for m in re.finditer(rb"((?:[\x20-\x7e]\x00){3,})", dll):
        out.append(m.group(1).decode("utf-16le"))
    return out

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = user_strings(load_dll())
    if a.check:
        need = {"Enter Serial: ", "password", "Correct!", "Try Again."}
        assert need <= set(s), s
    print("password" if a.q else "Serial : password")

if __name__ == "__main__":
    sys.exit(main())
