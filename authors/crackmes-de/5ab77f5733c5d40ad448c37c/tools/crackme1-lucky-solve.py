#!/usr/bin/env python3
"""crackme1_lucky (KLiZMA) : serial = ticket "chanceux" à 6 chiffres (somme des 3 premiers == somme des 3 derniers).
Pas de nom/login -> pas de `petik`.
  crackme1-lucky-solve.py            # serial par défaut 123006
  crackme1-lucky-solve.py -q         # serial seul
  crackme1-lucky-solve.py --serial N # teste/valide N en local
  crackme1-lucky-solve.py --check    # lance l'exe d'origine sous Wine (OK + KO)
"""
import argparse, os, subprocess, sys, tempfile, zipfile

def valid(n):
    if not 0 <= n <= 999999: return False
    d = [(n // 10**i) % 10 for i in range(6)]      # d[0] = unité (le binaire remplit buf[0..5] ainsi)
    return d[0] + d[1] + d[2] == d[3] + d[4] + d[5]

def wine(serial):
    here = os.path.dirname(os.path.abspath(__file__))
    zp = os.path.join(here, '..', 'original', 'Crackme#1_by_KLiZMA.zip')
    with tempfile.TemporaryDirectory() as td:
        zipfile.ZipFile(zp).extract('crackme.exe', td)
        r = subprocess.run(['xvfb-run', '-a', 'wine', os.path.join(td, 'crackme.exe')], input=f'{serial}\nx\n'.encode(),
                           capture_output=True, timeout=120, cwd=td)
        return r.stdout.decode(errors='replace')

ap = argparse.ArgumentParser()
ap.add_argument('--serial', type=int, default=123006)
ap.add_argument('-q', action='store_true')
ap.add_argument('--check', action='store_true')
a = ap.parse_args()
if not valid(a.serial): sys.exit(f'{a.serial} invalide')
if a.q: print(a.serial); sys.exit()
print(f'serial = {a.serial:06d}  (valide)')
if a.check:
    for s, exp in ((a.serial, 'Good!'), (123457, 'Not valid')):
        out = wine(s); print(f'--- {s}:\n{out}')
        assert exp in out, f'attendu {exp!r}'
    print('check OK')
