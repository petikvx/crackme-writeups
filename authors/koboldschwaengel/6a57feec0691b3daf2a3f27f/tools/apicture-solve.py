#!/usr/bin/env python3
"""APicturePerfectPassword (koboldschwaengel) : retrouve le mot de passe à 6 chiffres.

Le crackme colle les 6 BMP-chiffres (100x100, 32 bits) côte à côte (ligne par
ligne) et memcmp() le résultat avec `solution_data` (.rdata VA 0x1400674a0,
600*100*4 octets de pixels bruts). On fait le chemin inverse : pour chaque
tranche de 100 px de la solution on cherche le chiffre dont le BMP correspond.

Usage : apicture-solve.py [-q] [--check] [EXE | ZIP]
"""
import argparse, os, re, struct, subprocess, sys, zipfile, io, shutil, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, '..', 'original', 'APicturePerfectPassword.zip')
IMG_BASE, RDATA_VA, RDATA_RAW = 0x140000000, 0x140005000, 0x3e00
SOL_VA = 0x1400674a0
W = H = 100
BPP = 4
ROW = W * BPP


def load_exe(path):
    if path.lower().endswith('.zip'):
        with zipfile.ZipFile(path) as z:
            z.setpassword(b'crackmes.one')
            n = [n for n in z.namelist() if n.lower().endswith('.exe')][0]
            return z.read(n)
    return open(path, 'rb').read()


def solve(exe):
    digits = []
    for m in re.finditer(b'BM', exe):
        o = m.start()
        if exe[o + 18:o + 26] == struct.pack('<ii', W, H) and struct.unpack('<I', exe[o + 2:o + 6])[0] == 40138:
            off = struct.unpack('<I', exe[o + 10:o + 14])[0]
            digits.append(exe[o + off:o + off + W * H * BPP])
    assert len(digits) == 10, len(digits)  # ordre en .rdata != ordre 0..9, voir table .data
    # table .data VA 0x1400a40c0 : 10 entrées (ptr, size) ; index = chiffre
    data_raw = 0xa2c00
    tab = []
    for i in range(10):
        va = struct.unpack('<Q', exe[data_raw + 0xc0 + 16 * i:data_raw + 0xc8 + 16 * i])[0]
        raw = va - RDATA_VA + RDATA_RAW
        hdr = exe[raw:raw + 2]
        assert hdr == b'BM'
        off = struct.unpack('<I', exe[raw + 10:raw + 14])[0]
        tab.append(exe[raw + off:raw + off + W * H * BPP])
    s = SOL_VA - RDATA_VA + RDATA_RAW
    sol = exe[s:s + 6 * W * H * BPP]
    pw = ''
    for slot in range(6):
        for d in range(10):
            if all(sol[r * 6 * ROW + slot * ROW:r * 6 * ROW + (slot + 1) * ROW] == tab[d][r * ROW:(r + 1) * ROW] for r in range(H)):
                pw += str(d)
                break
        else:
            raise SystemExit('chiffre introuvable slot %d' % slot)
    return pw


def check(pw, zpath):
    if not shutil.which('wine'):
        print('wine absent', file=sys.stderr); return None
    tmp = tempfile.mkdtemp()
    with zipfile.ZipFile(zpath) as z:
        z.setpassword(b'crackmes.one')
        n = [n for n in z.namelist() if n.lower().endswith('.exe')][0]
        exe = os.path.join(tmp, 'a.exe'); open(exe, 'wb').write(z.read(n))
    out = subprocess.run(['wine', exe], input=pw + '\n', capture_output=True, text=True, timeout=60).stdout
    return out


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true', help='lance le binaire via wine avec la solution')
    ap.add_argument('src', nargs='?', default=ZIP)
    a = ap.parse_args()
    pw = solve(load_exe(a.src))
    print(pw if a.q else 'Password : ' + pw)
    if a.check:
        print(repr(check(pw, a.src)))
