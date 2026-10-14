#!/usr/bin/env python3
"""schizo (S3c_Cult) — reconstitue les 5 fragments renvoyés par le « serveur » 127.0.0.1:5566.

Pipeline du crackme : fragment_serveur --___1()--> blob --base91--> table E0F40 (attendu).
On inverse donc : base91_decode(attendu) -> inverse(___1) -> fragment en clair.

Usage : schizo-solve.py [--check] [--keys] [-q] [binaire]
"""
import argparse, hashlib, struct, sys, os

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, '..', 'analysis', 'extracted', 'schizo')
M = 0xFFFFFFFF


def b91dec(s):
    out = bytearray(); v = -1; b = 0; n = 0
    for c in s:
        c -= 33
        if v == -1:
            v = c
        else:
            b += 13; n |= (91 * v + c) << (32 - b); n &= M
            while True:
                out.append((n >> 24) & 255); n = (n << 8) & M; b -= 8
                if b <= 7: break
            v = -1
    if v != -1:
        out.append((((v << (32 - (b + 6))) | n) & M) >> 24)
    return bytes(out)


def b91enc(data):
    # inverse exact de b91dec (chaque paire de chars = 13 bits)
    bits = ''.join(f'{x:08b}' for x in data)
    out = []
    i = 0
    while i + 13 <= len(bits):
        v = int(bits[i:i + 13], 2); i += 13
        out += [v // 91 + 33, v % 91 + 33]
    return bytes(out), bits[i:]


def xs(st):
    st ^= (st << 13) & M; st ^= st >> 17; st ^= (st << 5) & M
    return st


class P:
    def __init__(s, seed): s.s = seed & M
    def byte(s):
        s.s = xs(s.s); return (s.s >> 8) & 255


rol = lambda x, k: ((x << (k & 7)) | (x >> (8 - (k & 7)))) & 255 if k & 7 else x
ror = lambda x, k: ((x >> (k & 7)) | (x << (8 - (k & 7)))) & 255 if k & 7 else x


def params(v27, n):
    R = (v27 & 7) + 6
    p = P((v27 ^ 0xA5A5A5A5) or 0xDEADBEEF)
    sb = list(range(256))
    for j in range(255, 0, -1):
        r = p.byte() % (j + 1); sb[j], sb[r] = sb[r], sb[j]
    p = P((v27 ^ 0x3C3C3C3C) ^ 0x5A5A5A5A)
    pm = list(range(n)); perms = []
    for j in range(n - 1, 0, -1):
        r = p.byte() % (j + 1); pm[j], pm[r] = pm[r], pm[j]
    for _ in range(R):
        perms.append(pm[:])
        if n > 1:
            a = p.byte() % n; b = p.byte() % n; pm[a], pm[b] = pm[b], pm[a]
    p = P(v27 ^ 0xC3C3C3C3)
    A = []; B = []
    for _ in range(R):
        a = []; b = []
        for _ in range(n):
            a.append(p.byte()); b.append(p.byte())
        A.append(a); B.append(b)
    return R, sb, perms, A, B


def seed_of(data):
    v = ((-1640531535 * len(data)) & M) ^ ((-2048144789 * sum(data)) & M) ^ 0xA3C59AC3
    return v or 0xCAFEBABE


def enc(data):                       # ___1
    n = len(data); v27 = seed_of(data)
    R, sb, perms, A, B = params(v27, n)
    x = list(data)
    for k in range(R):
        x = [x[i] ^ A[k][i] for i in range(n)]
        x = [sb[c] for c in x]
        x = [x[perms[k][i]] for i in range(n)]
        x = [rol(x[i], i + k) for i in range(n)]
        x = [(x[i] + B[k][i]) & 255 for i in range(n)]
    return struct.pack('>I', v27) + bytes([R]) + bytes(x)


def dec(blob):                       # inverse de ___1
    v27 = struct.unpack('>I', blob[:4])[0]; ct = list(blob[5:]); n = len(ct)
    R, sb, perms, A, B = params(v27, n)
    inv = [0] * 256
    for i, c in enumerate(sb): inv[c] = i
    x = ct
    for k in range(R - 1, -1, -1):
        x = [(x[i] - B[k][i]) & 255 for i in range(n)]
        x = [ror(x[i], i + k) for i in range(n)]
        y = [0] * n
        for i in range(n): y[perms[k][i]] = x[i]
        x = [inv[c] for c in y]
        x = [x[i] ^ A[k][i] for i in range(n)]
    return bytes(x), v27


def ___4(s):
    return bytes(ror((~(c - 9 * i)) & 255, 3) for i, c in enumerate(s))


def cstr(d, a): return d[a:d.index(b'\0', a)]


def split(s):
    for k in range(1, len(s) + 1):
        d = b91dec(s[:k])
        if d and d.isdigit(): return int(d), s[k:]


def tables(d):
    out = {}
    for name, base in (('keys', 0xE0F00), ('expected', 0xE0F40)):
        out[name] = [split(cstr(d, struct.unpack_from('<Q', d, base + 8 * i)[0])) for i in range(5)]
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('binary', nargs='?', default=BIN)
    ap.add_argument('--keys', action='store_true', help='affiche les X-Fragment-Key a envoyer')
    ap.add_argument('--check', action='store_true', help='re-chiffre et compare avec la table')
    ap.add_argument('-q', action='store_true')
    a = ap.parse_args()
    d = open(a.binary, 'rb').read()
    t = tables(d)
    if a.keys:
        for i, k in t['keys']: print(i, k.decode())
    frags = {}
    for i, rest in t['expected']:
        blob = b91dec(rest)
        pt, v27 = dec(blob)
        ok = enc(pt) == blob
        if a.check:
            print(f'idx {i}: roundtrip {"OK" if ok else "KO"}  v27={v27:#010x} len={len(pt)}')
        frags[i] = pt
    flag = b''.join(frags[i] for i in sorted(frags))
    if a.q: print(flag.decode(errors='replace'))
    else:
        for i in sorted(frags): print(f'fragment {i}: {frags[i]!r}')
        print('assemble :', flag.decode(errors='replace'))


if __name__ == '__main__':
    main()
