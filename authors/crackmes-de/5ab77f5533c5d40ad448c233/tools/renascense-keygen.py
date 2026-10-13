#!/usr/bin/env python3
"""Keygen « CrackMe Renascense v1.0 » (skapunky, VB6 natif).

Routine du bouton Registrer (0x4096F0) :
  On Error Resume Next
  For i = 0 To 7 : c(i) = Mid(nom, i+1, 1) : a(i) = Asc(c(i)) : Next   ' Asc("") -> erreur ignorée, a(i) reste Empty (0)
  s = CStr(a(0)+a(1)+...+a(7))
  serial = "ska" & s & CStr(a(0)*3) & CStr(CInt(a(7)*5))
  If serial = Text(serial) Then "Good, this version is registrered !"
Seuls les 8 premiers caractères du nom comptent.   usage : renascense-keygen.py [NOM]
"""
import sys

def serial(name: str) -> str:
    a = [ord(ch) for ch in name[:8]] + [0] * max(0, 8 - len(name))
    # Asc() de VB6 renvoie le code ANSI (cp1252) ; ord() suffit pour l'ASCII
    return "ska%d%d%d" % (sum(a), a[0] * 3, a[7] * 5)

if __name__ == "__main__":
    n = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{n} -> {serial(n)}")
