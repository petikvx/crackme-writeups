#!/usr/bin/env python3
"""Keygen/solveur koboldschwaengel's Medium (crackme.exe, PE64).

Mot de passe (7 octets, non ASCII) : ref[i] ^ clé[i], ref="pass123",
clé = 0xdead >> (8*(i&1)) (octet bas) : 0xad pour i pair, 0xde pour i impair.

  koboldschwaengel-medium-solve.py            # affiche hex + écrit les octets (-q)
  koboldschwaengel-medium-solve.py --check EXE   # lance sous wine et vérifie "Correct!"
"""
import argparse, subprocess, sys

REF = b"pass123"

def password() -> bytes:
    return bytes(c ^ ((0xDEAD >> (8 * (i & 1))) & 0xFF) for i, c in enumerate(REF))

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="écrit les octets bruts sur stdout")
    ap.add_argument("--check", metavar="EXE", help="exécute EXE (xvfb-run -a wine) avec le mot de passe")
    a = ap.parse_args()
    pw = password()
    if a.q:
        sys.stdout.buffer.write(pw); return
    print("password hex:", pw.hex(), "| repr:", pw)
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + b"\r\n",
                             capture_output=True, timeout=120).stdout.decode("latin1")
        print(out)
        sys.exit(0 if "Correct!" in out else 1)

if __name__ == "__main__":
    main()
