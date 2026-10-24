#!/usr/bin/env python3
"""creepys_crackme#3 (creepy, crackmes.de) — mot de passe statique.

Reconstruit le mot de passe depuis le PE (4 std::string globales initialisées
dans __static_initialization_and_destruction_0, puis concaténées) et, avec
--check, le teste contre le binaire d'origine sous Wine (xvfb-run).

Usage : creepys-crackme3-solve.py [-q] [--check [chemin.zip]]
"""
import argparse, struct, subprocess, sys, zipfile, tempfile, os, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "creepys_crackme#3.zip")
BASE = 0x400000
# globals std::string (VA) -> pointeur char* chargé en 0x44308x (.rdata)
GLOBALS = {0x446010: 0x443085, 0x446014: 0x443089, 0x446018: 0x44308c, 0x44601c: 0x443090}
# ordre de concaténation (opérandes de operator+ @0x401777..0x401873, puis copie vers 0x446020)
ORDER = [0x446014, 0x446014, 0x446010, 0x44601c, 0x446010, 0x44601c, 0x446018, 0x446018]

def load_pe(data):
    pe = struct.unpack_from("<I", data, 0x3c)[0]
    nsec = struct.unpack_from("<H", data, pe + 6)[0]
    opt = struct.unpack_from("<H", data, pe + 20)[0]
    secs = []
    for i in range(nsec):
        o = pe + 24 + opt + 40 * i
        vsz, va, rsz, raw = struct.unpack_from("<IIII", data, o + 8)
        secs.append((va + BASE, max(vsz, rsz), raw))
    return secs

def cstr(data, secs, va):
    for s, sz, raw in secs:
        if s <= va < s + sz:
            o = raw + va - s
            return data[o:data.index(b"\0", o)].decode()
    raise ValueError(hex(va))

def password(exe):
    data = open(exe, "rb").read()
    secs = load_pe(data)
    return "".join(cstr(data, secs, GLOBALS[g]) for g in ORDER)

def extract():
    d = tempfile.mkdtemp(prefix="cc3-")
    with zipfile.ZipFile(ZIP) as z:
        z.extractall(d)
    return d, os.path.join(d, [f for f in os.listdir(d) if f.endswith(".exe")][0])

def run(exe, pw):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=pw + "\n", capture_output=True,
                       text=True, timeout=60)
    return r.stdout

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d, exe = extract()
    try:
        pw = password(exe)
        print(pw if a.q else f"password = {pw}")
        if a.check:
            ok, ko = run(exe, pw), run(exe, "petik")
            print("OK :", "Great you have done" in ok)
            print("KO (petik) :", "try again" in ko)
            sys.exit(0 if "Great you have done" in ok and "try again" in ko else 1)
    finally:
        shutil.rmtree(d, ignore_errors=True)
