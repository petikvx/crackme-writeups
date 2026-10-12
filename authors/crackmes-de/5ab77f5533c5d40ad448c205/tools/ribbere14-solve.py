#!/usr/bin/env python3
"""Keymaker Ribbere 1.4 (bswap, crackmes.de).

Un seul champ (le « nom », contrôle 0xC9). Pour chaque octet n[i] (i = 0..15) du buffer :
    g(c, k) = c + k ; si < 0x21 : += 0x21 ; si > 0x7B : >>= 1        (k = 16 - i, compteur `loop`)
    out[i] = g(n[i], 16 - i)
Enregistré si dword(out[1..4]) == dword(out[5..8]).

Le keymaker garde les 5 premiers caractères du nom et calcule n[5..8] :
    petik -> petikixmo      (n[i+4] = n[i] + 4 hors cas limites)

  ./ribbere14-solve.py [nom]          # nom valide dérivé
  ./ribbere14-solve.py -q             # idem, sortie seule (petik)
  ./ribbere14-solve.py --check NOM    # rejoue le check
"""
import argparse, sys

def g(c: int, k: int) -> int:                 # 0x40197e (après le code mort)
    e = c + k
    if e < 0x21: e += 0x21                    # cmp eax,0x21 / jae / add eax,0x21
    if e > 0x7B: e >>= 1                      # cmp eax,0x7b / jle / shr eax,1
    return e & 0xFF

def out_bytes(name: bytes) -> list:
    buf = (name + b"\0" * 16)[:16]            # buffer 0x40332c (mis à 0 avant GetDlgItemTextA)
    return [g(buf[i], 16 - i) for i in range(16)]   # 0x40195a : ecx = 0x10 .. 1

def check(name: bytes) -> bool:
    if not 1 <= len(name) <= 0x1D:           # GetDlgItemTextA(…, 0x1e) >= 1
        return False
    o = out_bytes(name)
    return o[1:5] == o[5:9]                   # cmp dword [0x40334c], [0x403350]

def keygen(name: str = "petik") -> str:
    base = (name + "AAAAA")[:5].encode()
    n = bytearray(base)
    for i in range(1, 5):                     # n[i+4] tel que g(n[i+4], 12-i) == g(n[i], 16-i)
        want = g(n[i], 16 - i)
        n.append(next(c for c in range(0x21, 0x7F) if g(c, 12 - i) == want))
    return n.decode()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check.encode("latin-1")); print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name); assert check(s.encode())
    print(s if a.q else f"Name   = {a.name}\nValide = {s}")
