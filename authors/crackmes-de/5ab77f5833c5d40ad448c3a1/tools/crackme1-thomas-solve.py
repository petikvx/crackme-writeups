#!/usr/bin/env python3
"""Keygen pour crackme1 de thomas (openmod.org) — VB6 natif, crackmes.one 5ab77f58...3a1.

    serial = (Somme des Asc(name[i])) * CLng(Format(Date, "ddmmyyyy"))

Le serial dépend donc de la date locale du jour. Nom : >= 5 caractères.

Usage : crackme1-thomas-solve.py [--name petik] [--date JJMMAAAA] [-q] [--check]
  --check : lance analysis/crackme1.exe sous Xvfb+Wine (xdotool) via wine-drive.sh
            et sauvegarde une capture dans /tmp/cm1-check.png
"""
import argparse, datetime, os, subprocess, sys


def serial(name, ddmmyyyy):
    if len(name) < 5:
        raise SystemExit("le nom doit faire >= 5 caractères")
    return sum(map(ord, name)) * int(ddmmyyyy)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--date", help="JJMMAAAA (défaut : aujourd'hui)")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = a.date or datetime.date.today().strftime("%d%m%Y")
    s = serial(a.name, d)
    print(s if a.q else f"name={a.name} date={d} -> serial={s}")
    if a.check:
        here = os.path.dirname(os.path.abspath(__file__))
        sh = os.path.join(here, "wine-drive.sh")
        subprocess.run(["bash", sh, a.name, str(s), "/tmp/cm1-check.png"], check=True)
        print("capture : /tmp/cm1-check.png")


if __name__ == "__main__":
    main()
