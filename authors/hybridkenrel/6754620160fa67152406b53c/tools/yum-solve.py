#!/usr/bin/env python3
"""hybridkenrel — yum :P : la clé = les 31 octets qui suivent le PREMIER octet 0xde dans libyum.so.

Fonction get_key @0x2567e5 (binaire statique strippé) : fread(libyum.so, 0x64) ; pour i in 0..99 :
si (0xde déjà vu) copier file[i] dans key[] (max 0x1f) ; puis si file[i] == 0xde -> drapeau.  key[31] = 0.
main @0x256aa3 : cin >> input ; std::string == key (@0x256e30) -> "Success!" sinon "try again".
Le programme lit ./libyum.so : lancer depuis le dossier qui le contient.
Usage : yum-solve.py [-q] [--check]
"""
import argparse, subprocess, sys, tempfile, zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "yum.zip"
z = zipfile.ZipFile(ZIP)
lib = z.read("libyum.so")[:0x64]
i = lib.index(b"\xde")
key = lib[i + 1:i + 1 + 31].decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(key); sys.exit(0)
print(f"0xde à l'offset {i:#x} dans libyum.so ; key = {key}")
if a.check:
    with tempfile.TemporaryDirectory() as t:
        for n in ("yum", "libyum.so"):
            (Path(t) / n).write_bytes(z.read(n))
        (Path(t) / "yum").chmod(0o755)
        run = lambda s: subprocess.run(["./yum"], cwd=t, input=s + "\n", capture_output=True, text=True, timeout=10).stdout.strip().splitlines()[-1]
        ok, ko = run(key), run("test")
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if ok.endswith("Success!") and ko.endswith("try again") else 1)
