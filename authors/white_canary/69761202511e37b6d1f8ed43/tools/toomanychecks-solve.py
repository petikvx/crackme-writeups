#!/usr/bin/env python3
"""TooManyChecks (White_Canary) : reconstruit le flag depuis le binaire d'origine.

Le flag est assemblé à l'exécution à partir de 18 std::string (decoys « instructions »
+ fragments). On relit ces chaînes dans .rdata et on applique les indices du ctor 0x140008090.
Usage : toomanychecks-solve.py [-q] [--check] [--exe PATH]
"""
import argparse, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "TooManyChecks.exe")
IMG = 0x140000000
# (index de string dans le tableau obj+0x98, nb de caractères pris) dans l'ordre de concat
PARTS = [(4, 1), (13, 1), (1, 2), (6, 8), (8, 2), (10, 5)]
# RVA .rdata des 18 strings (lea rdx dans 0x1400038c0, dans l'ordre)
ADDRS = [0x140026cf0, 0x140026cfc, 0x140026d00, 0x140026d0c, 0x140026d10, 0x140026d18,
         0x140026d30, 0x140026d40, 0x140026d50, 0x140026d58, 0x140026d68, 0x140026d70,
         0x140026d78, 0x140026d84, 0x140026d90, 0x140026da0, 0x140026db0, 0x140026dc0]


def flag(exe):
    d = open(exe, "rb").read()
    base = 0x25400 - 0x140026000  # .rdata : file = VA + base
    def cstr(a):
        o = a + base
        return d[o:d.index(b"\0", o)]
    S = [cstr(a) for a in ADDRS]
    return b"".join(S[i][:n] for i, n in PARTS).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="teste via wine")
    ap.add_argument("--exe", default=EXE)
    a = ap.parse_args()
    f = flag(a.exe)
    print(f if a.q else "flag = " + f)
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.exe], input=f + "\n",
                           capture_output=True, text=True, timeout=60)
        ok = "Congrat you won" in r.stdout
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)


main()
