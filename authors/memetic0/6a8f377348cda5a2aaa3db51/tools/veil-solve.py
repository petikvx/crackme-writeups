#!/usr/bin/env python3
"""Keygen/solveur pour memetic0's Veil (crackmes.one 6a8f377348cda5a2aaa3db51).

La clé (128 hex = 512 bits) est l'état initial d'un automate cellulaire 1D
circulaire de 512 cellules. 12 pas ; pas s utilise la table de règle RULES[s&3].
Accepté si état(6) respecte 2 contraintes et état(12) respecte 504 contraintes
(tables MID/FIN dumpées du binaire, voir README).

  veil-solve.py            -> imprime une clé
  veil-solve.py --check    -> la teste contre ../original (extrait dans analysis/extracted/veil)
"""
import argparse, os, subprocess, sys, zipfile, tempfile
import z3

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
RULES = [[1,0,1,1,0,1,0,0],[1,0,1,0,0,1,1,0],[1,1,0,1,0,0,1,0],[1,0,0,1,1,0,1,0]]
N = 512
# dump binaire de 0x410760..0x411000 (bss rempli à l'exécution)
T = open(os.path.join(ROOT, 'analysis', 'tables-410760.bin'), 'rb').read()
MASK_MID, XOR_MID, MASK_FIN, XOR_FIN = (T[o:o+N] for o in (0, 0x400, 0x200, 0x600))


def step(cur, s):
    r = RULES[s & 3]
    out = []
    for i in range(N):
        idx = cur[(i+1) % N] | (cur[i] << 1) | (cur[(i-1) % N] << 2)
        out.append(r[idx ^ 5] ^ 1)
    return out


def solve():
    sol = z3.Solver()
    s0 = [z3.BitVec(f'b{i}', 1) for i in range(N)]
    cur = s0
    # idx = r ^ 5 puis table puis ^1 -> mux z3
    for s in range(12):
        r = RULES[s & 3]
        nxt = []
        for i in range(N):
            idx = z3.Concat(cur[(i-1) % N], cur[i], cur[(i+1) % N])
            e = z3.BitVecVal(r[7], 1)
            for k in range(7):
                e = z3.If(idx == (k ^ 5), z3.BitVecVal(r[k], 1), e)
            nxt.append(e ^ 1)
        # NB: k est l'index après xor 5 ; on teste idx^5 == k  <=>  idx == k^5
        cur = nxt
        if s == 5:
            for i in range(N):
                if MASK_MID[i] == 0:
                    sol.add(cur[i] == XOR_MID[i])
    for i in range(N):
        if MASK_FIN[i] == 0:
            sol.add(cur[i] == XOR_FIN[i])
    if sol.check() != z3.sat:
        sys.exit('unsat')
    m = sol.model()
    bits = [m.eval(b, model_completion=True).as_long() for b in s0]
    return ''.join('%02x' % int(''.join(map(str, bits[i:i+8])), 2) for i in range(0, N, 8))


def binary():
    p = os.path.join(ROOT, 'analysis', 'extracted', 'veil')
    if not os.path.exists(p):
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with zipfile.ZipFile(os.path.join(ROOT, 'original', 'veil.zip')) as z:
            z.extractall(os.path.dirname(p), pwd=b'crackmes.one')
        os.chmod(p, 0o755)
    return p


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    k = solve()
    print(k)
    if a.check:
        rc = subprocess.run([binary(), '--quiet', k]).returncode
        print('veil rc =', rc, '(0 = accepté)')
        sys.exit(rc)
