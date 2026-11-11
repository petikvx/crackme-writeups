#!/usr/bin/env python3
"""Keygen « Simple Java Verify » (alogen) : clé de 8 caractères, préfixe "77", suffixe "1".

Usage : alogen-solve.py [--user petik] [-q] [--check]
  --check : extrait le crackme (ZIP crackmes.one -> APK -> classes.dex), relit les
            constantes de checkLicense dans le dex et rejoue le prédicat.
"""
import argparse, re, sys, zipfile, io, pathlib

LEN, PREFIX, SUFFIX = 8, "77", "1"

def keygen(user="petik"):
    mid = "".join(c for c in user if c.isalnum())[: LEN - len(PREFIX) - len(SUFFIX)]
    mid = mid.ljust(LEN - len(PREFIX) - len(SUFFIX), "0")
    return PREFIX + mid + SUFFIX

def predicate(k):  # miroir de MainActivity.checkLicense
    return len(k) == LEN and k.startswith(PREFIX) and k.endswith(SUFFIX)

def dex_constants():
    here = pathlib.Path(__file__).resolve().parent.parent / "original" / "download.bin"
    z = zipfile.ZipFile(here); z.setpassword(b"crackmes.one")
    apk = zipfile.ZipFile(io.BytesIO(z.read(z.namelist()[0])))
    dex = apk.read("classes.dex")
    # chaînes du dex (MUTF-8 préfixées par leur longueur) : "77", "1" présentes
    strs = set(re.findall(rb"[\x01-\x7f]{1,16}\x00", dex))
    return dex, strs

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.user)
    if a.check:
        dex, strs = dex_constants()
        assert b"\x02" + b"77\x00" in dex and b"\x01" + b"1\x00" in dex, "constantes absentes"
        assert b"Access Granted" in dex and b"checkLicense" in dex
        assert predicate(k) and not predicate("77petik2") and not predicate("77petik")
        print("OK dex + prédicat", file=sys.stderr)
    print(k if a.q else f"user={a.user} -> clé = {k}")
