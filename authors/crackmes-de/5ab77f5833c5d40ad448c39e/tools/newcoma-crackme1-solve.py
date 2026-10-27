#!/usr/bin/env python3
"""Keygen pour newcoma's CrackMe #1 (VB6, crackmes.de / crackmes.one 5ab77f58...).

Pour chaque caractère c (index i = 1..Len) du nom :
    h_i = Hex$( CInt( i + Asc(UCase(c)) + Timer/60/60 ) )   # arrondi banquier, int16
serial = h_1 & h_2 & ... & h_Len   (ordre direct, vérifié en live)

Le serial dépend donc de l'heure locale (Timer = secondes depuis minuit).
Nom : 5..40 caractères.

Usage : newcoma-crackme1-solve.py [--name petik] [--timer SEC | --hour H] [-q]
"""
import argparse, datetime


def vb_timer():
    n = datetime.datetime.now()
    return n.hour * 3600 + n.minute * 60 + n.second + n.microsecond / 1e6


def serial(name, timer):
    if not 5 <= len(name) <= 40:
        raise SystemExit("le nom doit faire 5..40 caractères")
    shift = timer / 60.0 / 60.0          # fdiv 60 ; fdiv 60  (0x401100 = 60.0f)
    parts = []
    for i, c in enumerate(name, 1):
        v = round(i + ord(c.upper()) + shift)   # __vbaFpI2 : round-half-even
        parts.append("%X" % (v & 0xFFFF))       # rtcHexVarFromVar
    return "".join(parts)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--timer", type=float, help="valeur de Timer (s depuis minuit)")
    ap.add_argument("--hour", type=float, help="heure décimale (ex 11.7)")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    a = ap.parse_args()
    t = a.timer if a.timer is not None else (a.hour * 3600 if a.hour is not None else vb_timer())
    s = serial(a.name, t)
    print(s if a.q else f"name={a.name} timer={t:.0f}s -> serial={s}")


if __name__ == "__main__":
    main()
