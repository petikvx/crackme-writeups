#!/usr/bin/env python3
"""SimbaHDD's very easy crackme (.NET) — extrait le mot de passe du #US heap.

Usage:
  very-easy-solve.py [-q] [--check]
  -q       : n'affiche que le password
  --check  : rejoue le binaire via le host `dotnet` (si dispo) et vérifie CORRECT
"""
import argparse, io, os, re, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")


def load_exe():
    z = zipfile.ZipFile(ORIG)
    return z.read("CRACKME.exe", pwd=b"crackmes.one")


def password(exe):
    """Le #US heap contient les littéraux UTF-16 ; le mot de passe est celui
    qui suit le prompt « Enter password: » (comparaison string == littéral)."""
    s = [m.group().decode("utf-16le")
         for m in re.finditer(rb"(?:[\x20-\x7e]\x00){3,}", exe)]
    i = s.index("Enter password: ")
    return s[i + 1]


def check(exe, pw):
    dn = shutil.which("dotnet") or os.path.expanduser("~/.dotnet/dotnet")
    if not os.path.exists(dn):
        print("dotnet absent : --check ignoré", file=sys.stderr); return None
    out = subprocess.run([dn, "--list-runtimes"], capture_output=True, text=True).stdout
    name, ver = [l.split()[:2] for l in out.splitlines() if l.startswith("Microsoft.NETCore.App")][-1]
    with tempfile.TemporaryDirectory() as t:
        open(os.path.join(t, "CRACKME.exe"), "wb").write(exe)
        open(os.path.join(t, "CRACKME.runtimeconfig.json"), "w").write(
            '{"runtimeOptions":{"framework":{"name":"%s","version":"%s"}}}' % (name, ver))
        res = {}
        for p in (pw, "wrong"):
            r = subprocess.run([dn, os.path.join(t, "CRACKME.exe")], input=p + "\n",
                               capture_output=True, text=True)
            res[p] = "CORRECT" in r.stdout
    return res[pw] and not res["wrong"]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe = load_exe()
    pw = password(exe)
    print(pw if a.q else f"password = {pw}")
    if a.check:
        ok = check(exe, pw)
        print("check:", {True: "OK", False: "KO", None: "n/a"}[ok])
        sys.exit(0 if ok is not False else 1)
