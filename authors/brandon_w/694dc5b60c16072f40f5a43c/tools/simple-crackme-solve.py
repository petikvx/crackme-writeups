#!/usr/bin/env python3
"""brandon_w's simple windows crackme — solveur.

Le binaire XOR chaque octet de l'entrée avec de^ad^be^ef = 0x22 puis strcmp
avec "password". Mot de passe = "password" XOR 0x22.

Usage: simple-crackme-solve.py [-q] [--check EXE]
(pas de user/login : le crackme n'en demande pas ; pour mémoire petik n'est pas utilisé)
"""
import argparse, subprocess, sys

TARGET = b"password"                      # .rdata 0x1400032d0
KEY = 0xDE ^ 0xAD ^ 0xBE ^ 0xEF           # 0x22 (boucle de 4 shr/xor sur 0xdeadbeef)

def solve() -> str:
    return bytes(b ^ KEY for b in TARGET).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe via wine (xvfb-run) et vérifie")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"Password : {pw}  (key=0x{KEY:02x})")
    if a.check:
        for cand, exp in ((pw, b"Correct!"), ("petik", b"Incorrect")):
            r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=(cand + "\r\n").encode(),
                               capture_output=True, timeout=120)
            ok = exp in r.stdout
            print(f"{cand!r}: {'OK' if ok else 'KO'} -> {r.stdout.decode(errors='replace').strip()[-60:]!r}")
            if not ok:
                sys.exit(1)

if __name__ == "__main__":
    main()
