#!/usr/bin/env python3
"""Keygen Keygenme2 (bikers80, VB.NET).

serial = Mid(decode(hex(rev(COMPUTERNAME)) + hex(name)), 5, 15)
hex(s)    : concaténation de Hex(Asc(c)) (majuscules, sans zéro de tête)
decode(s) : chaque caractère +3 (DecodeASCII2)
Le serial dépend aussi de %COMPUTERNAME% (défaut : PETIK-PC).
Nom : len(name) comparé comme *chaîne* à "5" -> longueurs valides 5..9 ou 50..60.

Usage: keygenme2-solve.py [--name petik] [--computer PETIK-PC] [-q]
"""
import argparse


def hexs(s: str) -> str:
    return "".join("%X" % b for b in s.encode("cp1252"))


def keygen(name: str, computer: str) -> str:
    if not (str(len(name)) >= "5" and len(name) <= 60):
        raise ValueError("longueur invalide (5..9 ou 50..60 : comparaison de chaînes)")
    s = hexs(computer[::-1]) + hexs(name)
    return "".join(chr(ord(c) + 3) for c in s)[4:19]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--computer", default="PETIK-PC")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    k = keygen(a.name, a.computer)
    print(k if a.q else f"name={a.name} COMPUTERNAME={a.computer} serial={k}")
