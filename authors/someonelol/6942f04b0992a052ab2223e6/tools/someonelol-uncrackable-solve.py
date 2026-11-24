#!/usr/bin/env python3
"""Solveur SomeoneLol [INSANELY HARD] Uncrackable.exe : la clé est une chaîne XOR 0x5a (pas de user)."""
import argparse, struct, subprocess, sys

# immediates LE copiés depuis main (0x140001ef7..0x140001f1a), 22 octets
DWORDS = [0x08190513, 0x1f11191b, 0x0e13051e, 0x686a6805, 0x1516056f]
WORD = 0x7b16
LEN = 22

def key():
    raw = b"".join(struct.pack("<I", d) for d in DWORDS) + struct.pack("<H", WORD)
    return bytes(c ^ 0x5a for c in raw[:LEN]).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la clé")
    ap.add_argument("--check", metavar="EXE", help="lance xvfb-run wine EXE avec la clé")
    a = ap.parse_args()
    k = key()
    print(k if a.q else f"Clé : {k}")
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=k + "\n",
                             capture_output=True, text=True, timeout=60).stdout
        print(out)
        sys.exit(0 if "Success" in out else 1)

if __name__ == "__main__":
    main()
