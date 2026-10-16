#!/usr/bin/env python3
"""idanhajbeko — babyFirstCrackme : main.exe fait strcmp(saisie, .rodata+0x1f) puis getFlag().

Lit main.exe dans le zip d'origine. Usage : babyfirst-solve.py [-q] [--check]
"""
import argparse, subprocess, sys, tempfile, zipfile
from pathlib import Path

ZIP = next((Path(__file__).resolve().parent.parent / "original").glob("*.zip"))
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
z = zipfile.ZipFile(ZIP)
exe_bytes = z.read("babyFirstCrackme/main.exe")
off = 0x201F
pw = exe_bytes[off:exe_bytes.index(b"\0", off)].decode()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    with tempfile.TemporaryDirectory() as t:
        exe = Path(t) / "main.exe"; exe.write_bytes(exe_bytes); exe.chmod(0o755)
        # sur EOF le binaire reboucle : on borne la sortie
        ok = subprocess.run([str(exe)], input=pw + "\n", capture_output=True, text=True, timeout=5).stdout
        try:
            ko = subprocess.run([str(exe)], input="wrong\n", capture_output=True, text=True, timeout=2).stdout
        except subprocess.TimeoutExpired as e:
            ko = (e.stdout or b"").decode() if isinstance(e.stdout, bytes) else (e.stdout or "")
    good = "you did it that was easy" in ok and "incorrect" in ko
    print("OK:", "you did it that was easy" in ok, "| KO:", "incorrect" in ko)
    sys.exit(0 if good else 1)
