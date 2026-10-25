#!/usr/bin/env python3
"""CrackMe2 (kcom, key_check_crackme) : name -> serial (octets bruts, non imprimables).

serial = ("AKCOM-L434" + name + "022LACD")[i] ^ ((int8)KEY[i % 15] + 1)
KEY = bf a6 f6 c6 f9 ff a6 a2 a9 83 b2 b0 ad ab ea  (.data 0x403000, strlen = 15)
name >= 8 caracteres, serial >= 8 octets.

Usage : key-check-crackme-solve.py [-q] [--name petikpetik] [--check CrackMe2.exe harness.exe]
"""
import argparse, subprocess, sys

KEY = bytes.fromhex("bfa6f6c6f9ffa6a2a983b2b0adabea")


def serial(name: str) -> bytes:
    # wsprintfA(buf, fmt, buf) : source == destination ! Le préfixe écrase
    # name[0:10] avant que %s soit lu -> l'argument devient PFX + name[10:]
    # (nom >= 10 caractères obligatoire pour un résultat déterministe).
    PFX = "AKCOM-L434"
    arg = PFX + name[10:]
    s = (PFX + arg + "022LACD").encode("latin1")
    out = bytearray()
    for i, c in enumerate(s):
        k = KEY[i % len(KEY)]
        k = k - 256 if k > 127 else k          # movsx
        out.append(c ^ ((k + 1) & 0xFF))
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="petikpetik")
    ap.add_argument("--check", nargs=2, metavar=("EXE", "HARNESS"),
                    help="CrackMe2.exe + harness.exe (tools/harness.c) sous xvfb-run wine")
    a = ap.parse_args()
    if len(a.name) < 10:
        sys.exit("nom >= 10 caractères requis (>= 8 pour le crackme, >= 10 pour wsprintf in-place)")
    ser = serial(a.name)
    if a.q:
        print(ser.hex())
    else:
        print(f"name   : {a.name}\nserial : {ser.hex()}  (hex, octets bruts)")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check[1], a.check[0], a.name, ser.hex()],
                           capture_output=True, text=True, timeout=90)
        print(r.stdout.strip())


if __name__ == "__main__":
    sys.exit(main())
