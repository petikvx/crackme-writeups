#!/usr/bin/env python3
"""PassMe / Korrect.exe (servitute, crackmes.de) — mot de passe `esistgut` (pas de user : petik sans objet).

strcmp(input, "esistgut") @0x401310 (après dépack eXPressor) ; Yes! si égal.

  passme-solve.py [-q] [--check] [exe]
  --check : lance l'exe (Wine/xvfb) avec le bon mot, un faux, un préfixe, une casse différente
"""
import argparse, os, shutil, subprocess, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "PassMe.zip")
PASSWORD = "esistgut"


def run(exe, word):
    cmd = ["wine", exe]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    return subprocess.run(cmd, input=word + "\n", capture_output=True, text=True, timeout=60).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if not a.check:
        print(PASSWORD if a.q else f"Mot de passe : {PASSWORD}")
        return
    exe = a.exe
    if not exe:
        tmp = tempfile.mkdtemp()
        with zipfile.ZipFile(ZIP) as z:
            z.extract("Korrect.exe", tmp)
        exe = os.path.join(tmp, "Korrect.exe")
    ok = True
    for w, want in [(PASSWORD, "Yes!"), ("nope", "Try again"), ("esistgu", "Try again"),
                    ("esistgutX", "Try again"), ("ESISTGUT", "Try again")]:
        good = want in run(exe, w)
        ok &= good
        print(f"{'OK ' if good else 'BAD'} {w!r} -> {want}")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()
