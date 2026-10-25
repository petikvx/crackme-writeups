#!/usr/bin/env python3
"""firstcrackme (damiok, crackmes.de) — mot de passe fixe.

Reconstruit la chaîne comparée par strcmp @0x401455 depuis les deux immediates
posés sur la pile (0x626d6f42 puis 0x0a474461, little-endian).
  python3 tools/firstcrackme-solve.py          # affiche le mot de passe
  python3 tools/firstcrackme-solve.py -q       # mot de passe seul
  python3 tools/firstcrackme-solve.py --check  # preuve : Wine/xvfb sur l'exe extrait de original/a.zip
(pas d'utilisateur : le crackme ne demande qu'un mot de passe, pas de `petik`)
"""
import argparse, os, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "a.zip")


def solve() -> str:
    raw = struct.pack("<II", 0x626D6F42, 0x0A474461)   # mov [esp+0x83], / [esp+0x87],
    # le dernier octet 0x0a est le '\n' que fgets conserve : on tape donc "BombaDG" + Entrée
    return raw.rstrip(b"\n").decode()


def check(pw: str) -> bool:
    with tempfile.TemporaryDirectory() as d:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(d, pwd=b"crackmes.one")
        exe = os.path.join(d, "a.exe")
        out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=pw + "\n",
                             capture_output=True, text=True, timeout=120).stdout
        bad = subprocess.run(["xvfb-run", "-a", "wine", exe], input="nope\n" * 4,
                             capture_output=True, text=True, timeout=120).stdout
    print(out); print(bad)
    return "Password ok" in out and "Password ok" not in bad


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    if a.q:
        print(pw)
    else:
        print(f"password = {pw}")
    if a.check:
        ok = check(pw)
        print("CHECK", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
