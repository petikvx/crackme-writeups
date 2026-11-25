#!/usr/bin/env python3
"""Keygen figger.exe (prolokmn2, Figger V2) : Key A / Key B dépendent de time()//30.

Usage : figger-solve.py [-q] [--check] [--t N]
  -q       n'imprime que "A B"
  --check  lance l'original sous Wine (xvfb-run) avec ces clés
  --t N    fenêtre explicite (défaut : time()//30)
Pas de nom d'utilisateur dans ce crackme (donc pas de « petik »).
"""
import argparse, os, subprocess, sys, time

def keygen(t, idx):
    # fig_fn_keygen @ 0x140001450 ; t = fenêtre, idx = 1 (Key A) / 2 (Key B)
    h = (0x811c9dc5 + idx * 0x9e3779b1) % 0x7fffffff
    g = (0x57984997 + idx * 0x9e37) % 0x7fffffed
    for i in range(0x28):
        tmp = (t + i * 0x9e3779b1 + idx) % 0xfffffffb
        h = (h * 0x1000193 + tmp) % 0x7fffffff
        g = (g * 0x1003f + h % 0x3d1 + i) % 0x7fffffed
        h = (h + g * 0x83 + t % (i + 3)) % 0x7fffffff
    return (h * 0x83 + g) % 0x7fffffff

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    ap.add_argument('--t', type=int)
    a = ap.parse_args()
    t = a.t if a.t is not None else int(time.time()) // 30
    ka, kb = keygen(t, 1), keygen(t, 2)
    if a.q:
        print(ka, kb)
    else:
        print(f"t = {t}  (window = {t % 1000000})\nKey A = {ka}\nKey B = {kb}")
    if a.check:
        exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'original', 'figger.exe')
        r = subprocess.run(['xvfb-run', '-a', 'wine', exe], input=f"{ka}\n{kb}\n",
                           capture_output=True, text=True, timeout=60)
        print(r.stdout)
        return 0 if 'Access granted' in r.stdout else 1

if __name__ == '__main__':
    sys.exit(main())
