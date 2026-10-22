#!/usr/bin/env python3
"""Crackme06 (attilhaz) : "solution" = patch du caption Label2 DEMO VERSION -> FULL VERSION.

Extrait Crackme06.exe du ZIP d'origine (non modifié), patche UNE COPIE
(chaîne ANSI du .frx embarqué, préfixée par sa longueur 0x0c) et l'écrit
dans analysis/Crackme06-full.exe.

  python3 -I tools/crackme06-solve.py [-q] [--check] [-o OUT]
"""
import argparse, hashlib, io, pathlib, sys, zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
ZIP = ROOT / "original" / "crackme06.zip"
OFF = 0x1368                       # octet de longueur, texte en 0x1369
OLD, NEW = b"DEMO VERSION", b"FULL VERSION"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie le patch (octets + unique occurrence)")
    ap.add_argument("-o", default=str(ROOT / "analysis" / "Crackme06-full.exe"))
    a = ap.parse_args()
    z = zipfile.ZipFile(ZIP); z.setpassword(b"crackmes.one")
    d = bytearray(z.read("Crackme06.exe"))
    assert d.count(OLD) == 1 and d[OFF + 1:OFF + 13] == OLD, "binaire inattendu"
    d[OFF + 1:OFF + 13] = NEW
    out = pathlib.Path(a.o); out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(d)
    if a.check:
        assert d.count(NEW) == 1 and OLD not in d        # caption ANSI seulement (la comparaison est en UTF-16)
    if a.q:
        print(NEW.decode())
    else:
        print(f"patch @0x{OFF+1:x}: {OLD.decode()} -> {NEW.decode()}")
        print(f"écrit {out} sha256={hashlib.sha256(d).hexdigest()}")
if __name__ == "__main__":
    main()
