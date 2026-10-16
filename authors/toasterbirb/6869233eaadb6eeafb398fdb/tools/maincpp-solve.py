#!/usr/bin/env python3
"""toasterbirb — main.cpp : polyglotte bash/C++. Décode le « magic_spell » base64 (l'octet 0xe5 corrompu = '2')
et en tire le mot de passe + la ligne de commande qui affiche « correct!! ».

Le script décodé fait : sed 's/extra_secret_password/even_more_secure_password/' | g++ ... ; refuse $# == 3 ; lance ./$out $3
=> il faut >= 4 arguments avec $3 = mot de passe.
Usage : maincpp-solve.py [-q] [--check]
"""
import argparse, base64, re, shutil, subprocess, sys, tempfile
from pathlib import Path

SRC = next((Path(__file__).resolve().parent.parent / "original").glob("*"))
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()

raw = SRC.read_bytes().split(b"\n")[1]
spell = re.search(rb'magic_spell="(.*)"', raw).group(1)
spell = re.sub(rb"[^A-Za-z0-9+/=!]", b"2", spell).replace(b"!", b"")   # le bash remplace ce caractère par '2'
script = base64.b64decode(spell).decode()
pw = re.search(r"s/extra_secret_password/(\w+)/", script).group(1)
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
print(f"commande : bash main.cpp a b {pw} d")
if a.check:
    with tempfile.TemporaryDirectory() as t:
        shutil.copy(SRC, Path(t) / "main.cpp")
        run = lambda *args: subprocess.run(["bash", "main.cpp", *args], cwd=t, capture_output=True, text=True).stdout.strip()
        ok, ko, ko3 = run("a", "b", pw, "d"), run("a", "b", "c", "d"), run("a", "b", pw)
    print("OK:", ok, "| KO:", ko, "|", ko3, "(3 args)")
    sys.exit(0 if ok == "correct!!" and ko == ko3 == "wrong..." else 1)
