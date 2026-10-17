#!/usr/bin/env python3
"""Jenya — nice_crackme : le mot de passe est une suite de blocs de 4 caractères, chacun de la forme xyyx (palindrome).

check_all(p) = (strlen(p) % 4 == 0) && pour chaque bloc de 4 : p[0]==p[3] && p[1]==p[2]   (source_code/main.c, vérifié sur le binaire)
Génération : le mot est découpé en paires de lettres ; chaque paire "xy" devient le bloc "xyyx" (petik -> pe|ti|kx -> peep tiit kxxk).
Usage : nice-solve.py [WORD] [-q] [--check]    (défaut : petik -> peeptiitkxxk)
"""
import argparse, subprocess, sys, tempfile, zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "nice_crackme.zip"


def make(word: str) -> str:
    """Un bloc xyyx par paire de lettres consécutives du mot (mot complété par 'x' si longueur impaire)."""
    w = word + ("x" if len(word) % 2 else "")
    return "".join(w[i] + w[i + 1] + w[i + 1] + w[i] for i in range(0, len(w), 2))


def check(p: str) -> bool:
    return len(p) % 4 == 0 and all(p[i] == p[i + 3] and p[i + 1] == p[i + 2] for i in range(0, len(p), 4))


ap = argparse.ArgumentParser()
ap.add_argument("word", nargs="?", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
pw = make(a.word)
assert check(pw)
if a.q:
    print(pw); sys.exit(0)
print(f"{a.word} -> {pw}  ({len(pw)} caractères, {len(pw)//4} blocs xyyx)")
if a.check:
    z = zipfile.ZipFile(ZIP)
    with tempfile.TemporaryDirectory() as t:
        exe = Path(t) / "main"; exe.write_bytes(z.read("nice_crackme/main")); exe.chmod(0o755)
        run = lambda s: subprocess.run([str(exe)], input=s + "\n", capture_output=True, text=True).stdout
        first = lambda o: o.replace("Enter password: ", "").splitlines()[0]
        ok = first(run(pw))
        ko = [first(run(x)) for x in ("abab", "abc", pw + "x")]
    print("OK:", ok, "| KO (abab, abc, +1 car.):", ko)
    sys.exit(0 if ok == "CORRECT!" and all(k == "WRONG number of attempt: 1" for k in ko) else 1)
