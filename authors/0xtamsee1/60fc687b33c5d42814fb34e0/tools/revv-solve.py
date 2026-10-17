#!/usr/bin/env python3
"""0xtamsee1 — revv (ELF strippé) : mot de passe de 21 caractères, comparé octet par octet.

check() @0x11c9 : strlen == 0x15 (21) ; puis 21 comparaisons "cmp al,imm8" sur pw[0..20], dans un
ordre non linéaire. Le solveur relit directement les paires (offset, octet attendu) dans le code
(pw[0] est comparé sans "add rax" préalable, les 20 autres suivent un "add rax,off ; movzx ; cmp al,imm8").
Usage : revv-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "revv"
CHECK_START, CHECK_END = 0x11C9, 0x13BA


def extract(code: bytes) -> bytes:
    pw = bytearray(21)
    # un "add rax,off" optionnel (absent pour pw[0]) avant movzx+cmp
    for m in re.finditer(rb"\x48\x8b\x45\xf8(?:\x48\x83\xc0(.))?\x0f\xb6\x00\x3c(.)", code, re.DOTALL):
        off = m.group(1)[0] if m.group(1) else 0
        pw[off] = m.group(2)[0]
    return bytes(pw)


d = Path(__file__).resolve().parent.parent.joinpath("original", "revv").read_bytes()
PW = extract(d[CHECK_START:CHECK_END]).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PW); sys.exit(0)
print(f"password = {PW}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko1, ko2 = run(PW), run(PW[:-1]), run("A" * 21)
    good = "Nice job" in ok and "Length mismatch" in ko1 and "Try Again" in ko2
    print("OK:", "Nice job" in ok, "| KO longueur:", "Length mismatch" in ko1, "| KO contenu:", "Try Again" in ko2)
    sys.exit(0 if good else 1)
