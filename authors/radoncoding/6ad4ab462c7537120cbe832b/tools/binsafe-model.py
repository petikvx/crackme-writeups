#!/usr/bin/env python3
"""Modele complet du crackme RadonCoding "binsafe" (Lights Out 8x8 qui n'en est pas un).

Tout vient du code natif du jeu (blob prive de l'exe, deviré depuis la VM binsafe) :

  coup (cellule c in 0..63)    : b' = F(b, c) = mix(b + (2c+1)*G)      G = 0x9e3779b97f4a7c15
  mix(z)                       : z ^= z>>31 ; z *= C1 ; z ^= z>>29 ; z *= C2 ; z ^= z>>32
  hash d'historique (r12)      : h = (h ^ b') * 0x100000001b3 ; h ^= h>>29      (h0 = FNV offset basis)
  victoire                     : b' == 0  -> flag = XOR(cipher, keystream(h_final))

usage :
  binsafe-model.py --check                 # verifie le modele contre les valeurs observees dans le vrai jeu
  binsafe-model.py --flag 0x<hash final>   # dechiffre le flag a partir du hash final r12
  binsafe-model.py --path 3,0,17,...       # rejoue un chemin (indices 0..63) depuis le plateau initial
"""
import sys

M = (1 << 64) - 1
G = 0x9e3779b97f4a7c15
C1 = 0xbf58476d1ce4e5b9
C2 = 0x94d049bb133111eb
FNV_P = 0x100000001b3
H0 = 0xcbf29ce484222325
INIT = 0x946683638e186420          # plateau initial (octets 20 64 18 8e 63 83 66 94)
CIPHER = bytes.fromhex('9ef8db263d8a75b03c51314d1fb03e649d57ab91c074a81f16d975b91f2388222dc61574d4ec079262')


def mix(z):
    z ^= z >> 31; z = (z * C1) & M; z ^= z >> 29; z = (z * C2) & M; z ^= z >> 32
    return z


def _xs_inv(x, sh):
    r = x
    for _ in range(64 // sh + 1):
        r = x ^ (r >> sh)
    return r


def mix_inv(z):
    z = _xs_inv(z, 32); z = (z * pow(C2, -1, 1 << 64)) & M
    z = _xs_inv(z, 29); z = (z * pow(C1, -1, 1 << 64)) & M
    return _xs_inv(z, 31)


def move(b, c):
    return mix((b + (2 * c + 1) * G) & M)


def move_inv(b2, c):
    return (mix_inv(b2) - (2 * c + 1) * G) & M


def hash_step(h, b2):
    h = ((h ^ b2) * FNV_P) & M
    return h ^ (h >> 29)


def decrypt_flag(h):
    out = bytearray()
    for i, c in enumerate(CIPHER):
        x = (h + i * G) & M
        y = x ^ (x >> 33); y = (y * 0xff51afd7ed558ccd) & M; y ^= y >> 33
        ch = (y & 0xff) ^ c
        out.append(ch if 0x20 <= ch <= 0x7e else 0x3f)
    return bytes(out).decode()


def replay(path, b=INIT):
    h = H0
    for c in path:
        b = move(b, c); h = hash_step(h, b)
    return b, h


def check():
    ok = True
    # chaine reelle observee dans le jeu : trois appuis sur A1 (cellule 0) depuis le plateau initial
    boards = [0xd7f8aed832c7c2e0, 0x20d30ae047963d51, 0xc1000bcc8726ef55]
    hashes = [0x8b35222e9137b0e9, 0xb9a50f7379abb41d, 0x8dc25a39e420cab4]
    b, h = INIT, H0
    for eb, eh in zip(boards, hashes):
        b = move(b, 0); h = hash_step(h, b)
        ok &= (b == eb and h == eh)
        print('A1 -> %016x hash %016x %s' % (b, h, 'OK' if (b == eb and h == eh) else 'KO'))
    # valeurs mesurees avec l'oracle (SetThreadContext sur r13) sur le vrai processus
    for bb, c, e in [(0, 0, 0x581d94c186728deb), (0, 1, 0xc8d6ee8dbf86604b), (0, 3, 0x4299527795f17af7), (0, 5, 0xd2cd87457ba55884),
                     (1 << 5, 0, 0x9787bacb931e83e2), (0x0123456789abcdef, 3, 0x84de888e06d1d7c7)]:
        r = move(bb, c); ok &= (r == e); print('F(%016x,%2d) = %016x %s' % (bb, c, r, 'OK' if r == e else 'KO'))
    # inversibilite
    for c in (0, 17, 63):
        assert move_inv(move(INIT, c), c) == INIT
    print('inverse OK ;', 'MODELE OK' if ok else 'MODELE KO')
    return ok


if __name__ == '__main__':
    a = sys.argv[1:]
    if not a or a[0] == '--check':
        sys.exit(0 if check() else 1)
    if a[0] == '--flag':
        print(decrypt_flag(int(a[1], 0)))
    elif a[0] == '--path':
        path = [int(x) for x in a[1].split(',')]
        b, h = replay(path)
        print('plateau final %016x  hash %016x' % (b, h))
        if b == 0:
            print('FLAG:', decrypt_flag(h))
