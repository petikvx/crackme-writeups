#!/usr/bin/env python3
"""crackme_1 by cosh (crackmes.de) — patch de 2 octets.

Le crackme cherche CD_CHECK.DAT sur les lecteurs non fixes, mais appelle
CreateFileA avec dwCreationDisposition = 0 (invalide -> ERROR_INVALID_PARAMETER),
donc le test échoue toujours. Patch : 0F 84 (je near) -> 90 E9 (nop; jmp near)
à l'offset fichier 0x138C (VA 0x40138C) : on force la branche « Well done ».

Usage:
  cosh1-solve.py [-q] [--check] [-o OUT] [crackme1.exe | cosh1.zip]
Par défaut lit original/cosh1.zip (mot de passe non requis pour le zip interne)
et écrit analysis/crackme1-patched.exe. Ne modifie jamais original/.
"""
import argparse, hashlib, io, os, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OFF, OLD, NEW = 0x138C, b"\x0f\x84", b"\x90\xe9"
SHA_EXE = None  # pas figé : on contrôle les octets patchés


def load(path):
    if zipfile.is_zipfile(path):
        with zipfile.ZipFile(path) as z:
            return bytearray(z.read("crackme1.exe"))
    return bytearray(open(path, "rb").read())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src", nargs="?", default=os.path.join(ROOT, "original", "cosh1.zip"))
    ap.add_argument("-o", "--out", default=os.path.join(ROOT, "analysis", "crackme1-patched.exe"))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie seulement les octets à patcher")
    a = ap.parse_args()
    d = load(a.src)
    if bytes(d[OFF:OFF + 2]) != OLD:
        sys.exit(f"octets inattendus à 0x{OFF:x}: {bytes(d[OFF:OFF+2]).hex()}")
    if a.check:
        print("OK: je near présent à 0x40138C" if not a.q else "OK")
        return
    d[OFF:OFF + 2] = NEW
    os.makedirs(os.path.dirname(a.out), exist_ok=True)
    open(a.out, "wb").write(d)
    if a.q:
        print(a.out)
    else:
        print(f"patch 0x{OFF:x}: {OLD.hex()} -> {NEW.hex()}  => {a.out}")
        print("sha256:", hashlib.sha256(d).hexdigest())


if __name__ == "__main__":
    main()
