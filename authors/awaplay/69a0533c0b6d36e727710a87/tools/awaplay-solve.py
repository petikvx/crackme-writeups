#!/usr/bin/env python3
"""awaplay OBSCURA (ProjectOfEntrophy1.exe) — solveur.

Le crackme lit une ligne (getline). Seul le chemin « somme des octets <= 0x100 »
(mode 0/2 dans 0x140003150) peut passer le test final (>= 10 octets imprimables
dans t[i]^buf[i]). On construit donc une ligne de 16 octets dont la somme
(signée) est <= 0x100 et dont tous les résultats sont imprimables.

  python3 awaplay-solve.py            # affiche la ligne (repr + hex)
  python3 awaplay-solve.py -q         # écrit les octets bruts sur stdout
  python3 awaplay-solve.py --check    # lance original/ProjectOfEntrophy1.exe sous wine
"""
import argparse, os, subprocess, sys

# Constantes extraites du binaire
S = 0xFFF7FEFFF8DAB42F      # état ca0 après 0x140002d50 (affiché par "SYNC LOST")
H = 0x8B                    # octet bas du FNV-1a-64 des 0x60 octets de 0x140003320
T = bytes([0x57,0x12,0x33,0x1b,0x0e,0x19,0x42,0x5c,0x10,0x07,0x1f,0x0b,0x05,0x48,0x19,0x22])
K = [(S >> (2 * i)) & 0xFF for i in range(16)]

rol8 = lambda x, n: ((x << n) | (x >> (8 - n))) & 0xFF
ror8 = lambda x, n: ((x >> n) | (x << (8 - n))) & 0xFF
printable = lambda x: 0x20 <= x <= 0x7E

def result(inp: bytes):
    """t[i]^buf[i] tel que calculé par le binaire (chemin 0x140003320)."""
    out = []
    for i in range(16):
        c = inp[i] if i < len(inp) else 0
        out.append(T[i] ^ (rol8(c ^ K[i], 3) ^ H))
    return out

def signed_sum(inp: bytes):
    return sum(b - 256 if b > 127 else b for b in inp)

def solve():
    # par position : candidats (octet saisi) donnant un résultat alphanumérique
    opts = []
    for i in range(16):
        o = []
        for c in range(1, 256):
            if c == 0x0A:
                continue
            p = T[i] ^ (rol8(c ^ K[i], 3) ^ H)
            if chr(p).isalnum() and p < 128:
                o.append(c)
        opts.append(o)
    # départ : plus petit octet par position, puis on "monte" vers l'ASCII imprimable
    pick = [min(o) for o in opts]
    budget = 0x100 - sum(pick)
    for i in range(16):
        best = [c for c in opts[i] if 0x20 <= c <= 0x7E]
        if not best:
            continue
        c = min(best)
        d = c - pick[i]
        if d <= budget:
            pick[i] = c
            budget -= d
    inp = bytes(pick)
    assert signed_sum(inp) <= 0x100 and all(printable(x) for x in result(inp))
    return inp

def check(inp):
    exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "ProjectOfEntrophy1.exe")
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=inp + b"\n",
                       capture_output=True, timeout=60)
    out = r.stdout.decode(errors="replace")
    print(out)
    return "SYSTEM STABLE" in out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    inp = solve()
    if a.q:
        sys.stdout.buffer.write(inp)
    else:
        print("ligne :", inp, "hex:", inp.hex(), "somme:", signed_sum(inp))
        print("t^buf :", bytes(result(inp)))
    if a.check:
        ok = check(inp)
        print("wine:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
