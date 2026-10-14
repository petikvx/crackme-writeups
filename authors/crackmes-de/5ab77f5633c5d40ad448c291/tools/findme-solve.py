#!/usr/bin/env python3
"""Solveur therapy's crackme #2 « FindMe ».

check() : P (15 car.) -> hex x3 (alphabet "0123456789@ABCDE", donc 10..15 -> '@'..'E')
          -> 120 octets h3 ; il faut 0xFF - h3[i] == table[i] (table @ 0x40201a) pour les 120.
On relit la table dans le binaire et on inverse les trois conversions.

  ./findme-solve.py            # imprime le mot de passe
  ./findme-solve.py --check PW # applique le prédicat de check()
"""
import argparse, os, struct, sys
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "[crackme #2]-FindMe.exe")
DIG = "0123456789@ABCDE"

def table():
    d = open(EXE, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3c)[0]
    ns = struct.unpack_from("<H", d, pe + 6)[0]
    sec = pe + 24 + struct.unpack_from("<H", d, pe + 20)[0]
    for i in range(ns):
        n, vs, va, rs, ro = struct.unpack_from("<8sIIII", d, sec + 40 * i)
        if n.rstrip(b"\0") == b".data":
            off = ro + (0x40201A - 0x400000 - va)
            return d[off:off + 120]
    raise SystemExit(".data introuvable")

def convert(b):  # _convert @ 0x401214
    return "".join(DIG[c >> 4] + DIG[c & 15] for c in b).encode("latin1")

def inv(s):
    s = s.decode("latin1")
    return bytes(DIG.index(s[i]) * 16 + DIG.index(s[i + 1]) for i in range(0, len(s), 2))

def solve():
    h3 = bytes(0xFF - b for b in table())
    return inv(inv(inv(h3))).decode("latin1")

def check(pw):
    p = pw.encode("latin1")
    h1 = convert(p); h2 = convert(h1); h3 = convert(h2)
    if len(h1) + len(h2) + len(h3) != 0xD2:   # 14·len == 210 -> len == 15
        return False
    return sum((0xFF - c) & 0xFF == t for c, t in zip(h3, table())) == 0x78

if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--check")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check); print("CORRECT" if ok else "INCORRECT"); sys.exit(0 if ok else 1)
    pw = solve(); assert check(pw); print(pw)
