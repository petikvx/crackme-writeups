#!/usr/bin/env python3
"""RodrigoTeixeira's Encrypted Password : déchiffre les chaînes du crackme.

Usage : encrypted-password-solve.py [-q] [--check] [--exe analysis/crackmes.exe]
Le mot de passe attendu est stocké chiffré dans main() (immediates empilés).
--check : lance le binaire sous Wine (xvfb-run) avec le mot de passe trouvé.
"""
import argparse, os, struct, subprocess, sys

def dec(buf, mult):
    """Boucle du binaire : b[i] = ((acc|1) * mult) & 0xff, mult = octet clair suivant."""
    b = bytearray(buf); acc = b[0]; i = 0
    while True:
        acc = ((acc | 1) * mult) & 0xffffffff
        i += 1
        b[i] = acc & 0xff
        mult = b[i + 1]
        if mult == 0:
            break
        acc |= 1
    return bytes(b).rstrip(b"\0")

# Blob de 0x402260..0x402283 (mov [esp+0x19], ...), multiplicateur initial 0x11
BLOB = struct.pack("<IIHB", 0x01531150, 0x0CAEC9ED, 0xF02C, 0)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=os.path.join(os.path.dirname(__file__), "..", "analysis", "crackmes.exe"))
    a = ap.parse_args()
    pw = dec(BLOB, 0x11).decode()
    if a.q:
        print(pw); return
    print("password =", pw)
    if a.check:
        exe = os.path.abspath(a.exe)
        for cand in (pw, "petik"):
            r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=cand + "\n",
                               capture_output=True, text=True, cwd=os.path.dirname(exe), timeout=90)
            print(f"{cand!r:14} ->", r.stdout.strip())

if __name__ == "__main__":
    main()
