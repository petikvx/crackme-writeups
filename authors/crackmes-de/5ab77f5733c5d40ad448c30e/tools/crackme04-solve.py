#!/usr/bin/env python3
"""Crackme04 (attilhaz, VB6) : la "solution" est un patch de la boucle infinie de MsgBox.

Extrait Crackme04.exe du ZIP d'origine (non modifié), patche UNE COPIE :
  0x401f35 (offset fichier 0x1f35) : `eb 91` (jmp 0x401ec8, boucle) -> `eb 00` (jmp +0, sort de la boucle)

  python3 -I tools/crackme04-solve.py [-q] [--check] [-o OUT]
"""
import argparse, hashlib, pathlib, zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
ZIP = ROOT / "original" / "crackme04.zip"
OFF = 0x1f35
OLD, NEW = bytes.fromhex("eb91"), bytes.fromhex("eb00")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie le patch (octets)")
    ap.add_argument("-o", default=str(ROOT / "analysis" / "Crackme04-patched.exe"))
    a = ap.parse_args()
    z = zipfile.ZipFile(ZIP); z.setpassword(b"crackmes.one")
    d = bytearray(z.read("Crackme04.exe"))
    assert d[OFF:OFF + 2] == OLD and d[OFF - 3:OFF] == bytes.fromhex("83c414"), "binaire inattendu"
    d[OFF:OFF + 2] = NEW
    out = pathlib.Path(a.o); out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(d)
    if a.check:
        assert d[OFF:OFF + 2] == NEW
    if a.q:
        print(f"{OFF:#x}: eb91 -> eb00")
    else:
        print(f"patch @0x{OFF:x} (VA 0x{0x400000+OFF:x}): {OLD.hex()} -> {NEW.hex()}")
        print(f"écrit {out} sha256={hashlib.sha256(d).hexdigest()}")
if __name__ == "__main__":
    main()
