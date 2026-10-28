#!/usr/bin/env python3
"""Boon's crackme #1 (crackmes.de) — patcheur.

Le « mot de passe » n'est jamais comparé : le jmp 0x40109b (eb 16) mène toujours
à « Sorry, you're wrong », et un thread le réécrit toutes les 500 ms depuis
0x402044. Patch : NOP du jmp (VA 0x40109b -> off 0x49b) ET de sa copie (VA 0x402044 -> off 0x844).
Ne touche jamais original/ : écrit une copie dans analysis/.
"""
import argparse, hashlib, io, os, sys, zipfile
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "crackme1.zip")
NAME = "Boon's crackme #1.exe"
PATCHES = [(0x49B, bytes.fromhex("eb16")), (0x844, bytes.fromhex("eb16"))]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--out", default=os.path.join(ROOT, "analysis", "boon1-patched.exe"))
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie les octets d'origine")
    a = ap.parse_args()
    z = zipfile.ZipFile(ZIP); z.setpassword(b"crackmes.one")
    data = bytearray(z.read(NAME))
    for off, old in PATCHES:
        assert data[off:off+2] == old, f"octets inattendus @0x{off:x}"
    if a.check:
        print("OK: octets d'origine conformes"); return
    for off, _ in PATCHES:
        data[off:off+2] = b"\x90\x90"
    os.makedirs(os.path.dirname(a.out), exist_ok=True)
    open(a.out, "wb").write(data)
    if a.quiet: print(a.out)
    else: print(f"patché -> {a.out} (sha256 {hashlib.sha256(data).hexdigest()})\nN'importe quel mot de passe (ex. petik) est alors accepté.")
if __name__ == "__main__": main()
