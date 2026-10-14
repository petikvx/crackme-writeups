#!/usr/bin/env python3
"""Keygen — crackmes.de's keygenme_1 by chaak (CKGM1a.exe, MinGW, 2011).

Format : CKGM1<k1><k2>-XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX (43 caractères)
 - k1 ∈ A1 = "ACEGIKMOQSUWY", k2 ∈ A2 = "BDFHYLNPRTVXZ"
 - A1' = A1 tourné pour commencer à k1, A2' = A2 tourné pour commencer à k2
 - les 32 caractères = 16 paires (A1'[x], A2'[y]) = 16 cases d'un labyrinthe 13x13
   (table de dwords à 0x403000, case libre = 1)
 - 1re case : x = 0 ; ensuite seulement haut/bas (même x, y±1) ou droite (x+1, même y) ;
   interdit de continuer depuis x = 12.

usage : chaak-keygenme-1-solve.py [--random] [--k1 A --k2 B] [--check SERIAL] [--exe CKGM1a.exe]
"""
import argparse, random, struct, sys, pathlib

A1 = "ACEGIKMOQSUWY"
A2 = "BDFHYLNPRTVXZ"
EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "CKGM1a.exe"

def load_grid(exe=EXE):
    d = pathlib.Path(exe).read_bytes()
    off = 0x1600  # .data (VA 0x403000) -> offset fichier 0x1600
    return struct.unpack("<169I", d[off:off + 169 * 4])

def rot(alpha, k):
    i = alpha.index(k)
    return alpha[i:] + alpha[:i]

def move_ok(px, py, x, y):
    """Réplique de 0x401588."""
    if px == -1:
        return x == 0
    if px == 12:
        return False
    return (x == px and abs(y - py) == 1) or (x == px + 1 and y == py)

def check(serial, grid):
    """Réplique du prédicat 0x401332 (0 = OK)."""
    if len(serial) != 43 or not serial.startswith("CKGM1"):
        return False
    k1, k2 = serial[5], serial[6]
    parts = serial[7:].split("-")
    if serial[7] != "-" or len(parts) != 5 or any(len(p) != 8 for p in parts[1:]):
        return False
    if k1 not in A1 or k2 not in A2:
        return False
    r1, r2 = rot(A1, k1), rot(A2, k2)
    body = "".join(parts[1:])
    px = py = -1
    for i in range(16):
        a, b = body[2 * i], body[2 * i + 1]
        if a not in r1 or b not in r2:
            return False
        x, y = r1.index(a), r2.index(b)
        if grid[y * 13 + x] != 1 or not move_ok(px, py, x, y):
            return False
        px, py = x, y
    return True

def find_path(grid, rng=None):
    """DFS : chemin simple de 16 cases, de la colonne 0 jusqu'à la colonne 12 si possible."""
    free = lambda x, y: 0 <= x < 13 and 0 <= y < 13 and grid[y * 13 + x] == 1
    best = []
    def dfs(path, want_end):
        nonlocal best
        if len(path) == 16:
            if not want_end or path[-1][0] == 12:
                best = list(path); return True
            return False
        x, y = path[-1]
        if x == 12:
            return False
        nxt = [(x + 1, y), (x, y - 1), (x, y + 1)]
        if rng: rng.shuffle(nxt)
        for c in nxt:
            if free(*c) and c not in path:
                path.append(c)
                if dfs(path, want_end): return True
                path.pop()
        return False
    starts = [(0, y) for y in range(13) if free(0, y)]
    if rng: rng.shuffle(starts)
    for want_end in (True, False):
        for s in starts:
            if dfs([s], want_end):
                return best
    raise SystemExit("pas de chemin")

def make_serial(grid, k1="A", k2="B", rng=None):
    r1, r2 = rot(A1, k1), rot(A2, k2)
    path = find_path(grid, rng)
    body = "".join(r1[x] + r2[y] for x, y in path)
    return "CKGM1" + k1 + k2 + "-" + "-".join(body[i:i + 8] for i in range(0, 32, 8)), path

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--k1", default="A"); ap.add_argument("--k2", default="B")
    ap.add_argument("--random", action="store_true")
    ap.add_argument("--check"); ap.add_argument("--exe", default=EXE)
    a = ap.parse_args()
    grid = load_grid(a.exe)
    if a.check:
        ok = check(a.check, grid); print("VALID" if ok else "INVALID"); sys.exit(0 if ok else 1)
    rng = None; k1, k2 = a.k1, a.k2
    if a.random:
        rng = random.Random(); k1, k2 = rng.choice(A1), rng.choice(A2)
    s, path = make_serial(grid, k1, k2, rng)
    assert check(s, grid)
    print(s)
    print("chemin (x,y):", path, file=sys.stderr)

if __name__ == "__main__":
    main()
