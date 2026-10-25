#!/usr/bin/env python3
"""cm01 (cyriel, crackmes.de) — mot de passe fixe de 13 caractères.

Résout les 9 contraintes de 0x401060 et rejoue le résultat.
  python3 tools/cm01-solve.py          # affiche le mot de passe
  python3 tools/cm01-solve.py -q       # mot de passe seul
  python3 tools/cm01-solve.py --check  # preuve : Wine/xvfb sur l'exe extrait de original/cm01.zip
(pas d'utilisateur : le crackme ne demande qu'un mot de passe, pas de `petik`)
"""
import argparse, os, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "cm01.zip")


def solve() -> str:
    p = [0] * 13
    p[0:6] = b"1337cr"                      # cmp 6 premiers octets @0x4010c0
    p[6] = p[0] + 0x30                      # p6 - p0 == 0x30
    p[8] = 0xDD - p[5]                      # (p8+p5) % 0x9c == 0x41 (branche 0xdd)
    p[9] = p[1] + p[0] + 1                  # p9 == p1+p0+1
    p[10] = p[9] + 0x0D                     # p10 == p9+13
    p[11] = p[5] - p[3]                     # p5 % p11 == p3  (114 % 59 == 55)
    p[12] = (p[2] - p[0]) * p[0] - 5        # p12 == (p2-p0)*p0 - 5
    p[7] = p[6] + ((p[11] - p[3]) >> 1)     # p7 - p6 == (p11-p3)/2
    # reste : p9 - p4/p7 - p2 == 0x31  et  somme == 0x441
    assert p[9] - p[4] // p[7] - p[2] == 0x31
    assert sum(p) == 0x441
    return bytes(p).decode()


def check(pw: str) -> bool:
    with tempfile.TemporaryDirectory() as d:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(d, pwd=b"crackmes.one")
        exe = os.path.join(d, "cm01.exe")
        out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=pw + "\n",
                             capture_output=True, text=True, timeout=120).stdout
    print(out)
    return "Well done :)" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        ok = check(pw)
        bad = check(pw[:-1] + "X")
        print("OK" if ok and not bad else "ECHEC"); sys.exit(0 if ok and not bad else 1)
