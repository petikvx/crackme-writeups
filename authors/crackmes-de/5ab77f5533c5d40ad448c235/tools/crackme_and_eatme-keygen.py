#!/usr/bin/env python3
"""Keygen « Crackme And Eatme #1 » (MIGHTY KInG, AutoIt v3, script extrait avec autoit-ripper).

_CHECK($USERNAME) :
  S1 = somme des Asc(c)         S2 = StringUpper(StringLeft(nom, 3))
  S3 = -somme des Asc(c)        S4 = 1 / c1 / c2 / ... / cn   (double)
  serial = S1 & "-" & S2 & S3 & "-" & S4        (S3 négatif apporte son propre « - »)
AutoIt convertit un double non entier avec "%.15g" du CRT MSVC (exposant sur 3 chiffres : e-011).
Nom : 3 à 20 caractères.            usage : crackme_and_eatme-keygen.py [NOM]
"""
import re, sys

def autoit_num(x: float) -> str:
    if x == int(x) and abs(x) < 1e15:
        return str(int(x))
    s = "%.15g" % x
    return re.sub(r"e([+-])(\d+)$", lambda m: "e%s%03d" % (m.group(1), int(m.group(2))), s)

def serial(name: str) -> str:
    codes = list(name.encode("cp1252"))
    s1 = sum(codes); s3 = -s1; s4 = 1.0
    for c in codes:
        s4 /= c
    return f"{s1}-{name[:3].upper()}{s3}-{autoit_num(s4)}"

if __name__ == "__main__":
    n = sys.argv[1] if len(sys.argv) > 1 else "petik"
    if not 3 <= len(n) <= 20:
        sys.exit("le nom doit faire 3 à 20 caractères")
    print(f"{n} -> {serial(n)}")
