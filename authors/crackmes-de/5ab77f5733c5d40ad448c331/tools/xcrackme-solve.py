#!/usr/bin/env python3
"""Keygen xCrackMe (am0k) : génère le fichier de licence lu par le crackme.
Usage: xcrackme-solve.py [--name petik] [-o DIR] [-q] [--check]
Le fichier (nom décodé ci-dessous) fait 0xa4 octets : [0x00..0x1f] nom chiffré, [0x20..0x23] dword n=hash(nom), [0x24..0xa3] serial chiffré."""
import argparse, os, sys

ENC_ALPHA = b"!0#2%4'6)8PCRETG"
ENC_FNAME = b"g^ixt~^t!fnp"
KEY_STR = 0x31
KEY_FILE = 0x3f

def cmod(a, m):            # reste C (signe du dividende)
    r = abs(a) % m
    return -r if a < 0 else r

def ks(key, i):            # keystream de la routine de déchiffrement 0x13141080
    return cmod(key * (i + 1) - i, 32)

def xdec(buf, key):        # symétrique (XOR) ; s'arrête au 1er octet brut nul
    out = bytearray(buf)
    for i, c in enumerate(buf):
        if c == 0:
            break
        out[i] = (ks(key, i) & 0xff) ^ c
    return bytes(out)

ALPHA = xdec(ENC_ALPHA, KEY_STR)      # 16 symboles
FNAME = xdec(ENC_FNAME, KEY_FILE).decode()

def name_hash(name):       # fonction 0x131410c0 -> 1..32
    edx, acc = 6, 0
    for c in name.encode():
        acc += cmod(edx, 32) ^ c
        edx += 5
    return cmod(acc, 32) + 1

def serial(name):          # fonction 0x13141110 : 127 symboles
    b = name.encode(); n = name_hash(name); out = []; k = 0
    for i in range(0x7f):
        c = b[k]
        t1 = cmod((i + 1) * c - k, 255)
        t2 = cmod(c * n, 255)
        out.append(chr(ALPHA[cmod(t1 ^ t2, 16) & 0xf]))
        k += 1
        if k == len(b): k = 0
    return ''.join(out)

def make_file(name):
    assert 0 < len(name) < 0x1c
    s = serial(name)
    blob = bytearray(0xa4)
    for off, txt in ((0, name.encode()), (0x24, s.encode())):
        for i, c in enumerate(txt):          # XOR symétrique
            blob[off + i] = ks(KEY_FILE, i) & 0xff ^ c
            assert blob[off + i] != 0, "octet brut nul : nom inutilisable"
    blob[0x20:0x24] = name_hash(name).to_bytes(4, 'little')   # dword comparé à n (cf. 0x13141284)
    # fopen(..., "r") = mode texte msvcrt : 0x1a = EOF, 0d 0a = CRLF écrasé
    assert 0x1a not in blob and b'\r\n' not in blob, "octet 0x1a / CRLF : choisir un autre nom"
    return bytes(blob)

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-o', '--outdir', default='.')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true', help='rejoue la vérif du crackme en Python')
    a = ap.parse_args()
    blob = make_file(a.name)
    path = os.path.join(a.outdir, FNAME)
    open(path, 'wb').write(blob)
    if a.check:
        n = xdec(blob[:0x20], KEY_FILE).split(b'\0')[0].decode()
        s = xdec(blob[0x24:], KEY_FILE).split(b'\0')[0].decode()
        assert n == a.name and s == serial(n); print('check OK')
    if a.q: print(path)
    else:
        print('fichier :', FNAME, '| alphabet :', ALPHA.decode(), '| n =', name_hash(a.name))
        print('nom    :', a.name); print('serial :', serial(a.name)); print('écrit  :', path)
