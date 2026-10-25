#!/usr/bin/env python3
"""Keygen — Obnoxious's KeygenMe #1 (crackmes.de, .NET).

Serial = "Obnoxious-" + H[1:9] + "-" + <jour du mois> + "-" + name[2:4]
où H = str(TimeSpan.GetHashCode()) de l'heure de lancement, que le crackme écrit
dans c:\\windows\\time_data.txt (donc H est lisible par le keygen).

Usage :
  obnoxiousskgm1-solve.py [--name petik1] [--hash H | --file time_data.txt] [--day D] [-q]
  obnoxiousskgm1-solve.py --check "<serial>" ...   (idem, vérifie un serial)
Sans --hash/--file : lit $WINEPREFIX/drive_c/windows/time_data.txt (défaut ~/.wine).
"""
import argparse, datetime, os, sys


def timespan_hash(ticks):
    """TimeSpan.GetHashCode() : (int)ticks ^ (int)(ticks >> 32), rendu en décimal signé."""
    v = (ticks & 0xFFFFFFFF) ^ ((ticks >> 32) & 0xFFFFFFFF)
    return v - (1 << 32) if v >> 31 else v


def serial(name, h, day):
    if len(name) < 6:
        raise ValueError("nom >= 6 caractères requis (le binaire refuse sinon)")
    h = str(h)
    if len(h) < 9:
        raise ValueError("hash trop court pour Substring(1,8)")
    return f"Obnoxious-{h[1:9]}-{day}-{name[2:4]}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik1")  # 'petik' = 5 car. < 6 : refusé -> 'petik1'
    ap.add_argument("--hash")
    ap.add_argument("--file")
    ap.add_argument("--day", type=int, default=datetime.date.today().day)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    h = a.hash
    if h is None:
        f = a.file or os.path.join(os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine")),
                                   "drive_c/windows/time_data.txt")
        h = open(f).read().strip()
    s = serial(a.name, h, a.day)
    if a.check is not None:
        ok = a.check == s
        print("OK" if ok else "KO", s)
        sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name} hash={h} day={a.day} serial={s}")


if __name__ == "__main__":
    main()
