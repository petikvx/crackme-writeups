#!/usr/bin/env python3
"""Am0kCM_2 (am0k) : aucun serial, le « Good Job » est inatteignable -> patch.

Le check (VA 0x401013..0x40101d) compare rand() (0..0x7fff) à 0x4876e7ff et edx (cdq) à 0x17 :
impossible. Patch : NOP des deux `jne` (0x401018 et 0x40101d, 2 octets chacun).

Usage : am0k-crackme2-solve.py [-q] [--check] [-o analysis/Am0kCM_2.patched.exe]
Le binaire sous original/ n'est jamais modifié (zip lu en mémoire).
"""
import argparse, hashlib, os, subprocess, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "Am0kCM_2.zip")
BASE = 0x400000
PATCHES = {0x401018: (b"\x75\x1e", b"\x90\x90"),   # jne -> bad
           0x40101d: (b"\x75\x19", b"\x90\x90")}   # jne -> bad

def load():
    return bytearray(zipfile.ZipFile(ZIP).read("Am0kCM_2.exe", pwd=b"crackmes.one"))

def patch(d):
    for va, (old, new) in PATCHES.items():
        off = va - BASE
        assert d[off:off+2] == old, hex(va)
        d[off:off+2] = new
    return d

def run(path):
    """Lance sous wine/xvfb avec trace des MessageBoxA (WINEDEBUG=+relay filtré)."""
    env = dict(os.environ, WINEDEBUG="+relay", WINEPREFIX=os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine")))
    p = subprocess.run(["xvfb-run", "-a", "timeout", "40", "wine", path], env=env,
                       capture_output=True, text=True)
    return [l for l in p.stderr.splitlines() if "MessageBoxA" in l and "Call" in l]

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("-o", default=os.path.join(HERE, "..", "analysis", "Am0kCM_2.patched.exe"))
    a = ap.parse_args()
    orig = load()
    print("sha256 orig:", hashlib.sha256(orig).hexdigest()) if not a.q else None
    out = patch(bytearray(orig))
    os.makedirs(os.path.dirname(a.o), exist_ok=True)
    open(a.o, "wb").write(out)
    print(a.o)
    if a.check:
        for name, p in (("orig", None), ("patched", a.o)):
            if p is None:
                p = os.path.join(os.path.dirname(a.o), "Am0kCM_2.orig-copy.exe")
                open(p, "wb").write(orig)
            print(name, "->", run(p))
