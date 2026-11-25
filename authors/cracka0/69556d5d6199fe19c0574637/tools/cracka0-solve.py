#!/usr/bin/env python3
"""Derive64 v1.0 (cracka0) : la paire (user, password) doit avoir le meme hash64
que la paire embarquee dans .rdata : user="you", password="solved".

  cracka0-solve.py            -> affiche la paire
  cracka0-solve.py -q         -> "you:solved"
  cracka0-solve.py --check [exe]   -> la teste contre l'exe via wine (xvfb-run)
  cracka0-solve.py --check --user petik  -> cas KO attendu (access denied)
"""
import argparse, os, subprocess, sys

USER, PASSWORD = "you", "solved"
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "craackme.exe")


def check(exe, user, pw):
    out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{user}\n{pw}\n",
                         capture_output=True, text=True, timeout=120).stdout
    return "granted" in out, out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const=EXE, metavar="EXE")
    ap.add_argument("--user", default=USER)
    ap.add_argument("--password", default=PASSWORD)
    a = ap.parse_args()
    if a.check:
        ok, out = check(a.check, a.user, a.password)
        print(out.strip())
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(f"{USER}:{PASSWORD}" if a.q else f"user: {USER}\npassword: {PASSWORD}")


main()
