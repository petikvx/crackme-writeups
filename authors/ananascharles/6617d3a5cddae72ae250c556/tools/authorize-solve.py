#!/usr/bin/env python3
"""AnanasCharles — Authorize by PIN (authorize) : PIN de 4 chiffres + flag décodé avec le PIN comme clé.

main @0x1380 : argc == 2 ; decoded = decode_pin(argv[1]) ; strncmp(decoded, "8446", 4) == 0 ; strlen(argv[1]) == strlen(decoded) (4)
decode_pin @0x1238 : pour 4 octets : d = c - 0x35 ; si d < 0 : d += 10 ; out = d + 0x30      (chiffre décalé de -5 mod 10)
=> PIN = chaque chiffre de "8446" + 5 mod 10 = "3991".
decode_string @0x129d : enc[i] - key[i % len(key)] (key = argv[1] = le PIN saisi) ; si le résultat sort de [0x20,0x7e] :
                        ((r + 0x3f) % 0x5f) + 0x20.
Usage : authorize-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "authorize"
d = EXE.read_bytes()


def cstr(off: int) -> bytes:
    return d[off:d.index(b"\0", off)]


target = cstr(0x2015)                         # "8446"
enc = cstr(0x2041)                            # chaîne encodée du flag
pin = "".join(chr((ord(c) - 0x30 + 5) % 10 + 0x30) for c in target.decode())


def decode_string(enc: bytes, key: str) -> str:
    out = ""
    for i, c in enumerate(enc):
        r = c - ord(key[i % len(key)])
        if not 0x1F < r <= 0x7E:
            r = (r + 0x3F) % 0x5F + 0x20
        out += chr(r)
    return out


flag = decode_string(enc, pin)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pin); sys.exit(0)
print(f"cible decode_pin = {target.decode()}  ->  PIN = {pin}\nflag = {flag}")
if a.check:
    run = lambda *x: subprocess.run([str(EXE), *x], capture_output=True, text=True).stdout
    ok, ko, ko5, ko3 = run(pin), run(target.decode()), run(pin + "0"), run(pin[:3])
    good = ("Correct PIN entered!" in ok and f"Decoded String: {flag}" in ok
            and all("This is not right" in k for k in (ko, ko5, ko3)))
    print("OK:", good)
    sys.exit(0 if good else 1)
