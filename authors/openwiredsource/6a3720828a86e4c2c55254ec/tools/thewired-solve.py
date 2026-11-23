#!/usr/bin/env python3
"""OpenWiredSource's The Wired : extrait le mot de passe depuis le binaire.

Clé XOR = 12 octets lus à 0x2f6ca(4) 0x2f6ce(2) 0x2f6c4(4) 0x2f6c8(2) = b'.gnu.version'.
Mot de passe = blob @0x4120 (36 o) ^ clé cyclique.
Usage : thewired-solve.py [-q] [--check] [binaire]
"""
import argparse, os, subprocess, sys, tempfile, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT = os.path.join(HERE, "..", "original", "thewired")
OFF = 0x1000  # vaddr -> offset fichier pour le segment RW


def dec(d, va, n, key):
    b = d[va - OFF:va - OFF + n]
    return bytes(key[i % 12] ^ b[i] for i in range(n))


def solve(path):
    d = open(path, "rb").read()
    g = lambda va, n: d[va - OFF:va - OFF + n]
    key = g(0x2f6ca, 4) + g(0x2f6ce, 2) + g(0x2f6c4, 4) + g(0x2f6c8, 2)
    return dec(d, 0x4120, 36, key).rstrip(b"\0").decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("binary", nargs="?", default=DEFAULT)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="lance une copie du binaire")
    a = ap.parse_args()
    pw = solve(a.binary)
    print(pw if a.q else f"password = {pw}")
    if a.check:
        with tempfile.TemporaryDirectory() as t:  # le binaire écrit lain_is_here.png dans le cwd
            exe = os.path.join(t, "thewired")
            shutil.copy(a.binary, exe); os.chmod(exe, 0o755)
            for arg, want in ((pw, b"ACCESS GRANTED"), ("wrong", b"Incorrect Password")):
                o = subprocess.run([exe, arg], cwd=t, capture_output=True).stdout
                ok = want in o
                print(f"check {arg!r}: {'OK' if ok else 'KO'}")
                if not ok: sys.exit(1)


if __name__ == "__main__":
    main()
