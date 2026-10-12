#!/usr/bin/env python3
"""Flatline's CrackMe #1 (flatlines_crackme_1 by flatline) — keygen.

Check (TForm1.Label3Load 0x4B6750 -> 0x4B63D4) :
  h = hex minuscule de SHA-1(AnsiString(Username))            (40 car.)
  pour chaque caractère c du nom : h = StringReplace(h, c, '', [rfReplaceAll, rfIgnoreCase])
  serial valide  <=>  Trim(Serial) == AnsiUpperCase(h)

  ./flatline1-keygen.py petik          # nom + serial
  ./flatline1-keygen.py -q petik       # serial seul
  ./flatline1-keygen.py --check NOM SERIAL
"""
import argparse, hashlib, sys

def serial(name: str) -> str:
    h = hashlib.sha1(name.encode("cp1252")).hexdigest()
    for c in name:
        h = h.replace(c.lower(), "").replace(c.upper(), "")
    return h.upper()

def check(name: str, s: str) -> bool:
    return s.strip("".join(map(chr, range(33)))) == serial(name)  # Trim Delphi : car. <= #32

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("NOM", "SERIAL"))
    ap.add_argument("name", nargs="?", default="petik")
    a = ap.parse_args()
    if a.check:
        ok = check(*a.check)
        print("Serial Valid. Well Done!" if ok else "Serial Invalid. Try Again")
        sys.exit(0 if ok else 1)
    s = serial(a.name)
    print(s if a.q else f"{a.name} -> {s}")

if __name__ == "__main__":
    main()
