#!/usr/bin/env python3
"""Keygen pour « Embrace RSA » (pietrogamer, crackme.jar).

Check Java : BigInteger(serial,16)^65537 mod N == SHA256(name) (entier positif).
N (2048 bits) est dans Cript3.class ; l'exposant privé d est caché après
l'IEND de Embrace.png (marqueur « !ITISNOTAKEY! »). serial = hash^d mod N.

Usage : embrace-rsa-solve.py [--name petik] [-q] [--check]
"""
import argparse, hashlib, re, sys, zipfile
from pathlib import Path

JAR = Path(__file__).resolve().parent.parent / "original" / "crackme.jar"
E = 65537


def load(jar=JAR):
    z = zipfile.ZipFile(jar)
    cls = z.read("Cript3.class")
    n = int(re.search(rb"[0-9]{300,}", cls).group())
    png = z.read("Embrace.png")
    tail = png[png.rfind(b"IEND") + 8:]
    d = int(tail.split(b"!ITISNOTAKEY!")[1].decode(), 16)
    return n, d


def keygen(name, n, d):
    h = int.from_bytes(hashlib.sha256(name.encode()).digest(), "big")
    return format(pow(h, d, n), "x")


def check(name, serial, n):
    h = int.from_bytes(hashlib.sha256(name.encode()).digest(), "big")
    return pow(int(serial, 16), E, n) == h


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    n, d = load()
    s = keygen(a.name, n, d)
    if a.check:
        ok = check(a.name, s, n)
        print("check:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name}\nserial={s}")
