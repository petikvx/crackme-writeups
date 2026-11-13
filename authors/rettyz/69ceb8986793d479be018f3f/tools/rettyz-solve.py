#!/usr/bin/env python3
"""Solveur rettyz's Easy Rust crackme.

Les identifiants sont des constantes (2 x qword imm64 dans main), pas de
dérivation depuis un nom : on les relit directement dans le binaire.

  rettyz-solve.py [-q] [--check] [exe]

exe = rust-crackme-easy.exe extrait de original/download.bin
(zip, mdp crackmes.one) ; par défaut analysis/extracted/.
"""
import argparse, os, re, struct, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEF = os.path.join(HERE, "..", "analysis", "extracted", "rust-crackme-easy.exe")

def extract(path):
    d = open(path, "rb").read()
    # movabs r8,imm64 (49 B8) = user ; movabs rcx,imm64 (48 B9) = password
    u = re.search(rb"\x49\xb8(.{8})\x4c\x39\x06", d, re.S)  # cmp [rsi],r8
    p = re.search(rb"\x48\xb9(.{8})\x48\x39\x08", d, re.S)  # cmp [rax],rcx
    return u.group(1).decode(), p.group(1).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?", default=DEF)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="test sous wine")
    a = ap.parse_args()
    user, pw = extract(a.exe)
    if a.q:
        print(f"{user}:{pw}")
    else:
        print(f"username = {user}\npassword = {pw}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.exe],
                           input=f"{user}\n{pw}\n", capture_output=True,
                           text=True, timeout=90)
        ok = "Correct!!!" in r.stdout
        print("check:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)

main()
