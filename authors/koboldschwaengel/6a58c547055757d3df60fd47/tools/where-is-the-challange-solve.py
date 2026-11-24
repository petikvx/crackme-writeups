#!/usr/bin/env python3
"""Where is the challange? (koboldschwaengel) — extraction + mot de passe.

Chaîne : ZIP -> PNG/ZIP polyglot -> stripper.exe -> overlay PE (le vrai crackme).
Mot de passe : octets chiffrés 31 32 33 61 62 63 71 71 XOR 0x50 -> abc123!!
Le crackme ne compare que les 8 premiers caractères (préfixe accepté).

  python3 -I where-is-the-challange-solve.py          # extrait dans analysis/ + affiche le mot de passe
  python3 -I where-is-the-challange-solve.py -q       # mot de passe seul
  python3 -I where-is-the-challange-solve.py --check  # lance le PE interne sous wine (OK + KO)
"""
import argparse, io, os, struct, subprocess, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "WhereIsTheChallange.zip")
OUT = os.path.join(ROOT, "analysis")
ENC = bytes.fromhex("3132336162637171")
KEY = 0x50


def password():
    return bytes(b ^ KEY for b in ENC).decode()


def extract():
    z = zipfile.ZipFile(ZIP)
    png = z.read("WhereIsTheChallange/WhereIsTheChallange.png")
    i = png.find(b"PK\x03\x04")          # ZIP collé après IEND
    exe = zipfile.ZipFile(io.BytesIO(png[i:])).read("There/WhereIsTheChallange.exe")
    # overlay = octets après la dernière section brute (0x7e00 ici)
    pe = struct.unpack_from("<I", exe, 0x3c)[0]
    n = struct.unpack_from("<H", exe, pe + 6)[0]
    so = pe + 24 + struct.unpack_from("<H", exe, pe + 20)[0]
    end = max(struct.unpack_from("<II", exe, so + 40 * k + 16)[0] + struct.unpack_from("<II", exe, so + 40 * k + 16)[1] for k in range(n))
    ov = exe[end:]
    assert ov[:4] == b"MZ\x90\x00"
    os.makedirs(OUT, exist_ok=True)
    p = os.path.join(OUT, "crackme-inner.exe")
    open(p, "wb").write(ov)
    return p


def run(exe, pw):
    r = subprocess.run(["wine", exe], input=(pw + "\n").encode(), capture_output=True, timeout=60)
    return r.stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = password()
    if a.q:
        print(pw); return
    p = extract()
    print("PE interne :", p)
    print("mot de passe :", pw)
    if a.check:
        ok, ko = run(p, pw), run(p, "petik")
        print("OK ->", ok.strip()); print("KO (petik) ->", ko.strip())
        sys.exit(0 if "correct pass" in ok and "wrong pass" in ko else 1)


main()
