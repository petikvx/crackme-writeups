#!/usr/bin/env python3
"""Keygen CrackMe 7 by Fr1c (crackmes.de, Delphi + UPX 0.94).

Button1Click (0x442880), n = len(nom), s = nom (0-based), octets & 0xFF :
  pour chaque c de s :  serial += chr((c*0x63 ^ 6) + s[1] + s[3])
                        serial += chr(c + 4n + s[1] + s[2] + s[3] - 4)     (boucle interne n fois, valeur constante)
  dernier car.       :  chr((s[2] ^ n) + 3 + GetForegroundWindow())        <- dépend du HWND au premier plan !
Le nom doit faire >= 4 caractères (s[3] est lu). Aucun octet ne doit valoir 0 (impossible à taper).

  ./crackme7-solve.py [nom] [--hwnd 0xHHHH]   (défaut : petik ; sans --hwnd, affiche le préfixe et la formule)
  ./crackme7-solve.py -x petik --hwnd 0x10020 (serial en hex)
"""
import argparse

def prefix(name):
    s = name.encode("latin1"); n = len(s)
    if n < 4:
        raise SystemExit("nom >= 4 caractères requis")
    out = bytearray()
    for c in s:
        out.append(((c * 0x63) ^ 6) + s[1] + s[3] & 0xFF)
        out.append(c + 4 * n + s[1] + s[2] + s[3] - 4 & 0xFF)
    return bytes(out)

def last(name, hwnd):
    s = name.encode("latin1")
    return ((s[2] ^ len(s)) + 3 + hwnd) & 0xFF

def serial(name, hwnd):
    return prefix(name) + bytes([last(name, hwnd)])

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--hwnd", type=lambda x: int(x, 0))
    ap.add_argument("-x", action="store_true", help="sortie hex")
    a = ap.parse_args()
    p = prefix(a.name)
    if 0 in p:
        print("attention : octet nul dans le serial, nom inutilisable")
    if a.hwnd is None:
        print(f"nom     : {a.name}\npréfixe : {p.decode('latin1')!r}  (hex {p.hex()})")
        print(f"dernier : chr(({a.name.encode('latin1')[2]} ^ {len(a.name)}) + 3 + (GetForegroundWindow() & 0xFF))")
    else:
        s = serial(a.name, a.hwnd)
        print(s.hex() if a.x else s.decode("latin1"))
