#!/usr/bin/env python3
"""KrakkRSR (crackr, crackmes.de) — serial statique, pas de user (petik non utilisé).

Le serial est une constante .NET (champ `krakkey`) comparée au TextBox.
Le solveur l'extrait de l'exe (heap #US, UTF-16LE) : on retrouve le littéral numérique
de 16 chiffres juste avant « Product activated ».

  krakkrsr-solve.py [-q] [--check] [exe]
  --check : vérifie que le serial figure bien dans l'exe (+ messages OK/KO)
"""
import argparse, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_EXE = os.path.join(HERE, "..", "analysis", "KrakkRSR.exe")  # extrait de original/KrakkRSR.zip (RAR : `unar`)
SERIAL = "2968723465784783"


def extract(path):
    d = open(path, "rb").read()
    # chaînes #US = UTF-16LE ; on cherche les suites de 16 chiffres
    u16 = d.decode("utf-16le", "ignore") + d[1:].decode("utf-16le", "ignore")
    m = re.findall(r"\d{16}", u16)
    return m, (b"P\0r\0o\0d\0u\0c\0t\0 \0a\0c\0t\0i\0v\0a\0t\0e\0d" in d)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?", default=DEFAULT_EXE)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    found, has_msg = extract(a.exe)
    if a.check:
        ok = SERIAL in found and has_msg
        print("check:", "OK" if ok else "KO", found)
        sys.exit(0 if ok else 1)
    print(SERIAL if a.q else f"Serial : {SERIAL}")


if __name__ == "__main__":
    main()
