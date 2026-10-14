#!/usr/bin/env python3
"""K-genme (macabre) — id 5ab77f5a33c5d40ad448c4fa. ELF32 KDE 3.5 / Qt 3.3 (GUI), strippé.

Un nom (>= 3 caractères) et TROIS champs de série (QLineEdit). Algorithme lu dans la routine du bouton :
    v23 = 0 ; v32 = 0 ; v25 = name[0] ; i = 0
    boucle : v23 += v25 ; i += 1 ; v32 += (v25 ^ 0x45) * v23
             si i == len : fin
             v25 = name[i] ; si v23 != 0 : v23 = (v23 - (v25 >> 1)) * v25      (int32, char signé)
    serial1 = str(75 * v23)           ( complet )
    serial2 = str(v23 / 0x44)[:4]     ( division signée tronquée, 4 premiers caractères )
    serial3 = str(v32)[:8]            ( 8 premiers caractères )

  kgenme-solve.py [name] [-q]        (défaut name = petik)
"""
import argparse


def i32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x


def s8(c):
    return c - 256 if c > 127 else c


def keygen(name: str):
    b = [s8(c) for c in name.encode()]
    if len(b) < 3:
        raise SystemExit("name : au moins 3 caractères")
    v23 = v32 = 0
    v25 = b[0]
    i = 0
    while True:
        v23 = i32(v23 + v25)
        i += 1
        v32 = i32(v32 + i32((v25 ^ 0x45) * v23))
        if i == len(b):
            break
        v25 = b[i]
        if v23 != 0:
            v23 = i32((v23 - (v25 >> 1)) * v25)
    q = abs(v23) // 0x44
    q = -q if v23 < 0 else q
    return str(i32(75 * v23)), str(q)[:4], str(v32)[:8]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = keygen(a.name)
    print(" ".join(s) if a.q else f"name    : {a.name}\nserial1 : {s[0]}\nserial2 : {s[1]}\nserial3 : {s[2]}")


if __name__ == "__main__":
    main()
