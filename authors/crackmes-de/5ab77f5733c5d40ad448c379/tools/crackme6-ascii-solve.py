#!/usr/bin/env python3
"""Solveur CrackMe #6 (KLiZMA's ASCII Table) — DOS 16 bits.

Le nom est ignoré ; le serial attendu est le long 666 (0x29a).
Usage : crackme6-ascii-solve.py [--name petik] [-q] [--check]
--check : lance CRACKME.EXE dans l'émulateur unicorn (tools/dosrun.py) avec
          le serial valide et un serial faux, et compare le comportement.
"""
import argparse, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, '..', 'analysis', 'extract', 'CRACKME.EXE')

def serial(name: str) -> int:
    return 0x29a  # cmp word [bp-6],0x29a ; cmp word [bp-4],0 -> long == 666

def table_shown(out: bytes) -> bool:
    return b'  32' in out and b'255' in out

def check(name):
    sys.path.insert(0, HERE)
    from dosrun import run
    ok = True
    for ser, want in ((serial(name), True), (serial(name) + 1, False), (666 + 65536, False)):
        r = run(EXE, f'{name}\n{ser}\n'.encode())
        got = table_shown(bytes(r['out']))
        print(f'serial={ser:<6} table ASCII affichée={got} (attendu {want}) -> {"OK" if got == want else "KO"}')
        ok &= got == want
    return ok

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    s = serial(a.name)
    print(s) if a.q else print(f'Name: {a.name}\nSerial: {s}')
    if a.check:
        sys.exit(0 if check(a.name) else 1)
