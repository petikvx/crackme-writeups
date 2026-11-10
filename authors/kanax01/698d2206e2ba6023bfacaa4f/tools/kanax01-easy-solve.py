#!/usr/bin/env python3
"""Kanax01's Fixed Easy Crackme — extrait le mot de passe du global std::string (.data).

Usage : kanax01-easy-solve.py [-q] [--check] [exe]
  exe par défaut : original/download.bin (ZIP, pwd crackmes.one) ou un PE direct.
"""
import argparse, io, struct, sys, zipfile, pathlib

GLOBAL_VA = 0x1400050B8   # std::string global : buffer SSO(16) @+0, size @+0x10, cap @+0x18
IMAGE_BASE = 0x140000000

def load(path):
    data = pathlib.Path(path).read_bytes()
    if data[:2] == b"PK":
        z = zipfile.ZipFile(io.BytesIO(data))
        data = z.read(z.namelist()[0], pwd=b"crackmes.one")
    return data

def va_to_off(pe, va):
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    nsec = struct.unpack_from("<H", pe, e + 6)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    rva = va - IMAGE_BASE
    for i in range(nsec):
        s = e + 24 + opt + 40 * i
        vsz, vrva, rsz, roff = struct.unpack_from("<IIII", pe, s + 8)
        if vrva <= rva < vrva + max(vsz, rsz):
            return roff + rva - vrva
    raise ValueError("VA hors sections")

def password(pe):
    o = va_to_off(pe, GLOBAL_VA)
    size = struct.unpack_from("<Q", pe, o + 0x10)[0]
    return pe[o:o + size].decode()

def main():
    here = pathlib.Path(__file__).resolve().parent.parent
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?", default=str(here / "original" / "download.bin"))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="rejoue la comparaison size+memcmp du binaire")
    a = ap.parse_args()
    pw = password(load(a.exe))
    if a.check:
        pe = load(a.exe)
        o = va_to_off(pe, GLOBAL_VA)
        size = struct.unpack_from("<Q", pe, o + 0x10)[0]
        ok = lambda s: len(s) == size and s.encode() == pe[o:o + size]
        assert ok(pw) and not ok("easypassword") and not ok("EasyPasswor")
        print("check OK", file=sys.stderr)
    print(pw if a.q else f"Password: {pw}")

if __name__ == "__main__":
    main()
