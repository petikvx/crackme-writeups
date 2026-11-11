#!/usr/bin/env python3
"""SimbaHDD's easy crackme (.NET) — le binaire compare base64(UTF8(input)) à un littéral.

Usage:
  easy-solve.py [-q] [--check]
  -q       : n'affiche que le password
  --check  : rejoue le binaire via le host `dotnet` et vérifie CORRECT / WRONG
"""
import argparse, base64, os, re, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")


def load_exe():
    return zipfile.ZipFile(ORIG).read("crack_me.exe", pwd=b"crackmes.one")


def password(exe):
    """Littéral base64 = chaîne UTF-16 du #US juste avant « Enter password: »."""
    s = [m.group().decode("utf-16le")
         for m in re.finditer(rb"(?:[\x20-\x7e]\x00){3,}", exe)]
    i = s.index("Enter password: ")
    lit = s[i - 1].lstrip("1")  # l'octet de longueur (0x31) est imprimable -> collé
    if len(lit) % 4:
        lit = s[i - 1][1:]
    return base64.b64decode(lit).decode()


def check(exe, pw):
    dn = shutil.which("dotnet") or os.path.expanduser("~/.dotnet/dotnet")
    if not os.path.exists(dn):
        print("dotnet absent : --check ignoré", file=sys.stderr); return None
    out = subprocess.run([dn, "--list-runtimes"], capture_output=True, text=True).stdout
    name, ver = [l.split()[:2] for l in out.splitlines() if l.startswith("Microsoft.NETCore.App")][-1]
    with tempfile.TemporaryDirectory() as t:
        open(os.path.join(t, "crack_me.exe"), "wb").write(exe)
        open(os.path.join(t, "crack_me.runtimeconfig.json"), "w").write(
            '{"runtimeOptions":{"framework":{"name":"%s","version":"%s"}}}' % (name, ver))
        res = {}
        for p in (pw, "petik"):
            r = subprocess.run([dn, os.path.join(t, "crack_me.exe")], input=p + "\n",
                               capture_output=True, text=True)
            print(f"  {p!r}: {r.stdout.strip()!r}", file=sys.stderr)
            res[p] = "CORRECT" in r.stdout
    return res[pw] and not res["petik"]


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
