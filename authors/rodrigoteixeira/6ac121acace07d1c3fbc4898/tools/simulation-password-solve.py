#!/usr/bin/env python3
"""RodrigoTeixeira's Simulation password -- solveur.

Le binaire lit 40 octets (20 paires c0,c1) et calcule en float (x87) :
  x=c0/256, y=c1/256, m=sqrt(x^2+y^2), nx=x/m, ny=y/m
  T += nx ; A += 0.1*ny ; B += A          (20 iterations)
  R = T^2 + B^2   -> "Congratulations" si R >= 0x43e76439 (~462.7830)
Le max continu de R vaut ~462.78801 : seul un mot quasi optimal passe.
Seuls les rapports c1/c0 comptent. L'ASCII imprimable plafonne a 462.681 (KO) ;
il faut des octets >= 0x80 (non blancs, donc acceptes par scanf("%40s")).

Usage : simulation-password-solve.py [-q] [--hex] [--check HEX]
  sans option : ecrit le mot de passe (octets bruts) sur stdout + diagnostic stderr
  -q  : octets bruts seuls sur stdout ; --hex : affiche en hexa ; --check HEX : score d'un mot
"""
import argparse, math, struct, sys

THRESH = struct.unpack('<f', struct.pack('<I', 0x43e76439))[0]
CHARS = [c for c in range(1, 256) if c not in (9, 10, 11, 12, 13, 32)]

def score(pw):
    assert len(pw) == 40
    T = A = B = 0.0
    for i in range(0, 40, 2):
        x, y = pw[i] / 256, pw[i + 1] / 256
        m = math.hypot(x, y)
        T += x / m
        A += 0.1 * (y / m)
        B += A
    return T * T + B * B

def solve():
    ang = [(a / math.hypot(a, b), b / math.hypot(a, b), (a, b)) for a in CHARS for b in CHARS]
    th = [0.5] * 20  # optimum continu par point fixe
    for _ in range(500):
        T = sum(math.cos(t) for t in th); A = B = 0.0
        for t in th:
            A += 0.1 * math.sin(t); B += A
        th = [math.atan2(B * 0.1 * (20 - j), T) for j in range(20)]
    sel = [min(ang, key=lambda s: abs(s[0] * math.sin(t) - s[1] * math.cos(t))) for t in th]
    for _ in range(100):  # polissage par montee de coordonnees
        T = sum(s[0] for s in sel); A = B = 0.0
        for s in sel:
            A += 0.1 * s[1]; B += A
        new = [max(ang, key=lambda s: T * s[0] + B * 0.1 * (20 - j) * s[1]) for j in range(20)]
        if new == sel:
            break
        sel = new
    return bytes(v for s in sel for v in s[2])

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--hex', action='store_true')
    ap.add_argument('--check', metavar='HEX')
    a = ap.parse_args()
    pw = bytes.fromhex(a.check) if a.check else solve()
    r = score(pw)
    if not a.q:
        print(f'hex = {pw.hex()}\nR = {r:.5f}  seuil = {THRESH:.5f}  ->',
              'OK' if r >= THRESH else 'KO', file=sys.stderr)
    if a.hex:
        print(pw.hex())
    else:
        sys.stdout.buffer.write(pw + (b'' if a.q else b'\n'))
