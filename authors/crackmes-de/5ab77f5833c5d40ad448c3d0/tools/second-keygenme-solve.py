#!/usr/bin/env python3
"""Keygen FixedSecondKeyGenMe (crackmes.de second_keygenme, dmichael).

serial[i] = (name[i] ^ 0x19) + 1   pour i < len(name)-1 ; le dernier char
n'est jamais comparé (bug de boucle) — on le génère quand même par cohérence.
Usage: second-keygenme-solve.py [--name petik] [-q] [--check EXE]
"""
import argparse, subprocess, sys

def keygen(name: str) -> str:
    if not 1 <= len(name) <= 11:
        raise SystemExit("nom: 1..11 caractères (buffer de 12 octets avant le serial)")
    return "".join(chr(((ord(c) ^ 0x19) + 1) & 0xFF) for c in name)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe via xvfb-run wine")
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{a.name}\n{s}\n",
                             capture_output=True, text=True, timeout=60).stdout
        print(out.strip())
        sys.exit(0 if "Like!!" in out else 1)

main()
