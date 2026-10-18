#!/usr/bin/env python3
"""My Third Crackme (TrynaToBe6for6Def) : DFA 19 états x 16 colonnes, 17 caractères.
Usage: third-solve.py [-q] [--check]"""
import argparse, struct, sys, os, subprocess
EXE = os.path.join(os.path.dirname(__file__), '..', 'original', 'My_Third_Crackme.exe')
TBL_RVA, N = 0x30E0, 19

def table():
    d = open(EXE, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    ns = struct.unpack_from('<H', d, pe + 6)[0]; opt = struct.unpack_from('<H', d, pe + 20)[0]
    for i in range(ns):
        _, vs, va, rs, rp = struct.unpack_from('<8sIIII', d, pe + 24 + opt + i * 40)
        if va <= TBL_RVA < va + max(vs, rs):
            o = rp + TBL_RVA - va
            return d[o:o + N * 16]

def nib(c): return ((c ^ 0xA) + 1) & 0xF

def solve():
    t = table(); s = 0; out = ''
    for _ in range(17):                      # un seul nibble sort de chaque état utile
        col = next(c for c in range(16) if t[16 * s + c] != 18)
        # premier caractère alphanumérique dont le nibble est col
        out += next(chr(c) for c in range(0x30, 0x7b) if chr(c).isalnum() and nib(c) == col)
        s = t[16 * s + col]
    assert s == 17
    return out

if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('-q', action='store_true'); ap.add_argument('--check', action='store_true')
    a = ap.parse_args(); p = solve()
    print(p)
    if a.check:
        import shutil; w = ['xvfb-run', '-a'] if shutil.which('xvfb-run') else []
        r = subprocess.run(w + ['wine', EXE], input=p + '\n\n', capture_output=True, text=True)
        print(r.stdout)
