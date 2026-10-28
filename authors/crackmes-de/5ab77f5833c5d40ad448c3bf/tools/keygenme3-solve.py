#!/usr/bin/env python3
"""Keygen pour issogoo KeygenMe #3 (crackmes.de) - serial de 10 caracteres [A-Za-z0-9].

Usage: keygenme3-solve.py [-q] [-n N] [--seed S] [--check SERIAL]
Aucun nom d'utilisateur : le serial est global (pas de champ name dans le binaire).
"""
import argparse, random, string, struct

CHARSET = string.ascii_uppercase + string.ascii_lowercase + string.digits


def valid(serial: str) -> bool:
    """Reimplementation exacte de la routine 0x401063 (test final 0x4010f1)."""
    if len(serial) != 10 or any(c not in CHARSET for c in serial):
        return False
    b = bytearray(serial.encode())
    for key, sumidx in ((0x1234567, 8), (0x89abcde, 9)):
        for i in range(2):  # xor dword [esi+i*4], key ; and byte [esi+i*4], 0xe
            v = struct.unpack_from('<I', b, i * 4)[0] ^ key
            struct.pack_into('<I', b, i * 4, v)
            b[i * 4] &= 0xE
        cl = b[sumidx]
        for k in range(10):  # add cl,[esi+k] ; mov [esi+sumidx],cl (ecrit a chaque tour)
            cl = (cl + b[k]) & 0xFF
            b[sumidx] = cl
    return b[8] == 0x42 and b[9] == 0xDE


def gen(rng):
    cs = CHARSET
    while True:
        s = [rng.choice(cs) for _ in range(8)]
        for a in cs:
            for c in cs:
                t = ''.join(s) + a + c
                if valid(t):
                    return t


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true', help='sortie = serial seul')
    ap.add_argument('-n', type=int, default=1)
    ap.add_argument('--seed', default='petik')
    ap.add_argument('--check')
    a = ap.parse_args()
    if a.check is not None:
        ok = valid(a.check)
        print('OK' if ok else 'KO')
        raise SystemExit(0 if ok else 1)
    rng = random.Random(a.seed)
    for _ in range(a.n):
        s = gen(rng)
        print(s if a.q else f'seed={a.seed} serial={s}')


if __name__ == '__main__':
    main()
