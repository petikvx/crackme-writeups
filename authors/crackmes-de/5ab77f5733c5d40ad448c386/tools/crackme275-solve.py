#!/usr/bin/env python3
"""CRaCKMe v2.75 (BuLLeT / TOL'98, VB5) : mot de passe reconstruit par Mid$ / concaténation.

Usage:
  crackme275-solve.py [-q] [--check]
  -q       n'affiche que le mot de passe
  --check  preuve live : Wine + Xvfb + xdotool (textbox -> « BuL_LeT@hotmail.com »)
Pas de nom/login dans ce crackme (donc pas de `petik` : il sert de mauvaise entrée).
Ne touche jamais à original/ (lit le zip, extrait sous analysis/x/ pour --check).
"""
import argparse, os, subprocess, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "tol_b275.zip")
PWD_ZIP = b"crackmes.one"
VA_A, VA_B = 0x401A04, 0x401A94   # BSTR UTF-16 constantes de Command1_Click
FILE_OFF = 0x400 - 0x401000       # VA -> offset fichier (.text)


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("B-CRKME2.EXE", pwd=PWD_ZIP)


def bstr(pe, va):
    o = va + FILE_OFF
    n = int.from_bytes(pe[o - 4:o], "little")        # préfixe longueur en octets
    return pe[o:o + n].decode("utf-16le")


def mid(s, start, n):                                # Mid$ VB : début 1-based
    return s[start - 1:start - 1 + n]


def solve():
    pe = load_exe()
    a, b = bstr(pe, VA_A), bstr(pe, VA_B)
    # ordre de concaténation vu dans les __vbaVarAdd (opérandes empilés droite -> gauche)
    return (mid(a, 2, 4) + mid(b, 5, 3) + "-" + mid(a, 12, 5)
            + mid(b, 0x17, 5) + mid(a, 0x17, 6) + mid(a, 0x25, 3))


def check(pw):
    script = os.path.join(HERE, "wine-live-test.sh")
    ax = os.path.join(HERE, "..", "analysis", "x")
    os.makedirs(ax, exist_ok=True)
    open(os.path.join(ax, "B-CRKME2.EXE"), "wb").write(load_exe())
    for txt, name in ((pw, "screenshot-ok.png"), ("petik", "screenshot-ko.png")):
        subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", "bash",
                        script, txt, name],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=90)
    print("captures régénérées : analysis/screenshot-ok.png (attendu textbox BuL_LeT@hotmail.com,"
          " bouton « Contact: ») et screenshot-ko.png (attendu « Nope. That's not the one! »)")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"Mot de passe : {pw}")
    if a.check:
        check(pw)
