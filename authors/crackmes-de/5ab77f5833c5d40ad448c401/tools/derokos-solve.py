#!/usr/bin/env python3
"""Solveur derokos_crackme_1 (deroko) : clé du RAR `crackme_src.rar`.

Le crackme (crackme.EXE, PE32 auto-modifiant) copie 0x50 octets situés juste après
la section contenant l'entry point (raw end de CODE = 0xe00), les déchiffre avec
    b = ((b - 0xaa) & 0xff) rol 4) ^ 0xde
et en fait sa "clé". Ce script refait la même chose sur le crackme.EXE d'origine
(extrait du ZIP, jamais modifié) puis, avec --check, teste la clé sur le RAR
(en-têtes chiffrés : mauvais mot de passe => 7z refuse d'ouvrir l'archive).

Usage : derokos-solve.py [-q] [--check] [--zip original/crackme.zip]
"""
import argparse, io, os, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_ZIP = os.path.join(HERE, "..", "original", "crackme.zip")
ZIP_PW = b"crackmes.one"

rol8 = lambda b, n: ((b << n) | (b >> (8 - n))) & 0xFF
dec = lambda b: rol8((b - 0xAA) & 0xFF, 4) ^ 0xDE


def key_from_exe(exe: bytes) -> bytes:
    """Réplique du stage 1 : parse PE, section de l'EP, 0x50 octets en fin de raw."""
    pe = struct.unpack_from("<I", exe, 0x3C)[0]
    nsec = struct.unpack_from("<H", exe, pe + 6)[0]
    ep = struct.unpack_from("<I", exe, pe + 0x28)[0]
    sec = pe + 0xF8
    for i in range(nsec):
        vsz, va, rsz, raw = struct.unpack_from("<IIII", exe, sec + 8 + 40 * i)[0:4]
        if va <= ep < va + max(vsz, rsz):
            blob = exe[raw + rsz: raw + rsz + 0x50]
            plain = bytes(dec(b) for b in blob)
            return plain.split(b"\0")[0]
    raise SystemExit("section de l'EP introuvable")


def load(zpath):
    z = zipfile.ZipFile(zpath)
    z.setpassword(ZIP_PW)
    return z.read("crackme/crackme.EXE"), z.read("crackme/crackme_src.rar")


def check(key: bytes, rar: bytes) -> bool:
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "src.rar")
        open(p, "wb").write(rar)
        r = subprocess.run(["7z", "l", "-p" + key.decode(), p], capture_output=True, text=True)
        return "crackme_src/crackme.asm" in r.stdout


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--zip", default=DEF_ZIP)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe, rar = load(a.zip)
    key = key_from_exe(exe)
    if a.check:
        ok = check(key, rar)
        bad = check(b"WRONGKEY", rar)
        print("OK" if ok and not bad else "KO", file=sys.stderr if a.q else sys.stdout)
        if not ok or bad:
            sys.exit(1)
    print(key.decode() if a.q else f"RAR key : {key.decode()}")
