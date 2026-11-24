#!/usr/bin/env python3
"""Ploxied's Calculator : déchiffre les chaînes de .data (XOR 0x67) et
affiche les clés de licence acceptées. --check les teste via Wine.

  python3 -I tools/ploxied-calc-solve.py [-q] [--check]
"""
import argparse, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "crackme.exe")
DATA_VA, DATA_OFF = 0xCB000, 0xC9C00          # .data : VA -> offset fichier
# (VA, longueur incluant le NUL) des blobs chiffrés XOR 0x67
BLOBS = {"icrackedit": (0xCB050, 12), "calc": (0xCB020, 0x21),
         "veryhard": (0xCB0A0, 0x13)}


def keys():
    d = open(EXE, "rb").read()
    out = []
    for va, n in BLOBS.values():
        o = va - DATA_VA + DATA_OFF
        out.append(bytes(b ^ 0x67 for b in d[o:o + n]).rstrip(b"\0").decode())
    return out


def check(k):
    r = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=f"{k}\n2\n2\n+\nn\n",
                       capture_output=True, text=True, timeout=60)
    return "[+] Access granted!" in r.stdout


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="sortie : clé principale seule")
    ap.add_argument("--check", action="store_true", help="vérifie sous Wine")
    a = ap.parse_args()
    ks = keys()
    if a.q:
        print(ks[2])
    else:
        for k in ks:
            print(k)
    if a.check:
        ok = True
        for k in ks + ["x"]:
            g = check(k)
            print(f"{k!r}: {'granted' if g else 'wrong'}", file=sys.stderr)
            ok &= g == (k != "x")
        sys.exit(0 if ok else 1)
