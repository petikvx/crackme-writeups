#!/usr/bin/env python3
"""guessme (micky23310) : retrouve la passphrase de 16 caractères.

Le binaire (dans le ZIP original/download.bin, mot de passe crackmes.one) n'embarque
aucune comparaison littérale : on rejoue le key schedule (xorshift32, graine
0x47554553), on calcule la cible T = const ^ key[0xb0..0xbf] puis on inverse
le bloc à 8 tours de la fonction 0x1400018b0 pour retrouver les 16 octets.

Usage : guessme-solve.py [-q] [--check <guessme.exe>] [--zip <download.bin>]
"""
import argparse, io, struct, subprocess, sys, zipfile, os

M = 0xFFFFFFFF
RDATA_VMA, RDATA_OFF = 0x14000B000, 0x9200


def xs(x):
    x ^= (x << 13) & M
    x ^= x >> 17
    x ^= (x << 5) & M
    return x


def key_schedule():
    k = [0] * 0x34  # dwords, 0xd0 octets
    x = 0x47554553
    for i in range(4):
        x = xs(x); k[i] = x % 17 + 7
    for i in range(4):
        x = xs(x); k[4 + i] = x | 1
    for i in range(4):
        x = xs(x); k[8 + i] = x
    for i in range(32):
        x = xs(x); k[12 + i] = x
    for i in range(4):
        x = xs(x); k[44 + i] = x
    x = xs(x); k[48] = x
    return k


def ror(x, n): n &= 31; return ((x >> n) | (x << (32 - n))) & M


def rol(x, n): n &= 31; return ((x << n) | (x >> (32 - n))) & M


def fwd(v, k):
    v = list(v)
    for r in range(8):
        for i in range(4):
            v[i] = (rol(v[i] ^ k[12 + 4 * r + i], k[i]) * k[4 + i] + k[8 + i]) & M
        t = v[3]
        v[0] = (v[0] + t) & M; v[1] = (v[1] + v[0]) & M
        v[2] = (v[2] + v[1]) & M; v[3] = (v[2] + t) & M
    return v


def inv(s, k):
    s = list(s)
    for r in range(7, -1, -1):
        t = (s[3] - s[2]) & M
        v2 = (s[2] - s[1]) & M; v1 = (s[1] - s[0]) & M; v0 = (s[0] - t) & M
        v = [v0, v1, v2, t]
        for i in range(4):
            x = ((v[i] - k[8 + i]) * pow(k[4 + i], -1, 1 << 32)) & M
            v[i] = ror(x, k[i]) ^ k[12 + 4 * r + i]
        s = v
    return s


def load_exe(zpath):
    z = zipfile.ZipFile(zpath)
    return z.read(z.namelist()[0], pwd=b"crackmes.one")


def solve(exe):
    k = key_schedule()
    c = exe[RDATA_OFF + 0x1F0:RDATA_OFF + 0x200]  # 0x14000b1f0
    c = struct.unpack("<4I", c)
    T = [c[i] ^ k[44 + i] for i in range(4)]
    pw = b"".join(struct.pack("<I", w) for w in inv(T, k))
    # étape finale : FNV-1a + xorshift ^ table 0x14000b1c0 doit donner CMO{...}
    h = 0x811C9DC5
    for b in pw:
        h = ((h ^ b) * 0x1000193) & M
    x = h ^ k[48]
    tab = exe[RDATA_OFF + 0x1C0:RDATA_OFF + 0x1E0]
    out = b""
    for blk in range(8):
        x = xs(x)
        out += bytes(((x >> (8 * j)) & 0xFF) ^ tab[4 * blk + j] for j in range(4))
    return pw.decode("latin1"), out, fwd(struct.unpack("<4I", pw), k) == T


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--zip", default=os.path.join(here, "..", "original", "download.bin"))
    ap.add_argument("--check", metavar="EXE", help="lance wine sur EXE avec la passphrase")
    a = ap.parse_args()
    pw, stage, ok = solve(load_exe(a.zip))
    if a.q:
        print(pw); return
    print("passphrase :", pw, "| bloc OK" if ok else "| bloc KO")
    print("stage 2 (FNV/xorshift) :", stage)
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + "\n",
                           capture_output=True, text=True, timeout=60)
        print(r.stdout)


main()
