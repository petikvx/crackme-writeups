#!/usr/bin/env python3
"""UTW KeyGenMe v3 (otromasf) -- keygen name -> serial.

  serial = str(A) + str(B)
  A = len(name) + 2*Asc(name[0]) * Asc(name[0])      (Integer VB 16 bits, overflow = erreur)
  B = len(name) * 2000                                (Integer VB 16 bits)

  python3 utw-kgmv3-solve.py                 # name par défaut : petik
  python3 utw-kgmv3-solve.py --name foo
  python3 utw-kgmv3-solve.py -q              # serial seul
  python3 utw-kgmv3-solve.py --check ZIP|EXE # preuve Wine/Xvfb (xdotool) : OK + KO
"""
import argparse, os, subprocess, sys, tempfile, zipfile


def serial(name):
    if not name:
        sys.exit("name vide : Asc('') lève une erreur VB")
    c = ord(name[0])
    n = len(name)
    a = n + 2 * c * c
    b = n * 2000
    if c > 127 or a > 32767 or b > 32767:
        sys.exit("hors contrainte Integer 16 bits (1er car. ASCII <= 127, len <= 16, ...)")
    return f"{a}{b}"


def check(path, name):
    here = os.path.dirname(os.path.abspath(__file__))
    with tempfile.TemporaryDirectory() as d:
        exe = path
        if path.lower().endswith(".zip"):
            zipfile.ZipFile(path).extract("UTW KGMv3.exe", d, pwd=None)
            exe = os.path.join(d, "UTW KGMv3.exe")
        for label, key in (("OK", serial(name)), ("KO", "1234567890")):
            png = os.path.join(here, "..", "analysis", f"screenshot-{label.lower()}.png")
            out = subprocess.run(["bash", os.path.join(here, "wine-drive.sh"), exe, name, key, png],
                                 capture_output=True, text=True, timeout=120).stdout
            boxes = out.split("|").count("UTW KeyGenMe ") + out.split("|").count("UTW KeyGenMe")
            print(f"{name!r} {key!r} -> {'MessageBox (OK)' if boxes >= 2 else 'rien (KO)'}   [{out.strip()}]")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="ZIP|EXE")
    a = ap.parse_args()
    if a.check:
        check(a.check, a.name)
    elif a.q:
        print(serial(a.name))
    else:
        print(f"Name  : {a.name}\nSerial: {serial(a.name)}")
