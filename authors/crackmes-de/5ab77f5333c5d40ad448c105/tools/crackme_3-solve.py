#!/usr/bin/env python3
"""crackme_3 (br0ken) — keygen.
Table T = "@^*R$FVT%@" (.rdata 0x403000) recopiée sur la pile, suivie de zéros.
Pour chaque caractère c_i du nom :
  B += c_i ^ T[c_i % 10]
  A += c_i * T[i] + 0xEFEF        (T[i] = 0 au-delà de 10 caractères)
  C  = c_last^2 + A - B             (boucle interne : seule la dernière valeur reste)
Serial = "br0-%lu-%lu%lu-ken" % (A, B, C)   (entiers 32 bits non signés)"""
import sys
T = b"@^*R$FVT%@" + bytes(200)

def keygen(name):
    A = B = C = 0
    for i, ch in enumerate(name.encode()):
        B += ch ^ T[ch % 10]
        A += ch * T[i] + 0xEFEF
        for c in name.encode():
            C = c * c + A - B
    m = 0xFFFFFFFF
    return "br0-%d-%d%d-ken" % (A & m, B & m, C & m)

if __name__ == "__main__":
    print(keygen(sys.argv[1] if len(sys.argv) > 1 else "petik"))
