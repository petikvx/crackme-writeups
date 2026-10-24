#!/usr/bin/env python3
"""CrackmeV5 (logan) — keygen name -> serial.

Prédicat (CrackmeV50DLL.dll, export ?crap@@YA_NQAD0@Z @ RVA 0x1090) :
  len(name) == 5, len(serial) == 11 ; pour i = 0..4, c = name[i], ds = somme des
  chiffres décimaux de c :
      serial[i]   = c + ds - i
      serial[5]   = '-'
      serial[6+i] = c + ds - i - 6
Usage : crackmev5-solve.py [--name petik] [-q] [--check [dll]]
  --check : appelle le vrai ?crap@@YA_NQAD0@Z de la DLL d'origine sous Wine
            (harnais tools/crap-harness.c, compilé avec mingw).
"""
import argparse, os, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

def dsum(n):
    return sum(map(int, str(n)))

def keygen(name):
    if len(name) != 5:
        raise ValueError("le nom doit faire exactement 5 caractères")
    a, b = [], []
    for i, ch in enumerate(name):
        c = ord(ch)
        v = c + dsum(c) - i
        if not (0x20 <= v - 6 and v < 0x7f):
            raise ValueError(f"caractère {ch!r} -> serial non imprimable")
        a.append(chr(v)); b.append(chr(v - 6))
    return "".join(a) + "-" + "".join(b)

def check(name, serial, dll):
    exe = os.path.join(tempfile.mkdtemp(), "h.exe")
    subprocess.run(["i686-w64-mingw32-gcc", "-o", exe, os.path.join(HERE, "crap-harness.c")], check=True)
    r = subprocess.run(["xvfb-run", "-a", "wine", exe, dll, name, serial],
                       capture_output=True, text=True, timeout=120)
    return r.stdout.strip()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const=os.path.join(ROOT, "analysis/ex/CrackmeV50DLL.DLL"))
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name = {a.name}  serial = {s}")
    if a.check:
        out = check(a.name, s, a.check)
        bad = check(a.name, s[:-1] + chr(ord(s[-1]) ^ 1), a.check)
        print("valide :", out, "| serial altéré :", bad, file=sys.stderr)
        sys.exit(0 if out.endswith("1") and bad.endswith("0") else 1)
