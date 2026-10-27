#!/usr/bin/env python3
"""JiM~ DotNet Series #1 (crackmes.de) — keygen name -> (key hex, checkboxes).

Prédicat (frm.btnCheck_Click + SuperString.operator+) :
  a = name.upper()                 # SuperString(SuperString) copie en majuscules
  b = Environment.UserName         # dépend de la machine !
  a' = rotations gauches cumulées de 1..len-1 sur a
  b' = rotations droites cumulées de 1..len-1 sur b
  attendu = b' + "X" + a'
  key = hex(attendu) (expand() relit des paires hex -> chars)
  cases A..F = bits 0..5 de len(name)   (len(name) <= 63)
Usage : jim-dotnet-series-1-solve.py [name] [--user USER] [-q] [--check KEY]
"""
import argparse
import getpass


def rotl_cum(t):
    for i in range(1, len(t)):
        t = t[i:] + t[:i]
    return t


def rotr_cum(t):
    for i in range(1, len(t)):
        t = t[-i:] + t[:-i]
    return t


def keygen(name, user):
    exp = rotr_cum(user) + "X" + rotl_cum(name.upper())
    key = "".join("%02X" % ord(c) for c in exp)
    n = len(name)
    boxes = "".join(c for i, c in enumerate("ABCDEF") if n >> i & 1)
    return key, boxes


def main():
    p = argparse.ArgumentParser()
    p.add_argument("name", nargs="?", default="petik")
    p.add_argument("--user", default=getpass.getuser())
    p.add_argument("-q", action="store_true")
    p.add_argument("--check")
    a = p.parse_args()
    if not 0 < len(a.name) < 64:
        p.error("name: 1..63 caractères")
    key, boxes = keygen(a.name, a.user)
    if a.check:
        ok = a.check.upper() == key
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    print(key if a.q else f"name={a.name} user={a.user} key={key} cases={boxes}")


if __name__ == "__main__":
    main()
