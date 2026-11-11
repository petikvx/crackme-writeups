#!/usr/bin/env python3
"""plikan's Ez Crackme (WinForms .NET) : le code attendu est AAAAMMJJ + 4777 (date du jour).

  python3 tools/ez-crackme-2-solve.py                  # code pour aujourd'hui
  python3 tools/ez-crackme-2-solve.py -q               # code seul
  python3 tools/ez-crackme-2-solve.py --date 2026-11-11
  python3 tools/ez-crackme-2-solve.py --check          # verifie les constantes dans l'IL de l'exe d'origine

Pas de champ user : l'exemple `petik` ne s'applique pas.
"""
import argparse, datetime, io, struct, sys, zipfile, os

BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "download.bin")
OFFSET = 4777


def code(d):
    return int(d.strftime("%Y%m%d")) + OFFSET


def check():
    with zipfile.ZipFile(BIN) as z:
        exe = z.read(z.namelist()[0], pwd=b"crackmes.one")
    us = "yyyyMMdd".encode("utf-16le")
    ok = us in exe
    # ldc.i4 (0x20) imm32 pour 2777 / 3777 / 4777 ; seul 4777 est compare a l'entree
    for k in (2777, 3777, 4777):
        found = (b"\x20" + struct.pack("<i", k)) in exe
        print(f"ldc.i4 {k}: {'present' if found else 'absent'}")
        ok &= found
    # corps de button1_Click : ... add(num3) ... ceq/bne sur num5 vs num3 -> verifie a la main (cf README)
    print("format yyyyMMdd:", "present" if us in exe else "absent")
    return ok


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--date")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        sys.exit(0 if check() else 1)
    d = datetime.date.fromisoformat(a.date) if a.date else datetime.date.today()
    c = code(d)
    print(c if a.q else f"date {d} -> code {c}")


main()
