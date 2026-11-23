#!/usr/bin/env python3
"""karity-crackme-E : mate en 3 (blancs) depuis 5r1k/5Npp/4Q3/8/8/8/8/6K1.

Entrée = 20 caractères : 7 de remplissage libre + 3 coups UCI (4 car. chacun) + 1 de remplissage.
Usage : karity-solve.py [-q] [--check] [--pad petik]   (pas de username dans ce crackme)
"""
import argparse, os, shutil, subprocess, sys

MOVES = ["f7h6", "e6g8", "h6f7"]   # Nh6+ Kh8 / Qg8+ Rxg8 / Nf7#

def build(pad="petik"):
    pre = (pad + "_" * 7)[:7]
    s = pre + "".join(MOVES) + "!"
    assert len(s) == 20
    return s

def check(s):
    exe = os.path.join(os.path.dirname(__file__), "..", "original", "karity-crackme-E.exe")
    cmd = ["wine", exe]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    out = subprocess.run(cmd, input=s + "\n", capture_output=True, text=True, timeout=60).stdout
    return "good!" in out, out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie contre le binaire (wine)")
    ap.add_argument("--pad", default="petik")
    a = ap.parse_args()
    s = build(a.pad)
    print(s if a.q else f"Réponse : {s}")
    if a.check:
        ok, out = check(s)
        print("OK (good!)" if ok else "KO : " + out.strip())
        ko, _ = check(s.replace("e6g8", "e6e7"))
        print("KO attendu sur coup invalide :", "bad!" if not ko else "ERREUR")
        sys.exit(0 if ok and not ko else 1)
