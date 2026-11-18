#!/usr/bin/env python3
"""echo_labyrinth (kamil123) - recherche du mot de passe (7 car., ASCII imprimable).

Contraintes issues du binaire (main @ 0x140007bc0) :
  e[i] = rol8(p[i]+7i, 3) ^ KEY[i]
  sum(e)==0x478, xor(e)==0x2c, djb2x(p)==0x9c670a5c, tail8(p)==0x73,
  check final FNV-ish == 0x732cbb2d.
Méthode : meet-in-the-middle sur le hash djb2-xor (inversible), puis filtre.
Usage : echo_labyrinth-solve.py [-q] [--check]   (--check : relance via wine)
"""
import sys, subprocess, numpy as np

KEY = [0x66, 0x57, 0x40, 0xB1, 0xA2, 0x93, 0xFC]
M = 0xFFFFFFFF
INV33 = pow(33, -1, 1 << 32)
CH = np.arange(0x20, 0x7F, dtype=np.uint64)


def rol8(x, n): return ((x << n) | (x >> (8 - n))) & 0xFF


def full_check(p):
    if len(p) != 7: return False
    e = [rol8((c + 7 * i) & 0xFF, 3) ^ KEY[i] for i, c in enumerate(p)]
    r9 = sum(e) & 0xFFFF; r8 = 0
    for x in e: r8 ^= x
    h = 0x1505
    for c in p: h = (((h << 5) + h) ^ c) & M
    dl, cl = 0xA5, 0
    for c in list(p) + [0] * 0:
        dl = ((dl >> 3) ^ ((dl * 65 + cl + c) & 0xFF)) & 0xFF
        cl += 3
    fin = ((dl * 0x1000193) ^ ((r8 << 16) | r9) ^ (h & 0xFFFF)) & M
    return r9 == 0x478 and r8 == 0x2C and h == 0x9C670A5C and dl == 0x73 and fin == 0x732CBB2D


def solve():
    # avant : 3 premiers car.
    a, b, c = np.meshgrid(CH, CH, CH, indexing="ij")
    h = np.uint64(0x1505)
    h = ((h * 33) ^ a.ravel()) & M
    h = ((h * 33) ^ b.ravel()) & M
    h = ((h * 33) ^ c.ravel()) & M
    pref = np.stack([a.ravel(), b.ravel(), c.ravel()], 1)
    order = np.argsort(h); hs = h[order]
    sols = []
    d, e_, f, g = np.meshgrid(CH, CH, CH, CH, indexing="ij")
    d, e_, f, g = d.ravel(), e_.ravel(), f.ravel(), g.ravel()
    # arrière : h_final -> h3 en inversant 4 étapes (g, f, e, d)
    t = np.full(d.shape, 0x9C670A5C, dtype=np.uint64)
    for ch in (g, f, e_, d):
        t = (((t ^ ch) & M) * INV33) & M
    idx = np.searchsorted(hs, t)
    idx[idx >= len(hs)] = len(hs) - 1
    for k in np.nonzero(hs[idx] == t)[0]:
        i = idx[k]
        while i < len(hs) and hs[i] == t[k]:
            p = bytes(int(x) for x in pref[order[i]]) + bytes(int(x[k]) for x in (d, e_, f, g))
            if full_check(p): sols.append(p.decode())
            i += 1
    return sols


if __name__ == "__main__":
    s = solve()
    if "-q" in sys.argv: print(s[0] if s else "")
    else: print("solutions :", s)
    if "--check" in sys.argv and s:
        exe = sys.argv[sys.argv.index("--check") + 1] if sys.argv[-1] != "--check" else "analysis/x/echo_labyrinth.exe"
        out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=s[0] + "\n\n", capture_output=True, text=True, timeout=60).stdout
        print(out); print("OK" if "GRANTED" in out else "KO")
