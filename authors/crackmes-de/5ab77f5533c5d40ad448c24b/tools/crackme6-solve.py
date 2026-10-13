#!/usr/bin/env python3
"""Keygen CrackMe 6 by Fr1c (crackmes.de, VB5 natif).

Command1_Click (0x402c20) :
  For i = 1 To Len(Text1.Text)
      tmp = Hex(Asc(Mid$(Text1.Text, i, 1)))
      cle = cle & tmp            ' variable de module, jamais remise à zéro
  Next
  If cle = Text2.Text Then MsgBox "Very good! ..." : Label3 = "REGISTERED"

=> clé = concaténation des codes ANSI du nom en hexadécimal MAJUSCULE, sans zéro de tête
   (valable au PREMIER clic sur « Check key » : la clé s'accumule ensuite).
"""
import sys


def keygen(name: str) -> str:
    return "".join("%X" % b for b in name.encode("cp1252"))


if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} -> {keygen(name)}")
