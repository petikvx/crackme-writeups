#!/usr/bin/env python3
"""Solveur kretrod's my first password crackme.

Extrait le mot de passe (20 octets, .text VA 0x140002360) du PE d'origine.
  --check : lance original/my-first-crackme.exe sous Wine (xvfb-run) et vérifie CORRECT!!
  -q      : n'affiche que le mot de passe
"""
import argparse, os, struct, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "my-first-crackme.exe")
VA, LEN = 0x140002360, 0x14


def extract():
    d = open(EXE, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    base = struct.unpack_from("<Q", d, pe + 0x30)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    sec = pe + 24 + opt
    rva = VA - base
    for i in range(nsec):
        vsz, vrva, rsz, roff = struct.unpack_from("<IIII", d, sec + 40 * i + 8)
        if vrva <= rva < vrva + rsz:
            o = roff + rva - vrva
            return d[o:o + LEN].decode()
    sys.exit("section introuvable")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = extract()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        for cand, want in ((pw, "CORRECT"), (pw[:-1] + "5", "WRONG")):
            out = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=cand + "\n",
                                 capture_output=True, text=True, timeout=60).stdout
            ok = want in out
            print(f"{cand}: {'OK' if ok else 'KO'} ({want})")
            if not ok:
                sys.exit(1)


if __name__ == "__main__":
    main()
