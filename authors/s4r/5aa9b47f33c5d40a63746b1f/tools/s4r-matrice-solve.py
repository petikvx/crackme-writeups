#!/usr/bin/env python3
"""Solveur s4r matrice : in[i]*in[i+1] == W[i] (41 mots WORD @0x403000), len 42, in[0] in [0x23,0x37]."""
import struct, pathlib

EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "matrice.exe"
DATA_VA, DATA_RAW = 0x403000, 0xa00

def words(d):
    w, o = [], DATA_RAW
    while (x := struct.unpack_from("<H", d, o)[0]):
        w.append(x); o += 2
    return w

def check(d, s):
    """Ré-implémentation fidèle de 0x401197 (table T reconstruite comme WM_INITDIALOG)."""
    W = words(d)
    T = bytearray(0x10000 + 8)
    T[0:4] = struct.pack("<I", 0xff)
    for i, w in enumerate(W):
        T[w:w + 4] = struct.pack("<I", i + 1)
    b = s.encode() + b"\0" * 4
    if len(s) % 6 or len(s) % 7 or not (0x23 <= b[0] <= 0x37):
        return False
    c = 0
    while True:
        v = T[b[c] * b[c + 1]]
        if v == 0xff:
            return True
        c += 1
        if v != c:
            return False

def solve():
    d = EXE.read_bytes()
    W = words(d)
    for c0 in range(0x23, 0x38):
        s = [c0]
        for w in W:
            if w % s[-1]:
                break
            s.append(w // s[-1])
        else:
            if all(0x20 <= x < 0x7f for x in s):
                cand = bytes(s).decode()
                if check(d, cand):
                    yield cand

if __name__ == "__main__":
    for s in solve():
        print(s)
