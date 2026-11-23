#!/usr/bin/env python3
"""biglsim04 puzzle : extrait le mot de passe (9 octets XOR 0x9f @ VA 0x14002b550).
Usage : puzzle-solve.py [-q] [--check puzzle.exe]   (--check : lance sous wine)"""
import argparse, subprocess, sys, zipfile, io, os
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, '..', 'original', 'puzzle.zip')
VA, IMG, RVA_RDATA, RAW_RDATA, KEY, N = 0x14002b550, 0x140000000, 0x21000, 0x20200, 0x9f, 9

def load(path=None):
    if path: return open(path, 'rb').read()
    import shutil
    if not shutil.which('7z'): sys.exit('7z requis (ZIP AES) ou passer --exe')
    return subprocess.run(['7z', 'x', '-pcrackmes.one', '-so', ZIP], capture_output=True, check=True).stdout

def password(exe):
    off = VA - IMG - RVA_RDATA + RAW_RDATA
    return bytes(b ^ KEY for b in exe[off:off+N]).decode()

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true'); ap.add_argument('--exe')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    exe = load(a.exe); pw = password(exe)
    print(pw if a.q else f'Mot de passe : {pw}')
    if a.check:
        import tempfile
        with tempfile.TemporaryDirectory() as t:
            p = os.path.join(t, 'puzzle.exe'); open(p, 'wb').write(exe)
            for cand in (pw, 'wrong'):
                r = subprocess.run(['xvfb-run', '-a', 'wine', p], input=cand+'\n', capture_output=True, text=True, timeout=60)
                print(repr(cand), '->', r.stdout.strip().splitlines()[-1:])
