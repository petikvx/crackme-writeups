#!/usr/bin/env python3
"""Solveur xEnsar69 "Determinism" (gate.exe).

Le seul prédicat réel : len(name) >= 6 et len(password) >= 3*len(name)
(fonction 0x14000183e). Le contenu du mot de passe n'est pas lu.

  gate-solve.py                 -> name=petik1, password=petik1petik1petik1
  gate-solve.py -q              -> sortie brute 2 lignes (à piper dans gate.exe)
  gate-solve.py --check [exe]   -> lance le binaire via wine/xvfb et vérifie OK + KO
"""
import argparse, os, subprocess, sys

MIN_NAME = 6          # "petik" (5) est refusé : "Your name is too short"
MAX_PASS = 95         # fgets(buf, 0x60)

def keygen(name):
    if len(name) < MIN_NAME:
        raise SystemExit(f"nom trop court (>= {MIN_NAME})")
    pw = (name * 3)[:max(3 * len(name), 0)]
    if len(pw) > MAX_PASS - 1:
        raise SystemExit("nom trop long (mot de passe > buffer)")
    return pw

def run(exe, name, pw):
    cmd = ["xvfb-run", "-a", "wine", exe]
    p = subprocess.run(cmd, input=f"{name}\n{pw}\n".encode(), capture_output=True, timeout=60)
    return p.stdout.decode(errors="replace")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik1")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "gate.exe"))
    a = ap.parse_args()
    pw = keygen(a.name)
    if a.q:
        print(a.name); print(pw); return
    print(f"name     = {a.name}\npassword = {pw}")
    if a.check:
        ok = "welcome" in run(a.check, a.name, pw)
        ko = "wrong answer" in run(a.check, a.name, pw[:-1])
        print("OK :", ok, "| KO (password-1) :", ko)
        sys.exit(0 if ok and ko else 1)

if __name__ == "__main__":
    main()
