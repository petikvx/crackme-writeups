#!/usr/bin/env python3
"""CrackIt;) (QERR0R) -- flag en dur.

main() reconstruit la chaine attendue en concatenant 11 litteraux C
("CTF{", "My_", "S3c", ...) stockes en .rodata et reference par un tableau de
pointeurs (stru_3D98 - 11*8 .. stru_3D98), compare argv[1] a la chaine
concatenee via memcmp. Aucun chiffrement ni calcul -- juste un decoupage pour
gener un strings/dump rapide.

Usage : crackit-solve.py [-q] [--check BINAIRE]
"""
import argparse
import subprocess

PARTS = [
    b"CTF{", b"My_", b"S3c", b"r3t_", b"Fl4g", b"}W0W",
    b"Y0u", b"F0und", b"M3", b"{0r ", b"N0t}",
]


def flag() -> str:
    return b"".join(PARTS).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    f = flag()
    if a.check:
        r = subprocess.run([a.check, f], capture_output=True, text=True)
        print(f"{f}\n{r.stdout.strip()}")
        return
    print(f if a.q else f"flag = {f!r}")


if __name__ == "__main__":
    main()
