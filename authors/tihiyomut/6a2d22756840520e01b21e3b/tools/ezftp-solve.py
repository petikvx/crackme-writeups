#!/usr/bin/env python3
"""EZFTP_ByTOMUT (TihiyOmut) : extrait le mot de passe en dur du .NET.

Usage:
  ezftp-solve.py [-q] [--check [EXE]]
Le crackme n'a pas de champ user (aucun `petik` à dériver) : le password est constant.
--check : lance l'exe (dotnet + runtimeconfig temporaire, ou wine/mono si dispo) avec le
          password trouvé et un mauvais, et vérifie les messages.
"""
import argparse, os, re, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
DL = os.path.join(ROOT, "original", "download.bin")


def extract_exe(dest):
    outer = zipfile.ZipFile(DL)
    inner = zipfile.ZipFile(__import__("io").BytesIO(
        outer.read(outer.infolist()[0], pwd=b"crackmes.one")))
    name = [i for i in inner.infolist() if i.filename.endswith(".exe")][0]
    path = os.path.join(dest, "crack.exe")
    open(path, "wb").write(inner.read(name))
    return path


def find_password(exe):
    # #US heap : littéraux UTF-16LE ; le password est celui comparé via op_Equality
    data = open(exe, "rb").read()
    lits = [s.decode("utf-16le") for s in re.findall(rb"(?:[\x20-\x7e]\x00){6,}", data)]
    for s in lits:
        if re.fullmatch(r"\w+_Secret_\d{4}", s):
            return s
    raise SystemExit("password introuvable")


def run(exe, pw):
    with tempfile.TemporaryDirectory() as t:
        shutil.copy(exe, t + "/c.exe")
        d = os.path.expanduser("~/.dotnet")
        v = sorted(os.listdir(d + "/shared/Microsoft.NETCore.App"))[-1]
        open(t + "/c.runtimeconfig.json", "w").write(
            '{"runtimeOptions":{"tfm":"net8.0","framework":{"name":"Microsoft.NETCore.App","version":"%s"}}}' % v)
        return subprocess.run([d + "/dotnet", t + "/c.exe"], input=pw + "\n\n",
                              capture_output=True, text=True, timeout=60).stdout


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    with tempfile.TemporaryDirectory() as t:
        exe = extract_exe(t)
        pw = find_password(exe)
        print(pw if a.q else f"Password : {pw}")
        if a.check:
            ok = "good boy" in run(exe, pw)
            ko = "bro r u serious" in run(exe, "petik")
            print("OK:", ok, "KO(petik):", ko)
            sys.exit(0 if ok and ko else 1)
