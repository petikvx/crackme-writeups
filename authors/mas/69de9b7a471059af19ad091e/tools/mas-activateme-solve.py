#!/usr/bin/env python3
"""Solveur ActivateMe.exe (MAS's Find The Key).

Magic number : 4 (20/n == 5).
Activation key : regex ^[A-Z]{2}-[A-Z]{2}$ et key[3] - key[1] == 3.
Pas de username : pas de `petik` ici.
"""
import argparse, itertools, os, string, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "ActivateMe.exe")
MAGIC = 4


def valid(k):
    return (len(k) == 5 and k[2] == "-" and k[:2].isalpha() and k[3:].isalpha()
            and k.isupper() and ord(k[3]) - ord(k[1]) == 3)


def keys():
    U = string.ascii_uppercase
    for a, b, d in itertools.product(U, U, U):
        if ord(d) - ord(b) == 3:
            for e in U:
                yield f"{a}{b}-{d}{e}"


def check(k):
    env = dict(os.environ, WINEDEBUG="-all")
    try:
        p = subprocess.run(["wine", EXE], input=f"{MAGIC}\n{k}\n".encode(),
                           capture_output=True, timeout=15, env=env)
        out = p.stdout
    except subprocess.TimeoutExpired as e:
        out = e.stdout or b""
    ok = b"Z+{Act1va7i0n}" in out and b"Try Again" not in out
    print(f"{k}: {'OK' if ok else 'KO'}  {out[-40:]!r}")
    return ok


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la clé")
    ap.add_argument("--check", metavar="KEY", nargs="?", const="AA-DA",
                    help="teste la clé sous wine")
    a = ap.parse_args()
    if a.check:
        sys.exit(0 if check(a.check) else 1)
    k = "AA-DA"
    print(k if a.q else f"magic number = {MAGIC}\nactivation key = {k}\n(toute clé XY-ZW avec Z-Y=3 convient, {sum(1 for _ in keys())} au total)")
