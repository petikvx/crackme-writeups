#!/usr/bin/env python3
"""Keygen howosec "Not to simple KeyGen V2" (ELF x86-64 statique).

Usage : python3 -I tools/howo-keygen-solve.py [--name petik] [--email petik1@mail.com] [-q] [--check]

Prédicat (main @0x401640) : serial de 16 octets, H = hash256(hash256(name)+hash256(email)),
OK s'il existe i in {0,3,..,15} avec  s[(i+3)%17] == 4*(signed)H[i]
et s[i]+s[i+1] != 8*s[i+2] (si égal, le binaire saute l'itération : leurre).
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile

M = 0xffffffff
HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, '..', 'original', 'howo-not-to-simple-keygen')


def rol(x, n):
    return ((x << n) | (x >> (32 - n))) & M


def blk(d, va):
    return list(struct.unpack('<4I', d[va - 0x497000 + 0x97000:][:16]))


def hash256(data, d):
    """Port de la fonction @0x401d80 : 256 octets de sortie."""
    x1, x3, x2, x4, x5, x6, x7, x8 = [blk(d, v) for v in (
        0x497890, 0x4978a0, 0x4978b0, 0x4978c0, 0x4978d0, 0x4978e0, 0x4978f0, 0x497900)]
    st = x1 + x3 + x2 + x3 + x4 + x3 + x5 + x3 + x4 + x3 + x6 + x7 + x4 + x3 + x8 + x3
    n = len(data)

    def mix(r, idx):  # commun aux blocs S/T
        r ^= st[idx]
        e = rol((r * 0x9e3779b3) & M, 13)
        st[idx] = e
        idx = (idx + 1) & 63
        st[idx] = (st[idx] + e) & M

    if n:
        if n & 1:
            k, A, B = 0, 0x243f6a9b, 0x370735a
        else:
            c = ((data[0] * 0x100019c) & M) ^ 0x9bf2baa1
            mix(c, (((c * 0x9e3779b3) & M) ^ 0x243f6a9b) & 63)
            k, A, B = 1, st[1], st[4]
        while True:
            r = (B >> (k & 31)) ^ A ^ ((data[k] * 0x100019c) & M) ^ 0xbcbda360          # bloc S
            mix(r, (((r * 0x9e3779b3) & M) ^ A) & 63)
            if k + 1 == n:
                break
            edi = st[(k + 1) & 63]                                                      # bloc T
            r = (st[(k + 4) & 63] >> ((k + 1) & 31)) ^ edi ^ ((data[k + 1] * 0x100019c) & M) ^ 0xbcbda360
            mix(r, (((r * 0x9e3779b3) & M) ^ edi) & 63)
            A, B = st[(k + 2) & 63], st[(k + 5) & 63]
            k += 2
    for ebx in range(1, 9):
        for g in range(8):
            for j in range(8):
                t = ((st[(ebx + 8 * g + j) & 7] ^ st[8 * g + j]) * 0x85ebca78) & M
                st[8 * g + j] = t ^ (t >> 13)
    for _ in range(16):
        for b in range(0, 64, 8):
            for j in range(8):
                t = ((st[(b + 1 + j) & 63] ^ st[b + j]) * 0x85ebca78) & M
                t ^= t >> 16
                t = (t * 0x7feb352c) & M
                st[b + j] = t ^ (t >> 15)
    return struct.pack('<64I', *[st[j] ^ ((j * 0x9e3779b8) & M) for j in range(64)])


def keygen(name, email, d):
    h = hash256(hash256(name.encode(), d) + hash256(email.encode(), d), d)
    for i in range(0, 16, 3):
        if 8 <= h[i] <= 31:
            s = bytearray(b'A' * 16)
            s[(i + 3) % 17] = 4 * h[i]
            return s.decode()
    return None


def check(name, email, serial):
    tmp = tempfile.mkdtemp()
    exe = os.path.join(tmp, 'b')
    shutil.copy(BIN, exe)
    os.chmod(exe, 0o755)
    out = subprocess.run([exe], input=f'{name}\n{email}\n{serial}\n'.encode(),
                         capture_output=True, timeout=10, cwd=tmp).stdout.decode(errors='replace')
    shutil.rmtree(tmp)
    return out


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('--email', default='petik1@mail.com')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    d = open(BIN, 'rb').read()
    s = keygen(a.name, a.email, d)
    if s is None:
        sys.exit("pas de serial ASCII imprimable pour cet email (essayer un autre email, ex. petik1@mail.com)")
    print(s if a.q else f'name={a.name} email={a.email} serial={s}')
    if a.check:
        out = check(a.name, a.email, s)
        print(out.strip().splitlines()[-1] if out.strip() else out)
